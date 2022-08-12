//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Text_Fold
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_RegexMatch)
	C_LONGINT:C283($_l_FoundAt; $_l_Length; $_l_StartPosition)
	C_TEXT:C284($_t_InputString; $_t_MethodName; $_t_oldMethodName; $_t_Regex; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Text_Fold")


$_t_InputString:=$1
If (Length:C16($_t_InputString)>75)
	$_t_Regex:="(?:[^\\p{C}]{1,72})(?:$|\\p{Z})"
	
	//========================    Method Actions    ==================================
	
	$_l_StartPosition:=72
	$_bo_RegexMatch:=Match regex:C1019($_t_Regex; $_t_InputString; $_l_StartPosition; $_l_FoundAt; $_l_Length)
	
	While ($_bo_RegexMatch)
		If ($_l_FoundAt>1)
			$_t_InputString:=Insert string:C231($_t_InputString; "\r\n "; $_l_FoundAt)
		End if 
		$_l_StartPosition:=$_l_FoundAt+$_l_Length+3
		$_bo_RegexMatch:=Match regex:C1019($_t_Regex; $_t_InputString; $_l_StartPosition; $_l_FoundAt; $_l_Length)
	End while 
	
	//========================    Clean up and Exit    =================================
	
End if 
$0:=$_t_InputString
ERR_MethodTrackerReturn("Cal4D_Text_Fold"; $_t_oldMethodName)