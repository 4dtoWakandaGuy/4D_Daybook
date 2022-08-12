//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_StripComm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/07/2012 15:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharPosition)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_IncomingText; $_t_ModifiedText; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_StripComm")
If (Count parameters:C259>=2)
	$_t_IncomingText:=$1
	If (Count parameters:C259>=2)
		$_l_CharPosition:=Position:C15("`"; $_t_IncomingText)
		If ($_l_CharPosition>0)
			$_t_ModifiedText:=Substring:C12($_t_IncomingText; 1; $_l_CharPosition-1)
		Else 
			$_t_ModifiedText:=$_t_IncomingText
		End if 
	Else 
		$_t_ModifiedText:=$_t_IncomingText
	End if 
	$_t_IncomingText:=$_t_ModifiedText
	If (Count parameters:C259>=2)
		$_l_CharPosition:=Position:C15("//"; $_t_IncomingText)
		If ($_l_CharPosition>0)
			$_t_ModifiedText:=Substring:C12($_t_IncomingText; 1; $_l_CharPosition-1)
		Else 
			$_t_ModifiedText:=$_t_IncomingText
		End if 
	Else 
		
	End if 
	$2->:=$_t_ModifiedText
End if 
ERR_MethodTrackerReturn("Str_StripComm"; $_t_oldMethodName)
