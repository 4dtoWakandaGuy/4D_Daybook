//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls RespCalc
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
	C_DATE:C307($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls RespCalc")
//Calls RespCalc
$0:=Substring:C12(String:C10(Year of:C25($1)); 3; 2)
If (Month of:C24($1)<10)
	$0:=$0+"0"+String:C10(Month of:C24($1))
Else 
	$0:=$0+String:C10(Month of:C24($1))
End if 
If (Day of:C23($1)<10)
	$0:=$0+"0"+String:C10(Day of:C23($1))
Else 
	$0:=$0+String:C10(Day of:C23($1))
End if 
ERR_MethodTrackerReturn("Calls RespCalc"; $_t_oldMethodName)