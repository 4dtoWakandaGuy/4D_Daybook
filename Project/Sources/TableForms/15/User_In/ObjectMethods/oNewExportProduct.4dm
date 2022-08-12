If (False:C215)
	//object Name: [USER]User_In.oNewExportProduct
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(EW_al_ProjectNumbers;0)
	//ARRAY TEXT(EW_at_ProjectsNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oNewExportProduct"; Form event code:C388)
FORM SET INPUT:C55([EW_ExportProjects:117]; "Entry")
EW_ArraysSetup("all")
ADD RECORD:C56([EW_ExportProjects:117])
//MODIFY RECORD([EW_ExportProjects])
If (OK=1)
	INSERT IN ARRAY:C227(EW_at_ProjectsNames; 1)
	INSERT IN ARRAY:C227(EW_al_ProjectNumbers; 1)
	EW_at_ProjectsNames{1}:=[EW_ExportProjects:117]ProjectName:1
	EW_al_ProjectNumbers{1}:=[EW_ExportProjects:117]RecordNumber:2
	SORT ARRAY:C229(EW_at_ProjectsNames; EW_al_ProjectNumbers)
	
	UNLOAD RECORD:C212([EW_ExportProjects:117])
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oNewExportProduct"; $_t_oldMethodName)
