//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetVersionNum
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
	C_LONGINT:C283($_l_CharIndex)
	C_TEXT:C284($_t_oldMethodName; $_t_OSVersion; $_t_OSVersionNum; $_t_OSVersionNumSTR; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetVersionNum")

If (Count parameters:C259>=1)
	$_t_OSVersion:=$1
	For ($_l_CharIndex; 1; Length:C16($_t_OSVersion))
		If ((Character code:C91($_t_OSVersion[[$_l_CharIndex]])>=48) & (Character code:C91($_t_OSVersion[[$_l_CharIndex]])<=57))
			$_t_OSVersionNumSTR:=$_t_OSVersionNum+$_t_OSVersion[[$_l_CharIndex]]
			If (String:C10(Num:C11($_t_OSVersionNumSTR))=$_t_OSVersionNumSTR)
				$_t_OSVersionNum:=$_t_OSVersionNumSTR
			Else 
				$_l_CharIndex:=Length:C16($_t_OSVersion)+1
			End if 
		End if 
		If ($_l_CharIndex<Length:C16($_t_OSVersion))
			If (Character code:C91($_t_OSVersion[[$_l_CharIndex]])=46)
				If ($_t_OSVersionNum#"")
					$_t_OSVersionNum:=$_t_OSVersionNum+$_t_OSVersion[[$_l_CharIndex]]
				End if 
			End if 
		End if 
		
	End for 
	If ($_t_OSVersionNum[[Length:C16($_t_OSVersionNum)]]=".")
		$_t_OSVersionNum:=Substring:C12($_t_OSVersionNum; 1; Length:C16($_t_OSVersionNum)-1)
	End if 
End if 
$0:=$_t_OSVersionNum
ERR_MethodTrackerReturn("DB_GetVersionNum"; $_t_oldMethodName)