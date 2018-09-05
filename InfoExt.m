function [Files,FileTable] = InfoExt(FolderPath)
%% 从未分类的图片文件夹中，根据图片的文件名提取其中的信息
% Zhang Pengnian
% 包括：姓名、LR、日期、文件名
tic
imds = imageDatastore(FolderPath,'IncludeSubfolders',true,'LabelSource','none');
N = size(imds.Files,1);
FileTable = cell(N,4);

FLAG_DOUBLE = 0;

for i=1:N 
    fp = char(imds.Files(i));
%     fp = imds.Files(i);
%     fp_str = char(fp);
    size_fp = size(fp,2);
%     fp_split = regexp(fp, '-', 'split');
    %% Name
    for j=1:size_fp-2
        if isChinese(fp(size_fp-j)) && isChinese(fp(size_fp-j-1))
            % 从右往左，找到了两个连续的汉字，后一个汉字的位置是size_fp-j
            NameEndPosition = size_fp-j;
            k=2;
            while isChinese(fp(size_fp-j-k))    
                k=k+1;
            end
            NameStartPosition = NameEndPosition-k+1;
            break;

        end
        if j==size_fp-2
            disp(i);
            disp('姓名出错');
            break;
        end
    end

    Files.Name(i) = cellstr(fp(NameStartPosition:NameEndPosition));
    
    %% Left or Right
%     if fp(size_fp-5)=='-' && fp(size_fp-7)=='-' && (fp(size_fp-6)=='左' || fp(size_fp-6)=='右')
%         FileTable(i,2) = cellstr(fp(size_fp-6));
%     elseif fp(size_fp-6)=='-' && fp(size_fp-8)=='-' && (fp(size_fp-7)=='左' || fp(size_fp-7)=='右')
%         FileTable(i,2) = cellstr(fp(size_fp-7));
%     else
%         disp(i);
%         disp('左/右 出错');
%     end
    for j=1:size_fp-2
        if fp(size_fp-j)=='-' && fp(size_fp-j-2)=='-' && fp(size_fp-j-1)=='左'
            % j和j-2是'-'，j-1是左或右
            Files.LoR(i) = cellstr('L');
            break;
        elseif fp(size_fp-j)=='-' && fp(size_fp-j-2)=='-' && fp(size_fp-j-1)=='右'
            Files.LoR(i) = cellstr('R');
            break;
        end
        if j==size_fp-2
            disp(i);
            disp('左右出错');
            break;
        end
    end
   
    %% Date
    for j=1:size_fp-2
%         if fp(size_fp-j) == '\' 
        if abs('0') <= abs(fp(size_fp-j)) && abs(fp(size_fp-j)) <= abs('9') && abs('0') <= abs(fp(size_fp-j-1)) && abs(fp(size_fp-j-1)) <= abs('9') ...
                && abs('0') <= abs(fp(size_fp-j-3)) && abs(fp(size_fp-j-3)) <= abs('9') && abs('0') <= abs(fp(size_fp-j-4)) && abs(fp(size_fp-j-4)) <= abs('9') ...
                && abs('0') <= abs(fp(size_fp-j-6)) && abs(fp(size_fp-j-6)) <= abs('9') && abs('0') <= abs(fp(size_fp-j-7)) && abs(fp(size_fp-j-7)) <= abs('9') ...
                && abs('0') <= abs(fp(size_fp-j-8)) && abs(fp(size_fp-j-8)) <= abs('9') && abs('0') <= abs(fp(size_fp-j-9)) && abs(fp(size_fp-j-9)) <= abs('9') ...
                && fp(size_fp-j-2) == '-' && fp(size_fp-j-5) == '-'
            Files.Date(i) = cellstr(fp(size_fp-j-9:size_fp-j));
            %             Files.Filepath(i) = cellstr(fp(size_fp-j+1:size_fp));
%             Files.Filepath(i) = cellstr('');
            break;
        end
        if j==size_fp-2
            disp(i);
            disp('日期出错');
            break;
        end
    end
    
    %% Filepath
    Files.Filepath(i) = cellstr(imds.Files(i));
            

    %%
    if fix(i/1000) == i/1000
        disp(i);
        toc;
    end
end
FileTable = [Files.Name;Files.LoR;Files.Date;Files.Filepath];

%% Only used in testing
if FLAG_DOUBLE==1
    for i=1:N
        FileTable(i+N,:) = FileTable(i,:);
        Files.Name(i+N) = Files.Name(i);
        Files.LoR(i+N) = Files.LoR(i);
        Files.Date(i+N) = Files.Date(i);
        Files.Filepath(i+N) = Files.Filepath(i);
    end
end
