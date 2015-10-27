"""
gen_3.py
run using 
    python -i gen_3.py
then use the 'gf' object to run tests on each level
for example:
    # (hp = 66, attack = 27, defense = 23, speed = 70, special_attack = 71, special_defense = 52)
    gf.verify_level(current_level = 31, stat = (66, 27, 23, 70, 71, 52))
"""
import math

def load_pokemon_base_stat(filename):
    _pokemon_base = {}
    for l in open(filename, "rt"):
        l = l.replace('\n', '')
        if l.startswith("#") or l == '':
            continue
        #,Name,HP,Attack,Defense,Sp. Atk,Sp. Def,Speed
        number, name, hp, attack, defense, special_attack, special_defense, speed = l.split(',')
        number, name, hp, attack, defense, special_attack, special_defense, speed = int(number), name, int(hp), int(attack), int(defense), int(special_attack), int(special_defense), int(speed)
        _pokemon_base[name] = hp, attack, defense, speed, special_attack, special_defense
    return _pokemon_base
    
class NoSuchIVForStat(Exception): pass
class PokemonGame(object):
    
    hidden_power_max_stat = {
        # name : (hp, atk, def, spd, special atk, special def)
        'bug' : (31, 31, 31, 30, 31, 30),
        'dark' : (31, 31, 31, 31, 31, 31),
        'dragon' : (30, 31, 31, 31, 31, 31),
        'electric' : (31, 31, 31, 31, 30, 31),
        'fighting' : (31, 31, 30, 30, 30, 30),
        'fire' : (31, 30, 31, 30, 30, 31),
        'flying' : (31, 31, 31, 30, 30, 30),
        'ghost' : (31, 30, 31, 31, 31, 30),
        'grass' : (30, 31, 31, 31, 30, 31),
        'ground' : (31, 31, 31, 31, 30, 30),
        'ice' : (31, 31, 31, 30, 31, 30),
        'poison' : (31, 31, 30, 31, 30, 30),
        'psychic' : (30, 31, 31, 30, 31, 31),
        'rock' : (31, 31, 30, 30, 31, 30),
        'steel' : (31, 31, 31, 31, 31, 30),
        'water' : (31, 31, 31, 30, 30, 31),
    }

    nature_factors = {
        # name : (attack_factor, defense_factor, speed_factor, special_attack_factor, special_defense_factor, spice_like, spice_dislike)
        'adamant' : (1.1, 1, 1, 0.9, 1, 'spicy', 'dry'),
        'bashful' : (1, 1, 1, 1, 1, '', ''),
        'bold' : (0.9, 1.1, 1, 1, 1, 'sour', 'spicy'),
        'brave' : (1.1, 1, 0.9, 1, 1, 'spicy', 'sweet'),
        'calm' : (0.9, 1, 1, 1, 1.1, 'bitter', 'spicy'),
        'careful' : (1, 1, 1, 0.9, 1.1, 'bitter', 'dry'),
        'docile' : (1, 1, 1, 1, 1, '', ''),
        'gentle' : (1, 0.9, 1, 1, 1.1, 'bitter', 'sour'),
        'hardy' : (1, 1, 1, 1, 1, '', ''),
        'hasty' : (1, 0.9, 1.1, 1, 1, 'sweet', 'sour'),
        'impish' : (1, 1.1, 1, 0.9, 1, 'sour', 'dry'),
        'jolly' : (1, 1, 1.1, 0.9, 1, 'sweet', 'dry'),
        'lax' : (1, 1.1, 1, 1, 0.9, 'sour', 'bitter'),
        'lonely' : (1.1, 0.9, 1, 1, 1, 'spicy', 'sour'),
        'mild' : (1, 0.9, 1, 1.1, 1, 'dry', 'sour'),
        'modest' : (0.9, 1, 1, 1.1, 1, 'dry', 'spicy'),
        'naive' : (1, 1, 1.1, 1, 0.9, 'sweet', 'bitter'),
        'naughty' : (1.1, 1, 1, 1, 0.9, 'spicy', 'bitter'),
        'quiet' : (1, 1, 0.9, 1.1, 1, 'dry', 'sweet'),
        'quircky' : (1, 1, 1, 1, 1, '', ''),
        'rash' : (1, 1, 1, 1.1, 0.9, 'dry', 'bitter'),
        'relaxed' : (1, 1.1, 0.9, 1, 1, 'sour', 'sweet'),
        'sassy' : (1, 1, 0.9, 1, 1.1, 'bitter', 'sweet'),
        'serious' : (1, 1, 1, 1, 1, '', ''),
        'timid' : (0.9, 1, 1.1, 1, 1, 'sweet', 'spicy'),
        
        
    }

    characteristics_table = {
        'Ofter dozes off' : ('hp', 1),
        'Loves to eat' : ('hp', 0),
        'Likes to relax' : ('hp', 4),
        'Scatters things often' : ('hp', 3),
        'Often scatters things' : ('hp', 2),
        
        'Likes to thrash about' : ('attack', 1),
        'Proud of its power' : ('attack', 0),
        'Quick tempered' : ('attack', 4),
        'Likes to fight' : ('attack', 3),
        'A little quick tempered' : ('attack', 2),
        
        'Capable of taking hits' : ('defense', 1),
        'Sturdy body' : ('defense', 0),
        'Good perseverance' : ('defense', 4),
        'Good endurance' : ('defense', 3),
        'Highly persistent' : ('defense', 2),
        
        'Alert to sounds' : ('speed', 1),
        'Likes to run' : ('speed', 0),
        'Quick to flee' : ('speed', 4),
        'Somewhat of a clown' : ('speed', 3),
        'Impetuous and silly' : ('speed', 2),
        
        'Mischievous' : ('special_attack', 1),
        'Highly curious' : ('special_attack', 0),
        'Very finicky' : ('special_attack', 4),
        'Often lost in thought' : ('special_attack', 3),
        'Thoroughly cunning' : ('special_attack', 2),
        
        'Somewhat vain' : ('special_defense', 1),
        'Strong willed' : ('special_defense', 0),
        'Somewhat stubborn' : ('special_defense', 4),
        'Hates to lose' : ('special_defense', 3),
        'Strongly defiant' : ('special_defense', 2),
    }

    
    pokemon_base = load_pokemon_base_stat("pokemon_stat.csv")
    
    @classmethod
    def get_stat_hp_value(cls, level, base, iv, ev, nature):
        return math.floor(           (((2 * base + iv + math.floor(ev / 4)) * level) / 100) + level + 10          )

    @classmethod
    def get_stat_value(cls, level, base, iv, ev, nature):
        return math.floor(math.floor((((2 * base + iv + math.floor(ev / 4)) * level) / 100)          + 5) * nature)

    @classmethod
    def get_hp_iv_value_min(cls, level, base, ev, stat, nature):
        return min(iv for iv in xrange(32) if cls.get_stat_hp_value(level, base, iv, ev, nature) == stat)
        if not is_valid_hp_stat(level, base, ev, stat):
            return None
        return max(min(math.ceil  ( (stat - 10 - level)  * 100        / level  - 2 * base - math.floor(ev / 4)), 31), 0)

    @classmethod
    def get_hp_iv_value_max(cls, level, base, ev, stat, nature):
        return max(iv for iv in xrange(32) if cls.get_stat_hp_value(level, base, iv, ev, nature) == stat)
        if not is_valid_hp_stat(level, base, ev, stat):
            return None
        return max(min(math.floor (((stat - 10 - level)  * 100 + 99)  / level) - 2 * base - math.floor(ev / 4) , 31), 0)

    @classmethod
    def get_iv_value_list(cls, level, base, ev, stat, nature):
        return [iv for iv in xrange(32) if cls.get_stat_value(level, base, iv, ev, nature) == stat]
    @classmethod
    def get_iv_value_min(cls, level, base, ev, stat, nature):
        l = cls.get_iv_value_list(level, base, ev, stat, nature)
        if len(l) == 0:
            raise NoSuchIVForStat()
        return min(l)
        
    @classmethod
    def get_iv_value_max(cls, level, base, ev, stat, nature):
        l = cls.get_iv_value_list(level, base, ev, stat, nature)
        if len(l) == 0:
            raise NoSuchIVForStat()
        return max(l)

    
    
class InvalidLevelForStat(Exception): pass
class InvalidLevel(Exception): pass

class PokemonStat(object):
    def __init__(self, hp, attack, defense, speed, special_attack, special_defense):
        self.hp = hp
        self.attack = attack
        self.defense = defense
        self.speed = speed
        self.special_attack = special_attack
        self.special_defense = special_defense
    def todict(self):
        return dict(
            ('hp', self.hp),
            ('attack', self.attack), 
            ('defense', self.defense),
            ('speed', self.speed),
            ('special_attack', self.special_attack),
            ('special_defense', self.special_defence), 
        )
        
class PokemonFoundData(object):
    def __init__(self, current_level = None, nature = None, characteristics = None, ability = None):
        super(PokemonFoundData, self).__init__()
        self.min_iv = PokemonStat(0, 0, 0, 0, 0, 0)
        self.max_iv = PokemonStat(31, 31, 31, 31, 31, 31)
        
        self.current_level = current_level
        
        self.ability = ability
        
        self.update_characteristics(characteristics)
        
        if nature is not None:
            self.update_nature(nature)
        else:
            self.nature = PokemonStat(1, None, None, None, None, None) # the last two are flavored tastes

    def update_ability(self, ability):
        self.ability = ability
            
    def update_nature(self, nature):
        self.nature = PokemonStat(1, *PokemonGame.nature_factors[nature][:-2]) # the last two are flavored tastes
        
    def update_level(self, current_level):
        if current_level < self.current_level:
            raise InvalidLevel("got lower level, think of creating a new " + self.__class__)
        self.current_level = current_level
        
    def update_characteristics(self, characteristics):

        self.characteristics = characteristics
        
        if characteristics is not None:
            self.characteristic_stat_name, self.characteristics_mod_5 = PokemonGame.characteristics_table[characteristics]
        else:
            self.characteristic_stat_name, self.characteristics_mod_5 = None, None


    def update_level_stat(self, name, stat, known, expected):
        if name == "hp":
            f_max = PokemonGame.get_hp_iv_value_max
            f_min = PokemonGame.get_hp_iv_value_min
        else:
            f_max = PokemonGame.get_iv_value_max
            f_min = PokemonGame.get_iv_value_min
            
        nature = expected.get_determining_nature(self)
            
        min_iv = max(f_min(self.current_level, getattr(known.base, name), getattr(known.ev, name), stat, getattr(nature, name)), getattr(self.min_iv, name))
        max_iv = min(f_max(self.current_level, getattr(known.base, name), getattr(known.ev, name), stat, getattr(nature, name)), getattr(self.max_iv, name))

        setattr(self.min_iv, name, min_iv)
        setattr(self.max_iv, name, max_iv)

    def verify_ability(self, expected):
        return expected.ability is None or expected.ability == self.ability
    def verify_nature(self, nature):
        return expected.nature is None or expected.nature == self.nature
        
    def verify_level_stat(self, name, expected):
        return getattr(self.min_iv, name) <= getattr(expected.iv, name) <= getattr(self.max_iv, name)
        

    def _verify_characteristics(self, min_iv, max_iv):
        if self.characteristics is not None:
            iv_dict = max_iv.todict()
            single_max_iv = max(iv_dict.itervalues())
            highest_iv_names = set([stat_name for stat_name, iv in iv_dict if single_max_iv == iv])
            if not self.characteristic_stat_name not in highest_iv_names:
                return False
            
            if not any(a % 5 == self.characteristics_mod_5 for a in xrange(getattr(min_iv, self.characteristic_stat_name), getattr(max_iv, self.characteristic_stat_name) + 1)):
                return False
                
        return True
            
            # min_characteristics = getattr(min_iv, self.characteristic_stat_name)
            # max_characteristics = getattr(max_iv, self.characteristic_stat_name)
            # mod = min_characteristics % 5
            # diff = max_characteristics - min_characteristics
            # overlapped_characteristics_mod_5 = self.characteristics_mod_5 if self.characteristics_mod_5 != 0 else 5
            # if diff + 1 < 5 and mod != self.characteristics_mod_5 and mod + diff < overlapped_characteristics_mod_5:
                # return False
                
    def verify_characteristics(self):
        return self._verify_characteristics(min_iv, max_iv)
        
    def initial_verify_characteristics(self, expected):
        return self._verify_characteristics(expected.iv, expected.iv)
        
class PokemonKnownData(object):
    def __init__(self, pokemon):
        super(PokemonKnownData, self).__init__()
        
        self.pokemon = pokemon
        
        self.ev = PokemonStat(0, 0, 0, 0, 0, 0)
        
        self.base = PokemonStat(*PokemonGame.pokemon_base[pokemon])
        
class PokemonExpectedData(object):
    def __init__(self, hidden_power = None, ability = None, nature = None):
        super(PokemonExpectedData, self).__init__()
        
        self.hidden_power = hidden_power
        
        self.ability = ability
        
        if nature is not None:
            self.nature = PokemonStat(1, *PokemonGame.nature_factors[nature][:-2]) # the last two are flavored tastes
        else:
            self.nature = None
        
        if self.hidden_power is not None:
            self.iv = PokemonStat(*PokemonGame.hidden_power_max_stat[hidden_power])
        else:
            self.iv = PokemonStat(31, 31, 31, 31, 31, 31)

    def get_determining_nature(self, found):
        if self.nature is not None:
            return self.nature
        else:
            return found.nature
    
    def get_tested_level(self, name, found, known):
        if name == 'hp':
            f_min = PokemonGame.get_hp_iv_value_min
            f_max = PokemonGame.get_hp_iv_value_max
            f_value = PokemonGame.get_stat_hp_value
        else:
            f_min = PokemonGame.get_iv_value_min
            f_max = PokemonGame.get_iv_value_max
            f_value = PokemonGame.get_stat_value
            
        base = getattr(known.base, name)
        nature = getattr(self.get_determining_nature(found), name)
        ev = getattr(known.ev, name)
        iv = getattr(self.iv, name)
            
        min_lvl, max_lvl = None, None
        for lvl in xrange(found.current_level, 101):
            stat = f_value(lvl, base, iv, ev, nature)
            if min_lvl is None and f_min(lvl, base, ev, stat, nature) == iv:
                min_lvl = lvl
            if max_lvl is None and f_max(lvl, base, ev, stat, nature) == iv:
                max_lvl = lvl
            if None not in (min_lvl, max_lvl):
                break
                
        print "-", name, "min at lvl", min_lvl, "should be", f_value(min_lvl, base, iv, ev, nature)
        print "-", name, "max at lvl", max_lvl, "should be", f_value(max_lvl, base, iv, ev, nature)
        if None in (min_lvl, max_lvl):
            raise InvalidLevelForStat(name)
            
        return min_lvl, max_lvl
            
class PokemonGeneFinder(object):
    """
    current_level:
        the level of the pokemon when you see it for the first time. usually its 1 after you got it from an egg, or any other level you caught it in.
        notice the implementation of PokemonGeneFinder dont support ev's and actually assume its 0, so just make sure you do not fight with the pokemon
        you want to check so it wont gain any ev
    pokemon:
        the name of the pokemon you are leveling (not nickname). First letter should be cased, the rest are lower case.
    nature:
        the nature of the pokemon from the stat screen. currently you must see it before running this algorithm. in the future i will add a better test
        for later natures accurding HP you see in the pokemon list (so less menus will be used).
        see nature_factors
    characteristics: 
        the text you have in the pokemon state screen. it helps the algorithm to know the pokemon have wrong ivs on lower levels.
        see characteristics_table
    hidden_power: 
        usually the algorithm searches for a pokemon with 31 in all iv's.
        since hidden power is determined by the iv's, a different iv set is needed if you want a specific hidden power.
        see hidden_power_max_stat
    minimize_menu:
        putting true in minimize_menu will return smaller level list
        meaning you will know later the pokemon dont meet the requirement
        but you will have to check its stats less.
        You will want to put True in here if you have planty of rare candies and plannig on leveling up using the rare candies and not the day care.
        using rare candies will make the pokemon level up much faster that leveling it with the daycare
        so watching the menu each level will take longer than actually leveling it up.
        Depending on your leveler implementation (the BOT), you might save the game before using the rare candies, and dont save after using the rare candies.
          just remember if you had the pokemon you wanted after using the rare candies, and level it up normally (aka elite four) after reseting.
    

    I used tables from 
        http://www.psypokes.com/ 
    I used equations found in 
        http://bulbapedia.bulbagarden.net/wiki/Main_Page

    """
    def __init__(self, pokemon, level = None, nature = None, characteristics = None, hidden_power = None, ability = None, found_nature = None, found_ability = None, minimize_menu = False):
        super(PokemonGeneFinder, self).__init__()
        
        self.minimize_menu = minimize_menu 
        self.found = PokemonFoundData(level, found_nature, characteristics, found_ability)
        self.known = PokemonKnownData(pokemon)
        self.expected = PokemonExpectedData(hidden_power, ability, nature)
        
    def verify_level_hp(self, current_level, hp):
        self.found.update_level(current_level)
        
        try:
            
            self.found.update_level_stat("hp", hp, self.known, self.expected)
        except NoSuchIVForStat:
            raise InvalidLevel("stat")

        if not self.found.verify_level_stat("hp", self.expected):
            return False
        if self.known.characteristic_stat_name == 'hp':
            return self.found.verify_characteristics()
            
        return True
        
    def update_characteristics(self, characteristics):
        self.found.update_characteristics(characteristics)
        return self.found.verify_level_stat("hp", self.expected)
        
    def update_nature(self, nature):
        self.found.update_nature(nature)
        return self.found.verify_nature(self.expected) and self.found.verify_level_stat("hp", self.expected)
        
    def update_ability(self, ability):
        self.found.update_ability(ability)
        return self.found.verify_ability(self.expected)
        
    def verify_level(self, current_level, stat):
        self.found.update_level(current_level)
        hp, attack, defense, speed, special_attack, special_defense = stat
        try:
            
            self.found.update_level_stat("hp", hp, self.known, self.expected)
            self.found.update_level_stat("attack", attack, self.known, self.expected)
            self.found.update_level_stat("defense", defense, self.known, self.expected)
            self.found.update_level_stat("speed", speed, self.known, self.expected)
            self.found.update_level_stat("special_attack", special_attack, self.known, self.expected)
            self.found.update_level_stat("special_defense", special_defense, self.known, self.expected)
        except NoSuchIVForStat:
            raise InvalidLevel("stat")

        return all([
            self.found.verify_level_stat("hp", self.expected),
            self.found.verify_level_stat("attack", self.expected),
            self.found.verify_level_stat("defense", self.expected),
            self.found.verify_level_stat("speed", self.expected),
            self.found.verify_level_stat("special_attack", self.expected),
            self.found.verify_level_stat("special_defense", self.expected),
            self.found.verify_characteristics(),
        ])

    def _statisfy_restraint(self, lvl_set, name, lvl, known, expected):
        if name == 'hp':
            f_min = PokemonGame.get_hp_iv_value_min
            f_max = PokemonGame.get_hp_iv_value_max
            f_value = PokemonGame.get_stat_hp_value
        else:
            f_min = PokemonGame.get_iv_value_min
            f_max = PokemonGame.get_iv_value_max
            f_value = PokemonGame.get_stat_value
            
        base = getattr(known.base, name)
        nature = getattr(expected.get_determining_nature(self.found), name)
        ev = getattr(known.ev, name)
        iv = getattr(expected.iv, name)
        
        stat = f_value(lvl, base, iv, ev, nature)
        satisfied = False
        if name + "_max" in lvl_set:
            if f_max(lvl, base, ev, stat, nature) == iv:
                lvl_set.remove(name + "_max")
                satisfied = True
                
        if name + "_min" in lvl_set:
            if f_min(lvl, base, ev, stat, nature) == iv:
                lvl_set.remove(name + "_min")
                satisfied = True

        return satisfied
                
    def get_tested_levels(self):
        
        self.found.initial_verify_characteristics(self.expected)
        
        hp_level_min, hp_level_max = self.expected.get_tested_level("hp", self.found, self.known)
        attack_level_min, attack_level_max  = self.expected.get_tested_level("attack", self.found, self.known)
        defense_level_min, defense_level_max = self.expected.get_tested_level("defense", self.found, self.known)
        speed_level_min, speed_level_max = self.expected.get_tested_level("speed", self.found, self.known)
        special_attack_level_min, special_attack_level_max = self.expected.get_tested_level("special_attack", self.found, self.known)
        special_defense_level_min, special_defense_level_max = self.expected.get_tested_level("special_defense", self.found, self.known)
        
        sorted_levels = sorted(list(set([
            hp_level_min, hp_level_max, 
            attack_level_min, attack_level_max, 
            defense_level_min, defense_level_max, 
            speed_level_min, speed_level_max, 
            special_attack_level_min, special_attack_level_max, 
            special_defense_level_min, special_defense_level_max
        ])))
        
        if self.minimize_menu:
            levels = set([])
            restraints_left = set(["hp_max", "hp_min", "attack_max", "attack_min", "defense_max", "defense_min", "speed_max", "speed_min", "special_attack_max", "special_attack_min", "special_defense_max", "special_defense_min",])
            for lvl in sorted_levels[::-1]:
                for name in ['hp', 'attack', 'defense', 'speed', 'special_attack', 'special_defense',]:
                    if self._statisfy_restraint(restraints_left, name, lvl, self.known, self.expected):
                        levels.add(lvl)

            sorted_levels = sorted(list(levels))

        return sorted_levels

gf = PokemonGeneFinder("Abra", level = 1, nature = "careful", hidden_power = None)
print "levels", gf.get_tested_levels()
