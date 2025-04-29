%% This is the main scirpt
% This script will run QSM (v2.4.0) multiple times for multiple trees
% TWO THINGS BEFORE YOU RUN

% 1.
% The trees point clouds need to have a file extension of .pts 
% and be located in QSM_Trees in the QSM folder 

% 2.
% Change the number of times you want QSM to run (QSM_runs) and 
% the number of trees in the folder with the .pts files (tree_nums).
% Change the inputs if necessary (inputs.PatchDiam1, inputs.PatchDiam2min, inputs.PatchDiam2Max)

% FOR MORE INFO, GO TO https://github.com/liz-elkins/MSUTX-TreeQSM
clearvars; clc; clf;

%% Create space to save all volumes, dbhs, height, and run times

% ---------------------------------------------------------------
% QSM_runs is how many times you want QSM to run
QSM_runs = 1;

% tree_nums is how many trees you are running at once
% (how many trees point clouds are in your point cloud folder)
tree_nums = 7;

% define inputs 
create_input
inputs.PatchDiam1 = 0.02;
inputs.PatchDiam2Min = 0.01;
inputs.PatchDiam2Max = 0.01;
% There are more inputs in create_input.m but I'm focusing on these

% ---------------------------------------------------------------

% This is where is the name of tree point cloud folder
% it should be in the same folder as QSM
tree_folder_name = 'QSM_Trees';

% initializing variables for saved data table
total_vols = zeros(QSM_runs, tree_nums);
trunk_vols = zeros(QSM_runs, tree_nums);
DBH_cyls = zeros(QSM_runs, tree_nums);
height= zeros(QSM_runs, tree_nums);
total_run_time = zeros(QSM_runs, tree_nums);
t_r_time_mins = zeros(QSM_runs, tree_nums);
tree_names = "";

% name needed files
qsmfile = pwd;
qsmtrees = append(string(pwd), '\', tree_folder_name);
outputfile = append(string(qsmtrees), '\', string(tree_folder_name), '_QSM_output');

%% Run QSM n times
for bz = 1:QSM_runs
%% Call tree folder and see whats in it
cd(qsmtrees) 
s = dir('*.pts');
d = datetime("today","InputFormat","dd/MM/uuuu HH:mm:ss");
diary_name = append(string(qsmtrees), '_', string(d), '_diary_', string(bz), '.txt');
mkdir(outputfile)
cd(outputfile)
diary (diary_name)
cd(qsmfile)
t = size(s,1);

% error checking if the number of trees are the same
if tree_nums ~= t
    error('MyComponent:incorrectType', ['\n' ...
        'The number of trees you inputed does not equal the amount number of trees found in the folder.' ...
        '\n[Fix or the saved table will be incorrect.]'])
end

%% Loop to run every .pts file through QSM
for c = 1:t
    %% Set up
    fprintf('Entered Parameters:\n PD1: %.4f\n PD2min: %.4f\n PD2max: %.4f\n\n', ...
    inputs.PatchDiam1, inputs.PatchDiam2Min, inputs.PatchDiam2Max);

    f = s(c).name;
    tree_names(bz, c) = append(s(c).name);

    %% Run QSM
    fprintf('%s\n%s\n\n', d, f);
    cd(qsmtrees) 
    P = importdata(f);
    cd(qsmfile) 
    P = P- mean(P);
    [QSM, fig1, fig2] = treeqsm(P, inputs);
    % print section break
    fprintf('\n************************************\n\n')

    %% Save the wanted variables

    total_vols(bz,c) = QSM.treedata.TotalVolume;
    trunk_vols(bz,c) = QSM.treedata.TrunkVolume;
    DBH_cyls(bz,c) = QSM.treedata.DBHcyl;
    height(bz,c)= QSM.treedata.TreeHeight;
    total_run_time(1:1) = total_run_time(1:1) + QSM.rundata.time(12);

    %% Save figures in output foulder 
    % this code will create an output file
        % there is no need to manually 

    % go to correct file location
    cd(outputfile)

    % take off the file extention, add needed titles, and save
    p = append(string(f(1:end-4)), '_cyl_', string(d));
    saveas(fig1, p, 'png');

    o = append(string(f(1:end-4)), '_pts_', string(d));
    saveas(fig2, o, 'png');

    % go back to original file
    cd(qsmfile)
end

diary off

end

%% Save wanted variables

t_r_time_mins(1:1) = total_run_time(1:1)/60;
fprintf('Total Run Time: %.2f mins\n', t_r_time_mins(1:1));
cd(outputfile)

% reshape data into one column
tree_names_re = reshape(tree_names, [], 1);
total_vols_re = reshape(total_vols, [], 1);
trunk_vols_re = reshape(trunk_vols, [], 1);
DBH_cyls_re = reshape(DBH_cyls, [], 1);
height_re = reshape(height, [], 1);
t_r_time_mins_re = reshape(t_r_time_mins, [], 1);

% write table
filename = append('Saved_Data_', string(d), '.csv');
headers = {'Tree', 'Total Volume (L)', 'Trunk Volume (L)', 'DBH cyls (m)', 'Height (m)', 'Total Run Time (mins)'};
T = table(tree_names_re, total_vols_re, trunk_vols_re, DBH_cyls_re, height_re, t_r_time_mins_re, 'VariableNames', headers);
writetable(T, filename);
fprintf('Tables and pictures have been saved in %s\n', outputfile)

cd(qsmfile) 
