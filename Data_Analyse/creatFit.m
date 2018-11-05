function [fitresult, gof] = createFit(time_, data_)
%CREATEFIT(TIME_,DATA_)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : time_
%      Y Output: data_
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
% 


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( time_, data_ );

% Set up fittype and options.
ft = fittype( 'fourier1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Lower = [-127 -127 -127 -Inf];
opts.StartPoint = [0 0 0 62.8318530717959];
opts.Upper = [127 127 127 Inf];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
% figure( 'Name', 'untitled fit 1' );
% h = plot( fitresult, xData, yData );
% legend( h, 'data_ vs. time_', 'untitled fit 1', 'Location', 'NorthEast' );
% % Label axes
% xlabel time_
% ylabel data_
% grid on


