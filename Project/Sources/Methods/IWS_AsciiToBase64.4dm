//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_AsciiToBase64
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
	C_LONGINT:C283($_l_Base64; $_l_CharacterCode; $_l_Divider; $_l_Index; $_l_Index2; $_l_Quotient)
	C_TEXT:C284($_t_Encoded; $_t_Input; $_t_oldMethodName; $_t_Output; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_AsciiToBase64")
//convert an ascii string into a base64 string
//Serge Glickmann, AGF.SI-DT/NTech (glickma@agf.fr)
//based on RFC 1521 (http://www.freesoft.org/Connected/RFC/1521/7.html)

//$1 contains an ascii string string
//$0 contains a base64 encoded string

$_t_Output:=""
$_t_Input:=$1
//translate the ascii string into a binary string
For ($_l_Index; 1; Length:C16($_t_Input))
	$_l_CharacterCode:=Character code:C91($_t_Input[[$_l_Index]])
	$_l_Divider:=256
	For ($_l_Index2; 1; 8)
		$_l_Divider:=$_l_Divider/2
		$_l_Quotient:=$_l_CharacterCode\$_l_Divider
		$_l_CharacterCode:=$_l_CharacterCode-($_l_Quotient*$_l_Divider)
		$_t_Output:=$_t_Output+String:C10($_l_Quotient; "0")
	End for 
End for 

$_t_Encoded:=""
//translate each 6 bits packet from the previous string into
//base64 chars
For ($_l_Index; 1; Length:C16($_t_Output); 6)
	$_l_Base64:=(Num:C11($_t_Output[[$_l_Index]])*32)+(Num:C11($_t_Output[[$_l_Index+1]])*16)
	$_l_Base64:=$_l_Base64+(Num:C11($_t_Output[[$_l_Index+2]])*8)+(Num:C11($_t_Output[[$_l_Index+3]])*4)
	$_l_Base64:=$_l_Base64+(Num:C11($_t_Output[[$_l_Index+4]])*2)+(Num:C11($_t_Output[[$_l_Index+5]]))
	Case of 
		: ($_l_Base64<26)
			$_t_Encoded:=$_t_Encoded+Char:C90($_l_Base64+65)
		: ($_l_Base64<52)
			$_t_Encoded:=$_t_Encoded+Char:C90($_l_Base64+71)
		: ($_l_Base64<62)
			$_t_Encoded:=$_t_Encoded+Char:C90($_l_Base64-4)
		: ($_l_Base64=62)
			$_t_Encoded:=$_t_Encoded+"+"
		: ($_l_Base64=63)
			$_t_Encoded:=$_t_Encoded+"/"
	End case 
End for 

$0:=$_t_Encoded

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_AsciiToBase64"; $_t_oldMethodName)