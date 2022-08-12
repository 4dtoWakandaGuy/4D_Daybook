//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_StripNonAN
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
	C_LONGINT:C283($_l_CharacterCode; $_l_CharPosition; $_l_inputLength)
	C_TEXT:C284($_t_InputText; $_t_oldMethodName; $_t_OutputText; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_StripNonAN")
//Str_StripNonAN
If (Count parameters:C259>=1)
	$_t_InputText:=$1
	$_t_OutputText:=$1
	
	
	$_l_inputLength:=Length:C16($_t_InputText)
	$_l_CharPosition:=1
	While ($_l_CharPosition<=$_l_inputLength)
		IDLE:C311  // 7/04/03 pb
		$_l_CharacterCode:=Character code:C91(Substring:C12($_t_InputText; $_l_CharPosition; 1))
		If (Not:C34((($_l_CharacterCode>47) & ($_l_CharacterCode<58)) | (($_l_CharacterCode>64) & ($_l_CharacterCode<91)) | (($_l_CharacterCode>96) & ($_l_CharacterCode<123))))
			$_t_OutputText:=Substring:C12($_t_OutputText; 1; $_l_CharPosition-1)+"*"+Substring:C12($_t_OutputText; $_l_CharPosition+1)
		End if 
		$_l_CharPosition:=$_l_CharPosition+1
	End while 
	$0:=Replace string:C233($_t_OutputText; "*"; "")
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str_StripNonAN"; $_t_oldMethodName)