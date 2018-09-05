function RepFlag = hasRep(DatabaseTable)
%% Not very useful...
% Zhang Pengnian

    N = size(DatabaseTable,1)-1;
    for i=1:N+1
        id(i,1) = cellstr([char(DatabaseTable(i,1)),char(DatabaseTable(i,2))]);
    end
    uniqueid = unique(id);
    if size(uniqueid) == N
        RepFlag = 0;
    else
        RepFlag = 1;
    end
end 
