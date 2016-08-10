function [rounded_rating, rt] = display_stimulus_rating(Display, Joyconfig, text1, text2, duration)
    
    drawRatings([],Display.window);
    DrawFormattedText(Display.window,text1,'center','center',[255 255 255]);
    DrawFormattedText(Display.window,text2,'center',(Display.rect(4)*.75),[255 255 255]);
    rating_onset  = Screen('Flip',Display.window);
    
    rating = 5;
    rt = 0;

     while (GetSecs() - rating_onset) < duration
        
        
       Input = get_joystick_value(Joyconfig);
       if Input.button1 && Input.button2
            rt = GetSecs() - rating_onset;
            break
        end
        rating = minmaxcheck(1, 9, (rating + Input.x));
        drawRatings(rating);
        DrawFormattedText(Display.window,text1,'center','center',[255 255 255]);
        DrawFormattedText(Display.window,text2,'center',(Display.rect(4)*.75),[255 255 255]);
        Screen('Flip', Display.window);
     end
    rounded_rating = round(rating);
end

    
