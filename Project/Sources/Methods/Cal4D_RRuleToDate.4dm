//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_RRuleToDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $0; $2)
	C_LONGINT:C283($_l_Year)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_RRule; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_RRuleToDate")

$_t_RRule:=$1
If (Count parameters:C259=2)
	$_d_Date:=$2
Else 
	$_d_Date:=Current date:C33(*)
End if 

$_l_Year:=Year of:C25($_d_Date)



$0:=$_d_Date
ERR_MethodTrackerReturn("Cal4D_RRuleToDate"; $_t_oldMethodName)