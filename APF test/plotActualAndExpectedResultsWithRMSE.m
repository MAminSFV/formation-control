function plotActualAndExpectedResultsWithRMSE(fis,x,y)

% Calculate RMSE bewteen actual and expected results
[rmse,actY] = calculateRMSE(fis,x,y);

% Plot results
figure
subplot(2,1,1)
hold on
bar(actY)
bar(y)
bar(min(actY,y),'FaceColor',[0.5 0.5 0.5])
hold off
axis([0 200 0 60])
xlabel("Validation input dataset index"),ylabel("MPG")
legend(["Actual MPG" "Expected MPG" "Minimum of actual and expected values"],...
        'Location','NorthWest')
title("RMSE = " + num2str(rmse) + " MPG")

subplot(2,1,2)
bar(actY-y)
xlabel("Validation input dataset index"),ylabel("Error (MPG)")
title("Difference Between Actual and Expected Values")

end

function [rmse,actY] = calculateRMSE(fis,x,y)

% Specify options for FIS evaluation
persistent evalOptions
if isempty(evalOptions)
    evalOptions = evalfisOptions("EmptyOutputFuzzySetMessage","none", ...
        "NoRuleFiredMessage","none","OutOfRangeInputValueMessage","none");
end

% Evaluate FIS
actY = evalfis(fis,x,evalOptions);

% Calculate RMSE 
del = actY - y;
rmse = sqrt(mean(del.^2));

end