//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Period Calc
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
	C_DATE:C307($1)
	C_TEXT:C284($_t_Month; $_t_oldMethodName; $_t_Year; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period Calc")
//Period Calc
//NB: this is the old method - is not v useful
$_t_Year:=Substring:C12(String:C10(Year of:C25($1)); 3; 2)
$_t_Month:=String:C10(Month of:C24($1))
If (Length:C16($_t_Month)=1)
	$_t_Month:="0"+$_t_Month
End if 
$0:=$_t_Year+"/"+$_t_Month
ERR_MethodTrackerReturn("Period Calc"; $_t_oldMethodName)
