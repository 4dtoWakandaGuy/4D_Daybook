//%attributes = {}
If (False:C215)
	//Project Method Name:      FirstWord
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
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FirstWord")
//Firstword
$_l_CharPosition:=Position:C15(" "; $1)
If ($_l_CharPosition=0)
	$0:=$1
Else 
	$0:=Substring:C12($1; 1; $_l_CharPosition-1)
End if 
ERR_MethodTrackerReturn("FirstWord"; $_t_oldMethodName)