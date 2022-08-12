//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_TelStrip
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
	C_LONGINT:C283($_l_CharacterCode; $_l_Index; $_l_StringLength)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_TelStrip")
//Str_TelStrip
$0:=""
$_l_Index:=1
If (Count parameters:C259>=1)
	$_l_StringLength:=Length:C16($1)
	While ($_l_Index<=$_l_StringLength)
		IDLE:C311  // 7/04/03 pb
		$_l_CharacterCode:=Character code:C91(Substring:C12($1; $_l_Index; 1))
		If ((($_l_CharacterCode>47) & ($_l_CharacterCode<58)) | (($_l_CharacterCode>39) & ($_l_CharacterCode<46)) | ($_l_CharacterCode=35) | ($_l_CharacterCode=87) | ($_l_CharacterCode=47) | ($_l_CharacterCode=32))
			$0:=$0+Substring:C12($1; $_l_Index; 1)
		End if 
		$_l_Index:=$_l_Index+1
	End while 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str_TelStrip"; $_t_oldMethodName)