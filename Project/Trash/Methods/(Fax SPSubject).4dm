//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Fax SPSubject
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Fax SPSubject")
Case of 
	: ($1="Order Auth")
		$0:="Order Authorisation"
	: ($1="Order Ack")
		$0:="Order Acknowledgement"
		
	Else 
		$0:=$1
End case 
ERR_MethodTrackerReturn("Fax SPSubject"; $_t_oldMethodName)