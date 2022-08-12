//%attributes = {}
If (False:C215)
	//Project Method Name:      Uppers3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2010 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharIndex; $_l_Length)
	C_TEXT:C284($_t_beforeCurrentCharString; $_t_Current3CharString; $_t_CurrentChar; $_t_CurrentPlus1; $_t_CurrentPlus2; $_t_CurrentPlus3; $_t_CurrentPlus4; $_t_CurrentPlus5; $_t_CurrentPlus6; $_t_oldMethodName; $_t_Result)
	C_TEXT:C284($0; $1; MOD_FieldValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Uppers3")
If (Count parameters:C259>=1)
	$_t_Result:=""
	If ($1#"")
		MOD_FieldValue:=""
		RemoveLeadTr($1; ->MOD_FieldValue)
		$_t_Result:=Str_StripDel(MOD_FieldValue)
		If (Substring:C12($_t_Result; 1; 1)="!")
			$_t_Result:=Substring:C12($_t_Result; 2; 32000)
		Else 
			$_t_Result:=Uppercase:C13(Substring:C12($_t_Result; 1; 1))+Substring:C12($_t_Result; 2; 32000)
			$_l_Length:=Length:C16($_t_Result)
			$_l_CharIndex:=1
			While ($_l_CharIndex<$_l_Length)
				//IDLE  ` 7/04/03 pb
				$_t_CurrentChar:=Substring:C12($_t_Result; $_l_CharIndex; 1)
				If (($_t_CurrentChar=" ") | ($_t_CurrentChar=",") | ($_t_CurrentChar="/") | ($_t_CurrentChar=".") | ($_t_CurrentChar=";") | ($_t_CurrentChar=":") | ($_t_CurrentChar="*") | ($_t_CurrentChar="(") | ($_t_CurrentChar=")") | (Character code:C91($_t_CurrentChar)=34) | ($_t_CurrentChar="-") | ($_t_CurrentChar="'") | ($_t_CurrentChar="’"))
					$_l_CharIndex:=$_l_CharIndex+1
					$_t_CurrentChar:=Substring:C12($_t_Result; $_l_CharIndex; 1)
					If (Count parameters:C259=1)
						If ((Character code:C91($_t_CurrentChar)#Character code:C91(Uppercase:C13($_t_CurrentChar))) | ($_t_CurrentChar="'") | ($_t_CurrentChar="’"))
							$_t_Current3CharString:=Substring:C12($_t_Result; $_l_CharIndex-1; 3)
							$_t_beforeCurrentCharString:=Substring:C12($_t_Result; $_l_CharIndex-3; 2)
							$_t_CurrentPlus1:=Substring:C12($_t_Result; $_l_CharIndex; 2)
							$_t_CurrentPlus2:=Substring:C12($_t_Result; $_l_CharIndex; 3)
							$_t_CurrentPlus3:=Substring:C12($_t_Result; $_l_CharIndex; 4)
							$_t_CurrentPlus4:=Substring:C12($_t_Result; $_l_CharIndex; 5)
							$_t_CurrentPlus5:=Substring:C12($_t_Result; $_l_CharIndex; 6)
							$_t_CurrentPlus6:=Substring:C12($_t_Result; $_l_CharIndex; 7)
							If (($_t_CurrentPlus2#"of ") & ($_t_CurrentPlus2#"at ") & ($_t_CurrentPlus2#"on ") & ($_t_CurrentPlus2#"on-") & ($_t_CurrentPlus2#"in-") & ($_t_CurrentPlus2#"or ") & ($_t_CurrentPlus2#"to ") & ($_t_CurrentPlus2#"in ") & ($_t_CurrentPlus3#"the ") & ($_t_CurrentPlus3#"the-") & ($_t_CurrentPlus3#"and ") & ($_t_CurrentPlus4#"with ") & ($_t_CurrentPlus5#"under-") & ($_t_CurrentPlus5#"under "))
								If (($_t_CurrentPlus1#"d’") & ($_t_CurrentPlus1#"d'") & ($_t_CurrentPlus2#"de ") & ($_t_CurrentPlus2#"la ") & ($_t_CurrentChar#"le ") & ($_t_CurrentPlus3#"rue "))
									If (($_t_Current3CharString#"'s ") & ($_t_Current3CharString#"’s ") & ($_t_Current3CharString#"'s") & ($_t_Current3CharString#"’s"))
										$_t_Result:=Substring:C12($_t_Result; 1; $_l_CharIndex-1)+Uppercase:C13($_t_CurrentChar)+Substring:C12($_t_Result; $_l_CharIndex+1; 32000)
									Else 
										//  $_l_CharIndex:=$_l_CharIndex+1
									End if 
								End if 
							End if 
							If (Num:C11($_t_beforeCurrentCharString)#0)
								$_t_Result:=Substring:C12($_t_Result; 1; $_l_CharIndex-3)+Uppercase:C13(Substring:C12($_t_Result; $_l_CharIndex-2; 1))+Substring:C12($_t_Result; $_l_CharIndex-1; 32000)
							End if 
							$_l_CharIndex:=$_l_CharIndex+1
						End if 
					Else 
						$_t_Result:=Substring:C12($_t_Result; 1; $_l_CharIndex-1)+Uppercase:C13($_t_CurrentChar)+Substring:C12($_t_Result; $_l_CharIndex+1; 32000)
						$_l_CharIndex:=$_l_CharIndex+1
					End if 
				Else 
					$_l_CharIndex:=$_l_CharIndex+1
				End if 
			End while 
		End if 
		$0:=$_t_Result
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Uppers3"; $_t_oldMethodName)
