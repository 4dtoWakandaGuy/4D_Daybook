If (False:C215)
	//object Name: Object Name:      LR_LicenceRequest.oGetLicencel1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/10/2012 09:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(DB_d_ExpiryDate; DB_d_ExpiryDateNEW)
	C_LONGINT:C283(DB_l_ConcurrentUsers)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.oGetLicencel1")

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.oGetLicencel1"; Form event code:C388)
//[USER]Path Name:="" `do not clear this
If (Current date:C33(*)>DB_d_ExpiryDate)
	If (DB_d_ExpiryDateNEW#!00-00-00!)
		DB_d_ExpiryDate:=DB_d_ExpiryDate
	End if 
	If (Current date:C33(*)>DB_d_ExpiryDate)
		
		//Path_CheckLUDel
		Case of 
			: (Application type:C494=4D Server:K5:6)
				
				Gen_Alert("No users will be able to log in")
				DB_l_ConcurrentUsers:=0
				CANCEL:C270
			Else 
				CLOSE WINDOW:C154
				FLUSH CACHE:C297
				QUIT 4D:C291
		End case 
	Else 
		CANCEL:C270
		//Licence has been renewed
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ LR_LicenceRequest.oGetLicencel1"; $_t_oldMethodName)
