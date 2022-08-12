If (False:C215)
	//object Name: [USER]Diary_OwnerDialog.OLBDiary1
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
	//ARRAY BOOLEAN(DA_lb_PerSelectP1;0)
	//ARRAY BOOLEAN(WS_abo_Selected;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_OwnerDialog.OLBDiary1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(DA_lb_PerSelectP1; $_l_Column; $_l_Row)
		
		If ($_l_Row>0)
			SD3_al_SelectedDiaryOwners{$_l_Row}:=Num:C11(WS_abo_Selected{$_l_Row})
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Diary_OwnerDialog.OLBDiary1"; $_t_oldMethodName)
