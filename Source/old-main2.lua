--import "scripts/script1"
import "scripts/bubble_text"

local gfx <const> = playdate.graphics
local geo <const> = playdate.geometry
local snd <const> = playdate.sound

synth = snd.synth.new(snd.kWaveSine)
local testCallback = function()
    print("button pressed")
end

--local inputHandlers = {
--    AButtonDown = function()
--        gfx.clear(gfx.kColorWhite)
--        table.remove(elements)
        --synth:playNote(30, 1.0, 0.2)
        --gfx.clear(gfx.kColorWhite)
        --bubble = nil
        --synth.allNotesOff()
--    end
--}

elements = {}
local bubble = BubbleText("*Hello there*", "a", 10, testCallback)
table.insert(elements, bubble)
--playdate.inputHandlers.push(inputHandlers)

function playdate.update()
    for i = 1, #elements, 1 do
        elements[i]:update()
    end 
    --for i = 0, 20000, 10 do
    --    print("note " .. i)
    --    synth:playNote(i, 1.0, 0.1)
    --    playdate.wait(500)
    --end
end