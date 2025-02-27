function dycp2Init()

        dycp2Font       = love.graphics.newFont("absender1.ttf", 192)

        dycp2Text       = "greetz to hackers, TPB, poo-brain, DSS, trilobit, LNX... .. . fuckings to lamers, check your priviledge, rate 5 stars, etc. etc.               End of file. Go drink booze or snort crack or whatever you people do these days..... .... ... .. .."
        dycp2TextLength = string.len(dycp2Text)
        dycp2TextOffset = 0
        dycp2Xpos       = 1280
        fadeOut         = 0
end

function dycp2()

        love.graphics.setColor(255, 255, 255, 255)

        love.graphics.push()
        love.graphics.translate(dmScreenW / 2, dmScreenH / 2)

        size    = (math.sin(c / 3) * 32) + 96

        cnt = 1

        while cnt < 8 do

                love.graphics.push()
                love.graphics.rotate((c * .9) - (cnt / 64))

                r, g, b = HSV(cnt * (c * 2), 255, 255)

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

        love.graphics.setFont(dycp2Font)

        cnt = 1

        while cnt < dycp2TextLength do

                chr     = string.sub(dycp2Text, cnt, cnt)
                x       = dycp2Xpos + (cnt * 96)
                y       = (math.sin((c * 3) + (cnt / 8)) * 240) + 300

                if x > -128 then

                        if x < dmScreenW then

                                love.graphics.setColor(0, 0, 0, 128)
                                love.graphics.print(chr, x + 5, y + 5)

                                love.graphics.setColor(255, 255, 255)
                                love.graphics.print(chr, x, y)
                        end
                end

                cnt = cnt + 1
        end

        dycp2Xpos = dycp2Xpos - 1150 * dt

        if c > 21 then

                love.graphics.setColor(0, 0, 0, fadeOut)
                love.graphics.rectangle("fill", 0, 0, 1280, 720)

                print(fadeOut)

                fadeOut = fadeOut + 1

                if fadeOut > 255 then

                        fadeOut = 255
                end
        end

        quickFlash()

        if c > 26 then

                love.event.push("quit")
        end
end