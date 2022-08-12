//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Date
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
	C_DATE:C307(<>DB_d_CurrentDate; $0; $1)
	C_LONGINT:C283($_l_Dayof; $_l_MonthOf; $_l_Yearof)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Date")
If (($1>!00-00-00!) & ($1<!1920-01-01!))
	$_l_Dayof:=Day of:C23($1)
	$_l_MonthOf:=Month of:C24($1)
	$_l_Yearof:=Year of:C25($1)
	If (($_l_Yearof=1901) & ($_l_MonthOf=1))
		$_l_Yearof:=Year of:C25(<>DB_d_CurrentDate)
		$_l_MonthOf:=Month of:C24(<>DB_d_CurrentDate)
	End if 
	$0:=Date_FromNums($_l_Dayof; $_l_MonthOf; $_l_Yearof)
Else 
	$0:=$1
End if 
ERR_MethodTrackerReturn("Check_Date"; $_t_oldMethodName)