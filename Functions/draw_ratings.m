function draw_ratings(Display, rating)

    [rects, mids] = draw_square_grid(Display, 9);

    colors=repmat([255 255 255]',1,9);

    colors(:,choice)=[0 255 0]';
    
    Screen('TextFont', Display.window, 'Arial');
    Screen('TextStyle', Display.window, 1);
    Screen('TextSize', Display.window,35);

    Screen('FrameRect',Display.window,colors,rects, 1);

    
    for n = 1:9;
        color = [255 255 255];
        if rating == n
            color = [0 255 255];
        end
        DrawFormattedText(Display.window, char(n), mids(1,n), mids(2,n), color);
    end
end
