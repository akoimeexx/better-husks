# Check if zombie can be tagged for husk conversion
execute as @e[type=#akoimeexx:better_husks/converts] unless score @s am.husk_clock matches 1.. at @s if entity @p[advancements={biomes:detect/dry=true},distance=..32] run scoreboard players set @s am.husk_clock 1
execute as @e[type=#akoimeexx:better_husks/converts] unless score @s am.husk_clock matches 1.. at @s if entity @p[advancements={biomes:detect/neutral/desert_hills=true},distance=..32] run scoreboard players set @s am.husk_clock 1
execute as @e[type=#akoimeexx:better_husks/converts,scores={am.husk_clock=1..}] at @s unless block ~ ~1 ~ #akoimeexx:better_husks/air run scoreboard players reset @s am.husk_clock
execute as @e[type=#akoimeexx:better_husks/converts,scores={am.husk_clock=1..}] at @s unless block ~ ~ ~ #akoimeexx:better_husks/air run scoreboard players reset @s am.husk_clock
execute as @e[type=#akoimeexx:better_husks/converts,scores={am.husk_clock=1..}] at @s unless block ~ ~-1 ~ #akoimeexx:better_husks/dessicant run scoreboard players reset @s am.husk_clock
execute as @e[type=#akoimeexx:better_husks/converts,scores={am.husk_clock=1..}] at @s unless block ~ ~-2 ~ #akoimeexx:better_husks/heat run scoreboard players reset @s am.husk_clock

# Increment counter for husk conversion
execute as @e[type=#akoimeexx:better_husks/converts,scores={am.husk_clock=1..}] run scoreboard players add @s am.husk_clock 1
execute as @e[type=#akoimeexx:better_husks/converts,scores={am.husk_clock=1..}] at @s run particle cloud ~ ~ ~ 0.125 0.25 0.125 0.05 5 normal @a[distance=..32]

# Replace zombies that have reached maximum dessication
execute as @e[type=minecraft:zombie,scores={am.husk_clock=31..}] at @s run function akoimeexx:better_husks/replace
execute as @e[type=minecraft:drowned,scores={am.husk_clock=31..}] at @s run function akoimeexx:better_husks/replace_drowned
scoreboard players set #HUSK_WATCHDOG am.husk_clock 0
