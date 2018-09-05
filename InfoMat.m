function Pending = InfoMat(Files,Targets)
%% Match two tables
% Zhangpengnian 


i_V = 0;
i_M = 0;
% MatchTable = Files;
N = size(Files.Name,2);
% Grades.Name = Grades(:,3)'; %
Vac = cell(1,5);
Match = cell(1,5);
for i=1:N
    x = find(strcmp(Targets.Name,Files.Name(i)));
    
    if isempty(x)   
        % Didn't find it
        i_V = i_V+1;
        Vac(i_V,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i),cellstr('Vac')];
%         CheckTheNum;
    elseif size(x,1)>2
        % Found Rep
        i_V = i_V+1;
        Vac(i_V,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i),cellstr('Rep')];
%         CheckTheNum;
    elseif size(x,1)==2
        if strcmp(Targets.LoR(x(1)),Files.LoR(i))
            % The first is the correct
            i_M = i_M+1;
            Match(i_M,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i),cellstr('')];
            Match(i_M,5) = Targets.Grade(x(1));
%             CheckTheNum;
        elseif strcmp(Targets.LoR(x(2)),Files.LoR(i))
            % The second
            i_M = i_M+1;
            Match(i_M,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i),cellstr('')];
            Match(i_M,5) = Targets.Grade(x(2));
%             CheckTheNum;
        else
%         if ~strcmp(Grades.LoR(x(1)),Files.LoR(i)) && ~strcmp(Grades.LoR(x(2)),Files.LoR(i))
            % Two right names but wrong LoR
            i_V = i_V+1;
            Vac(i_V,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i),cellstr('Vac')];
%             CheckTheNum;
        end
    elseif size(x,1)==1
        if ~strcmp(Targets.LoR(x),Files.LoR(i))
            % Found one right name but wrong LoR
            i_V = i_V+1;
            Vac(i_V,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i),cellstr('Vac')];
%             CheckTheNum;
        else
            i_M = i_M+1;
            Match(i_M,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i),cellstr('')];
            Match(i_M,5) = Targets.Grade(x);
%             CheckTheNum;
        end
        
    end

end
        
Pending.Vac = Vac;
Pending.Match = Match;





