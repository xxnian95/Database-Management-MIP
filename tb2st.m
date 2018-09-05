function st = tb2st(tb)
% Zhang Pengnian
% Transform table to a structural variable.
% The structure of this table is strictly requested.
% DEFAULT: There is a title bar in this table and will be removed while transformed into the structural variable.

% 13: C grade
% 14: N grade
% 15: C grade
% The blanks will be filled with '0'

c = [3 12 15];
N = size(tb,1);
st.Name = tb(2:N,c(1));
st.LoR = tb(2:N,c(2));
st.Grade = tb(2:N,c(3));
for i = 1:N-2    
    if max(isnan(cell2mat(st.Name(i)))) && max(~isnan(cell2mat(st.Name(i+1))))
        st.Name(i) = st.Name(i-1);
    end

    
    if isnan(cell2mat(st.Grade(i)))
        st.Grade(i) = num2cell(0);
    end
    
    switch cell2mat(st.Grade(i))
        case 'C1'
            st.Grade(i) = num2cell(1);
        case 'C2'
            st.Grade(i) = num2cell(2);
        case 'C3'
            st.Grade(i) = num2cell(3);
        case 'C4'
            st.Grade(i) = num2cell(4);
        case 'C5'
            st.Grade(i) = num2cell(5);
        case '5+'
            st.Grade(i) = num2cell(5);
    end

end

end