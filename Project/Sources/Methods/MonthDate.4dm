//%attributes = {}
If (False:C215)
	//Project Method Name:      MonthDate
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
	C_DATE:C307($0; $1)
	C_LONGINT:C283($_l_Dayof; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MonthDate")
$_l_Dayof:=Day of:C23($1)
$0:=$1+Int:C8(31*$2*$3)
$0:=Date_FromNums($_l_Dayof; Month of:C24($0); Year of:C25($0))
If ($0>($1+Int:C8(31*$2*$3)))
	$0:=$0-Day of:C23($0)
End if 
ERR_MethodTrackerReturn("MonthDate"; $_t_oldMethodName)