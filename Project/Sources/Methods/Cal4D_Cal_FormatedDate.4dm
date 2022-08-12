//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_FormatedDate
	//------------------ Method Notes ------------------
	//--------------------------------------------------------------------------------
	//method_wide_constants_declarations
	//--------------------------------------------------------------------------------
	//local_variable_declarations
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 17:25`Method: Cal4D_Cal_FormatedDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $0)
	C_LONGINT:C283($_l_Dayof; $_l_Month; $_l_Year; $1; $2; $3)
	C_TEXT:C284($_t_DateBase; $_t_FormatedDate; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_FormatedDate")


$_l_Year:=$1
$_l_Month:=$2
$_l_Dayof:=$3
$_t_DateBase:=String:C10(!1776-07-04!; Internal date short special:K1:4)
$_t_FormatedDate:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($_t_DateBase; "07"; "M"); "04"; "D"); "1776"; "Y"); "/"; "")

//========================    Method Actions    ==================================

Case of 
	: ($_t_FormatedDate="DMY")
		$_d_Date:=Date:C102(String:C10($_l_Dayof)+"/"+String:C10($_l_Month)+"/"+String:C10($_l_Year))
		
	: ($_t_FormatedDate="MDY")
		$_d_Date:=Date:C102(String:C10($_l_Month)+"/"+String:C10($_l_Dayof)+"/"+String:C10($_l_Year))
		
	: ($_t_FormatedDate="YMD")
		$_d_Date:=Date:C102(String:C10($_l_Year)+"/"+String:C10($_l_Month)+"/"+String:C10($_l_Dayof))
		
	Else 
		ALERT:C41("Unrecognized date format")
		
End case 
ERR_MethodTrackerReturn("Cal4D_Cal_FormatedDate"; $_t_oldMethodName)