//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_DocName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:17
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

$_t_oldMethodName:=ERR_MethodTracker("Gen_DocName")

$0:=$1
If (Is Windows:C1573)
	$_l_CharPosition:=Position:C15("."; $0)
	If ($_l_CharPosition<1)
		$0:=Substring:C12($0; 1; 8)+".TXT"
	Else 
		$0:=Substring:C12($0; 1; 12)
	End if 
End if 
ERR_MethodTrackerReturn("Gen_DocName"; $_t_oldMethodName)