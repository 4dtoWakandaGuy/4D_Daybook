If (False:C215)
	//object Name: [INVOICES]Invoices_In.oAllocations
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
	//ARRAY BOOLEAN(INV_lb_ALLOCATIONS;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.oAllocations"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//BEEP
		
		LISTBOX SELECT ROW:C912(INV_lb_ALLOCATIONS; Self:C308->; 0)
		
		
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_In.oAllocations"; $_t_oldMethodName)
