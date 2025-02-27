function dotsInit()

        dotsCenterX = 160
        dotsCenterY = 90
        dotsAlpha   = 0

        dotsPic     = love.graphics.newImage("gfx/pone/twi.png")
        dotsPicScale = .15
        dotsPicYpos = 720

end

function dots()

        love.graphics.push()
        love.graphics.scale(4, 4)

        cntMain = 1

        cnt = 1

        while cnt < 94 do

                cntSub = 1

                totSub = 128

                cos = (cnt * math.sin(c / 128))


                while cntSub <= totSub do

                        x = (math.cos(c + ((cntSub + cos) * (totSub / 180))) * (cnt * 2)) + dotsCenterX
                        y = (math.sin(c + ((cntSub + cos) * (totSub / 180))) * (cnt * 2)) + dotsCenterY

                        love.graphics.setColor(255 - y, 255 - (x / 1.5), 255, dotsAlpha)

                        love.graphics.circle("fill", x, y, 2 + (cnt / 32))

                        cntSub = cntSub + 1

                        cntMain = cntMain + 1
                end

                cnt = cnt + 1
        end

        if dotsAlpha < 32 then

                dotsAlpha = dotsAlpha + 15 * dt
        end

        love.graphics.pop()

        -- overlay gfx --

        if kick() == true then

                yOff = 20
        end

        if yOff > 0 then

                yOff = yOff - 1
        end

        love.graphics.setColor(0, 0, 0, 128)
        love.graphics.draw(dotsPic, 15, dotsPicYpos + 5 + yOff, 0, dotsPicScale, dotsPicScale)
        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(dotsPic, 10, dotsPicYpos + yOff, 0, dotsPicScale, dotsPicScale)

        if dotsPicYpos > 100 then

                dotsPicYpos = dotsPicYpos - 150 * dt
        end

        if c > 8 then

                c = 0
                kickTableC = 1
                activePart = plasma3
        end

        ------------------
end