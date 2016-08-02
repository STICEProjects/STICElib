function [Ret] = get_joystick_value(Joy)
    if Joy.mac == 1
        %GAMEPAD STUFF
    else
        [x, y, ~, buttons] = WinJoystickMex(0);
    end
    Ret.x = (x - Joy.center(1));
    Ret.y = (y - Joy.center(2));
    
    if Ret.x < Joy.deadzone && Ret.x > (-1 * Joy.deadzone)
            Ret.x = 0;
    else Ret.x = Ret.x - sign(Ret.x)*Joy.deadzone;
    end
    
    if Ret.y < Joy.deadzone && Ret.y > (-1 * Joy.deadzone)
            Ret.y = 0;
    else Ret.y = Ret.y - sign(Ret.y)*Joy.deadzone;
    end
    
    Ret.x = Ret.x*Joy.xmod;
    Ret.y = Ret.y*Joy.ymod;
    
    Ret.button1 = buttons(1);
    Ret.button2 = buttons(2);
    Ret.trigger = buttons(3);
end