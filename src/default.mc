function load{
  scoreboard objectives add Pos.z dummy
  scoreboard objectives add Private dummy
  
  <%%
    // Change the "10" and "8" to the coordinates of your liking where the barrier will be and change the "8" and "2" to the number where Threshold - Near = Coords where the particle will start to appear
    storage.set("ThresholdPositiveZ", 6)
    storage.set("ThresholdNegativeZ", -6)
    storage.set("NearPositiveZ", 3)
    storage.set("NearNegativeZ", -3)

    emit(`scoreboard players set Threshold.Positive_z Private ${storage.get("ThresholdPositiveZ")}`)
    emit(`scoreboard players set Near.Positive_z Private ${storage.get("NearPositiveZ")}`)
    emit(`scoreboard players set Threshold.Negative_z Private ${storage.get("ThresholdNegativeZ")}`)
    emit(`scoreboard players set Near.Negative_z Private ${storage.get("NearNegativeZ")}`)
  %%>
}
function tick{
  execute as @a at @s run{
    # Store the current position of the player
    execute store result score @s Pos.z run data get entity @s Pos[2]

    # Tp the player back when they get beyond the barrier
    execute unless score @s Pos.z < Threshold.Positive_z Private run{
      tp ~ ~ ~-0.3
    }
    execute unless score @s Pos.z > Threshold.Negative_z Private run{
      tp ~ ~ ~0.3
    }

    # Display the particle when the player get close to the wall
    # Change the number beside
    execute if score @s Pos.z >= Near.Positive_z Private run{
      <%%
        emit(`particle dust 1 0 0 1 ~ ~1.5 ${storage.get("ThresholdPositiveZ")} 1 1 0 0 20`)
      %%>
    }
    execute if score @s Pos.z <= Near.Negative_z Private run{
      <%%
        emit(`particle dust 1 0 0 1 ~ ~1.5 ${storage.get("ThresholdNegativeZ")} 1 1 0 0 20`)
      %%>
    }
  }
}


