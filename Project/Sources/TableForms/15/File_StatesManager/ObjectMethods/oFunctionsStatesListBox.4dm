If (False:C215)
	//object Name: [USER]File_StatesManager.oFunctionsStatesListBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(FS_lb_Functions;0)
	//ARRAY BOOLEAN(ST_abo_CodeUsed;0)
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; ST_l_Modified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.oFunctionsStatesListBox"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(FS_lb_Functions; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)
				ST_al_CodeUsed{$_l_Row}:=Num:C11(ST_abo_CodeUsed{$_l_Row})
				//ST_al_CodeUsed:=0
				//ST_at_CodeUseName:=0
				ST_l_Modified:=1
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.oFunctionsStatesListBox"; $_t_oldMethodName)
