function draw_ratings(Display, rating)

    [rects, mids] = draw_square_grid(Display, 9);

    colors=repmat([255 255 255]',1,9);

    colors(:,round(rating))=[0 255 0]';
    
    Screen('FrameRect',Display.window,colors,rects, 1);

    
    for n = 1:9;
        color = [255 255 255];
        if rating == n
            color = [0 255 0];
        end
    number = num2str(n);
    DrawFormattedText(Display.window, number,round(mids(1,n)),round(mids(2,n)),color,50,[],[],1.5);
    end
end
