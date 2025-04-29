READ_ME_QSM_instructions
for the RSM Lab MSU TX


ALWAYS use QSM_auto_v3. TreeQSM-master is a clean copy of the code and will NOT run

*****************************************************************

Instructions for QSM_auto:

This is better version of QSM_v2. There are instructions in the code too.

The main script is a1_myqsmtree.m
There are TWO things to do before running the script (a1_myqsmtree.m)
	**script should be located at the very top**

1. All tree point clouds need to be stored in one file and have a .pts file extension.
	This folder needs to be in QSM_auto and only have the point clouds. 
	You will need to change the trees_cloud_file variable to the name of the file.

2. Change the number of times you want QSM to run (QSM_runs) and 
	the number of trees in the folder with the .pts files (tree_nums).
	Change the inputs if necessary (inputs.PatchDiam1, inputs.PatchDiam2min, inputs.PatchDiam2Max)

After those are complete, RUN the script.

All relevant outputs should be located in QSM_Trees_output
	Relevant outputs are pics of the point cloud (pts) and the 3D model (cyl), 
	the command window text (diary), 
	and wanted calculated variables (total volume, DBH, run time, etc.)


*****************************************************************

Instructions for QSM_auto_v1:

QSM is now automated as of 5 June 2024!!! This version will run all point clouds and save some of the outputs.
Updated 5 Feb 2025 (QSM_auto_v2): Polished the saved data output.

There are TWO things to do before running the script (a1_myqsmtree.m)
	**script should be located at the very top**

1. All point clouds need to be stored in one file (QSM_Trees) and have a .pts file extension
	**this file needs to be in QSM_auto and only have the point clouds**
	**If you want a different folder name, make sure to change the code too.**

2. Change the number of times you want QSM to run (QSM_runs) and the number of trees in QSM_Trees folder (tree_nums).

After those are complete, RUN the script.

All relevant outputs should be located in QSM_Trees_output (located in QSM_Trees)
	Relevant outputs are pics of the point cloud (pts) and the 3D model (cyl), the command window text (diary), 
	and wanted calculated variables (total volume, DBH, etc.)

Changing inputs:

There are THREE inputs: PatchDiam1, PatchDiam2Min, PatchDiam2Max and these can be changed in

	create_inputs.m

*****************************************************************

Instructions for QSM_no_subfolder:

QSM_no_subfolder is not automated.
QSM_no_subfolder will run ONE tree point cloud at a time, and it will NOT save anything

1. Put the tree point cloud needs to be in the QSM_no_subfolder folder
2. Open the a1_myqsmtree.m script should be located at the very top
3. In the code, after importdata(', write the file name of the point cloud
	make sure to have single quotes around the file name ''
4. Run
5. Outputs are not saved. However, they should include graphs, figures, and tree attributes.
	Save these as needed.
*****************************************************************

If you break the program, email Elizabeth (lizcelkins10@gmail.com)
	with your name, status (Grad, Undergrad), and the problem with pics if possible.

For more info, go to TreeQSM-master/README.md or TreeQSM-master/Manual/TreeQSM_documentation


