//%attributes = {}
If (False:C215)
	//Project Method Name:      Export_Stamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Export_Stamp")
$0:=Substring:C12(String:C10(Year of:C25(Current date:C33)); 3; 2)+("0"*(Num:C11(Month of:C24(Current date:C33)<10)))+String:C10(Month of:C24(Current date:C33))+("0"*(Num:C11(Day of:C23(Current date:C33)<10)))+String:C10(Day of:C23(Current date:C33))+Substring:C12(String:C10(Current time:C178); 1; 2)+Substring:C12(String:C10(Current time:C178); 4; 2)
ERR_MethodTrackerReturn("Export_Stamp"; $_t_oldMethodName)