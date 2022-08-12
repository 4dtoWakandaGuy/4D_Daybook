If (False:C215)
	//object Name: [ORDERS]Orders_In.oContButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; ORD_SubProcCON)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.oContButton"; Form event code:C388)

If ([ORDERS:24]Contact_Code:2#"")
	If (ORD_SubProcCON=0)
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])); Module_SalesOrders; ""; ->[CONTACTS:1]Contact_Code:2; [ORDERS:24]Contact_Code:2)
		
		//ZContacts_Mod ([ORDERS]Contact Code;"True";->ORD_SubProcCON)
	Else 
		$_l_ProcessState:=Process state:C330(ORD_SubProcCON)
		If ($_l_ProcessState<0)
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[CONTACTS:1])); Module_SalesOrders; ""; ->[CONTACTS:1]Contact_Code:2; [ORDERS:24]Contact_Code:2)
		Else 
			BRING TO FRONT:C326(ORD_SubProcCON)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.oContButton"; $_t_oldMethodName)
