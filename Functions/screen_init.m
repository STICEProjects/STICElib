function [Display] = screen_init()
sca
close all
clearvars

PsychDefaultSetup(2);

screenids = Screen('Screens');
Display.id = max(screenids);


[Display.window, Display.rect] = Screen('OpenWindow', Display.id, 0, [], 32, 2);

Screen('Flip', Display.window);
Display.interval = Screen('GetFlipInterval', Display.window);

Display.priority = MaxPriority(Display.window);

Display.center = zeros(2);
[Display.center(1), Display.center(2)] = RectCenter(Display.rect);

Screen('Textsize', Display.window, 60);
Screen('BlendFunction', Display.window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');
sca







