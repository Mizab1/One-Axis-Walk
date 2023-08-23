# Made by Mizab using MC-Build

execute store result score @s Pos.x run data get entity @s Pos[0]
execute unless score @s Pos.x < Threshold.Positive_x Private run tp ~-0.3 ~ ~
execute unless score @s Pos.x > Threshold.Negative_x Private run tp ~0.3 ~ ~
execute if score @s Pos.x >= Near.Positive_x Private run particle dust 1 0 0 1 6 ~1.5 ~ 0 1 1 0 20
execute if score @s Pos.x <= Near.Negative_x Private run particle dust 1 0 0 1 -6 ~1.5 ~ 0 1 1 0 20