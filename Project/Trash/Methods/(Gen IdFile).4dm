//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_IdFile
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_IdFile")
//Gen_IdFile - returns the File No with leading zeros
$0:=String:C10(Table:C252($1))
$0:=("0"*(3-Length:C16($0)))+$0
ERR_MethodTrackerReturn("Gen_IdFile"; $_t_oldMethodName)