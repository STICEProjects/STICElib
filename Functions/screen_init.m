function [Display] = screen_init(varagin)
sca
close all
clear Screen

PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 1)

if exist('varagin', 'var')
    PsychDebugWindowConfiguration(0,.3)
else
    HideCursor();
end

screenids = Screen('Screens');
Display.id = max(screenids);


[Display.window, Display.rect] = Screen('OpenWindow', Display.id, 0, [], 32, 2);



Screen('Flip', Display.window);
Display.interval = Screen('GetFlipInterval', Display.window);

Display.priority = MaxPriority(Display.window);

Display.waitframes = 1;

Display.center = zeros(2);
[Display.center(1), Display.center(2)] = RectCenter(Display.rect);

Display.center(2,1)


Screen('Textsize', Display.window, 60);
Screen('BlendFunction', Display.window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
Display.vbl = Screen('Flip', Display.window);










