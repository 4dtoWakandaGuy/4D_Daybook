If (False:C215)
	//object Name: Object Name:      EW_ExportProjectsManager.oEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 06:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(EW_al_ProjectNumbers;0)
	C_LONGINT:C283($_l_event; $_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ EW_ExportProjectsManager.oEW"; Form event code:C388)
// eALEWList


$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Double Clicked:K2:5)
		$_l_SelectedRow:=Self:C308->
		Case of 
			: ($_l_SelectedRow>0)
				READ WRITE:C146([EW_ExportProjects:117])
				READ WRITE:C146([EW_ExportSteps:118])
				READ WRITE:C146([EW_StepActions:119])
				QUERY:C277([EW_ExportProjects:117]; [EW_ExportProjects:117]RecordNumber:2=EW_al_ProjectNumbers{$_l_SelectedRow})
				FORM SET INPUT:C55([EW_ExportProjects:117]; "Entry")
				MODIFY RECORD:C57([EW_ExportProjects:117])
				UNLOAD RECORD:C212([EW_ExportProjects:117])
		End case 
End case 
ERR_MethodTrackerReturn("OBJ EW_ExportProjectsManager.oEW"; $_t_oldMethodName)
