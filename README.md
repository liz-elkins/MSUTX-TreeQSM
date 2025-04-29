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
