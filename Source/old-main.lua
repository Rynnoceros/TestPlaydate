import "scripts/pipe"
import "CoreLibs/graphics"
import "CoreLibs/sprites"

--local testPipe = Pipe(200, 120, 200, 40, true)

--local gfx = playdate.graphics
--local geo = playdate.geometry

--local p = geo.point.new(10, 10)
--local p2 = geo.point.new(100, 100)
--gfx.drawLine(p.x, p.y, p2.x, p2.y)
--local t = geo.affineTransform.new()
--print(t)
--t:rotate(50, p2)
--print(t)
--print(p)

--t:transformPoint(p)
--gfx.drawLine(p.x, p.y, p2.x, p2.y)
--local image = gfx.image.new("image/campfire2")
--local sprite = gfx.sprite.new(image)
--sprite:moveTo(100,100)
--sprite:add()

--print(image)
--print(sprite.x)

--function playdate.update()
--    sprite:update()
    --testPipe:test()
    --local crank = playdate.getCrankChange()
    --if (crank ~= 0) then
    --    gfx.setColor(gfx.kColorWhite)
    --    gfx.fillRect(0,0, 400, 240)
    --    gfx.setColor(gfx.kColorBlack)
    --    local tr = geo.affineTransform.new()
    --    tr:rotate(crank, testPipe.rotationPoint)
    --    testPipe:applyTransform(tr)
    --end
    --testPipe:update()
    --testVPipe:draw()
    --gfx.drawEllipseInRect(5, 10, 10, 20)
    --gfx.drawLine(10, 10, 30, 10)
    --gfx.drawLine(10, 30, 25, 30)
    --gfx.drawEllipseInRect(10, 10, 40, 40, 0, 90)
    --gfx.drawArc(10, 50, 20, 0, 90)
    --gfx.drawEllipseInRect(20, 30, 10, 10, 0, 90)
    --gfx.drawLine(50, 30, 50, 50)
    --gfx.drawLine(30, 35, 30, 50)
    --gfx.drawEllipseInRect(30, 45, 20, 10, 90, 260)

    --for i = 6, 20, 2 do
    --    gfx.drawEllipseInRect(i, 20, 10, 10, 75, 180)
    --end

    --for i = 30, 44, 2 do
    --    gfx.drawEllipseInRect(30, i, 10, 10, 140, 260)
    --end
--end