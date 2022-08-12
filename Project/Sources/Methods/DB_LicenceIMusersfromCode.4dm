//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LicenceIMusersfromCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 10:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountIMUsers; $_l_FirstNumber; $0)
	C_TEXT:C284($_t_LicenceNumber; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LicenceIMusersfromCode")

$0:=0
If (Count parameters:C259>=1)
	If ($1#"")
		$_t_LicenceNumber:=$1
		$_l_FirstNumber:=Num:C11($_t_LicenceNumber[[1]])
		$_l_CountIMUsers:=Num:C11($_t_LicenceNumber[[$_l_FirstNumber+2]]+$_t_LicenceNumber[[$_l_FirstNumber+3]])
		If ($_l_FirstNumber=8) | ($_l_FirstNumber=9)
			$_l_CountIMUsers:=$_l_CountIMUsers+99
		End if 
		$0:=$_l_CountIMUsers
	End if 
End if 
ERR_MethodTrackerReturn("DB_LicenceIMusersfromCode"; $_t_oldMethodName)