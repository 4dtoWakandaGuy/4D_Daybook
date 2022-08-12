If (False:C215)
	//object Name: [USER]Diary_AccessSelector.Tab Control2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	//ARRAY LONGINT(WS_aI_SelectedSetGroups;0)
	//ARRAY LONGINT(WS_al_SelectedSetGroups;0)
	//ARRAY TEXT(SM_at_SendSetControl;0)
	C_LONGINT:C283($_l_event; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_AccessSelector.Tab Control2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		Case of 
			: (SM_at_SendSetControl=1)
				For ($_l_Index; 1; Size of array:C274(WS_al_SelectedSetGroups))
					WS_al_SelectedSetGroups{$_l_Index}:=0
				End for 
				FORM GOTO PAGE:C247(2)
			: (SM_at_SendSetControl=2)
				For ($_l_Index; 1; Size of array:C274(WS_al_SelectedSetGroups))
					SD3_al_SelectedDiaryOwners{$_l_Index}:=0
				End for 
				FORM GOTO PAGE:C247(3)
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Diary_AccessSelector.Tab Control2"; $_t_oldMethodName)
