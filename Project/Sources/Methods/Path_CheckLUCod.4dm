//%attributes = {}
If (False:C215)
	//Project Method Name:      Path_CheckLUCod
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
	C_LONGINT:C283($_l_Character; $_l_CharIndex; $_l_Length; $_l_Random)
	C_TEXT:C284($_t_Character; $_t_LicenceNumber; $_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Path_CheckLUCod")
//Path_CheckLUCod - codify the Update Contents

$_l_Random:=Random:C100%(9-1+1)+1

$_t_LicenceNumber:=""
$_l_CharIndex:=1
While ($_l_CharIndex<=Length:C16($1))
	IDLE:C311  // 7/04/03 pb
	$_l_Character:=Character code:C91(Substring:C12($1; $_l_CharIndex; 1))
	If (($_l_Character<48) | ($_l_Character>57))
		If (($_l_Character>96) & ($_l_Character<123))
			$_t_LicenceNumber:=$_t_LicenceNumber+String:C10($_l_Character-32)
		End if 
		If (($_l_Character>64) & ($_l_Character<91))
			$_t_LicenceNumber:=$_t_LicenceNumber+String:C10($_l_Character-50)
		End if 
		If (($_l_Character=47) | ($_l_Character=92))
			$_t_LicenceNumber:=$_t_LicenceNumber+String:C10($_l_Character)
		End if 
		If ($_l_Character=45)
			$_t_LicenceNumber:=$_t_LicenceNumber+"00"
		End if 
	Else 
		$_t_LicenceNumber:=$_t_LicenceNumber+Substring:C12($1; $_l_CharIndex; 1)
	End if 
	$_l_CharIndex:=$_l_CharIndex+1
End while 

$0:=""
$_t_LicenceNumber:="7"+$_t_LicenceNumber+"7"
$_l_Length:=Length:C16($_t_LicenceNumber)
For ($_l_CharIndex; 1; $_l_Length)
	$_t_Character:=Substring:C12($_t_LicenceNumber; $_l_CharIndex; 1)
	$_l_Character:=Num:C11($_t_Character)+$_l_Random
	If ($_l_Character>9)
		$_l_Character:=$_l_Character-10
	End if 
	$0:=$0+String:C10($_l_Character)
End for 
$0:=$0+String:C10($_l_Random)

$_l_CharIndex:=1
While ($_l_CharIndex<=Length:C16($0))
	IDLE:C311  // 7/04/03 pb
	$_t_Character:=Substring:C12($0; $_l_CharIndex; 2)
	If ((Length:C16($_t_Character))>1)
		$_l_Character:=Num:C11($_t_Character)
		If (($_l_Character>14) & ($_l_Character<41) & ($_l_Character#29) & ($_l_Character#23))
			$0:=Substring:C12($0; 1; $_l_CharIndex-1)+Char:C90($_l_Character+50)+Substring:C12($0; $_l_CharIndex+2; 32000)
		End if 
		If (($_l_Character>64) & ($_l_Character<91) & ($_l_Character#79) & ($_l_Character#76))
			$0:=Substring:C12($0; 1; $_l_CharIndex-1)+Char:C90($_l_Character+32)+Substring:C12($0; $_l_CharIndex+2; 32000)
		End if 
		If (($_l_Character=47) | ($_l_Character=92))
			$0:=Substring:C12($0; 1; $_l_CharIndex-1)+Char:C90($_l_Character)+Substring:C12($0; $_l_CharIndex+2; 32000)
		End if 
		If ($_l_Character=0)
			$0:=Substring:C12($0; 1; $_l_CharIndex-1)+Char:C90(45)+Substring:C12($0; $_l_CharIndex+2; 32000)
		End if 
	End if 
	$_l_CharIndex:=$_l_CharIndex+1
End while 
ERR_MethodTrackerReturn("Path_CheckLUCod"; $_t_oldMethodName)
