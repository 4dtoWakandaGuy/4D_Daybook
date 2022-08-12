//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_toBool
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_toBool")
If (Count parameters:C259>=1)
	$0:=(($1="True") | ($1="Y@") | ($1="1"))
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Str_toBool"; $_t_oldMethodName)