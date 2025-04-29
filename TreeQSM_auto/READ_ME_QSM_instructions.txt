READ_ME_QSM_instructions
for the RSM Lab MSU TX


*****************************************************************


Instructions for QSM_auto:


The main script is a1_myqsmtree.m
There are TWO things to do before running the script (a1_myqsmtree.m)
	**script should be located at the very top**

1. All tree point clouds need to be stored in one file and have a .pts file extension.
	This folder needs to be in QSM_auto and only have the point clouds 
	You will need to change the trees_cloud_file variable to the name of the file

2. Change the number of times you want QSM to run (QSM_runs) and 
	the number of trees in the folder with the .pts files (tree_nums).
	Change the inputs if necessary (inputs.PatchDiam1, inputs.PatchDiam2min, inputs.PatchDiam2Max)

After those are complete, RUN the script.

All relevant outputs should be located in QSM_Trees_output
	Relevant outputs are pics of the point cloud (pts) and the 3D model (cyl), 
	the command window text (diary), 
	and wanted calculated variables (total volume, DBH, run time, etc.)


*****************************************************************

If you break the program, email Elizabeth (lizcelkins10@gmail.com)
	with your name, user status (Grad, Undergrad, GitHub), and the problem with pics if possible.

For more info, go to original files TreeQSM-master/README.md or TreeQSM-master/Manual/TreeQSM_documentation


