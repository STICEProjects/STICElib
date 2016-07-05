function joystick_calibration()
   
    Display = screen_init('debug');
    
    Defaultjoy.center = [32767, 32767];
    Defaultjoy.xmod = .001;
    Defaultjoy.ymod = .001;
    
    Cursor.color = [255 255 255];
    
    
    Priority(Display.priority);
    
    Screen('Flip', Display.window);
    while 1
        
        Joy = get_joystick_value(Defaultjoy);
        
        Cursor.position = [Joy.x + Cursor.position(1), Joy.y + Cursor.position(2)];
        Screen('DrawDots', Display.window, Cursor.position, 20, Cursor.color, [], 2);
        Screen('Flip', Display.window);
        %Display.vbl  = Screen('Flip', Display.window, Display.vbl + (Display.waitframes - 0.5) * Display.interval);
        
    end

    