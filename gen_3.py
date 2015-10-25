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
    return math.floor((((2 * base + iv + math.floor(ev / 4)) * level) / 100) + level + 10)

def get_stat_value(level, base, iv, ev, nature):
    return math.floor(math.floor((((2 * base + iv + math.floor(ev / 4)) * level) / 100) + 5) * nature)


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

def get_tested_level(current_level, base, iv, nature):
    for lvl in xrange(current_level, 101):
        if is_single_iv(lvl, base, iv, nature):
            return lvl
    return None
  
def get_hp_tested_level(current_level, base, iv):
    for lvl in xrange(current_level, 101):
        if is_single_hp_iv(lvl, base, iv):
            return lvl
    return None
  
 
def get_tested_levels(current_level, pokemon, nature, hidden_power = None):
    if hidden_power is not None:
        attack_iv, defense_iv, speed_iv, special_attack_iv, special_defence_iv, hp_iv = hidden_power_max_stat[hidden_power]
    else:
        attack_iv, defense_iv, speed_iv, special_attack_iv, special_defence_iv, hp_iv = 31, 31, 31, 31, 31, 31

    attack_nature, defense_nature, speed_nature, special_attack_nature, special_defense_nature, _, _ = nature_factors[nature]
    
    hp_base, attack_base, defense_base, speed_base, special_attack_base, special_defense_base = pokemon_base[pokemon]
    
    hp_level = get_hp_tested_level(current_level, hp_base, hp_iv)
    attack_level = get_tested_level(current_level, attack_base, attack_iv, attack_nature)
    defense_level = get_tested_level(current_level, defense_base, defense_iv, defense_nature)
    speed_level = get_tested_level(current_level, speed_base, speed_iv, speed_nature)
    special_attack_level = get_tested_level(current_level, special_attack_base, special_attack_iv, special_attack_nature)
    special_defense_level = get_tested_level(current_level, special_defense_base, special_defence_iv, special_defense_nature)

    print "-hp at lvl ", hp_level, "should be", get_stat_hp_value(hp_level, hp_base, hp_iv, 0)
    print "-attack at lvl ", attack_level, "should be", get_stat_value(attack_level, attack_base, attack_iv, 0, attack_nature)
    print "-defense at lvl ", defense_level, "should be", get_stat_value(defense_level, defense_base, defense_iv, 0, defense_nature)
    print "-speed at lvl ", speed_level, "should be", get_stat_value(speed_level, speed_base, speed_iv, 0, speed_nature)
    print "-special attack at lvl ", special_attack_level, "should be", get_stat_value(special_attack_level, special_attack_base, special_attack_iv, 0, special_attack_nature)
    print "-special defense at lvl ", special_defense_level, "should be", get_stat_value(special_defense_level, special_defense_base, special_defence_iv, 0, special_defense_nature)

    levels = [hp_level, attack_level, defense_level, speed_level, special_attack_level, special_defense_level]
    levels = sorted(list(set(levels)))
    if None in levels:
        print "invalid needed level"
    return levels