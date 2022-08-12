If (False:C215)
	//object Name: [SERVICE_CALLS]dService Call.Variable9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/09/2013 12:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vCharge)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].dService Call.Variable9"; Form event code:C388)
If ((vCharge="Y") | (vCharge="N"))
	vCharge:=Uppercase:C13(vCharge)
	[SERVICE_CALLS:20]Charge:8:=vCharge
	If ([SERVICE_CALLS:20]Charge:8="Y")
		[SERVICE_CALLS:20]Your_Order_Number:25:="CHARGE"
	Else 
		[SERVICE_CALLS:20]Your_Order_Number:25:="CONTRACT"
	End if 
Else 
	vCharge:=[SERVICE_CALLS:20]Charge:8
	GOTO OBJECT:C206(vCharge)
End if 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].dService Call.Variable9"; $_t_oldMethodName)
