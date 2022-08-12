If (False:C215)
	//object Name: [INVOICES]dAllocation.Variable15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; GEN_l_NameSelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dAllocation.Variable15"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (GEN_l_NameSelected>0)
			ACCEPT:C269
		Else 
			ALERT:C41("You must select an order before you press OK")
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dAllocation.Variable15"; $_t_oldMethodName)
