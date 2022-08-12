If (False:C215)
	//object Name: [ORDER_ITEMS]dItems_Sel.oOrderStatesListbox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OrdI_abo_Include;0)
	//ARRAY BOOLEAN(ORDi_LB_States;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].dItems_Sel.oOrderStatesListbox"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Data Change:K2:15)
		//TRACE
		LISTBOX GET CELL POSITION:C971(ORDi_LB_States; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=1)
				MOD_al_ModuleAccessStatus{$_l_Row}:=Abs:C99(MOD_al_ModuleAccessStatus{$_l_Row}-1)
				OrdI_abo_Include{$_l_Row}:=(MOD_al_ModuleAccessStatus{$_l_Row}=1)
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].dItems_Sel.oOrderStatesListbox"; $_t_oldMethodName)
