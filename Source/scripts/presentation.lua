import "scripts/bubble_text"

local gfx <const> = playdate.graphics
local geo <const> = playdate.geometry
local snd <const> = playdate.sound

-- Clean screen
gfx.clear(gfx.kColorWhite)

-- Display hello message
elements = {}
table.insert(elements, BubbleText("*Hello there*", "a", 10, function()
    table.remove(elements)
    table.insert(elements, BubbleText("*Can you see me ?*", "b", 10, function()
        table.remove(elements)
        table.insert(elements, BubbleText("*Are you sure ?*", "a", 10, function()
            table.remove(elements)
        end))
    end))
end))

function playdate.update()
    for i = 1, #elements, 1 do
        elements[i]:update()
    end
end