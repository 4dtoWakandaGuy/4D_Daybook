//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_PasswordValidation
	//------------------ Method Notes ------------------
	//This method is the error handler for use in the login process.
	//THis will display a sensible error message if the password is wrong(-9978) we should never het a -9979 as we validate
	//the user name first
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2009 09:03`Method: DB_PasswordValidation
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_PasswordValidation")

Case of 
	: (Error=-9978)  //invald password
		Gen_Alert("The password stored in Daybook for this user does not match the password system. Please ask your administrator to look into this problem")
		QUIT 4D:C291
End case 
ERR_MethodTrackerReturn("DB_PasswordValidation"; $_t_oldMethodName)