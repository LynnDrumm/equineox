function chessboardInit()

        chessboardOverlay  = love.graphics.newImage("gfx/pone/rarara.png")
end

function chessboard()

        love.graphics.setColor(255, 255, 255, 255)

        love.graphics.push()
        love.graphics.translate(dmScreenW / 2, dmScreenH / 2)

        size    = (math.sin(c * 1.1) * 64) + 96

        cnt = 1

        while cnt < 8 do

                love.graphics.push()
                love.graphics.rotate((c * 1.5) - (cnt / 64))

                r, g, b = HSV(cnt * 32, 255, 255)

                love.graphics.setColor(r, g, b, 64)

                y = -dmScreenH

                xor     = 0

                while y < dmScreenH do

                        if bit.bxor(0, xor) == 0 then

                                x       = -dmScreenW
                                xor     = 1
                        else

                                x       = -dmScreenW + size
                                xor     = 0
                        end

                        while x < dmScreenW do

                                love.graphics.rectangle("fill", x, y, size, size)

                                x = x + (size * 2)
                        end

                        y = y + size
                end

                love.graphics.pop()

                cnt = cnt + 1
        end

        love.graphics.pop()

        ---- draw image ----

        if kick() == true then

                yOff = 20
        end

        if yOff > 0 then

                yOff = yOff - 100 * dt
        end

        love.graphics.setColor(0, 0, 0, 128)
        love.graphics.draw(chessboardOverlay, 725, 85 + yOff, .08, .08)

        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(chessboardOverlay, 720, 80 + yOff, .08, .08)

        quickFlash()

        if c > 8 then

                c = 0
                kickTableC = 1
                activePart = plasma2
        end
end