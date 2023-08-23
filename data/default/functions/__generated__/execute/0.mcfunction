# Made by Mizab using MC-Build

execute store result score @s Pos.z run data get entity @s Pos[2]
execute unless score @s Pos.z < Threshold.Positive_z Private run tp ~ ~ ~-0.3
execute unless score @s Pos.z > Threshold.Negative_z Private run tp ~ ~ ~0.3
execute if score @s Pos.z >= Near.Positive_z Private run particle dust 1 0 0 1 ~ ~1.5 6 1 1 0 0 20
execute if score @s Pos.z <= Near.Negative_z Private run particle dust 1 0 0 1 ~ ~1.5 -6 1 1 0 0 20