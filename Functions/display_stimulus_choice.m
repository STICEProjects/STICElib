function [rounded_rating, rt] = display_stimulus_choice(Display, Joyconfig, wRect, text1, left_choice, right_choice, duration)
    
    DrawFormattedText(Display.window,text1,'center','center',[255 255 255]);
    DrawFormattedText(Display.window,left_choice,wRect(3)*0.10,(wRect(4)*.75),[255 255 255]);
    DrawFormattedText(Display.window,right_choice,wRect(3)*0.60,(wRect(4)*.75),[255 255 255]);
    
    rating = 5;
    rt = 0;
    rating_onset = Screen('Flip',Display.window);

    
    while (GetSecs() - rating_onset) < duration
        DrawFormattedText(Display.window,text1,'center','center',COLORS.WHITE);
        if rt > 0
            Screen('Flip',Display.window);
            WaitSecs(0.10);
            rounded_rating = round(rating);
            break;
        end
        
        Input = get_joystick_value(Joyconfig);
        if Input.button1 && Input.button2
            rt = GetSecs() - rating_onset;
        end
        rating = minmaxcheck(1, 9, (rating + Input.x));
        left_color = [255 255 255];
        right_color = [255 255 255];
        if rating < 4
            left_color = [255 255 255]; 
        end
        if rating > 6
            right_color = [255 255 255];
        end
        DrawFormattedText(Display.window,left_choice,wRect(3)*0.10,(wRect(4)*.75),left_color);
        DrawFormattedText(Display.window,right_choice,wRect(3)*0.60,(wRect(4)*.75),right_color);
        Screen('Flip',Display.window);
        WaitSecs(0.10);
    end
    
end