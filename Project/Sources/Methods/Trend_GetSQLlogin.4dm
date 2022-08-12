//%attributes = {}

If (False:C215)
	//Database Method Name:      Trend_GetSQLlogin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_Ptr_SQL_PW; $_ptr_SQLDSN; $_Ptr_SQLUser; $2; $3; $4)
	C_TEXT:C284($_t_SQLSOURCENAME; $1)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Trend_GetSQLlogin")

If (Count parameters:C259>=4)
	$_t_SQLSOURCENAME:=$1
	$_ptr_SQLDSN:=$2
	$_Ptr_SQLUser:=$3
	$_Ptr_SQL_PW:=$4
End if 
Case of 
	: ($_t_SQLSOURCENAME="SAGE")
		// SQL LOGIN("sage2";"trendops";"machine")
		$_ptr_SQLDSN->:="sage2"
		$_Ptr_SQLUser->:="trendops"
		$_Ptr_SQL_PW->:="machine"
End case 
ERR_MethodTrackerReturn("Trend_GetSQLlogin"; $_t_oldMethodName)