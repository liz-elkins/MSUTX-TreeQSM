# Estimating North Texas Urban Tree Above-Ground Biomass Based on Terrestrial LiDAR and Optimized Quantitative Structure Models
### Elizabeth Elkins & Kashif Mahmud

Using TreeQSM (vr. 2.4.0) by InverseTampere around MSU Texas' campus.

In peperation to be submitted to the Journal of Earth Observation and Geospatial Applications.

## Abstract: 
Several studies have revealed that terrestrial Light Detection And Ranging (LiDAR) remote-sensing technology can be an alternative, more accurate approach to estimate tree Above-Ground Biomass (AGB). A set of algorithms has been developed to create a volume reconstruction of tree point clouds, which can be converted to an estimate of AGB. This allows to calculate AGB in a non-destructive and more accurate way compared to current forestry practices, which use generic allometric equations. LiDAR scans of trees within Midwestern State University’s campus were collected and analyzed with a tree segmentation/modeling algorithm. The validation method was based on comparing the estimated above-ground attributes to actual field measurements. Optimized parameters increased with increasing tree DBH. QSM produces accurate estimates calculating DBH, however it fails to calculate it precisely when there are low branches or dense leaves within the canopy. These occlusions commonly occur with certain tree species such Pinus echinata and Juniperus virginiana due to leaf density. Our result suggests good agreement of QSM derived AGB estimates for larger trees but overestimated AGB for smaller trees. This could be due to errors within the point clouds such as occlusions or segmentation and structure errors in the QSM model.

**Keywords:** LiDAR, QSM, urban, trees, AGB 

## Files

[TreeQSM_auto](https://github.com/liz-elkins/MSUTX-TreeQSM/tree/main/TreeQSM_auto) 
> A version of TreeQSM that runs multiple trees multiple times and save wanted data (total volume, trunk volume, DBH, height, and total run time)

[Workspace](https://github.com/liz-elkins/MSUTX-TreeQSM/tree/main/Workspace)
> MATLAB scripts used to create relvant figures (contains an .xlsx file, MATLAB scripts, and resulting figures)

[1_Tree_Data](https://github.com/liz-elkins/MSUTX-TreeQSM/blob/main/1_Tree_Data)
> All tree point clouds separated by size and raw field data avaiable for each tree

# Running Scripts

### QSM_auto:
> [!IMPORTANT]
> Located in TreeQSM_auto and the main script is **<ins>a1_myqsmtree.m<ins>**

There are TWO things to do before running script:

1. All tree point clouds need to be stored in the QSM_Trees folder and have a .pts file extension.
	- QSM_Trees folder needs to be in the QSM_auto folder and only have the point clouds

2. Change variables if necessary
   - The number of times you want QSM to run using the QSM_runs variable
   - The number of trees in the QSM_Trees folder using the variable tree_nums
   - The inputs if necessary (inputs.PatchDiam1, inputs.PatchDiam2min, inputs.PatchDiam2Max)

After those are complete, RUN the script.

All relevant outputs should be located in QSM_Trees_output
- Relevant outputs are pics of the point cloud (pts) and the 3D model (cyl), the command window text (diary), and wanted calculated variables (total volume, DBH, run time, etc.)

### Workspace Scripts
These scripts create figures using the Bolin_Plus_Tree_Data_2025.xlsx file. They import the necessary data, create the wanted figure, and saves it as a .png in the Figures folder.

| Script Name  | Description |
| ------------- | ------------- |
| [Bolin_Plus_2025_Box_Plots.m](https://github.com/liz-elkins/MSUTX-TreeQSM/blob/main/Workspace/Bolin_Plus_2025_Box_Plots.m) | Creates box plots for DBH error % and AGB % difference seprated by tree size and species |
| [Bolin_Plus_2025_Linear_Reg_Plots.m](https://github.com/liz-elkins/MSUTX-TreeQSM/blob/main/Workspace/Bolin_Plus_2025_Linear_Reg_Plots.m) | Creates linear regression plots for QSM vs Field DBH and QSM vs Allometric AGB (R<sup>2</sup> is calculated) |
| [Bolin_Plus_2025_MSE_Plots.m](https://github.com/liz-elkins/MSUTX-TreeQSM/blob/main/Workspace/Bolin_Plus_2025_MSE_Plots.m) | Creates a 3x3 plot that shows the MSE of different parameter outputs and run times for each tree size group |
| [Bolin_Plus_2025_Opt_Parameters.m](https://github.com/liz-elkins/MSUTX-TreeQSM/blob/main/Workspace/Bolin_Plus_2025_Opt_Parameters.m) | Create a visual of the change in optimized parameters for each tree size group |


*****************************************************************
> [!WARNING]
> If you break the program, email Elizabeth (lizcelkins10@gmail.com) with your name, user status (Grad, Undergrad, GitHub), and the problem with pics if possible.

For more info, go to original files TreeQSM-master/README.md or TreeQSM-master/Manual/TreeQSM_documentation
