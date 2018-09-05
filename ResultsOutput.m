function ResultsOutput(Rs)
%% Output the results to a excel file

% Sheet3, Column5:
%       Vac: Couldn't find this patient.
%       Rep: Found too many and need to handle manually.

Ov = cell(3,2);
Ov(1,1) = cellstr('Files');
Ov(2,1) = cellstr('Matched');
Ov(3,1) = cellstr('Vacant');
Ov(1,2) = num2cell(size(Rs.Match,1)+size(Rs.Vac,1));
Ov(2,2) = num2cell(size(Rs.Match,1));
Ov(3,2) = num2cell(size(Rs.Vac,1));



delete('Results.xlsx');
xlswrite('Results.xlsx',Rs.Match,'Matched');
xlswrite('Results.xlsx',Rs.Vac,'Vacant');
xlswrite('Results.xlsx',Ov,'Sheet1');
