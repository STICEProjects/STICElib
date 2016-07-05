function joystick_calibration()
    
    Display = screen_init();
    Display.waitframes = 1;
    defaultjoy.xmod = 1;
    defaultjoy.ymod = 1;
    
    Cursor.rect = [0 0 20 20];
    Cursor.color = [1 0 0];
    
    
    Priority(Display.priority);
    
    while 1
        get_resp('space');
        Joy = get_joystick_value(defaultjoy);
        
        Cursor.position = CenterRectonPointd(Cursor.rect, joy.x, joy.y);
        Screen('Fillrect', Display.window, Cursor.color, Cursor.position);
        Display.vbl  = Screen('Flip', Display.window, Display.vbl + (Display.waitframes - 0.5) * Display.interval);
        
    end

    