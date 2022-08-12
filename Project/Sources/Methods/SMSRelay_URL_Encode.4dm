//%attributes = {}
If (False:C215)
	//Project Method Name:      SMSRelay_URL_Encode
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
	C_LONGINT:C283($_l_CharacterCode; $_l_CharacterCode2; $_l_Index; $_l_InputLength)
	C_TEXT:C284($_t_HexString; $_t_inputChar; $_t_InputString; $_t_oldMethodName; $_t_outputString; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SMSRelay_URL_Encode")
//Method: SMSRelay_URL_Encode
// 08/05/02 PB



$0:=""
If (Count parameters:C259>=1)
	$_t_InputString:=$1
	$_l_InputLength:=Length:C16($_t_InputString)
	$_t_outputString:=""
	
	$_t_HexString:="0123456789ABCDEF"
	
	For ($_l_Index; 1; $_l_InputLength)
		$_t_inputChar:=$_t_InputString[[$_l_Index]]
		Case of 
			: (Character code:C91($_t_inputChar)=13)
				$_t_outputString:=$_t_outputString+"%0A"  // replace with a line feed
			: (Character code:C91($_t_inputChar)=Character code:C91(" "))
				$_t_outputString:=$_t_outputString+"+"
			: (Character code:C91($_t_inputChar)>=Character code:C91("a")) & (Character code:C91($_t_inputChar)<=Character code:C91("z"))
				$_t_outputString:=$_t_outputString+$_t_inputChar
			: (Character code:C91($_t_inputChar)>=Character code:C91("A")) & (Character code:C91($_t_inputChar)<=Character code:C91("Z"))
				$_t_outputString:=$_t_outputString+$_t_inputChar
			: (Character code:C91($_t_inputChar)>=Character code:C91("0")) & (Character code:C91($_t_inputChar)<=Character code:C91("9"))
				$_t_outputString:=$_t_outputString+$_t_inputChar
			Else 
				$_l_CharacterCode:=Character code:C91($_t_inputChar)\16
				$_l_CharacterCode2:=Character code:C91($_t_inputChar)%16
				$_t_outputString:=$_t_outputString+"%"+$_t_HexString[[$_l_CharacterCode+1]]+$_t_HexString[[$_l_CharacterCode2+1]]
		End case 
	End for 
	$0:=$_t_outputString
End if 
ERR_MethodTrackerReturn("SMSRelay_URL_Encode"; $_t_oldMethodName)