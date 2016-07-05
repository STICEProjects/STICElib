function out = escape_sequence(key)

out = 0;
beginTime = GetSecs;

if isequal(upper(key), 'Q')
    [keyIsDown,secs,keyCode] = KbCheck;
    while keyIsDown, [keyIsDown,secs,keyCode] = KbCheck; end;
    lastKey = keyCode;
    while (~keyIsDown) & (GetSecs-beginTime < 0.5)
        [keyIsDown,secs,keyCode] = KbCheck;
        lastKey = keyCode;
    end
    key = KbName(lastKey);
    if isequal(upper(key), 'P')
        responded = 1;
        out = 1;
        clear screen;
        ShowCursor;
    else
        out = 0;
    end
else
    out = 0;
end