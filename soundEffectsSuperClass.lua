--Inspired by: https://gist.github.com/BlackBulletIV/3904043
-- "Generate sine wave tones in Love2D"

SoundEffect = Object:extend()

function SoundEffect:new(samples, freq)
  --self.samples = samples
  --self.freq = freq
  --sample rate = samples / seconds (Or samples * (1 / Period)), so:
  local rate = samples * freq
  local data = love.sound.newSoundData(samples, rate, 8)
  return data
  --If is looping, and is playing, and is at the final sample: Stop??
end

----------------------------
Motor = SoundEffect:extend()

function Motor:new(initVolume, samples, freq)
  
  local data = Motor.super.new(self, samples, freq)
  
  for i = 0, samples - 1 do --until math.pi * 2 * 10?? complete cicle
    data:setSample(i, initVolume * math.sin((i / (samples - 1) * math.pi * 2)))
  end
  
  self.source = love.audio.newSource(data)
  self.source:setLooping(true)
  self.playing = false
  self.time = 0
end

function Motor:play()
  self.playing = true
  self.time = 0
  love.audio.play(self.source)
end

function Motor:update(dt)
  if self.playing then
    self.source:setPitch(math.sin(self.time) * 0.375 + 0.625)
    self.time = self.time + dt 
  end
end