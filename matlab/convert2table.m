clc
close all
clear

% author: ASI/VFAT/FMEC/Federico Aspesi - 49299
% first date: 18/04/2024
% update 

pathSav ='..\outputs'; % path of folder where .sav outputs are stored
fileName ='ID3_FLME.sav'; % file name
[fname,pname,var]=load_sav_tab(pathSav,fileName); % call to load_sav_tab

% create a matrix containing varriables values
for iV = 1:size(var,2)
    TAB(1:numel(var(iV).val),iV) = single(var(iV).val);
end
% convert to table
TAB = array2table(TAB);

% set names as parameterName_unit
TAB.Properties.VariableNames(1:numel(TAB.Properties.VariableNames)) = append(append([var(1:size(var,2)).name],'_'),[var(1:size(var,2)).units]);

% write output file
pathCSV ='..\outputs'; % path of folder where .csv outputs will be stored
writetable(TAB,[pathCSV  filesep strrep(fname,'.sav','') '.csv'])