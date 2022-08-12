//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_ContexttoTable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/09/2011 09:49 v7.0.0/1
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

$_t_oldMethodName:=ERR_MethodTracker("DBWS_ContexttoTable")
//This method will return the table NAME for the context passed in..this is so we can call things something else on the web stte or give them better names
$0:=""
If (Count parameters:C259>=1)
	
	$0:=$1
	
	
End if 
ERR_MethodTrackerReturn("DBWS_ContexttoTable"; $_t_oldMethodName)