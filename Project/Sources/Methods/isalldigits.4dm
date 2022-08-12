//%attributes = {}
If (False:C215)
	//Project Method Name:      isalldigits
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
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("isalldigits")
// Isalldigits
// function returns True if the passed text is all digits,
// otherwise False
// 9/1/03 pb
// parameters: $1 = the text to check

$_t_Text:=$1
$0:=True:C214
For ($_l_Index; 1; Length:C16($_t_Text))
	If (Character code:C91($_t_Text[[$_l_Index]])<48) | (Character code:C91($_t_Text[[$_l_Index]])>58)
		$0:=False:C215
		$_l_Index:=Length:C16($_t_Text)
	End if 
End for 
ERR_MethodTrackerReturn("isalldigits"; $_t_oldMethodName)