function nonBalancedTable = makeUnablancedMetabolitesTable(model)
    % makeUnablancedMetabolitesTable
    %   Makes a table with non-balance metabolites and their elemental proportions
    % 
    %   model   A RAVEN model structure

    %   nonBalancedTable     A MATLAB table. Columns are elements abbreviations. Rows non-balanced reactions.
    %       balanceStatus    0 for unbalanced,
    %                       -1 for unknown status by missing information, and
    %                       -2 for unknown status by an error.
    %       elements        Element abreviations. The number of elements depends on the model.
    %                       Their value is the difference between the left and the right of the equations.

% Calls getElementalBalance RAVEN function.
balanceStructure = getElementalBalance(model);
% Creates and filter the table
balanceStructureTable = array2table([balanceStructure.balanceStatus, balanceStructure.leftComp - balanceStructure.rightComp], ...
    'VariableNames', ['balanceStatus'; balanceStructure.elements.abbrevs], ...
    'RowNames', model.rxns);
nonBalancedTable = balanceStructureTable(...
    model.rxns(balanceStructure.balanceStatus ~= 1), :);
    fprintf('Potential problematic reactions: %i.\n\n', height(nonBalancedTable));
end