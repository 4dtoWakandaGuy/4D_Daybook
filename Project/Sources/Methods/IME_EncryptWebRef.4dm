//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_EncryptWebRef
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
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $0; $1; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_EncryptWebRef")
//IME_EncryptWebRef

//Encrypt a URL along with the Web Ref for added security

$_t_Input:=$1

If ($_t_Input="daybook@")
	$_t_Input:=Substring:C12($_t_Input; 8)
	$_t_Output:="daybook"
Else 
	$_t_Output:=""
End if 

$_l_CharPosition:=Position:C15("?"; $_t_Input)
If ($_l_CharPosition>0)
	$_t_Output:=$_t_Output+IME_Encrypt2(Substring:C12($_t_Input; 1; $_l_CharPosition-1))+"?"+IME_Encrypt2("WebRef="+vWebRef+"&"+Substring:C12($_t_Input; $_l_CharPosition+1))
Else 
	$_t_Output:=$_t_Output+IME_Encrypt2($_t_Input)+"?"+IME_Encrypt2("WebRef="+vWebRef)
End if 

$0:=$_t_Output
ERR_MethodTrackerReturn("IME_EncryptWebRef"; $_t_oldMethodName)