function flashInit()

        flashFade = 0
        rgbOff = 0
        quickFlashFade = 0

        kickTable = {

                0, 0.406, 0.750, 1.156, 1.5,
                2, 2.406, 2.750, 3.156, 3.5, 3.75,
                4, 4.406, 4.750, 5.156, 5.5,
                6, 6.406, 6.750, 7.156, 7.375, 7.5, 7.75
        }

        kickTableC = 1
        kickTableT = 23
end

function kick()

        if c > kickTable[kickTableC] then

                kickTableC = kickTableC + 1

                if kickTableC > kickTableT then

                        kickTableC = 1
                end

                return true
        end
end

function flash()

        if c > 3.9 and c < 4
        or c > 11.9 and c < 12
        or c > 19.9 and c < 20
        or c > 27.9 and c < 28 then

                flashFade = 128
                rgbOff = 0
        end

        if flashFade > 0 then

                love.graphics.setColor(255, 0, 0, flashFade)
                love.graphics.draw(canvas, -5 + rgbOff, -5 + rgbOff)

                love.graphics.setColor(0, 0, 255, flashFade)
                love.graphics.draw(canvas, 5 - rgbOff, 5 - rgbOff)

                love.graphics.setColor(255, 255, 255, flashFade)
                --love.graphics.draw(canvas, 0, 0)
                love.graphics.rectangle("fill", 0, 0, 1280, 720)

                flashFade = flashFade - 200 * dt

                if flashFade < 0 then

                        flashFade = 0
                end

                rgbOff = rgbOff + .64 * dt
        end
end

function quickFlash()

        if c < 0.1 then

                quickFlashFade = 255
        end

        if quickFlashFade > 0 then

                love.graphics.setColor(255, 255, 255, quickFlashFade)
                love.graphics.rectangle("fill", 0, 0, 1280, 720)

                quickFlashFade = quickFlashFade - 4

                if quickFlashFade < 0 then

                        quickFlashFade = 0
                end
        end
end

function flicker()

        if c > 7.9 and c < 7.95
        or c > 8.0 and c < 8.1
        or c > 8.2 and c < 8.2 then

                love.graphics.setColor(0, 0, 0, 255)
                love.graphics.rectangle("fill", 0, 0, 1280, 720)
        end
end

