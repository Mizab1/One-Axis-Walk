function load{
  scoreboard objectives add Pos.x dummy
  scoreboard objectives add Private dummy
  
  <%%
    // Change the "10" and "8" to the coordinates of your liking where the barrier will be and change the "8" and "2" to the number where Threshold - Near = Coords where the particle will start to appear
    storage.set("ThresholdPositiveX", 10)
    storage.set("ThresholdNegativeX", 0)
    storage.set("NearPositiveX", 7)
    storage.set("NearNegativeX", 3)

    emit(`scoreboard players set Threshold.Positive_x Private ${storage.get("ThresholdPositiveX")}`)
    emit(`scoreboard players set Near.Positive_x Private ${storage.get("NearPositiveX")}`)
    emit(`scoreboard players set Threshold.Negative_x Private ${storage.get("ThresholdNegativeX")}`)
    emit(`scoreboard players set Near.Negative_x Private ${storage.get("NearNegativeX")}`)
  %%>
}
function tick{
  execute as @a at @s run{
    # Store the current position of the player
    execute store result score @s Pos.x run data get entity @s Pos[0]

    # Tp the player back when they get beyond the barrier
    execute unless score @s Pos.x < Threshold.Positive_x Private run{
      tp ~-0.5 ~ ~
      tellraw @s {"text": "You can't change your direction", "color": "red"}
    }
    execute unless score @s Pos.x > Threshold.Negative_x Private run{
      tp ~0.5 ~ ~
      tellraw @s {"text": "You can't change your direction", "color": "red"}
    }

    # Display the particle when the player get close to the wall
    # Change the number beside
    execute if score @s Pos.x >= Near.Positive_x Private run{
      <%%
        emit(`particle dust 1 0 0 1 ${storage.get("ThresholdPositiveX")} ~1.5 ~ 0 1 1 0 20`)
        // emit(`particle block_marker barrier ${storage.get("ThresholdPositiveX")} ~1.5 ~ 0 1 1 0 1`)
      %%>
    }
    execute if score @s Pos.x <= Near.Negative_x Private run{
      <%%
        emit(`particle dust 1 0 0 1 ${storage.get("ThresholdNegativeX")} ~1.5 ~ 0 1 1 0 20`)
      %%>
    }
  }
}


