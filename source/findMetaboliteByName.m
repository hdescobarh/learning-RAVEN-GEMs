function matchTable = findMetaboliteByName(model, expression)
    % findMetaboliteByName
    %   Use regex to look for metabolites in the field metNames of a RAVEN model structure.
    %
    %   model        A RAVEN model structure
    %   expression   A valid MATLAB Regular expression. For more details, see <a href="matlab:web('https://www.mathworks.com/help/matlab/matlab_prog/regular-expressions.html')">Regular Expressions</a> in the MathWorks Web site.
    %   
    %   matchTable   A MATLAB table. Each row contains information about metabolites IDs and names.
    %       metID    metabolite ID
    %       metName  metabolite Name
    %
    %   The search is case insensitive. 
    %
    %   Usage: matchTable = findMetaboliteByName(model, expression)

matchIndexes = find(~cellfun(@isempty, regexpi(model.metNames, expression, 'match')'));
matchTable = table(model.mets(matchIndexes), ...
    model.metNames(matchIndexes), ...
    'VariableNames', {'metID', 'metName'});
end



