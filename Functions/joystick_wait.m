function joystick_wait(Joyconfig)
    while 1
    Joy = get_joystick_value(Joyconfig);
    if Joy.button1 && Joybutton2
        break
    end
    end
end