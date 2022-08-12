//%attributes = {}
If (False:C215)
	//Project Method Name:      Date_YYYYMMDD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Dayof; $_l_MonthOf; $_l_Year)
	C_TEXT:C284($_t_oldMethodName; $_t_ReturnYYYYMMDD; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date_YYYYMMDD")
//date_yyyymmdd
$0:=""
$_l_Dayof:=Day of:C23($1)
If ($_l_Dayof<10)
	$0:="0"+String:C10($_l_Dayof)
Else 
	$0:=String:C10($_l_Dayof)
End if 
$_l_MonthOf:=Month of:C24($1)
If ($_l_MonthOf<10)
	$0:="0"+String:C10($_l_MonthOf)+$0
Else 
	$0:=String:C10($_l_MonthOf)+$0
End if 
$_l_Year:=Year of:C25($1)
$_t_ReturnYYYYMMDD:=String:C10($_l_Year)+$0
If ($_t_ReturnYYYYMMDD="00")
	$_t_ReturnYYYYMMDD:=String:C10($_l_Year; "####")
End if 
$0:=$_t_ReturnYYYYMMDD  //+$0
ERR_MethodTrackerReturn("Date_YYYYMMDD"; $_t_oldMethodName)