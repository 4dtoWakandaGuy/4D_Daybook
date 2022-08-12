If (False:C215)
	//object Name: Object Name:      LR_LicenceRequest.Variable11
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/09/2012 00:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(DB_d_ExpiryDateNEW)
	C_LONGINT:C283(xOK)
	C_TEXT:C284($_t_oldMethodName; DB_t_PathName; vTitle3; vTitle4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.Variable11")

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.Variable11"; Form event code:C388)
If (vTitle3#"")
	$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.Variable11")
	//Date_Test2
	//requires current writable User record
	DB_ValidateDateCode(Vtitle3; DB_t_PathName)
	
	If (Current date:C33(*)>DB_d_ExpiryDateNEW)
		
		vTitle4:="Not Accepted"
		vTitle3:=""
		GOTO OBJECT:C206(vTitle3)
		OBJECT SET ENABLED:C1123(xOK; False:C215)
	Else 
		vTitle4:=String:C10((DB_d_ExpiryDateNEW-Current date:C33(*))+1)+" days remaining"
		vTitle3:=""
		OBJECT SET ENABLED:C1123(xOK; True:C214)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ LR_LicenceRequest.Variable11"; $_t_oldMethodName)
