summon minecraft:husk ~ ~ ~ {IsBaby:0b}
tag @e[type=minecraft:husk,sort=nearest,limit=1] add am.conversion

data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] Rotation set from entity @s Rotation

# Update death loot table for sandy goodness
data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] DeathLootTable set value "akoimeexx:better_husks/entities/sandy_husk"

# Copy equipment to the new husk entity
#   Armor
data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] ArmorItems set from entity @s ArmorItems
data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] ArmorDropChances set from entity @s ArmorDropChances

#   Copy persistent flag, if applicable.
execute if entity @s[nbt={PersistenceRequired:1b}] run data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] PersistenceRequired set value 1b

#   Equipment
data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] HandItems set from entity @s HandItems
data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] HandDropChances set from entity @s HandDropChances

# Turn drowned into baby, if set
data modify entity @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] IsBaby set from entity @s IsBaby

# Remove drowned conversion tag
tag @e[type=minecraft:husk,tag=am.conversion,sort=nearest,limit=1] remove am.conversion

# Denote conversion
particle cloud ~ ~ ~ 0.125 0.25 0.125 0.05 25 force @a[distance=..32]

# Remove Zombie
effect give @s minecraft:invisibility 5 1 true
tp @s ~ -128 ~
kill @s
