If (False:C215)
	//object Name: Object Name:      EW_ExportProjectsManager.Invisible Button5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 14:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(EW_al_ProjectNumbers;0)
	//ARRAY TEXT(EW_at_ProjectsNames;0)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ EW_ExportProjectsManager.Invisible Button5"; Form event code:C388)

GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
READ WRITE:C146([EW_ExportProjects:117])
FORM SET INPUT:C55([EW_ExportProjects:117]; "Entry")
EW_ArraysSetup("all")

ADD RECORD:C56([EW_ExportProjects:117])

If (OK=1)
	INSERT IN ARRAY:C227(EW_at_ProjectsNames; 1)
	INSERT IN ARRAY:C227(EW_al_ProjectNumbers; 1)
	EW_at_ProjectsNames{1}:=[EW_ExportProjects:117]ProjectName:1
	EW_al_ProjectNumbers{1}:=[EW_ExportProjects:117]RecordNumber:2
	SORT ARRAY:C229(EW_at_ProjectsNames; EW_al_ProjectNumbers)
	UNLOAD RECORD:C212([EW_ExportProjects:117])
End if 
READ ONLY:C145([EW_ExportProjects:117])

SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
ERR_MethodTrackerReturn("OBJ EW_ExportProjectsManager.Invisible Button5"; $_t_oldMethodName)
