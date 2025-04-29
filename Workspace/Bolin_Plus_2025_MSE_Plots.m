%% Plot optimized parameters for each group
clc; clear; clf;

%% Import Bolin Data
[~,sheet_name]=xlsfinfo('Bolin_Plus_Tree_Data_2025.xlsx');
for k=1:numel(sheet_name)
  data{k}=xlsread('Bolin_Plus_Tree_Data_2025.xlsx',sheet_name{k});
end

%% Pull data 

S_PD1_para = data{1,3}(:,1);
S_PD1_MSE = data{1,3}(:,2);
S_PD1_RT = data{1,3}(:,3);

S_min_para = data{1,3}(:,5);
S_min_MSE = data{1,3}(:,6);
S_min_RT = data{1,3}(:,7);

S_max_para = data{1,3}(:,9);
S_max_MSE = data{1,3}(:,10);
S_max_RT = data{1,3}(:,11);

M_PD1_para = data{1,3}(:,14);
M_PD1_MSE = data{1,3}(:,15);
M_PD1_RT = data{1,3}(:,16);

M_min_para = data{1,3}(:,18);
M_min_MSE = data{1,3}(:,19);
M_min_RT = data{1,3}(:,20);

M_max_para = data{1,3}(:,22);
M_max_MSE = data{1,3}(:,23);
M_max_RT = data{1,3}(:,24);

L_PD1_para = data{1,3}(:,27);
L_PD1_MSE = data{1,3}(:,28);
L_PD1_RT = data{1,3}(:,29);

L_min_para = data{1,3}(:,31);
L_min_MSE = data{1,3}(:,32);
L_min_RT = data{1,3}(:,33);

L_max_para = data{1,3}(:,35);
L_max_MSE = data{1,3}(:,36);
L_max_RT = data{1,3}(:,37);

%% Plot data
f = figure(1);
f.Position = [400 400 1000 550];
t = tiledlayout(3,3);
annotation(f, "textbox", [0.02, 0.83, 0, 0], 'String', 'Small Trees')
annotation(f, "textbox", [0.02, 0.54, 0, 0], 'String', 'Medium Trees')
annotation(f, "textbox", [0.02, 0.24, 0, 0], 'String', 'Large Trees')

% small trees
nexttile
yyaxis left
plot(S_PD1_para, S_PD1_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(S_PD1_para, S_PD1_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (mins)')
subtitle('PD1')
xlabel('Test Parameters')
axis padded

nexttile
yyaxis left
plot(S_min_para, S_min_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(S_min_para, S_min_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (mins)')
%title('Mean Squared Error and Run Times','FontSize',15)
subtitle('PD2Min')
xlabel('Test Parameters')
axis padded

nexttile
yyaxis left
plot(S_max_para, S_max_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(S_max_para, S_max_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (mins)')
subtitle('PD2Max')
legend('MSE', 'Run Times', 'Location','northoutside', 'Orientation', 'horizontal', 'Box', 'on')
xlabel('Test Parameters')
axis padded

% medium trees
nexttile
yyaxis left
plot(M_PD1_para, M_PD1_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(M_PD1_para, M_PD1_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (hrs)')
xlabel('Test Parameters')
axis padded

nexttile
yyaxis left
plot(M_min_para, M_min_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(M_min_para, M_min_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (hrs)')
xlabel('Test Parameters')
axis padded

nexttile
yyaxis left
plot(M_max_para, M_max_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(M_max_para, M_max_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (hrs)')
xlabel('Test Parameters')
axis padded

% large trees
nexttile
yyaxis left
plot(L_PD1_para, L_PD1_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(L_PD1_para, L_PD1_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (mins)')
xlabel('Test Parameters')
axis padded

nexttile
yyaxis left
plot(L_min_para, L_min_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(L_min_para, L_min_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (mins)')
xlabel('Test Parameters')
axis padded

nexttile
yyaxis left
plot(L_max_para, L_max_MSE, 'Marker', '.', 'MarkerSize', 20 )
ylabel('MSE')
yyaxis right
plot(L_max_para, L_max_RT, 'Marker', '.', 'MarkerSize', 20 )
ylabel('Run Times (mins)')
xlabel('Test Parameters')
axis padded

%% Save plots

current_folder = pwd;
fig_folder = append(current_folder, '\Figures');
cd(fig_folder)
saveas(figure(1), '2025 MSE vs Run Time Plots for Each Group', 'png');
fprintf('All figures saved in %s\n', fig_folder)
cd(current_folder)


