%% TableGeneration
% Author: Zhang Pengnian
%% 读取文件夹的格式如下
% /...
%   /样本根目录
%       /级别1
%       /级别2
%       /...
        
%% 表格的格式如下 
% |姓名|左/右|级别|日期      |文件路径|
% |张三|左   |N3  |2017-01-01|*.jpg   |
% |... |... |... |...       |...     |

%% 
clear;
close all;

FileName = '7.16重新分级.xlsx';
imds = imageDatastore('D:\Project Files\7.16重新分级','IncludeSubfolders',true,'LabelSource','foldernames');
N = size(imds.Files,1);  %图片总数
DatabaseTable = cell(N+1,5);
DatabaseTable(1,:) = {'姓名','左/右','级别','日期','文件路径'};

%% 
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
            error('姓名出错');
        end
    end

    DatabaseTable(i+1,1) = cellstr(fp(NameStartPosition:NameEndPosition));
    
    %% Left or Right
%     if fp(size_fp-5)=='-' && fp(size_fp-7)=='-' && (fp(size_fp-6)=='左' || fp(size_fp-6)=='右')
%         DatabaseTable(i+1,2) = cellstr(fp(size_fp-6));
%     elseif fp(size_fp-6)=='-' && fp(size_fp-8)=='-' && (fp(size_fp-7)=='左' || fp(size_fp-7)=='右')
%         DatabaseTable(i+1,2) = cellstr(fp(size_fp-7));
%     else
%         disp(i);
%         error('左/右 出错');
%     end
    for j=1:size_fp-2
        if fp(size_fp-j)=='-' && fp(size_fp-j-2)=='-' && fp(size_fp-j-1)=='左'
            % j和j-2是'-'，j-1是左或右
            DatabaseTable(i+1,2) = cellstr('L');
            break;
        elseif fp(size_fp-j)=='-' && fp(size_fp-j-2)=='-' && fp(size_fp-j-1)=='右'
            DatabaseTable(i+1,2) = cellstr('R');
            break;
        end
        if j==size_fp-2
            disp(i);
            error('左右出错');
        end
    end
   
    %% Grade
    for j=1:size_fp-2
        if fp(size_fp-j) == '\'
            DatabaseTable(i+1,3) = cellstr([fp(size_fp-j-2),fp(size_fp-j-1)]);
            break;
        end
        if j==size_fp-2
            disp(i);
            error('级别出错');
        end
    end
    
    %% Date
    for j=1:size_fp-2
        if fp(size_fp-j) == '\'
            DatabaseTable(i+1,4) = cellstr(fp(size_fp-j+1:size_fp-j+10));
            break;
        end
        if j==size_fp-2
            disp(i);
            error('日期出错');
        end
    end
    %%
    DatabaseTable(i+1,5) = cellstr(fp);
    
end

xlswrite(FileName,DatabaseTable);


    
    
    
    
    
    
    
    
    
    