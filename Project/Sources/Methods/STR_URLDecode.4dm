//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_URLDecode
	//------------------ Method Notes ------------------
	// (PM) STR_URLDecode
	// Returns a URL decoded string
	// $1 = String to decode
	// $0 = Decoded string
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IndexPosition; $_l_Value)
	C_TEXT:C284($_t_HexValues; $_t_Input; $_t_oldMethodName; $_t_Output; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_URLDecode")



$_t_Input:=$1
$_t_HexValues:="123456789ABCDEF"

For ($_l_IndexPosition; 1; Length:C16($_t_Input))
	
	Case of 
		: ($_t_Input[[$_l_IndexPosition]]="+")
			$_t_Output:=$_t_Output+" "
		: ($_t_Input[[$_l_IndexPosition]]="%")
			$_l_Value:=Position:C15(Substring:C12($_t_Input; $_l_IndexPosition+1; 1); $_t_HexValues)*16
			$_l_Value:=$_l_Value+Position:C15(Substring:C12($_t_Input; $_l_IndexPosition+2; 1); $_t_HexValues)
			$_t_Output:=$_t_Output+Char:C90($_l_Value)
			$_l_IndexPosition:=$_l_IndexPosition+2
		Else 
			$_t_Output:=$_t_Output+$_t_Input[[$_l_IndexPosition]]
	End case 
	
End for 

$_t_Output:=_O_ISO to Mac:C520($_t_Output)

$0:=$_t_Output
ERR_MethodTrackerReturn("STR_URLDecode"; $_t_oldMethodName)
