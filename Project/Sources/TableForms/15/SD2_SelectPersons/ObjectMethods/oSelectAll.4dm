If (False:C215)
	//object Name: [USER]SD2_SelectPersons.oSelectAll
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
	C_BOOLEAN:C305(SD2_bo_SelectAll)
	C_LONGINT:C283($_l_event; $_l_PersionsIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_SelectPersons.oSelectAll"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_bo_SelectAll)
			For ($_l_PersionsIndex; 1; Size of array:C274(SD2_abo_SelectedPersons))
				SD2_abo_SelectedPersons{$_l_PersionsIndex}:=True:C214
			End for 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_SelectPersons.oSelectAll"; $_t_oldMethodName)
