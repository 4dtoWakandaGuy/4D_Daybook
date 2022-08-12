//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_FieldValue2
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
	//ARRAY TEXT(IME_at_FieldNames;0)
	//ARRAY TEXT(IME_at_Fields;0)
	C_LONGINT:C283($_l_Index; $_l_Parameters; $_l_TextLength)
	C_TEXT:C284($_t_Character; $_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_FieldValue2")
//IME_FieldValue

$_l_TextLength:=Find in array:C230(IME_at_FieldNames; $1)
If ($_l_TextLength>0)
	$_l_Parameters:=Count parameters:C259
	$0:=IME_at_Fields{$_l_TextLength}
	If ($_l_Parameters>1)
		$_l_TextLength:=Length:C16($2)
		For ($_l_Index; 1; $_l_TextLength)
			$_t_Character:=Substring:C12($2; $_l_Index; 1)
			Case of 
				: ($_t_Character="U")
					$0:=Uppercase:C13($0)
				: ($_t_Character="F")
					$0:=Uppers2($0)
				: ($_t_Character="L")
					$0:=Lowercase:C14($0)
				: ($_t_Character="S")
					$0:=RemoveLeadTr($0)
				: ($_t_Character="C")
					$0:=Str_IMAChars($0)
				: ($_t_Character="N")
					$0:=Str_NumOnly($0)
				: ($_t_Character="A")
					$0:=Str_AlphaOnly($0)
			End case 
		End for 
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("IME_FieldValue2"; $_t_oldMethodName)