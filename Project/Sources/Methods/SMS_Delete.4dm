//%attributes = {}

If (False:C215)
	//Project Method Name:      SMS_Delete
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMS_Delete")

// SMS_Delete
// Delete SMS_Log records
// 14/01/03 pb

$_t_oldMethodName:=ERR_MethodTracker("SMS_Delete")

If (Records in set:C195("userset")=0)
	//ALERT("Please select one or more records to delete!")
	Gen_Alert("Please select one or more records to delete!")
Else 
	CREATE SET:C116([SMS_Log:124]; "SMSMaster")
	USE SET:C118("userset")
	If (Records in selection:C76([SMS_Log:124])>0)
		vNo:=Records in selection:C76([SMS_Log:124])
		Are_You_Sure
		If (OK=1)
			DELETE SELECTION:C66([SMS_Log:124])
		End if 
		USE SET:C118("SMSMaster")
	End if 
End if 
ERR_MethodTrackerReturn("SMS_Delete"; $_t_oldMethodName)