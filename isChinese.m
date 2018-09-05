function [Chinese] = isChinese(ch)

% Return 1: ch is a Chinses character.
% 0: not a Chinese.

    info = unicode2native(ch,'GB2312');
    bytes = size(info,2);
    Chinese = 0;
    if (bytes == 2)
        if(info(1)>160 && info(2)>160)
        Chinese = 1;
        end
    end
end 