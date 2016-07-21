function onset = draw_fixation_cross(Display, duration)
    DrawFormattedText(Display.window,'+','center','center',[255 255 255]);
    onset = Screen('Flip',Display.window);
    WaitSecs(duration);
end