//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_PC_AN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterCode; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_PC_AN")
$_l_Index:=1
$0:=""
While ($_l_Index<=Length:C16($1))
	IDLE:C311  // 03/04/03 pb
	$_l_CharacterCode:=Character code:C91(Substring:C12($1; $_l_Index; 1))
	If (($_l_CharacterCode>64) & ($_l_CharacterCode<91))
		$0:=$0+"A"
	Else 
		If (($_l_CharacterCode>47) & ($_l_CharacterCode<58))
			$0:=$0+"N"
		Else 
			$0:=$0+" "
		End if 
	End if 
	$_l_Index:=$_l_Index+1
End while 
ERR_MethodTrackerReturn("Check_PC_AN"; $_t_oldMethodName)