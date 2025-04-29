%% import Bolin Data
clear; clc; clf;
[~,sheet_name]=xlsfinfo('Bolin_Plus_Tree_Data_2025.xlsx');
for k=1:numel(sheet_name)
  data{k}=xlsread('Bolin_Plus_Tree_Data_2025.xlsx',sheet_name{k});
end

%% pull in-field and QSM DBHs
DBH_Field = data{1,1}(:,1);
DBH_QSM = data{1,1}(:,2);

AGB_Field = data{1,1}([5 21 22 23], 4);
AGB_QSM = data{1,1}([5 21 22 23], 5);

%% calculate r squared for both
mdl_DBH = fitlm(DBH_Field, DBH_QSM); 
r_sq_DBH = mdl_DBH.Rsquared.Ordinary;
r_txt_DBH = append('R-Squared: ', string(r_sq_DBH));

mdl_AGB = fitlm(AGB_Field, AGB_QSM); 
r_sq_AGB = mdl_AGB.Rsquared.Ordinary;
r_txt_AGB = append('R-Squared: ', string(r_sq_AGB));

%% plot field vs QSM (cm)
f = figure(1);
f.Position = [600 300 1200 500];
tiledlayout(1,2);

nexttile
plot([0 80], [0 80], 'r', 'LineWidth', 1)
hold on
scatter(DBH_Field,DBH_QSM,60,"blue","filled","square")
title('Field vs QSM DBH')
xlabel('In-Field DBH (cm)')
ylabel('QSM DBH (cm)')
text(3, max(DBH_QSM), r_txt_DBH)

nexttile
xref = 10.^(1:.1:4);
yref = xref;
loglog(xref,yref, 'r', 'LineWidth', 1)
hold on
loglog(AGB_Field, AGB_QSM, 's', 'MarkerSize', 10, 'MarkerFaceColor', "blue", 'MarkerEdgeColor', 'blue' )
title('Field vs QSM AGB')
xlabel('In-Field AGB (kg)')
ylabel('QSM AGB (kg)')
text(15, max(AGB_QSM)+2000, r_txt_AGB)

%% Save plots

current_folder = pwd;
fig_folder = append(current_folder, '\Figures');
cd(fig_folder)
saveas(figure(1), '2025 DBH & AGB Linear Reg w Rsq', 'png');
fprintf('Figure saved in %s\n', fig_folder)
cd(current_folder)