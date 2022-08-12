If (False:C215)
	//object Name: [USER]SD2_SelectPersons.oExit
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
	//ARRAY BOOLEAN(SD2_abo_SelectedPersons;0)
	C_LONGINT:C283($_l_Index; $_l_SelectedPersons; SD2_l_PersonsSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_SelectPersons.oExit"; Form event code:C388)

$_l_SelectedPersons:=0
For ($_l_Index; 1; Size of array:C274(SD2_abo_SelectedPersons))
	If (SD2_abo_SelectedPersons{$_l_Index})
		$_l_SelectedPersons:=$_l_SelectedPersons+1
	End if 
End for 
If ($_l_SelectedPersons>0)
	SD2_l_PersonsSelected:=1
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_SelectPersons.oExit"; $_t_oldMethodName)
