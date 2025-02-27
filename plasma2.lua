function plasma2Init()

        plasma2Overlay      = love.graphics.newImage("gfx/pone/pinkie.png")
        plasma2OverlayScale = .6
        plasma2OverlayX     = 1280 - (plasma2Overlay:getWidth()  * plasma2OverlayScale) - 10
        plasma2OverlayY     = 720  - (plasma2Overlay:getHeight() * plasma2OverlayScale) + 5

end


function plasma2()

        pi     = 3.1415
        scale  = 8
        width  = 1280 / scale
        height =  720 / scale

        love.graphics.push()
        love.graphics.scale(scale, scale)

        x = 0

        while x < width do

                y = 0

                while y < height do

                        k = ((math.sin(x * pi / 130) * (math.cos(c) * 512) + math.sin(y * pi / 45) * 128 + math.sin((y + x / (math.sin(c) + 2) + (c * (love.math.noise(4) * 128))) * pi / 45) * 128) / 4) + 64

                        r = 128 + 128 * math.sin(pi * k / 128)
                        g = 128 + 128 * math.sin(pi * k / 16)
                        b = 128 + 128 * math.sin(pi * k / 64)

                        love.graphics.setColor(r, g, b)
                        love.graphics.rectangle("fill", x, y, 1, 1)

                        y = y + 1
                end

                x = x + 1
        end

        love.graphics.pop()

        if kick() == true then

                yOff = 20
        end

        if yOff > 0 then

                yOff = yOff - 1
        end

        love.graphics.setColor(0, 0, 0, 128)
        love.graphics.draw(plasma2Overlay, plasma2OverlayX + 5, plasma2OverlayY + 5 + yOff, 0, plasma2OverlayScale, plasma2OverlayScale)

        love.graphics.setColor(255, 255, 255)
        love.graphics.draw(plasma2Overlay, plasma2OverlayX, plasma2OverlayY + yOff, 0, plasma2OverlayScale, plasma2OverlayScale)

        quickFlash()

        if c > 8 then

                c = 0
                kickTableC = 1
                activePart = kefrens
        end
end