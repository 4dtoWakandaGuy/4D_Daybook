//%attributes = {}
If (False:C215)
	//Project Method Name:      Fax_SPSubject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($1)
	C_TEXT:C284($0; $1; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax_SPSubject")
Case of 
	: ($1="Order_Auth")
		$0:="Order Authorisation"
	: ($1="Order_Ack")
		$0:="Order Acknowledgement"
		
	Else 
		$0:=$1
End case 
ERR_MethodTrackerReturn("Fax_SPSubject"; $_t_oldMethodName)
