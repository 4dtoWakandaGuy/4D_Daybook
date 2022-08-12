//%attributes = {}
If (False:C215)
	//Project Method Name:      Tenthmatrix_SQL_Login
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/10/2014 16:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($0; vSyncErrorCountInt)
	C_TEXT:C284($_t_IPAddress; $_t_IPAddressStaging; $_t_oldMethodName; $_t_Password; $_t_UserName; vSQLRemoteServerStr)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Tenthmatrix_SQL_Login")

If (False:C215)
	// ----------------------------------------------------
	// User name (OS): Balinder Walia
	// Date and time: 11/10/14, 13:13:16
	// ----------------------------------------------------
	// Method: Tenthmatrix_SQL_Login
	// Description
	//
	//
	// Parameters
	// ----------------------------------------------------
End if 

$_t_IPAddressStaging:="billing.tenthmatrix.co.uk:19832"
If ($_t_IPAddressStaging#"")  //use vSQLRemoteServerStr instead
	$_t_IPAddress:=$_t_IPAddressStaging
Else 
	
	If (Is compiled mode:C492)
		$_t_IPAddress:="billing.tenthmatrix.co.uk:19832"
		
	Else 
		//$_t_IPAddress:="dev-billing.tenthmatrix.co.uk:19832"
	End if 
End if 
$_t_UserName:="Administrator"
$_t_Password:="^D8sN2a9fx65$"

If (vSQLRemoteServerStr#"")
	$_t_IPAddress:=vSQLRemoteServerStr
End if 

If ($_t_IPAddress="")
	$_t_IPAddress:=Request:C163("Enter server ip/domains: "+$_t_IPAddress; $_t_IPAddress)
End if 

If ($_t_IPAddress#"")
	SQL LOGIN:C817("IP:"+$_t_IPAddress; $_t_UserName; $_t_Password; *)
End if 

If (OK=1)
Else 
	vSyncErrorCountInt:=1  //connection error
End if 

$0:=vSyncErrorCountInt
ERR_MethodTrackerReturn("Tenthmatrix_SQL_Login"; $_t_oldMethodName)
