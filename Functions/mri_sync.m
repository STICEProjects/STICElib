function time = mri_sync(Display)
    DrawFormattedText(Display.window,'Syncing with MRI, please wait.','center','center',[255 255 255],50,[],[],1.5);
    Screen('Flip', Display.window);
    
    while 1
        key = GetChar();
        if isequal(key, '5')
            break
        end
    end
    time = GetSecs();
end
