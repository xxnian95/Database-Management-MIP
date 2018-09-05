function Results = InfoMat2(Files,Targets)
%% Match two tables
% Each eye corresponds multiple images
% Zhang Pengnian

Match = cell(size(Targets.Name,1),50); %

i_V = 0;
% i_M = 0;
% MatchTable = Files;
N = size(Files.Name,2);
% Grades.Name = Grades(:,3)'; %
Vac = cell(1,4);
% Rep = cell(1,4);

for i=1:N
%     disp(i);
    MATCH_FLAG = 0;
    x = find(strcmp(Targets.Name,Files.Name(i)));
    
    if isempty(x)   
        % Didn't find it
        i_V = i_V+1;
        Vac(i_V,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i)];
%         CheckTheNum;
    else  % If find several ones, compare in order. Repetition is not considered yet.
        for j=1:size(x,1)
            if strcmp(Files.Name(i), Targets.Name(x(j))) && strcmp(Files.LoR(i), Targets.LoR(j)) 
                % Match successfully
                Match = GottaClue(Files,Targets,i,x(j),Match);
                MATCH_FLAG = 1;
                break;
            end
        end  % All coordinates in x isn't correct so that the following codes can be run.
        if ~MATCH_FLAG
            i_V = i_V+1;
            Vac(i_V,:) = [Files.Name(i),Files.LoR(i),Files.Date(i),Files.Filepath(i)];
        end
        % ATTENTION: Haven't consider the repetition nor the date.
    end
end

        
Results.Vac = Vac;
Results.Match = Match;





