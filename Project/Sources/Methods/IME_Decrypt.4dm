//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_Decrypt
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
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Decrypt")
//IME_Decrypt

$_l_CharPosition:=Position:C15("?"; $1)

If ($_l_CharPosition>0)
	$0:=IME_Decrypt2(Substring:C12($1; 1; $_l_CharPosition-1))+"?"+IME_Decrypt2(Substring:C12($1; $_l_CharPosition+1; 32000))
Else 
	$0:=IME_Decrypt2($1)
End if 
ERR_MethodTrackerReturn("IME_Decrypt"; $_t_oldMethodName)