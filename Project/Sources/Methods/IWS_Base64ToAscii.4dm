//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_Base64ToAscii
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
	C_LONGINT:C283($_l_Base64; $_l_CharacterCode; $_l_Divider; $_l_Index; $_l_Index2; $_l_InputLength; $_l_Quotient)
	C_TEXT:C284($_t_Input; $_t_oldMethodName; $_t_Output; $_t_Result; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_Base64ToAscii")
//convert a base64 encoded string into an ascii string
//Serge Glickmann, AGF.SI-DT/NTech (glickma@agf.fr)
//based on RFC 1521 (http://www.freesoft.org/Connected/RFC/1521/7.html)


$_t_Input:=Replace string:C233($1; "="; "")  //the "=" char is a padding char
$_t_Output:=""
$_t_Result:=""
$_l_InputLength:=Length:C16($_t_Input)

For ($_l_Index; 1; $_l_InputLength)  //convert all chars from the string into ascii values
	$_l_CharacterCode:=Character code:C91($_t_Input[[$_l_Index]])
	Case of 
		: ($_l_CharacterCode=43)  //the ascii code of the base64 char
			$_l_Base64:=62  //the base64 corresponding code
		: ($_l_CharacterCode=47)
			$_l_Base64:=63
		: ($_l_CharacterCode<58)
			$_l_Base64:=$_l_CharacterCode+4
		: ($_l_CharacterCode<91)
			$_l_Base64:=$_l_CharacterCode-65
		: ($_l_CharacterCode<123)
			$_l_Base64:=$_l_CharacterCode-71
	End case 
	$_l_Divider:=32
	For ($_l_Index2; 1; 6)  //convert the base64 code into binary
		$_l_Quotient:=$_l_Base64\$_l_Divider
		$_l_Base64:=$_l_Base64-($_l_Quotient*$_l_Divider)
		$_t_Output:=$_t_Output+String:C10($_l_Quotient)
		$_l_Divider:=$_l_Divider\2
	End for 
End for 

$_t_Output:=Substring:C12($_t_Output; 1; (($_l_InputLength*6)\8)*8)  //you get a string of 8 bits chars
For ($_l_Index; 1; Length:C16($_t_Output); 8)  //last "0" are padding bits
	$_l_CharacterCode:=(Num:C11($_t_Output[[$_l_Index]])*128)+(Num:C11($_t_Output[[$_l_Index+1]])*64)  //convert 8 bits into ascii chars
	$_l_CharacterCode:=$_l_CharacterCode+(Num:C11($_t_Output[[$_l_Index+2]])*32)+(Num:C11($_t_Output[[$_l_Index+3]])*16)
	$_l_CharacterCode:=$_l_CharacterCode+(Num:C11($_t_Output[[$_l_Index+4]])*8)+(Num:C11($_t_Output[[$_l_Index+5]])*4)
	$_l_CharacterCode:=$_l_CharacterCode+(Num:C11($_t_Output[[$_l_Index+6]])*2)+Num:C11($_t_Output[[$_l_Index+7]])
	$_t_Result:=$_t_Result+Char:C90($_l_CharacterCode)
End for 
$0:=$_t_Result

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_Base64ToAscii"; $_t_oldMethodName)