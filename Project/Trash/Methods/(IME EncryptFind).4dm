//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_EncryptFind
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
	C_LONGINT:C283($_l_Count; $_l_Index; $_l_StringPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_EncryptFind")
//IME_EncryptFind

$0:=$1
$_l_StringPosition:=Position:C15("&ENC&"; $0)
$_l_Count:=0
While (($_l_StringPosition>0) & ($_l_Count<1000))
	IDLE:C311  // 7/04/03 pb
	$_l_Index:=$_l_StringPosition+5
	$_t_Text:=Substring:C12($0; $_l_Index)
	$_l_StringPosition:=Position:C15("&END&"; $_t_Text)
	If ($_l_StringPosition>0)
		$0:=Substring:C12($0; 1; $_l_Index-6)+IME_Encrypt(Substring:C12($_t_Text; 1; $_l_StringPosition-1))+Substring:C12($0; $_l_Index+$_l_StringPosition+4; 32000)
	End if 
	$_l_StringPosition:=Position:C15("&ENC&"; $0)
	$_l_Count:=$_l_Count+1
End while 
ERR_MethodTrackerReturn("IME_EncryptFind"; $_t_oldMethodName)