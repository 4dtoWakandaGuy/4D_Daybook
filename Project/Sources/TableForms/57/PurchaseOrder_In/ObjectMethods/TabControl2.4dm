If (False:C215)
	//object Name: [PURCHASE_ORDERS]PurchaseOrder_In.TabControl2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2014 18:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	C_LONGINT:C283($_l_event; vCT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS]PurchaseOrder_In.TabControl2"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//ALERT("you clicked "+PO_at_ViewTabsLabels{PO_at_ViewTabsLabels})
		
		
		
		
		vCT:=0
		LBi_RemoveAll(->POI_aptr_LBSetup)
		ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
		PurchOrd_InLPß("P1")
		
		
		
		
End case 
//ERR_MethodTrackerReturn ("OBJ PurchaseOrder_In.Tab Control";$_t_oldMethodName)
