If (False:C215)
	//object Name: [INVOICES]Invoices_In.Tab Control1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/09/2009 20:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	C_BOOLEAN:C305(INV_bo_Addingitem)
	C_LONGINT:C283($_l_event; vCT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.Tab Control1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		vCT:=0
		If (INV_bo_Addingitem)
			DB_SaveRecord(->[INVOICES_ITEMS:161])
		End if 
		LBi_RemoveAll(->INV_aptr_ListboxSetup)
		ARRAY POINTER:C280(INV_aptr_ListboxSetup; 0)
		Invoices_InLPß("P1")
		
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_In.Tab Control1"; $_t_oldMethodName)
