function time = mri_sync(Display)
    DrawFormattedText(Display.window,'Syncing with MRI, please wait.','center','center',[255 255 255],50,[],[],1.5);
    Screen('Flip', Display.window);
    
    get_resp('5%');
    time = GetSecs();
end
