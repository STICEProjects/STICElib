function [rects, mids] = draw_square_grid(Display, number)
    
    %DrawRectGrid:  Builds a grid of squares with gaps in between.
    %Size of image will depend on screen size. First, an area approximately 80%
    %of screen is determined. Then, images are 1/4th the side of that square
    %(minus the 3 x the gap between images.
    
    xlen = Display.rect(3)*.8;           %Make area covering about 90% of vertical dimension of screen.
    gap = 10;                       %Gap size between each rect
    square_side = fix((xlen - (num_rects-1)*gap)/number); %Size of rect depends on size of screen.

    squart_x = Display.center(1)-(xlen/2);
    squart_y = Display.rect(4)*.8;         %Rects start @~80% down screen.

    rects = zeros(4, number);

        for col = 1:number;
            rects(1,col)= squart_x + (col-1)*(square_side+gap);
            rects(2,col)= squart_y;
            rects(3,col)= squart_x + (col-1)*(square_side+gap)+square_side;
            rects(4,col)= squart_y + square_side;
        end
    mids = [rects(1,:)+square_side/2; rects(2,:)+square_side/2+5];

end
