//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Date YYMMDD
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
	C_TEXT:C284($_t_oldMethodName; $_t_ReturnYYMMDD; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Date YYMMDD")

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
$_t_ReturnYYMMDD:=Substring:C12(String:C10($_l_Year); 3; 2)
If ($_t_ReturnYYMMDD="00")
	$_t_ReturnYYMMDD:=String:C10($_l_Year; "####")
End if 
$0:=$_t_ReturnYYMMDD+$0
ERR_MethodTrackerReturn("Date YYMMDD"; $_t_oldMethodName)