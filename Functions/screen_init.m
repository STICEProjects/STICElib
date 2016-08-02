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

Display.imagesize = [450 600];
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

%Image frame config
im_width = 600;
im_height = 450;
x_offset = 0;
y_offset = 0;
near_scale = 1.5;
far_scale = 0.5;

im_x_center = Display.center(1) + x_offset;
im_y_center = Display.center(2) + y_offset;
im_center = [im_x_center im_y_center im_x_center im_y_center];

im_rect = [-im_width/2 -im_height/2 im_width/2 im_height/2];
Display.imagerect = im_center + im_rect;
Display.smallimagerect = im_center + im_rect * far_scale;
Display.largeimagerect = im_center + im_rect * near_scale;








