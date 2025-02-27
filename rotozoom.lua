function rotozoomInit()

        rotozoomTex             = love.graphics.newImage("gfx/tex/chdf.png")
        --rotozoomTex:setFilter("linear", "nearest", 8)
        rotozoomTexAlpha        = 0
        rotozoomScaleOffset     = 32

        rotozoomOverlay         = love.graphics.newImage("gfx/pone/unhappydash.png")
        rotozoomOverlayScale    = .63
        rotozoomOverlayX        = 5
        rotozoomOverlayY        = 720  - (rotozoomOverlay:getHeight()  * rotozoomOverlayScale) - 5
        rotozoomOverlayW        = rotozoomOverlay:getWidth()
        rotozoomOverlayXoffset  = -rotozoomOverlayW + 20
        rotozoomOverlayAlpha    = 0

        rotozoomFont            = love.graphics.newFont("aaaiight-fat.ttf", 100)
        rotozoomFont:setLineHeight( .5 )

        rotozoomText            = "We are the Cartoon Horse Demo Force \n \n this is our contribution to the Revision 2016 2D-Demo compo"
        rotozoomTextAlpha       = 0

end

function rotozoom()

        --love.graphics.setColor(255, 255, 255, 255)
        --love.graphics.rectangle("fill", 0, 0, 1280, 720)

        x = c * 8

        r, g, b = HSV(c * 3, 255, 255)

        --love.graphics.setColor(255, 255, 255, 32)
        love.graphics.setColor(r, g, b, rotozoomTexAlpha)

        if c < 10 then

                if rotozoomTexAlpha < 24 then

                        rotozoomTexAlpha = rotozoomTexAlpha + 10 * dt

                        if rotozoomTexAlpha > 24 then

                                rotozoomTexAlpha = 24
                        end
                end

        -- fade out
        elseif c > 30 then

                if rotozoomTexAlpha > 0 then

                        rotozoomTexAlpha = rotozoomTexAlpha - 15 * dt

                        if rotozoomTexAlpha < 0 then

                                rotozoomTexAlpha = 0
                        end
                end

                if plasmaBackgroundAlpha < 255 then

                        plasmaBackgroundAlpha = plasmaBackgroundAlpha + 180 * dt

                        if plasmaBackgroundAlpha > 255 then

                                plasmaBackgroundAlpha = 255
                        end
                end
        end

        local scale = (math.cos(c / 3) * 1) + rotozoomScaleOffset

        if rotozoomScaleOffset > 1.3 then

                rotozoomScaleOffset = rotozoomScaleOffset - 1.9 * dt

                if rotozoomScaleOffset < 1.3 then

                        rotozoomScaleOffset = 1.3
                end
        end

        local zoomX  = rotozoomTex:getWidth() * scale
        local zoomY  = rotozoomTex:getHeight() * scale

        local cnt = 1

        while cnt <= 15 do

                angle = (c / 1.1) + (cnt / 256)

                love.graphics.translate(1280/2, 720/2)
                love.graphics.rotate(angle)

                local x = (math.cos(c * 1.5) * 512) + -1280

                while x < 1280 do

                        local y = (math.cos(c * 1.2) * 512) + -1280

                        while y < 720 do

                                love.graphics.draw(rotozoomTex, x , y, 0, scale, scale)

                                y = y + zoomY
                        end

                        x = x + zoomX
                end

                love.graphics.rotate(-angle)
                love.graphics.translate(-1280/2, -720/2)

                cnt = cnt + 1
        end

        --- text ---

        if c > 16 then

                love.graphics.setFont(rotozoomFont)
                love.graphics.setColor(255, 255, 255, rotozoomTextAlpha)

                love.graphics.printf(rotozoomText, 370, 40, 900, "center")

                if c < 30 then

                        if rotozoomTextAlpha < 255 then

                                rotozoomTextAlpha = rotozoomTextAlpha + 100 * dt

                                if rotozoomTextAlpha > 255 then

                                        rotozoomTextAlpha = 255
                                end
                        end
                else

                        if rotozoomTextAlpha > 0 then

                                rotozoomTextAlpha = rotozoomTextAlpha - 100 * dt

                                if rotozoomTextAlpha < 0 then

                                        rotozoomTextAlpha = 0
                                end
                        end
                end
        end


        --- overlay gfx ---

        love.graphics.setColor(0, 0 , 0, rotozoomOverlayAlpha / 2)
        love.graphics.draw(rotozoomOverlay, (rotozoomOverlayX + rotozoomOverlayXoffset) + 5, rotozoomOverlayY + 5, 0, rotozoomOverlayScale, rotozoomOverlayScale)

        love.graphics.setColor(255, 255, 255, rotozoomOverlayAlpha)
        love.graphics.draw(rotozoomOverlay, rotozoomOverlayX + rotozoomOverlayXoffset, rotozoomOverlayY, 0, rotozoomOverlayScale, rotozoomOverlayScale)

        if c > 15 then

                if rotozoomOverlayXoffset < 0 then

                        rotozoomOverlayXoffset = rotozoomOverlayXoffset + 200 * dt

                        if rotozoomOverlayXoffset > 0 then

                                rotozoomOverlayXoffset = 0
                        end
                end

                if rotozoomOverlayAlpha < 255 then

                        rotozoomOverlayAlpha = rotozoomOverlayAlpha + 100 * dt

                        if rotozoomOverlayAlpha > 255 then

                                rotozoomOverlayAlpha = 255
                        end
                end

        elseif c > 22.5 then

                if rotozoomOverlayXoffset > -rotozoomOverlayW then

                        rotozoomOverlayXoffset = rotozoomOverlayXoffset - 200 * dt
                end

                if rotozoomOverlayAlpha > 0 then

                        rotozoomOverlayAlpha = rotozoomOverlayAlpha - 100 * dt

                        if rotozoomOverlayAlpha < 0 then

                                rotozoomOverlayAlpha = 0
                        end
                end
        end

        love.graphics.setColor(85, 200, 100, plasmaBackgroundAlpha)
        love.graphics.rectangle("fill", 0, 0, 1280, 720)

        if c > 32 then

                c = 0
                activePart = plasma
        end
end