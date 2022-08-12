If (False:C215)
	//object Name: [USER]User_In.Button6
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
	//ARRAY BOOLEAN(EW_lb_ProjectList;0)
	//ARRAY LONGINT(EW_al_ProjectNumbers;0)
	//ARRAY TEXT(EW_at_ProjectsNames;0)
	C_LONGINT:C283($_l_FormEvent; $_l_SourceRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button6"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
//$_l_SourceRow:=AL_GetLine (eALEWList)
$_l_SourceRow:=EW_lb_ProjectList
If ($_l_SourceRow>0)
	CONFIRM:C162("Are you sure you want to permanently delete the Export project "+EW_at_ProjectsNames{$_l_SourceRow}+"?"; "No"; "Yes")
	If (OK=0)
		READ WRITE:C146([EW_ExportProjects:117])
		QUERY:C277([EW_ExportProjects:117]; [EW_ExportProjects:117]RecordNumber:2=EW_al_ProjectNumbers{$_l_SourceRow})
		DB_DeletionControl(->[CATALOGUE:108])
		
		DELETE RECORD:C58([EW_ExportProjects:117])
		DELETE FROM ARRAY:C228(EW_at_ProjectsNames; $_l_SourceRow)
		DELETE FROM ARRAY:C228(EW_al_ProjectNumbers; $_l_SourceRow)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button6"; $_t_oldMethodName)
