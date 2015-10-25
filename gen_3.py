import math
from operator import itemgetter

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
    
    'Mischievous' : ('special attack', 1),
    'Highly curious' : ('special attack', 0),
    'Very finicky' : ('special attack', 4),
    'Often lost in thought' : ('special attack', 3),
    'Thoroughly cunning' : ('special attack', 2),
    
    'Somewhat vain' : ('special defense', 1),
    'Strong willed' : ('special defense', 0),
    'Somewhat stubborn' : ('special defense', 4),
    'Hates to lose' : ('special defense', 3),
    'Strongly defiant' : ('special defense', 2),
}

pokemon_base = {}
for l in open("pokemon_stat.csv", "rt"):
    l = l.replace('\n', '')
    if l.startswith("#") or l == '':
        continue
    #,Name,HP,Attack,Defense,Sp. Atk,Sp. Def,Speed
    number, name, hp, attack, defense, special_attack, special_defense, speed = l.split(',')
    number, name, hp, attack, defense, special_attack, special_defense, speed = int(number), name, int(hp), int(attack), int(defense), int(special_attack), int(special_defense), int(speed)
    pokemon_base[name] = hp, attack, defense, speed, special_attack, special_defense
    
def get_stat_hp_value(level, base, iv, ev):
    return math.floor(           (((2 * base + iv + math.floor(ev / 4)) * level) / 100) + level + 10          )
    # get_stat_value(level / 2, base + 50, iv, ev, 2)
    # return math.floor(math.floor((((2 * (base + 50) + iv + math.floor(ev / 4)) * level / 2) / 100)          + 5) * 2)
    # return math.floor(math.floor((((2 * base + 100 + iv + math.floor(ev / 4)) * level) / 100)          + 10))
    # return math.floor(math.floor((((2 * base + iv + math.floor(ev / 4)) * level) / 100) + 100 * level / 100          + 10))
    # return math.floor(math.floor((((2 * base + iv + math.floor(ev / 4)) * level) / 100) + level          + 10))

def get_stat_value(level, base, iv, ev, nature):
    return math.floor(math.floor((((2 * base + iv + math.floor(ev / 4)) * level) / 100)          + 5) * nature)


def is_valid_hp_stat(level, base, ev, stat):
   if stat < 10:
	  return False
   if level <= 50:
	  return True
   if math.ceil(((stat - 10 - level) * 100) / level) <> math.floor(((stat - 10 - level) * 100 + 99)/ level):
	  return False
   return True
   # return ($stat >= 10 and $level <= 50 or (Ceiling((($stat - 10) * 50) / $level) <> Floor((($stat - 10) * 50 + 49)/ $level)))

def is_valid_stat(level, base, ev, stat, nature):
   if stat < 5:
	  return False
   if level <= 50:
	  return True
   if math.ceil(((stat / nature - 5) * 100) / level) <>  math.floor(((stat / nature - 5) * 100 + 99)/ level):
	  return False
   return True
   # return $stat >= 5 and ($level <= 50 or Ceiling((($stat - 5) * 50) / $level) <>  Floor((($stat - 5) * 50 + 49)/ $level))


def get_hp_iv_value_min(level, base, ev, stat):
    return min(iv for iv in xrange(32) if get_stat_hp_value(level, base, iv, ev) == stat)
    if not is_valid_hp_stat(level, base, ev, stat):
        return None
    return max(min(math.ceil  ( (stat - 10 - level)  * 100        / level  - 2 * base - math.floor(ev / 4)), 31), 0)

def get_hp_iv_value_max(level, base, ev, stat):
    return max(iv for iv in xrange(32) if get_stat_hp_value(level, base, iv, ev) == stat)
    if not is_valid_hp_stat(level, base, ev, stat):
        return None
    return max(min(math.floor (((stat - 10 - level)  * 100 + 99)  / level) - 2 * base - math.floor(ev / 4) , 31), 0)

def get_iv_value_min(level, base, ev, stat, nature):
    return min(iv for iv in xrange(32) if get_stat_value(level, base, iv, ev, nature) == stat)
    if not is_valid_stat(level, base, ev, stat, nature):
        return None
    return max(min(math.ceil  ( (stat / nature - 5 ) * 100        / level  - 2 * base - math.floor(ev / 4)), 31), 0)

def get_iv_value_max(level, base, ev, stat, nature):
    return max(iv for iv in xrange(32) if get_stat_value(level, base, iv, ev, nature) == stat)
    if not is_valid_stat(level, base, ev, stat, nature):
        return None
    return max(min(math.floor (((stat / nature - 5 ) * 100 + 99) / level)  - 2 * base - math.floor(ev / 4) , 31), 0)


def is_single_hp_iv(lvl, base, iv):
    stat = get_stat_hp_value(lvl, base, iv, 0)
    min, max = get_hp_iv_value_min(lvl, base, 0, stat), get_hp_iv_value_max(lvl, base, 0, stat)
    if False in (min, max):
        return False
    return min == max

def is_single_iv(lvl, base, iv, nature):
    stat = get_stat_value(lvl, base, iv, 0, nature)
    min, max = get_iv_value_min(lvl, base, 0, stat, nature), get_iv_value_max(lvl, base, 0, stat, nature)
    if False in (min, max):
        return False
    return min == max

# def get_tested_level(current_level, base, iv, nature):
    # for lvl in xrange(current_level, 101):
        # if is_single_iv(lvl, base, iv, nature):
            # return lvl
    # return None
  
# def get_hp_tested_level(current_level, base, iv):
    # for lvl in xrange(current_level, 101):
        # if is_single_hp_iv(lvl, base, iv):
            # return lvl
    # return None

def get_tested_level(current_level, base, iv, nature):
    min_lvl, max_lvl = None, None
    for lvl in xrange(current_level, 101):
        stat = get_stat_value(lvl, base, iv, ev, nature)
        if min_lvl is None and get_iv_value_min(lvl, base, ev, stat, nature) == iv:
            min_lvl = lvl
        if max_lvl is None and get_iv_value_max(lvl, base, ev, stat, nature) == iv:
            max_lvl = lvl
        if None not in (min_lvl, max_lvl):
            break
    return min_lvl, max_lvl
  
def get_hp_tested_level(current_level, base, iv):
    min_lvl, max_lvl = None, None
    for lvl in xrange(current_level, 101):
        stat = get_stat_hp_value(lvl, base, iv, ev)
        if min_lvl is None and get_hp_iv_value_min(lvl, base, ev, stat) == iv:
            min_lvl = lvl
        if max_lvl is None and get_hp_iv_value_max(lvl, base, ev, stat) == iv:
            max_lvl = lvl
        if None not in (min_lvl, max_lvl):
            break
    return min_lvl, max_lvl
    
def test_level_hp_stat(current_level, stat, level, base, iv, ev):
    min_iv = max(get_hp_iv_value_min(current_level, base, ev, stat), min_iv)
    max_iv = min(get_hp_iv_value_max(current_level, base, ev, stat), max_iv)
    return min_iv, max_iv, min_iv <= iv <= max_iv
    if current_level == level:
        if stat != get_stat_hp_value(level, base, iv, ev):
            return False 
    elif current_level < level:
        if not get_hp_iv_value_min(current_level, base, ev, stat) <= iv <= get_hp_iv_value_max(current_level, base, ev, stat):
            return False
    return True
    
def test_level_stat(current_level, stat, level, base, iv, ev, nature):
    min_iv = max(get_iv_value_min(current_level, base, ev, stat, nature), min_iv)
    max_iv = min(get_iv_value_max(current_level, base, ev, stat, nature), max_iv)
    return min_iv, max_iv, min_iv <= iv <= max_iv
    if current_level == level:
        if stat != get_stat_value(level, base, iv, ev, nature):
            return False 
    elif current_level < level:
        if not get_iv_value_min(current_level, base, ev, stat, nature) <= iv <= get_iv_value_max(current_level, base, ev, stat, nature):
            return False
    return True
    
def test_characteristic(stat_name, min_iv, max_iv, max_ivs):
    max_without_max_iv = max(max_ivs)
    if min_iv > max_without_max_iv:
        if len(highest_iv_names) == 1:
            if highest_iv_names[0] != stat_name:
                return False
            if not any(a % 5 == 0 for a in xrange(min_iv, max_iv + 1)):
                return False
            
def test_level(current_level, stat):
    hp_ev, attack_ev, defense_ev, speed_ev, special_attack_ev, special_defense_ev = 0, 0, 0, 0, 0, 0
    hp, attack, defense, speed, special_attack, special_defense = stat
    res, min_hp_iv, max_hp_iv = test_level_hp_stat(current_level, hp          , hp_level             , hp_base             , hp_iv             , hp_ev                                     , min_hp_iv, max_hp_iv):
    if not res:
        return False 
    res, min_attack_iv, max_attack_iv = test_level_stat(current_level, attack         , attack_level         , attack_base         , attack_iv         , attack_ev         , attack_nature         , min_attack_iv, max_attack_iv):
    if not res:
        return False 
    res, min_defense_iv, max_defense_iv = test_level_stat(current_level, defense        , defense_level        , defense_base        , defense_iv        , defense_ev        , defense_nature        , min_defense_iv, max_defense_iv):
    if not res:
        return False 
    res, min_speed_iv, max_speed_iv = test_level_stat(current_level, speed          , speed_level          , speed_base          , speed_iv          , speed_ev          , speed_nature          , min_speed_iv, max_speed_iv):
    if not res:
        return False 
    res, min_special_attack_iv, max_special_attack_iv = test_level_stat(current_level, special_attack , special_attack_level , special_attack_base , special_attack_iv , special_attack_ev , special_attack_nature , min_special_attack_iv, max_special_attack_iv):
    if not res:
        return False 
    res, min_special_defense_iv, max_special_defense_iv = test_level_stat(current_level, special_defense, special_defense_level, special_defense_base, special_defence_iv, special_defense_ev, special_defense_nature, min_special_defense_iv, max_special_defense_iv):
    if not res:
        return False 
    
    if characteristics is not None:
        if not test_characteristic('hp', min_hp_iv, max_hp_iv, (max_attack_iv, max_defense_iv, max_speed_iv, max_special_attack_iv, max_special_defense_iv)):
            return False

        if not test_characteristic('attack', min_attack_iv, max_attack_iv, (max_hp_iv, max_defense_iv, max_speed_iv, max_special_attack_iv, max_special_defense_iv)
            return False

        if not test_characteristic('defense', min_defense_iv, max_defense_iv, (max_attack_iv, max_hp_iv, max_speed_iv, max_special_attack_iv, max_special_defense_iv)
            return False

        if not test_characteristic('speed', min_speed_iv, max_speed_iv, (max_attack_iv, max_defense_iv, max_hp_iv, max_special_attack_iv, max_special_defense_iv)
            return False

        if not test_characteristic('special attack', min_special_attack_iv, max_special_attack_iv, (max_attack_iv, max_defense_iv, max_speed_iv, max_hp_iv, max_special_defense_iv)
            return False

        if not test_characteristic('special defense', min_special_defense_iv, max_special_defense_iv, (max_attack_iv, max_defense_iv, max_speed_iv, max_special_attack_iv, max_hp_iv)
            return False
                    
    return True

def get_tested_levels(current_level, pokemon, nature, characteristics = None, hidden_power = None):
    if hidden_power is not None:
        attack_iv, defense_iv, speed_iv, special_attack_iv, special_defence_iv, hp_iv = hidden_power_max_stat[hidden_power]
    else:
        attack_iv, defense_iv, speed_iv, special_attack_iv, special_defence_iv, hp_iv = 31, 31, 31, 31, 31, 31

    attack_nature, defense_nature, speed_nature, special_attack_nature, special_defense_nature, _, _ = nature_factors[nature]
    
    hp_base, attack_base, defense_base, speed_base, special_attack_base, special_defense_base = pokemon_base[pokemon]
    
    if characteristics is not None:
        characteristic_stat_name, characteristics_mod_5 = characteristics_table[characteristics]
        max_iv = max(attack_iv, defense_iv, speed_iv, special_attack_iv, special_defence_iv, hp_iv)
        iv_dict = dict(('attack', attack_iv), ('defense', defense_iv), ('speed', speed_iv), ('special attack', special_attack_iv), ('special defense', special_defence_iv), ('hp', hp_iv))
        highest_iv_names = [stat_name for stat_name, iv in iv_dict if max_iv == iv]
        
        if characteristic_stat_name not in highest_iv_names:
            print 'highest expected iv mismatch owned characteristics'
            return None
        if len(highest_iv_names) == 1 and iv_dict[characteristic_stat_name] % 5 != characteristics_mod_5:
            print 'invalid expected iv modulu 5 for owned characteristics text'
            return None
    hp_level_min, hp_level_max = get_hp_tested_level(current_level, hp_base, hp_iv)
    attack_level_min, attack_level_max = get_tested_level(current_level, attack_base, attack_iv, attack_nature)
    defense_level_min, defense_level_max = get_tested_level(current_level, defense_base, defense_iv, defense_nature)
    speed_level_min, speed_level_max = get_tested_level(current_level, speed_base, speed_iv, speed_nature)
    special_attack_level_min, special_attack_level_max = get_tested_level(current_level, special_attack_base, special_attack_iv, special_attack_nature)
    special_defense_level_min, special_defense_level_max = get_tested_level(current_level, special_defense_base, special_defence_iv, special_defense_nature)

    print "-hp min at lvl ", hp_level_min, "should be", get_stat_hp_value(hp_level_min, hp_base, hp_iv, 0)
    print "-hp max at lvl ", hp_level_max, "should be", get_stat_hp_value(hp_level_max, hp_base, hp_iv, 0)
    
    print "-attack min at lvl ", attack_level_min, "should be", get_stat_value(attack_level_min, attack_base, attack_iv, 0, attack_nature)
    print "-attack max at lvl ", attack_level_max, "should be", get_stat_value(attack_level_max, attack_base, attack_iv, 0, attack_nature)
    
    print "-defense min at lvl ", defense_level_min, "should be", get_stat_value(defense_level_min, defense_base, defense_iv, 0, defense_nature)
    print "-defense max at lvl ", defense_level_max, "should be", get_stat_value(defense_level_max, defense_base, defense_iv, 0, defense_nature)
    
    print "-speed min at lvl ", speed_level_min, "should be", get_stat_value(speed_level_min, speed_base, speed_iv, 0, speed_nature)
    print "-speed max at lvl ", speed_level_max, "should be", get_stat_value(speed_level_max, speed_base, speed_iv, 0, speed_nature)
    
    print "-special attack min at lvl ", special_attack_level_min, "should be", get_stat_value(special_attack_level_min, special_attack_base, special_attack_iv, 0, special_attack_nature)
    print "-special attack max at lvl ", special_attack_level_max, "should be", get_stat_value(special_attack_level_max, special_attack_base, special_attack_iv, 0, special_attack_nature)
    
    print "-special defense min at lvl ", special_defense_level_min, "should be", get_stat_value(special_defense_level_min, special_defense_base, special_defence_iv, 0, special_defense_nature)
    print "-special defense max at lvl ", special_defense_level_max, "should be", get_stat_value(special_defense_level_max, special_defense_base, special_defence_iv, 0, special_defense_nature)
    

    levels = [
        hp_level_min, hp_level_max, 
        attack_level_min, attack_level_max, 
        defense_level_min, defense_level_max, 
        speed_level_min, speed_level_max, 
        special_attack_level_min, special_attack_level_max, 
        special_defense_level_min, special_defense_level_max
    ]
    levels = sorted(list(set(levels)))
    if None in levels:
        print "invalid needed level", levels
        return None
    return levels