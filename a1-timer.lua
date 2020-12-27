function init()
  color = 3
  number = 1500
  counter = metro.init()
  counter.time = 1
  counter.count = -1
  counter.event = count
  counting = nil
  tick()
end

function count(c)
  if number > 0 then
    color = 3
    number = number - 1
    tick()
  elseif number == 0 then
    blink()
  end
end

function blink()
  if color == 3 then
    color = 0
  elseif color == 0 then
    color = 3
  end
  tick()
end

-- clock
-- if timer reaches zero, blink
function tick()
  minute = string.format("%02d", math.floor(number / 60))
  second = string.format("%02d", number % 60)
  redraw()
end


function redraw()
  screen.clear()
  screen.level(color)
  screen.font_face(17)
  screen.font_size(42)
  screen.move(0,50)
  screen.text(minute .. ":" .. second)
  screen.update()
end

function key(n,z)
  -- color = 3 + z * 12
  
  if z == 1 then
  
    if n == 2 then
      number = 1500
      tick()
    end
  
    if n == 3 then
      
      if counting then
        counter:stop()
        counting = nil
      else
        counter:start()
        counting = 1
      end
    end
  end
end

function enc(n,d)
  
  if n == 3 then
    if number + d > 0 then
      number = number + d
    end
    tick()
  end
  
  if n == 2 then
    if (number + d*60) > 0 then
      number = number + (d*60)
    end
    tick()
  end
  
end