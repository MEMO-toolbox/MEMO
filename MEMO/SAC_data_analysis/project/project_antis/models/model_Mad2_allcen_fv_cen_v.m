% Data:
%   control
%   all Mad2 data (no double mutants)
% Model:
%   log-normal
%   one component fixed across experiments
%   one component variable across experiments

%% SPECIFY MODEL PARAMETERS 
syms mu_c       esigma_c ...
     mu_M2_80   esigma_M2_80   w_M2_80   ...
     mu_M2_200   esigma_M2_200   w_M2_200  ...
    mu_M2_60_P50   esigma_M2_60_P50   w_M2_60_P50   ...
  mu_M2_60_P188   esigma_M2_60_P188    w_M2_60_P188   ...
     gamma_cen_M2_WT   esigma_cen_M2_WT      elambda_cen_M2_WT      exi_cen_M2_WT  ...
     gamma_cen_M2_200   esigma_cen_M2_200      elambda_cen_M2_200      exi_cen_M2_200  ...
     gamma_cen_M2_80  esigma_cen_M2_80     elambda_cen_M2_80     exi_cen_M2_80 ...
    gamma_cen_M2_60_P50  esigma_cen_M2_60_P50     elambda_cen_M2_60_P50     exi_cen_M2_60_P50 ...
     gamma_cen_M2_60_P188  esigma_cen_M2_60_P188     elambda_cen_M2_60_P188     exi_cen_M2_60_P188;
 


  
parameters.sym  = [ mu_c       ; esigma_c       ;             ...
                   mu_M2_200   ; esigma_M2_200   ; w_M2_200   ; ...
                    mu_M2_80   ; esigma_M2_80   ; w_M2_80   ; ...
                    mu_M2_60_P50   ; esigma_M2_60_P50   ; w_M2_60_P50   ; ...
                    mu_M2_60_P188    ; esigma_M2_60_P188    ; w_M2_60_P188   ;
                    gamma_cen_M2_WT;   esigma_cen_M2_WT ;     elambda_cen_M2_WT;      exi_cen_M2_WT;  ...
                    gamma_cen_M2_200;   esigma_cen_M2_200 ;     elambda_cen_M2_200;      exi_cen_M2_200;  ...
                    gamma_cen_M2_80;  esigma_cen_M2_80;     elambda_cen_M2_80;     exi_cen_M2_80; ...
                    gamma_cen_M2_60_P50;  esigma_cen_M2_60_P50;     elambda_cen_M2_60_P50;     exi_cen_M2_60_P50; ...
                    gamma_cen_M2_60_P188;  esigma_cen_M2_60_P188;     elambda_cen_M2_60_P188;     exi_cen_M2_60_P188] ;

parameters.name = {'mu_c'         ; 'esigma_c'         ;                 ...
                   'mu_{M2,200}'   ; 'esigma_{M2,200}'   ; 'w_{M2,200}'   ; ...
                   'mu_{M2,80}'   ; 'esigma_{M2,80}'   ; 'w_{M2,80}'   ; ...
                   'mu_{M2,60_P50}'   ; 'esigma_{M2,60_P50}'   ; 'w_{M2,60_P50}'   ; ...
                   'mu_{M2,60_P188}'   ; 'esigma_{M2,60_P188}'   ; 'w_{M2,60_P188}'   ; ...
                    'gamma_{cen_M2_WT}';   'esigma_{cen_M2_WT}' ;     'elambda_{cen_M2_WT}';      'exi_{cen_M2_WT}';  ...
                    'gamma_{cen_M2_200}';   'esigma_{cen_M2_200}' ;     'elambda_{cen_M2_200}';      'exi_{cen_M2_200}';  ...
                    'gamma_{cen_M2_80}';  'esigma_{cen_M2_80}';    'elambda_{cen_M2_80}';     'exi_{cen_M2_80}'; ...
                    'gamma_{cen_M2_60_P50}';  'esigma_{cen_M2_60_P50}';     'elambda_{cen_M2_60_P50}';     'exi_{cen_M2_60_P50}'; ...
                    'gamma_{cen_60_P188}';  'esigma_{cen_60_P188}';     'elambda_{cen_60_P188}';     'exi_{cen_60_P188}'};
               
               
parameters.number = length(parameters.sym);

parameters.min  = [  log(5); log(1e-1);   ...
                     log(5); log(1e-1); 0; ...     
                     log(5); log(1e-1); 0; ...     
                     log(5); log(1e-1); 0; ...    
                     log(5); log(1e-1); 0; ...       
                     0   ; log(0.1); log(0.1); log(500);...
                     0   ; log(0.1); log(0.1); log(500);...
                    0   ; log(0.1); log(0.1); log(500);...
                    0   ; log(0.1); log(0.1); log(500);...
                     0   ; log(0.1); log(0.1); log(500)];  
                 
parameters.max  = [ log(2e3); log(1e1);    ...
                    log(2e3); log(1e1); 1; ...
                    log(2e3); log(1e1); 1; ...
                    log(2e3); log(1e1); 1; ...
                    log(2e3); log(1e1); 1; ...
                    20; log(12); log(100); log(2e3);....
                    20; log(12); log(100); log(2e3);...
                    20; log(12); log(100); log(2e3);...
                    20; log(12); log(100); log(2e3);...
                    20; log(12); log(100); log(2e3) ];
                
                
                
% parameters.min  = [  log(5); log(1e-1);   ...
%                      log(5); log(1e-1); 0; ...     
%                      log(5); log(1e-1); 0; ...     
%                      log(5); log(1e-1); 0; ...    
%                      log(5); log(1e-1); 0; ...       
%                      -20   ; log(1e-4); log(5); log(5);...
%                      -20   ; log(1e-4); log(5); log(5);...
%                      -20   ; log(1e-4); log(5); log(5);...
%                      -20   ; log(1e-4); log(5); log(5);...
%                      -20   ; log(1e-4); log(5); log(5)];  
%                  
% parameters.max  = [ log(2e3); log(1e1);    ...
%                     log(2e3); log(1e1); 1; ...
%                     log(2e3); log(1e1); 1; ...
%                     log(2e3); log(1e1); 1; ...
%                     log(2e3); log(1e1); 1; ...
%                     20; log(1e4); log(2e3); log(2e3);...
%                     20; log(1e4); log(2e3); log(2e3);...
%                     20; log(1e4); log(2e3); log(2e3);...
%                     20; log(1e4); log(2e3); log(2e3);...
%                     20; log(1e4); log(2e3); log(2e3) ];
%                       

%% SPECIFY MODEL AND DATA
M.mixture.type = 'log-normal';
M.label.x = 'time [min]';
M.label.y = 'probability density';

Mc.mixture.type = 'Johnson SU';
Mc.label.x = 'time [min]';
Mc.label.y = 'probability density';





% EXPERIMENT
i = 1 ;
data_60_P50_Mad2;

D{i}.name = tit;
D{i}.description = [];
D{i}.data.uncensored = Tm;
D{i}.data.censored = Tc;
D{i}.observation_interval = 5;

M.experiment(i).name  = tit;
M.experiment(i).size  = 2;
M.experiment(i).w     = {1-w_M2_60_P50,w_M2_60_P50};
M.experiment(i).mu    = {mu_c,mu_M2_60_P50};
M.experiment(i).sigma = {exp(esigma_c),exp(esigma_M2_60_P50)};

Mc.experiment(i).name   = tit;
Mc.experiment(i).size   = 1;
Mc.experiment(i).w      = {            1 };
Mc.experiment(i).gamma  = {      gamma_cen_M2_60_P50 };
Mc.experiment(i).sigma  = { exp(esigma_cen_M2_60_P50)};
Mc.experiment(i).lambda = {exp(elambda_cen_M2_60_P50)};
Mc.experiment(i).xi     = {    exp(exi_cen_M2_60_P50)};

% EXPERIMENT
i = i + 1;
data_60_P188_Mad2;

D{i}.name = tit;
D{i}.description = [];
D{i}.data.uncensored = Tm;
D{i}.data.censored = Tc;
D{i}.observation_interval = 5;

M.experiment(i).name  = tit;
M.experiment(i).size  = 2;
M.experiment(i).w     = {1-w_M2_60_P188,w_M2_60_P188};
M.experiment(i).mu    = {mu_c,mu_M2_60_P188};
M.experiment(i).sigma = {exp(esigma_c),exp(esigma_M2_60_P188)};

Mc.experiment(i).name   = tit;
Mc.experiment(i).size   = 1;
Mc.experiment(i).w      = {            1 };
Mc.experiment(i).gamma  = {      gamma_cen_M2_60_P188 };
Mc.experiment(i).sigma  = { exp(esigma_cen_M2_60_P188)};
Mc.experiment(i).lambda = {exp(elambda_cen_M2_60_P188)};
Mc.experiment(i).xi     = {    exp(exi_cen_M2_60_P188)};

% EXPERIMENT
i = i+1;
data_80_Mad2;

D{i}.name = tit;
D{i}.description = [];
D{i}.data.uncensored = Tm;
D{i}.data.censored = Tc;
D{i}.observation_interval = 5;

M.experiment(i).name  = tit;
M.experiment(i).size  = 2;
M.experiment(i).w     = {1-w_M2_80,w_M2_80};
M.experiment(i).mu    = {mu_c,mu_M2_80};
M.experiment(i).sigma = {exp(esigma_c),exp(esigma_M2_80)};

Mc.experiment(i).name   = tit;
Mc.experiment(i).size   = 1;
Mc.experiment(i).w      = {            1 };
Mc.experiment(i).gamma  = {      gamma_cen_M2_80 };
Mc.experiment(i).sigma  = { exp(esigma_cen_M2_80)};
Mc.experiment(i).lambda = {exp(elambda_cen_M2_80)};
Mc.experiment(i).xi     = {    exp(exi_cen_M2_80)};

% EXPERIMENT
i = i + 1;
data_200_Mad2_P259bp;

D{i}.name = tit;
D{i}.description = [];
D{i}.data.uncensored = Tm;
D{i}.data.censored = Tc;
D{i}.observation_interval = 5;

M.experiment(i).name  = tit;
M.experiment(i).size  = 2;
M.experiment(i).w     = {1-w_M2_200,w_M2_200};
M.experiment(i).mu    = {mu_c,mu_M2_200};
M.experiment(i).sigma = {exp(esigma_c),exp(esigma_M2_200)};

Mc.experiment(i).name   = tit;
Mc.experiment(i).size   = 1;
Mc.experiment(i).w      = {            1 };
Mc.experiment(i).gamma  = {      gamma_cen_M2_200 };
Mc.experiment(i).sigma  = { exp(esigma_cen_M2_200)};
Mc.experiment(i).lambda = {exp(elambda_cen_M2_200)};
Mc.experiment(i).xi     = {    exp(exi_cen_M2_200)};












% % EXPERIMENT
% i = i + 1;
% data_10_Mad2;
% 
% D{i}.name = tit;
% D{i}.description = [];
% D{i}.data.uncensored = Tm;
% D{i}.data.censored = Tc;
% D{i}.observation_interval = 5;
% 
% M.experiment(i).name  = tit;
% M.experiment(i).size  = 2;
% M.experiment(i).w     = {1-w_M2_10,w_M2_10};
% M.experiment(i).mu    = {mu_c,mu_M2_10};
% M.experiment(i).sigma = {exp(esigma_c),exp(esigma_M2_10)};
% 
% % Mc.experiment(i).name   = tit;
% % Mc.experiment(i).size   = 1;
% % Mc.experiment(i).w      = {            1 };
% % Mc.experiment(i).gamma  = {      gamma_cen_M2_10 };
% % Mc.experiment(i).sigma  = { exp(esigma_cen_M2_10)};
% % Mc.experiment(i).lambda = {exp(elambda_cen_M2_10)};
% % Mc.experiment(i).xi     = {    exp(exi_cen_M2_10)};
% Mc.experiment(i).name   = tit;
% Mc.experiment(i).size   = 1;
% Mc.experiment(i).w      = {            1 };
% Mc.experiment(i).gamma  = {      gamma_cen_M2_WT };
% Mc.experiment(i).sigma  = { exp(esigma_cen_M2_WT)};
% Mc.experiment(i).lambda = {exp(elambda_cen_M2_WT)};
% Mc.experiment(i).xi     = {    exp(exi_cen_M2_WT)};

% % EXPERIMENT
% i = i + 1;
% data_20_Mad2;
% 
% D{i}.name = tit;
% D{i}.description = [];
% D{i}.data.uncensored = Tm;
% D{i}.data.censored = Tc;
% D{i}.observation_interval = 5;
% 
% M.experiment(i).name  = tit;
% M.experiment(i).size  = 2;
% M.experiment(i).w     = {1-w_M2_20,w_M2_20};
% M.experiment(i).mu    = {mu_c,mu_M2_20};
% M.experiment(i).sigma = {exp(esigma_c),exp(esigma_M2_20)};
% 
% % Mc.experiment(i).name   = tit;
% % Mc.experiment(i).size   = 1;
% % Mc.experiment(i).w      = {            1 };
% % Mc.experiment(i).gamma  = {      gamma_cen_M2_20 };
% % Mc.experiment(i).sigma  = { exp(esigma_cen_M2_20)};
% % Mc.experiment(i).lambda = {exp(elambda_cen_M2_20)};
% % Mc.experiment(i).xi     = {    exp(exi_cen_M2_20)};
% Mc.experiment(i).name   = tit;
% Mc.experiment(i).size   = 1;
% Mc.experiment(i).w      = {            1 };
% Mc.experiment(i).gamma  = {      gamma_cen_M2_WT };
% Mc.experiment(i).sigma  = { exp(esigma_cen_M2_WT)};
% Mc.experiment(i).lambda = {exp(elambda_cen_M2_WT)};
% Mc.experiment(i).xi     = {    exp(exi_cen_M2_WT)};


% % EXPERIMENT
% i = i + 1;
% data_40_Mad2;
% 
% D{i}.name = tit;
% D{i}.description = [];
% D{i}.data.uncensored = Tm;
% D{i}.data.censored = Tc;
% D{i}.observation_interval = 5;
% 
% M.experiment(i).name  = tit;
% M.experiment(i).size  = 2;
% M.experiment(i).w     = {1-w_M2_40,w_M2_40};
% M.experiment(i).mu    = {mu_c,mu_M2_40};
% M.experiment(i).sigma = {exp(esigma_c),exp(esigma_M2_40)};
% 
% % Mc.experiment(i).name   = tit;
% % Mc.experiment(i).size   = 1;
% % Mc.experiment(i).w      = {            1 };
% % Mc.experiment(i).gamma  = {      gamma_cen_M2_40 };
% % Mc.experiment(i).sigma  = { exp(esigma_cen_M2_40)};
% % Mc.experiment(i).lambda = {exp(elambda_cen_M2_40)};
% % Mc.experiment(i).xi     = {    exp(exi_cen_M2_40)};
% 
% Mc.experiment(i).name   = tit;
% Mc.experiment(i).size   = 1;
% Mc.experiment(i).w      = {            1 };
% Mc.experiment(i).gamma  = {      gamma_cen_M2_WT };
% Mc.experiment(i).sigma  = { exp(esigma_cen_M2_WT)};
% Mc.experiment(i).lambda = {exp(elambda_cen_M2_WT)};
% Mc.experiment(i).xi     = {    exp(exi_cen_M2_WT)};

% EXPERIMENT
i = i+1;
data_WT_Mad2;

D{i}.name = tit;
D{i}.description = [];
D{i}.data.uncensored = Tm;
D{i}.data.censored = Tc;
D{i}.observation_interval = 5;

M.experiment(i).name  = tit;
M.experiment(i).size  = 1;
M.experiment(i).w     = {1};
M.experiment(i).mu    = {mu_c};
M.experiment(i).sigma = {exp(esigma_c)};

Mc.experiment(i).name   = tit;
Mc.experiment(i).size   = 1;
Mc.experiment(i).w      = {            1 };
Mc.experiment(i).gamma  = {      gamma_cen_M2_WT };
Mc.experiment(i).sigma  = { exp(esigma_cen_M2_WT)};
Mc.experiment(i).lambda = {exp(elambda_cen_M2_WT)};
Mc.experiment(i).xi     = {    exp(exi_cen_M2_WT)};


% Compile model
% (This generates the functional expression of parameters and derivatives.)
[M,parameters.constraints] = getMixtureModel(M,parameters.sym);
Mc = getMixtureModel(Mc,parameters.sym);