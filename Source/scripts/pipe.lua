import "CoreLibs/graphics"
import "CoreLibs/object"

local gfx <const> = playdate.graphics
local geo <const> = playdate.geometry

class("Pipe").extends("Object")

function Pipe:init(x, y, length, thickness, isHorizontal)
    self.xCenterPosition = x
    self.yCenterPosition = y
    self.length = length
    self.thickness = thickness
    self.midLength = length / 2
    self.midThickness = thickness / 2
    self.isHorizontal = isHorizontal
    self.previousCrankPosition = 0
    self.rotationPoint = geo.point.new(x, y)
    self.ps1 = geo.point.new(x - self.midLength, y - self.midThickness)
    self.pe1 = geo.point.new(x + self.midLength, y - self.midThickness)
    self.ps2 = geo.point.new(x - self.midLength, y + self.midThickness)
    self.pe2 = geo.point.new(x + self.midLength, y + self.midThickness)
    self.rect1 = geo.rect.new(self.ps1.x - self.midThickness / 2, self.ps1.y, self.thickness, self.thickness)
end

function Pipe:test()
    gfx.drawLine(self.ps1.x, self.ps1.y, self.pe1.x, self.pe1.y)
    gfx.drawLine(self.ps2.x, self.ps2.y, self.pe2.x, self.pe2.y)
    gfx.drawRect(self.rect1)
end

function Pipe:applyTransform(affineTransform)
    affineTransform:transformPoint(self.ps1)
    affineTransform:transformPoint(self.ps2)
    affineTransform:transformPoint(self.pe1)
    affineTransform:transformPoint(self.pe2)
    affineTransform:transformAABB(self.rect1)
end

-- Draw the pipe according to its orientation
function Pipe:draw()
    if self.isHorizontal then
        self:drawHorizontal()
    else
        self:drawVertical()
    end
end

-- Draw the horizontal pipe
function Pipe:drawHorizontal()
    -- Define local variable used to draw
    local startX = self.xCenterPosition - self.midLength
    local startY = self.yCenterPosition - self.midThickness
    local endY = self.yCenterPosition + self.midThickness
    local endX = self.xCenterPosition + self.midLength

    -- Draw top and bottom line of the pipe
    gfx.drawLine(startX, startY, endX, startY)
    gfx.drawLine(startX, endY, endX, endY)
    
    -- Draw start and end ellipse of the pipe
    gfx.drawEllipseInRect(startX - self.midThickness / 2, startY, self.midThickness, self.thickness)
    gfx.drawEllipseInRect(startX + self.length - self.midThickness / 2, startY, self.midThickness, self.thickness, 0, 180)
    local border = self.midThickness / 2
    -- Draw shadow pipe
    for i = startX - border + 2, endX - border, 2 do
        gfx.drawEllipseInRect(i, startY, self.midThickness, self.thickness, 91, 180)        
    end 
end

-- Draw the vertical pipe
function Pipe:drawVertical()
    -- Define local variable used to draw
    local startX = self.xCenterPosition - self.midThickness
    local startY = self.yCenterPosition - self.midLength
    local endX = startX + self.thickness
    local endY = startY + self.length

    -- Draw left and right line of the pipe
    gfx.drawLine(startX, startY, startX, endY)
    gfx.drawLine(endX, startY, endX, endY)
    
    -- Draw start and end ellipse of the pipe
    gfx.drawEllipseInRect(startX, startY - self.midThickness / 2, self.thickness, self.midThickness)
    gfx.drawEllipseInRect(startX, startY + self.length - self.midThickness / 2, self.thickness, self.midThickness, 90, 260)
    local border = self.midThickness / 2
    -- Draw shadow pipe
    for i = startY - border + 2, endY - border, 2 do
        gfx.drawEllipseInRect(startX, i, self.thickness, self.midThickness, 181, 260)        
    end 
end

function Pipe:update()
    local newPosition = playdate.getCrankPosition()
    local diff = math.abs(newPosition - self.previousCrankPosition)
    self.previousCrankPosition = newPosition
    if diff > 90 then
        gfx.setColor(gfx.kColorWhite)
        gfx.fillRect(0,0, 400, 240)
        gfx.setColor(gfx.kColorBlack)
        self.isHorizontal = not self.isHorizontal
    end
    self:draw()
end
