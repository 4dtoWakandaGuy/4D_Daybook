//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_DateTimeStamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 16:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date)
	C_TEXT:C284($_t_oldMethodName; $_t_TimeString; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_DateTimeStamp")

$_t_TimeString:=Time string:C180(Current time:C178)
$_d_Date:=Current date:C33


If (Is Windows:C1573)
	$0:=String:C10(Year of:C25($_d_Date))+"-"+String:C10(Month of:C24($_d_Date); "00")+"-"+String:C10(Day of:C23($_d_Date); "00")+"-"+Replace string:C233($_t_TimeString; ":"; "-")
Else 
	$0:=Replace string:C233($_t_TimeString; ":"; "-")
End if 
ERR_MethodTrackerReturn("UTI_DateTimeStamp"; $_t_oldMethodName)
