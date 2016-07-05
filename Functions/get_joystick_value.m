function [Ret] = get_joystick_value(Joy)
    [x, y, z, buttons] = WinJoystickMex(0);
    
    Ret.x = (x - Joy.center(1)) * Joy.xmod;
    Ret.y = (y - Joy.center(2)) * Joy.ymod;
    Ret.button1 = buttons(1);
    Ret.button2 = buttons(2);
    
end