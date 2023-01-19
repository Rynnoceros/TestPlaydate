import "CoreLibs/object"
import "CoreLibs/graphics"

local gfx <const> = playdate.graphics
local geo <const> = playdate.geometry
local snd <const> = playdate.sound
local refreshRate = -1


class("AnimatedButton").extends("Object")

function AnimatedButton:init(displayPosition, button, callback)
    self.buttonPosition = 0
    self.displayPosition = displayPosition
    self.button = button
    self.text = "*"..string.upper(button).."*"
    self.buttonRadius = 10
    self.buttonHeight = 5
    self.callback = callback
    self.sound = snd.sampleplayer.new("sounds/selection")
    self.diff = self.buttonRadius - gfx.getTextSize(self.text)
end

function AnimatedButton:update()
    self:clearButton()
    if playdate.buttonJustPressed(self.button) then
        self.sound:play()
        self.callback()
    else
        if refreshRate < 0 then
            refreshRate = 1
            self.buttonPosition += 1
            if self.buttonPosition >= self.buttonHeight then
                self.buttonPosition = 0
            end
        end
        gfx.drawArc(self.displayPosition.x, self.displayPosition.y + self.buttonPosition, self.buttonRadius, 0, 360)
        gfx.drawText(self.text, self.displayPosition.x - (self.buttonRadius / 2) + self.diff, self.displayPosition.y - self.buttonRadius + 1 + self.buttonPosition)
        for i = self.buttonPosition, self.buttonHeight, 1 do
            gfx.drawArc(self.displayPosition.x, self.displayPosition.y + i, self.buttonRadius, 80, 270)
        end
        refreshRate -= 1
    end
    coroutine.yield()
end

function AnimatedButton:clearButton()
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRect(self.displayPosition.x - self.buttonRadius, self.displayPosition.y - self.buttonRadius, self.buttonRadius * 2, self.buttonRadius * 2 + self.buttonHeight)
    gfx.setColor(gfx.kColorBlack)
end