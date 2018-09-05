function Match = GottaClue(Files,Targets,x,y,Match)
%% Files(x) --> Targets(y)
WRITE_FLAG = 0;
x1 = find(strcmp(Match,Files.Name(x)));  % If this name has been matched.

if isempty(x1)  % Haven't been matched.
    px = 1;
%     py = 1;
    while (~isempty(Match{px,1}))  % Place the pointer to the first empty line.
        px = px+1;
    end
%     while ((~isempty(Match{px,py})))  % Place the other pointer to the first empty element in this line.
%         py = py+1;
%     end
    Match(px,1) = Files.Name(x);
    Match(px,2) = Files.LoR(x);
    Match(px,3) = Targets.Grade(y);
    
    Match(px,4) = Files.Filepath(x);
    
else
    for j=1:size(x1,1)
        if strcmp(Match(x1(j),1), Files.Name(x)) && strcmp(Match(x1(j),2), Files.LoR(x)) 
            % ATTENTION: Not consider the same Name and LoR but different Grade nor the date.
            % This one has been matched before and need to add the filepath bihind.
            py = 1;
            while (~isempty(Match{x1(j),py}))
                py = py+1;  % Place the pointer to the first empty element in this line.
            end  
            Match(x1(j),py) = Files.Filepath(x);
            WRITE_FLAG = 1;
            break;
        end 
    end
    % Fine the name but other information isn't correct so build up a new line for it.
    if ~WRITE_FLAG
        px = 1;
        while (~isempty(Match{px,1}))
            px = px+1;
        end
        Match(px,1) = Files.Name(x);
        Match(px,2) = Files.LoR(x);
        Match(px,3) = Targets.Grade(y);
        Match(px,4) = Files.Filepath(x);
    end
end