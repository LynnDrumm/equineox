function plasmaInit()

        plasmaXtotal         =  180
        plasmaYtotal         =  167
        plasmaAlpha          =  255

        plasmaBorderAlpha    =    255
        plasmaBorderWidth    =  184
        plasmaBorderWidthMax =  184
        plasmaOverlayAlpha   =    255
        plasmaOverlayX       =    550
        plasmaBackgroundAlpha = 0

        plasmaPic         =    love.graphics.newImage("gfx/pone/basscannon.png")
end

function plasma()

        ---- set background colour ----

        love.graphics.setColor(85, 200, 100)
        love.graphics.rectangle("fill", 0, 0, 1280, 720)

        -- change scale to upscale plasma and draw area
        love.graphics.push()
        love.graphics.scale(4, 4)

        ---- draw plasma border ----

        love.graphics.setColor(0, 0, 0, plasmaBorderAlpha)
        love.graphics.rectangle("fill", -1, 10, plasmaBorderWidth, 160)

        if plasmaBorderWidth < plasmaBorderWidthMax then

                plasmaBorderWidth = plasmaBorderWidth + 100 * dt

                if plasmaBorderWidth > plasmaBorderWidthMax then

                        plasmaBorderWidth = plasmaBorderWidthMax
                end
        end

        if plasmaBorderAlpha < 255 then

                plasmaBorderAlpha = plasmaBorderAlpha + 150 * dt

                if plasmaBorderAlpha > 255 then

                        plasmaBorderAlpha = 255
                end
        end

        ---

        x  = 0

        while x <= plasmaXtotal do

                cos = math.deg(math.cos((x / 32) + c)) * (math.sin(c * 3.2) * 2)

                y = 12

                while y <= plasmaYtotal do

                        k = cos + (math.deg(math.sin((y / 32) + c)) * (math.cos(c * 3.2) * 2))

                        g = 128 + 128 * math.sin(3 * k / 8)
                        b = 128 + 128 * math.sin(3 * k / 128)


                        love.graphics.setColor(0, g, b, plasmaAlpha)
                        --love.graphics.setColor(k + c, k + c * 21, k + c * 8, plasmaAlpha)
                        love.graphics.rectangle("fill", x, y, 1, 1)


                        y = y + 1
                end

                x = x + 1
        end

        love.graphics.pop()

        ---- draw image ----

        if kick() == true then

                yOff = 20
        end

        if yOff > 0 then

                yOff = yOff - 100 * dt
        end

        love.graphics.setColor(0, 0, 0, plasmaOverlayAlpha / 2)
        love.graphics.draw(plasmaPic, plasmaOverlayX + 5, 15 + yOff, 0, .25, .25)

        love.graphics.setColor(255, 255, 255, plasmaOverlayAlpha)
        love.graphics.draw(plasmaPic, plasmaOverlayX, 10 + yOff, 0, .25, .25)

        if c > 8 then

                c = 0
                kickTableC = 1
                activePart = chessboard
        end
end