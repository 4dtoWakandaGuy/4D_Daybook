If (False:C215)
	//object Name: [USER]User_In.oEW
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
	C_LONGINT:C283($_l_FormEvent; $_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oEW"; Form event code:C388)
// eALEWList


$_l_FormEvent:=Form event code:C388
Case of 
		//: ($_l_FormEvent=2)  ` double-click
	: ($_l_FormEvent=On Double Clicked:K2:5)
		//$_l_SelectedRow:=AL_GetLine (Self->)
		$_l_SelectedRow:=Self:C308->
		Case of 
			: ($_l_SelectedRow>0)
				READ WRITE:C146([EW_ExportProjects:117])
				READ WRITE:C146([EW_ExportSteps:118])
				READ WRITE:C146([EW_StepActions:119])
				QUERY:C277([EW_ExportProjects:117]; [EW_ExportProjects:117]RecordNumber:2=EW_al_ProjectNumbers{$_l_SelectedRow})
				FORM SET INPUT:C55([EW_ExportProjects:117]; "Entry")
				//        EW_ArraysSetup ("all")
				
				MODIFY RECORD:C57([EW_ExportProjects:117])
				
				UNLOAD RECORD:C212([EW_ExportProjects:117])
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oEW"; $_t_oldMethodName)
