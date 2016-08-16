function [rounded_rating, rt] = display_stimulus_rating(Display, Joyconfig, text1, text2, duration)
    rating = 5;
    rounded_rating = 5;
    rt = 0;
    
    draw_ratings(Display, rating);
    
    DrawFormattedText(Display.window,text1,'center','center',[255 255 255]);
    DrawFormattedText(Display.window,text2,'center',(Display.rect(4)*.65),[255 255 255]);
    rating_onset  = Screen('Flip',Display.window);
    
    

     while (GetSecs() - rating_onset) < duration
        
        
       Input = get_joystick_value(Joyconfig);
       if Input.button1 && Input.button2
            rt = GetSecs() - rating_onset;
            break
        end
        rating = minmaxcheck(1, 9, (rating + Input.x));
        if rounded_rating ~= round(rating);
            pause(.2);
        end
        draw_ratings(Display, round(rating));
        DrawFormattedText(Display.window,text1,'center','center',[255 255 255]);
        DrawFormattedText(Display.window,text2,'center',(Display.rect(4)*.65),[255 255 255]);
        Screen('Flip', Display.window);
        rounded_rating = round(rating);
     end
    
end

    
