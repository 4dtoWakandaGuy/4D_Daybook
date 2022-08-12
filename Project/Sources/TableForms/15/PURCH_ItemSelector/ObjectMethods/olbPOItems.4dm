If (False:C215)
	//object Name: [USER]PURCH_ItemSelector.olbPOItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2010 11:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PI_abo_CopyItem;0)
	//ARRAY BOOLEAN(PI_abo_MarkItem;0)
	//ARRAY BOOLEAN(PO_lb_COPYITEMS;0)
	//ARRAY LONGINT(PI_al_dCopyItem;0)
	//ARRAY LONGINT(PI_al_dMarkItem;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_REAL:C285(ACC_ai_DCopyItem)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PURCH_ItemSelector.olbPOItems"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(PO_lb_COPYITEMS; $_l_Column; $_l_Row)
		ACC_ai_DCopyItem:=$_l_Row
		Case of 
			: ($_l_Column=4)  //copy
				
				PI_al_dCopyItem{$_l_Row}:=Num:C11(PI_abo_CopyItem{$_l_Row})
				If (Not:C34(PI_abo_CopyItem{$_l_Row}))
					PI_abo_MarkItem{$_l_Row}:=False:C215
					PI_al_dCopyItem{$_l_Row}:=0
				End if 
			: ($_l_Column=5)  //Mark
				PI_al_dMarkItem{$_l_Row}:=Num:C11(PI_abo_MarkItem{$_l_Row})
				If (PI_abo_MarkItem{$_l_Row})
					PI_abo_CopyItem{$_l_Row}:=True:C214
					PI_al_dCopyItem{$_l_Row}:=1
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].PURCH_ItemSelector.olbPOItems"; $_t_oldMethodName)
