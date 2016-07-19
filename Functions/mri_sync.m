function time = mri_sync(Display)
    DrawFormattedText(Display.window,'We are going to show you pictures of food. \n\n Press the joystick trigger to continue.','center','center',[255 255 255],50,[],[],1.5);
    Screen('Flip', Display.window);
    KbWait();
    time = GetSecs();
end
