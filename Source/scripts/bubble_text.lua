import "CoreLibs/object"
import "scripts/animated_button"

local gfx <const> = playdate.graphics
local geo <const> = playdate.geometry

class("BubbleText").extends("Object")

function BubbleText:init(text, button, border, callback)
    self.text = text
    self.border = border
    self.textSize = gfx.getTextSize(text)
    self.bubbleLength = self.textSize + 5 * border
    self.bubbleHeight = 40
    self.bubbleRadius = 10
    self.startPoint = geo.point.new((400 - self.bubbleLength) / 2, 240 - self.bubbleHeight - 2 * border)
    self.button = AnimatedButton(geo.point.new(self.startPoint.x + self.textSize + 3 * border, 240 - self.bubbleHeight), button, 
        function()
            gfx.setColor(gfx.kColorWhite)
            gfx.fillRect(self.startPoint.x, self.startPoint.y, self.bubbleLength, self.bubbleHeight)
            gfx.setColor(gfx.kColorBlack)
            self.button = nil
            callback()
        end)
    gfx.drawRoundRect(self.startPoint.x, self.startPoint.y, self.bubbleLength, self.bubbleHeight, self.bubbleRadius)
    gfx.drawText(self.text, self.startPoint.x + self.border, self.startPoint.y + self.border)
end

function BubbleText:update()
    if self.button ~= nil then
        self.button:update()
    end
end