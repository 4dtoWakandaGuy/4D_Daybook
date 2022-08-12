If (False:C215)
	//object Name: [PURCHASE_ORDERS]dPurchOrd_Sel.oPurchaseStatesListbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PO_abo_Include;0)
	//ARRAY BOOLEAN(PO_LB_States;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oPurchaseStatesListbox"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		//TRACE
		LISTBOX GET CELL POSITION:C971(PO_LB_States; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)
				MOD_al_ModuleAccessStatus{$_l_Row}:=Abs:C99(MOD_al_ModuleAccessStatus{$_l_Row}-1)
				PO_abo_Include{$_l_Row}:=(MOD_al_ModuleAccessStatus{$_l_Row}=1)
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oPurchaseStatesListbox"; $_t_oldMethodName)
