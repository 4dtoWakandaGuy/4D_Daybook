//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LicenceUsersFromCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 11:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FirstCharNUM; $_l_Users; $0)
	C_TEXT:C284($_t_LicenceNumercSTRING; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LicenceUsersFromCode")
$_t_LicenceNumercSTRING:=$1
$0:=0
If ($_t_LicenceNumercSTRING#"")
	$_l_FirstCharNUM:=Num:C11(Substring:C12($_t_LicenceNumercSTRING; 1; 1))
	$_l_Users:=Num:C11(Substring:C12($_t_LicenceNumercSTRING; $_l_FirstCharNUM; 2))
	If ($_l_FirstCharNUM>6)
		$_l_Users:=$_l_Users+99
	End if 
	$0:=$_l_Users
End if 
ERR_MethodTrackerReturn("DB_LicenceUsersFromCode"; $_t_oldMethodName)