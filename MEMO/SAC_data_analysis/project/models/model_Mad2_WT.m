% Data:
% Mad2 delta 
% Model:
%  log-normal mixture of prometaphase lengths
%  two components variable across experiments
%  model Mc for censoring distribution, Johnson SU

%% SPECIFY MODEL PARAMETERS 
syms    mu_M3_WT_1 log_sigma_M3_WT_1 mu_M3_WT_2 log_sigma_M3_WT_2 w_M3_WT ...
        gamma_cen  log_sigma_cen    log_lambda_cen  log_xi_cen;
    
parameters.sym  = [ mu_M3_WT_1 ; log_sigma_M3_WT_1 ;mu_M3_WT_2 ; log_sigma_M3_WT_2 ; w_M3_WT;...
                    gamma_cen  ; log_sigma_cen     ; log_lambda_cen ; log_xi_cen];

parameters.name = {'mu_1_{M3,WT}' ; 'log(\sigma_1_{M3,WT})' ;'mu_1_{M3,WT}' ; 'log(\sigma_1_{M3,WT})' ;'w_{M3,WT}'; ...
                   '\gamma_{cen}'  ; 'log(\sigma_{cen})'     ; 'log(\lambda_{cen})' ; 'log(\xi_{cen})' };

parameters.number = length(parameters.sym);
parameters.guess = zeros(parameters.number,1);
parameters.min  = [  log(5); log(1e-2);log(5); log(1e-2);0 ; ...
                     -20   ; log(1e-4); log(5); log(5)];      

parameters.max  = [ log(2e3); log(1e1);log(2e3); log(1e1);1; ...
                          20; log(1e4); log(2e3); log(2e3)];


%% SPECIFY MODEL AND DATA
M.mixture.type = 'log-normal';
M.label.x = 'time [min]';
M.label.y = 'probability density';

Mc.mixture.type = 'Johnson SU';
Mc.label.x = 'time [min]';
Mc.label.y = 'probability density';

% EXPERIMENT
i = 1;

%load data from file
data_WT_Mad2;

D{i}.name = tit;
D{i}.description = [];
D{i}.data.uncensored = Tm;
D{i}.data.censored = Tc;
D{i}.observation_interval = 5;

M.experiment(i).name  = tit;
M.experiment(i).size  = 2;
M.experiment(i).w     = {1-w_M3_WT,w_M3_WT};
M.experiment(i).mu    = {mu_M3_WT_1,mu_M3_WT_2};
M.experiment(i).sigma = {exp(log_sigma_M3_WT_1),exp(log_sigma_M3_WT_2)};

Mc.experiment(i).name   = tit;
Mc.experiment(i).size   = 1;
Mc.experiment(i).w      = {            1 };
Mc.experiment(i).gamma  = {      gamma_cen };
Mc.experiment(i).sigma  = { exp(log_sigma_cen)};
Mc.experiment(i).lambda = {exp(log_lambda_cen)};
Mc.experiment(i).xi     = {    exp(log_xi_cen)};


% Compile model
% (This generates the functional expression of parameters and derivatives.)
[M,parameters.constraints] = getMixtureModel(M,parameters.sym);
Mc = getMixtureModel(Mc,parameters.sym);