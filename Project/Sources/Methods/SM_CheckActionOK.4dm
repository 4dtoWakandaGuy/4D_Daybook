//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_CheckActionOK
	//------------------ Method Notes ------------------
	//This method will check if a user has the rights to take the action
	//$1=Action
	//Valid Values for $1
	//Share
	//Delete
	//Modify
	//$2 =scope
	//valid values for $2
	//List
	//Rules
	//context
	//$3 is the ID of the list or context or macro
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_CheckActionOK")

$0:=True:C214
Case of 
End case 
ERR_MethodTrackerReturn("SM_CheckActionOK"; $_t_oldMethodName)
