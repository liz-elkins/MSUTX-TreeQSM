%% Plot all boxplots
clc; clear; clf;

%% Import Bolin Data
[~,sheet_name]=xlsfinfo('Bolin_Plus_Tree_Data_2025.xlsx');
for k=1:numel(sheet_name)
  data{k}=xlsread('Bolin_Plus_Tree_Data_2025.xlsx',sheet_name{k});
end
 

%% Data set up
% DBH data set up
DBH_Speices_Elm = data{1,9}(:, 3);
DBH_Speices_Oak = data{1,9}(:, 12);
DBH_Speices_Pine = data{1,9}(:, 21);
DBH_Speices_Juniper = data{1,9}(:, 30);

DBH_Size_Small = data{1,10}(:, 3);
DBH_Size_Medium = data{1,10}(:, 12);
DBH_Size_Large = data{1,10}(:, 21);

% AGB data set up
AGB_Speices_Elm = data{1,9}(:, 6);
AGB_Speices_Oak = data{1,9}(:, 15);
AGB_Speices_Pine = data{1,9}(:, 24);
AGB_Speices_Juniper = data{1,9}(:, 33);

AGB_Size_Small = data{1,10}(:, 6);
AGB_Size_Medium = data{1,10}(:, 15);
AGB_Size_Large = data{1,10}(:, 24);

%% Format data
DBH_Speices_data = [DBH_Speices_Elm; DBH_Speices_Oak; DBH_Speices_Pine; DBH_Speices_Juniper];
a1_r = length(DBH_Speices_Elm);
a2_r = length(DBH_Speices_Oak);
a3_r = length(DBH_Speices_Pine);
a4_r = length(DBH_Speices_Juniper);
a1 = repmat({'Cedar Elms'},a1_r, 1);
a2 = repmat({'Oaks'},a2_r,1);
a3 = repmat({'Pines'},a3_r,1);
a4 = repmat({'Juniper'},a4_r,1);
a = [a1; a2; a3; a4];

DBH_Size_data = [DBH_Size_Small; DBH_Size_Medium; DBH_Size_Large];
b1_r = length(DBH_Size_Small);
b2_r = length(DBH_Size_Medium);
b3_r = length(DBH_Size_Large);
b1 = repmat({'Small (DBH <36 cm)'},b1_r, 1);
b2 = repmat({'Med (DBH 36-55 cm)'},b2_r,1);
b3 = repmat({'Large (DBH >55 cm)'},b3_r,1);
b = [b1; b2; b3];

AGB_Speices_data = [AGB_Speices_Elm; AGB_Speices_Oak; AGB_Speices_Pine; AGB_Speices_Juniper];
c1_r = length(AGB_Speices_Elm);
c2_r = length(AGB_Speices_Oak);
c3_r = length(AGB_Speices_Pine);
c4_r = length(AGB_Speices_Juniper);
c1 = repmat({'Cedar Elms'},c1_r, 1);
c2 = repmat({'Oaks'},c2_r,1);
c3 = repmat({'Pines'},c3_r,1);
c4 = repmat({'Juniper'},c4_r,1);
c = [c1; c2; c3; c4];

AGB_Size_data = [AGB_Size_Small; AGB_Size_Medium; AGB_Size_Large];
d1_r = length(AGB_Size_Small);
d2_r = length(AGB_Size_Medium);
d3_r = length(AGB_Size_Large);
d1 = repmat({'Small (DBH <36 cm)'},d1_r, 1);
d2 = repmat({'Med (DBH 36-55 cm)'},d2_r,1);
d3 = repmat({'Large (DBH >55 cm)'},d3_r,1);
d = [d1; d2; d3];

%% Plot data
f = figure(1);
f.Position = [400 100 1200 800];
colors_siz = [0 0.4470 0.7410; 0.6350 0.0780 0.1840; 0.9290 0.6940 0.1250];
colors_spe = [0.9290 0.6940 0.1250; 0 0.4470 0.7410; 0.6350 0.0780 0.1840; 0.9290 0.6940 0.1250];
tiledlayout(2,2);

nexttile
boxplot(DBH_Speices_data, a)
h = findobj(gca,'Tag','Box');
for j=1:(length(h))
    patch(get(h(j),'XData'),get(h(j),'YData'),colors_spe(j,:),'FaceAlpha',.5);
end
xlabel("Tree Species Group")
ylabel('Error %')
title('DBH Error Percentage by Tree Species')

nexttile
boxplot(DBH_Size_data, b)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors_siz(j,:),'FaceAlpha',.5);
end
xlabel("Tree Size")
ylabel('Error %')
title('DBH Error Percentage by Tree Size')

nexttile
boxplot(AGB_Speices_data, c)
h = findobj(gca,'Tag','Box');
for j=1:(length(h))
    patch(get(h(j),'XData'),get(h(j),'YData'),colors_spe(j,:),'FaceAlpha',.5);
end
xlabel("Tree Species Group")
ylabel('% Difference')
title('AGB Percentage Difference by Tree Species')

nexttile
boxplot(AGB_Size_data, d)
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),colors_siz(j,:),'FaceAlpha',.5);
end
xlabel("Tree Size")
ylabel('% Difference')
title('AGB Percentage Difference by Tree Size')

%% Save plots

current_folder = pwd;
fig_folder = append(current_folder, '\Figures');
cd(fig_folder)

saveas(gcf, '2025 DBH and AGB Error-Difference Percentage.png');
fprintf('Figure saved in %s\n', fig_folder)
cd(current_folder)
