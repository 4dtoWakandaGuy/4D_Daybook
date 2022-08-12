//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_Seconds
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_Seconds")
//CAC_Seconds
//Rollo 12/9/99

//returns a number of seconds from a fixed date
//to be used as a replacement for milliseconds - since that
//appears to go wrong after 24 days of a machine being up

//86400 is 24*60*60


$0:=((Current date:C33-!1999-08-12!)*86400)+Current time:C178
ERR_MethodTrackerReturn("CAC_Seconds"; $_t_oldMethodName)
