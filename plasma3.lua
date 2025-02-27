function plasma3Init()

        plasma3overlay = love.graphics.newImage("gfx/pone/smokin_vinyl-alt_lores.png")

end


function plasma3()

        love.graphics.push()
        love.graphics.scale(6, 6)

        w = 320
        h = 180

        x = 0

        while x < w do

                y = 0

                sin = 128 + (128 * math.sin((c * 3) + x / 16))

                while y < h do

                        k = sin + 128 + (128 * math.sin((c * 3) + y / 16)) + 128 + (128 * math.sin((x + y) / 32)) + 128 + (128 * math.sin(math.sqrt(x * x + y * y) / 8)) / 8

                        k = k / 4
                        love.graphics.setColor(k, k, k)
                        love.graphics.rectangle("fill", x, y, 2, 2)
                        love.graphics.setColor(0, k / 2, k, 255)
                        love.graphics.circle("fill", x + 1, y + 1, .9, k / 24)

                        y = y + 2
                end

                x = x + 2
        end

        love.graphics.pop()

        if kick() == true then

                yOff = 20
        end

        if yOff > 0 then

                yOff = yOff - 1
        end

        love.graphics.setColor(0, 0, 0, 128)
        love.graphics.draw(plasma3overlay, 415, 145 + yOff, 0, .2, .2)

        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(plasma3overlay, 410, 140 + yOff, 0, .2, .2)

        quickFlash()

        if c > 8 then

                c = 0
                kickTableC = 1
                activePart = dycp2
        end
end