//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term Platform
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:51
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

$_t_oldMethodName:=ERR_MethodTracker("Term Platform")
If (Is Windows:C1573)
	$0:=Replace string:C233($1; "Folder"; "Directory")
	$0:=Replace string:C233($1; "Option"; "Alt")
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("Term Platform"; $_t_oldMethodName)