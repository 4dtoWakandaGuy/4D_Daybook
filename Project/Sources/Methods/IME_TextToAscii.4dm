//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_TextToAscii
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
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_TextToAscii")
//IME_TextToAscii
//Rollo 12/23/99


If (Count parameters:C259>0)
	
	$_t_Input:=$1
	$_t_Output:=""
	
	For ($_l_Index; Length:C16($_t_Input); 1; -1)
		$_t_Output:=$_t_Output+String:C10(Character code:C91($_t_Input[[$_l_Index]]); "000")
	End for 
	
	$0:=$_t_Output
	
Else 
	
	$0:=""
	
End if 
ERR_MethodTrackerReturn("IME_TextToAscii"; $_t_oldMethodName)