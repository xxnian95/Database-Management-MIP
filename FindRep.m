function RepTable = FindRep(table,c)
%% Find the repetitive elements in Column c
% Zhang Pengnian

% RepTable
% |rep1|c11|c12|c13|...
% |rep2|c21|c22|c23|...
% ...

RepTable = cell(1);
col1 = table(:,c(1));
if size(c,2)>1
    col2 = table(:,c(2));
    if size(c,2)>2
        col3 = table(:,c(3));
    end
end
m = size(col1,1);
i=1;
ii=1;
% jj=1;
RepDis = zeros(m,1);
switch size(c,2)
    case 1
        while i<=m-1
            % for i=1:m-1
            temp = col1(i);
            jj=1;
            for j = i+1:m
                if isequal(temp,col1(j)) && RepDis(j) == 0
                    if jj==1
                        RepTable(ii,jj) = col1(j); % Name of the repetitive element
                        RepTable(ii,jj+1) = num2cell(i);
                        RepTable(ii,jj+2) = num2cell(j);
                        jj = 4;
                        RepDis(i) = 1;
                        RepDis(j) = 1;
                    else
                        RepTable(ii,jj) = num2cell(j); % Position
                        jj = jj+1;
                        RepDis(j) = 1;
                    end
                end
                if j==m && jj~=1
                    ii = ii+1;
                end
            end
            i=i+1;
            
        end
    case 2
        while i<=m-1
            % for i=1:m-1
            temp = col1(i);
            jj=1;
            
            
            for j = i+1:m
                if isequal(temp,col1(j)) && RepDis(j) == 0
                    if isequal(table(i,c(2)),table(j,c(2)))
                        
                        if jj==1
                            RepTable(ii,jj) = col1(j); % Name of the repetitive element
                            RepTable(ii,jj+1) = num2cell(i);
                            RepTable(ii,jj+2) = num2cell(j);
                            jj = 4;
                            RepDis(i) = 1;
                            RepDis(j) = 1;
                        else
                            RepTable(ii,jj) = num2cell(j); % Position
                            jj = jj+1;
                            RepDis(j) = 1;
                            
                        end
                    end
                end
                if j==m && jj~=1
                    ii = ii+1;
                end
            end
            
            i=i+1;
            
        end
    case 3
        while i<=m-1
            % for i=1:m-1
            temp = col1(i);
            jj=1;
            
            for j = i+1:m
                if isequal(temp,col1(j)) && RepDis(j) == 0
                    if isequal(table(i,c(2)),table(j,c(2))) && isequal(table(i,c(3)),table(j,c(3)))
                        
                        if jj==1
                            RepTable(ii,jj) = col1(j); % Name of the repetitive element
                            RepTable(ii,jj+1) = num2cell(i);
                            RepTable(ii,jj+2) = num2cell(j);
                            jj = 4;
                            RepDis(i) = 1;
                            RepDis(j) = 1;
                        else
                            RepTable(ii,jj) = num2cell(j); % Position
                            jj = jj+1;
                            RepDis(j) = 1;
                        end
                    end
                end
                if j==m && jj~=1
                    ii = ii+1;
                end
                
            end
            
            i=i+1;
            
        end
end

%     case 2
%         while i<=m-1
%             b = a(i);
%             jj=1;
%             for j = i+1:m
%                 if isequal(b,a(j))
%                     if isequal(table(i,c(2)),table(j,c(2)))
%                         if jj==1
%                             RepTable(ii,jj) = a(j); % Name of the repetitive element
%                             RepTable(ii,jj+1) = num2cell(i);
%                             RepTable(ii,jj+2) = num2cell(j);
%                             jj = 4;
%                         else
%                             RepTable(ii,jj) = num2cell(j); % Position
%                             jj = jj+1;
%                         end
%                     end
%                 end
%                 if j==m && jj~=1
%                     ii = ii+1;
%                 end
%             end
%             if jj>1
%
%                 i=i+jj-2;
%             else
%                 i=i+1;
%             end
%         end
%     case 3
%         while i<=m-1
%             b = a(i);
%             jj=1;
%             for j = i+1:m
%                 if isequal(b,a(j))
%                     if isequal(table(i,c(2)),table(j,c(2))) && isequal(table(i,c(3)),table(j,c(3)))
%                         if jj==1
%                             RepTable(ii,jj) = a(j); % Name of the repetitive element
%                             RepTable(ii,jj+1) = num2cell(i);
%                             RepTable(ii,jj+2) = num2cell(j);
%                             jj = 4;
%                         else
%                             RepTable(ii,jj) = num2cell(j); % Position
%                             jj = jj+1;
%                         end
%                     end
%                 end
%                 if j==m && jj~=1
%                     ii = ii+1;
%                 end
%             end
%             if jj>1
%
%
%                 i=i+jj-2;
%             else
%                 i=i+1;
%             end
%         end
% end


end