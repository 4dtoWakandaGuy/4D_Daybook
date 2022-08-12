//%attributes = {}
If (False:C215)
	//Project Method Name:      ContrI_Del
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ContrI_Del")
If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	
End if 
If ([ORDER_ITEMS:25]Contract_Code:29#"")
	If ([ORDER_ITEMS:25]Order_Code:1#"")
		Gen_Confirm("This Item cannot be deleted as it's part of an Order.  Unallocate"+" it from this Contract instead?"; "Yes"; "No")
		If (OK=1)
			[ORDER_ITEMS:25]Contract_Code:29:=""
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		End if 
	Else 
		$_l_OK:=DB_DeletionControl(->[ORDER_ITEMS:25]; "Contrl Del")
		If ($_l_OK=1)
			DELETE RECORD:C58([ORDER_ITEMS:25])
		End if 
	End if 
End if 
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
[CONTRACTS:17]Contract_Cost:7:=Gen_Round((Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)); 2; 2)
REDRAW:C174([CONTRACTS:17])
ERR_MethodTrackerReturn("ContrI_Del"; $_t_oldMethodName)