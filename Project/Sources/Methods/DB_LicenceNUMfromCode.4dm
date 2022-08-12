//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LicenceNUMfromCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 10:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterCode; $_l_Index; $_l_Length)
	C_TEXT:C284($_t_LicenceCode; $_t_LicenceNumber; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LicenceNUMfromCode")
$_t_LicenceCode:=$1
$_l_Length:=Length:C16($1)
$_t_LicenceNumber:=""
For ($_l_Index; 1; $_l_Length)
	$_l_CharacterCode:=Character code:C91($_t_LicenceCode[[$_l_Index]])
	If (($_l_CharacterCode<48) | ($_l_CharacterCode>57))
		If (($_l_CharacterCode>96) & ($_l_CharacterCode<123))
			$_t_LicenceNumber:=$_t_LicenceNumber+String:C10($_l_CharacterCode-32)
		End if 
		If (($_l_CharacterCode>64) & ($_l_CharacterCode<91))
			$_t_LicenceNumber:=$_t_LicenceNumber+String:C10($_l_CharacterCode-50)
		End if 
		If (($_l_CharacterCode=47) | ($_l_CharacterCode=92))
			$_t_LicenceNumber:=$_t_LicenceNumber+String:C10($_l_CharacterCode)
		End if 
		If ($_l_CharacterCode=45)
			$_t_LicenceNumber:=$_t_LicenceNumber+"00"
		End if 
	Else 
		$_t_LicenceNumber:=$_t_LicenceNumber+Substring:C12($_t_LicenceCode; $_l_Index; 1)
	End if 
End for 
$0:=$_t_LicenceNumber
ERR_MethodTrackerReturn("DB_LicenceNUMfromCode"; $_t_oldMethodName)