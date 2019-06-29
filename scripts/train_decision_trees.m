clc;
clear;
%% change parameters according to your own data setting
data_path = '../Records.xlsx';
sheet_name = 'Benchmark_Sequences';
active_range = 'a2:j119';
%%
% read everything into one cell array
[~,~,raw] = xlsread(data_path, sheet_name, active_range);
% find numbers
containsNumbers = cellfun(@isnumeric,raw);
% convert to string
raw(containsNumbers) = cellfun(@num2str,raw(containsNumbers),'UniformOutput',false);
T = cell2table(raw(2:end,:),'VariableNames', cellstr(raw(1,:)));

% % seperate in-/outdoor
% T_INDOOR = strcmp(T.Scene, 'indoor');
% T_OUTDOOR = strcmp(T.Scene, 'outdoor');

% categorize properties
% --- predictors
% tbl.Playform = categorical(T.Platform); 
tbl.Scene = categorical(T.Scene);

tbl.Duration = cellfun(@str2num,T.Duration);
short_terms = find(tbl.Duration<120);
long_terms = find(tbl.Duration>=600);
tbl.Duration = string(tbl.Duration);
tbl.Duration(:) = 'medium';
tbl.Duration(short_terms) = 'short';
tbl.Duration(long_terms) = 'long';
tbl.Duration = categorical(tbl.Duration);

tbl.MotDynamics = categorical(T.Motion_Dyn);
tbl.EnvDynamics = categorical(T.Env_Dyn);
tbl.RevisitFrequency = categorical(T.Revisit_Freq);   %turn off if VO only
% --- response
tbl.Difficulty = categorical(T.Difficulty);
tbl = struct2table(tbl);

% launch calssification GUI
% use table-type variable "tbl" as input
% select property Difficulty as response and others as predictors
% set related configurations for better trained results
% DON'T forget to export the trained model for visualization
classificationLearner;

% visualize structure of yielded decision tree
view(trainedClassifier.ClassificationTree, 'mode', 'graph');