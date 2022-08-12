//%attributes = {}
If (False:C215)
	//Project Method Name:      IsALeapYear
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
	C_BOOLEAN:C305($0)
	C_DATE:C307($_d_Date; $_d_FirstDayofYear; $_d_LastDateofYear; $1)
	C_LONGINT:C283($_l_NumberofDays; $_l_Year)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IsALeapYear")
// Function: IsALeapYear
// Returns TRUE if the year of the date passed in $1 is a leap yr
// otherwise FALSE
// 20/09/02 pb


$_d_Date:=$1
$_l_Year:=Year of:C25($_d_Date)
$_d_FirstDayofYear:=Date:C102("!01/01/"+String:C10($_l_Year)+"!")
$_d_LastDateofYear:=Date:C102("!01/01/"+String:C10($_l_Year+1)+"!")
$_l_NumberofDays:=$_d_LastDateofYear-$_d_FirstDayofYear
If ($_l_NumberofDays=366)
	$0:=True:C214
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("IsALeapYear"; $_t_oldMethodName)