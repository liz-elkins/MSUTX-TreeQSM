%% Plot optimized parameters for each group
clc; clear; clf;

%% Import Bolin Data
[~,sheet_name]=xlsfinfo('Bolin_Plus_Tree_Data_2025.xlsx');
for k=1:numel(sheet_name)
  data{k}=xlsread('Bolin_Plus_Tree_Data_2025.xlsx',sheet_name{k});
end

%% Pull data
pd1 = data{1,2}(1,[1 6 11]);
pd2min = data{1,2}(2,[1 6 11]);
pd2max = data{1,2}(3,[1 6 11]);

%% Model data
% mdl_pd1 = polyfit(1:3, pd1, 2);
% mdl_pd2min = polyfit(1:3, pd2min, 2);
% mdl_pd2max = polyfit(1:3, pd2max, 2);
% 
% x = linspace(1,3);
% pd1y = polyval(mdl_pd1, x);
% pd2miny = polyval(mdl_pd2min, x);
% pd2maxy = polyval(mdl_pd2max, x);
% 
% % find equations
% equ_pd1 = ['y = ', num2str(mdl_pd1(1)), '*x^2 + (', num2str(mdl_pd1(2)), ')*x + ', num2str(mdl_pd1(3))];
% equ_pd2min = ['y = ', num2str(mdl_pd2min(1)), '*x^2 + ', num2str(mdl_pd2min(2)), '*x + (', num2str(mdl_pd2min(3)), ')'];
% equ_pd2max = ['y = ', num2str(mdl_pd2max(1)), '*x^2 + (', num2str(mdl_pd2max(2)), ')*x + ', num2str(mdl_pd2max(3))];


%% Plot data

f = figure(1);
% f.Position = [600 300 800 500];

% plot(x, pd1y, '--', 'Color', '#f1a10c');
% plot(x, pd2miny, '--', 'Color', "#13670f");
% plot(x, pd2maxy, '--', 'Color', '#c013dc');

scatter(1:3, pd1, 300, 'filled', 'o', 'MarkerEdgeColor', '#ffffff', 'MarkerFaceColor', '#f1a10c', 'LineWidth', 1);
hold on
scatter(1:3, pd2min, 300, 'filled', 'square', 'MarkerEdgeColor', "#ffffff", 'MarkerFaceColor', "#13670f", 'LineWidth', 1);
scatter(1:3, pd2max, 200, 'filled', 'diamond', 'MarkerEdgeColor', '#ffffff', 'MarkerFaceColor','#c013dc', 'LineWidth', 1);


axis padded
lab = {'Small (DBH <36 cm)'; 'Medium (DBH 36-55 cm)'; 'Large (DBH >55 cm)'};
set(gca,'xtick',1:3,'xticklabel',lab) 
xtickangle(0)
xlabel('Tree Size')
ylabel('Parameter Value')

[~, l1] = legend('PD1', 'PD2min', 'PD2max', 'Location', 'northwest');
legend("boxoff")
l1 = findobj(l1,'Type','patch');
l1 = findobj(l1,'Marker','none','-xor');
set(l1(1:3),'MarkerSize',10);

 
% text(1.25, 0.065, equ_pd1)
% text(2.1, 0.005, equ_pd2min)
% text(2.35, 0.06, equ_pd2max)
% 
% fprintf('PD1: %s\n', equ_pd1)
% fprintf('PD2Min: %s\n', equ_pd2min)
% fprintf('PD2Max: %s\n', equ_pd2max)

%% Save plots

current_folder = pwd;
fig_folder = append(current_folder, '\Figures');
cd(fig_folder)
saveas(figure(1), '2025 Optimized Parameters for Each Group', 'png');
fprintf('All figures saved in %s\n', fig_folder)
cd(current_folder)