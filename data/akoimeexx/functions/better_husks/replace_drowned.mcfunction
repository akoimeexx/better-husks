summon minecraft:zombie ~ ~ ~
tag @e[type=minecraft:zombie,sort=nearest,limit=1] add am.conversion

# Update death loot table for sandy goodness
data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] DeathLootTable set value "minecraft:entities/zombie"

# Copy equipment to the new zombie entity, if it doesn't have equipment already
#   Armor
execute if data entity @s ArmorItems[0].Count unless data entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[0].Count run data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[0] set from entity @s ArmorItems[0]
execute if data entity @s ArmorItems[1].Count unless data entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[1].Count run data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[1] set from entity @s ArmorItems[1]
execute if data entity @s ArmorItems[2].Count unless data entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[2].Count run data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[2] set from entity @s ArmorItems[2]
execute if data entity @s ArmorItems[3].Count unless data entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[3].Count run data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorItems[3] set from entity @s ArmorItems[3]
data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] ArmorDropChances set from entity @s ArmorDropChances
#   Copy persistent flag, if applicable.
execute if entity @s[nbt={PersistenceRequired:1b}] run data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] PersistenceRequired set value 1b
#   Equipment
execute if data entity @s HandItems[0].Count run data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] HandItems[1] set from entity @s HandItems[0]
data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] HandDropChances[1] set value 2f

# Turn drowned into baby, if set
data modify entity @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] IsBaby set from entity @s IsBaby

# Remove drowned conversion tag
tag @e[type=minecraft:zombie,tag=am.conversion,sort=nearest,limit=1] remove am.conversion

# Denote conversion
particle cloud ~ ~ ~ 0.125 0.25 0.125 0.05 25 force @a[distance=..32]

# Remove Zombie
effect give @s minecraft:invisibility 5 1 true
tp @s ~ -128 ~
kill @s
