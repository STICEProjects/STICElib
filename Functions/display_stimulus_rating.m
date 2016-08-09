function [rating, rt] = display_stimulus_rating(w, text1, text2, duration)
    global KEYS COLORS wRect usingKeyboard telap rateon
    
    drawRatings([],w);
    DrawFormattedText(w,text1,'center','center',COLORS.WHITE);
    DrawFormattedText(w,text2,'center',(wRect(4)*.75),COLORS.WHITE);
    rateon = Screen('Flip',w);
    
    FlushEvents();
    telap = 0;
    rating = 5;
    rt = 0;

    while telap < duration
        telap = GetSecs() - rateon;
        
        if rt > 0
                drawRatings(keycode, w, rating);
            else
                keycode = zeros();
                [rating, rt] = GetJoystickValue(rating);
                keycode(round(rating) + 48) = true;
                drawRatings(keycode);
            end
            DrawFormattedText(w,text1,'center','center',COLORS.WHITE);
            DrawFormattedText(w,text2,'center',(wRect(4)*.75),COLORS.WHITE);
            Screen('Flip',w);
            WaitSecs(0.10);
        end
end
    
function drawRatings(varargin)

    global w KEYS COLORS rects mids;

    colors=repmat(COLORS.WHITE',1,9);
    % rects=horzcat(allRects.rate1rect',allRects.rate2rect',allRects.rate3rect',allRects.rate4rect');

    %Needs to feed in "code" from KbCheck, to show which key was chosen.
    choice = 0;
    if nargin >= 1 && ~isempty(varargin{1})
        response=varargin{1};

        key=find(response);
        if length(key)>1
            key=key(1);
        end;

        switch key

            case {KEYS.ONE}
                choice=1;
            case {KEYS.TWO}
                choice=2;
            case {KEYS.THREE}
                choice=3;
            case {KEYS.FOUR}
                choice=4;
            case {KEYS.FIVE}
                choice=5;
            case {KEYS.SIX}
                choice=6;
            case {KEYS.SEVEN}
                choice=7;
            case {KEYS.EIGHT}
                choice=8;
            case {KEYS.NINE}
                choice=9;
            case {KEYS.TEN}
                choice = 10;
        end

        if exist('choice','var')
            colors(:,choice)=COLORS.GREEN';
        end
    end

    if nargin>=2 && ~isempty(varargin{2})
        window=varargin{2};
    else
       window=w;
    end
    
    choice_selected = -1;
    if nargin >= 3 && ~isempty(varargin{3})
        choice_selected = floor(varargin{3});
    end

    Screen('TextFont', window, 'Arial');
    oldStyle = Screen('TextStyle', window, 1);
    oldSize = Screen('TextSize',window,65);

    %draw all the squares
    Screen('FrameRect',window,colors,rects,1);

    %draw the text (1-10)
    % 20160512cdt add green color to selected number
    for n = 1:9;
        numnum = sprintf('%d',n);
        color = COLORS.WHITE;
        localOldSize = Screen('TextSize', window);
        if choice_selected == n
            localOldSize = Screen('TextSize', window, 35 + 10);
            color = COLORS.GREEN;
        else
            if n == choice
                color = COLORS.GREEN;
            end
        end
        CenterTextOnPoint(window,numnum,mids(1,n),mids(2,n),color);
        Screen('TextSize', window, localOldSize);
    end

    Screen('TextSize',window,oldSize);

end

