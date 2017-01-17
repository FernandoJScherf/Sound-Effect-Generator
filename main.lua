function love.load()
  Object = require "classic"
  require "soundEffectsSuperClass"
  
  motor = Motor(0.50, 256, 131)
end

function love.update(dt)
  if love.keyboard.isDown("m") then
    motor:play()
  end
  
  motor:update(dt)
end

function love.draw()
  if motor.time then
    love.graphics.print(
      string.format("%.2f", math.sin(motor.time) * 0.375 + 0.625), 10, 10)
  else
    love.graphics.print("No", 10, 10)
  end
end