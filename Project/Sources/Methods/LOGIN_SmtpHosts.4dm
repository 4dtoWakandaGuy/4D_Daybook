//%attributes = {}
If (False:C215)
	//Project Method Name:      LOGIN_SmtpHosts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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

$_t_oldMethodName:=ERR_MethodTracker("LOGIN_SmtpHosts")

//NG this new method(December 2007) is created to facilitate multiple SMTP hosts
//Note that i have also created a SEPERATE multiple email addresses preference
//This will allow a  user to have
//1)a Default Email address
//`2)multiple email addresses
//3)a default SMTP host assigned to each email address
//4) Multiple SMTP hosts
ERR_MethodTrackerReturn("LOGIN_SmtpHosts"; $_t_oldMethodName)