function time = mri_sync(Display, Joy)
    DrawFormattedText(Display.window,'Syncing with MRI, please wait.','center','center',[255 255 255],50,[],[],1.5);
    Screen('Flip', Display.window);
    
    while 1
        
        if 
            break
        end
    end
    
    time = GetSecs();
end
