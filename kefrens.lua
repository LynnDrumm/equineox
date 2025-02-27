function kefrensInit()

        kefrensBar1     = love.graphics.newImage("gfx/vbar1.png")
        kefrensBar2     = love.graphics.newImage("gfx/vbar2.png")
        kefrensOverlay  = love.graphics.newImage("gfx/pone/sweetiebelle.png")
end

function kefrens()

        love.graphics.setColor(255, 255, 255, 255)
        y = 0

        while y < 600 do

                if c < 4 then

                        sin = (math.sin((c / 512) + y / 64) * 128) + 256
                        x = (math.cos((c * 4) + y / 32) * sin) + 580
                        love.graphics.draw(kefrensBar1, x, y, 0, 1, 700)
                else

                        sin = (math.sin((c / 512) + y / 16) * 192) + 256
                        x = (math.cos((c * 3) + y / 32) * sin) + 580
                        love.graphics.draw(kefrensBar2, x, y, 0, 1, 700)
                end

                y = y + 2
        end

                ---- draw image ----

        if kick() == true then

                yOff = 20
        end

        if yOff > 0 then

                yOff = yOff - 1
        end

        love.graphics.setColor(0, 0, 0, 128)
        love.graphics.draw(kefrensOverlay, 555, 405 + yOff, -.1, .08, .08)

        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(kefrensOverlay, 550, 400 + yOff, -.1, .08, .08)

        quickFlash()

        if c > 8 then

                c = 0
                kickTableC = 1
                activePart = dots
        end
end