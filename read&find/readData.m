function dataExp = readData(filename,sheet,range)
    data=readtable(filename, 'Sheet', sheet, 'Range',range,'VariableNamingRule','preserve');
    dataExp = table2array(data);
    nanIndex = find(isnan(dataExp(:, 1)), 1);
    if ~isempty(nanIndex)
        dataExp=dataExp(1:nanIndex-1,:);
    end
end