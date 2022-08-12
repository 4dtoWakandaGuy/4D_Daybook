//%attributes = {}
If (False:C215)
	//Project Method Name:      Week_No
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
	C_DATE:C307(<>TimeYear; $1)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Week_No")
//Week_No
If (Count parameters:C259>=1)
	$0:=$1-<>TimeYear
	$0:=Int:C8($0/7)+1
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("Week_No"; $_t_oldMethodName)