//%attributes = {}
If (False:C215)
	//Project Method Name:      StockAss_SNoZ
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
	C_LONGINT:C283(vSNo)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_SNoZ")
vSNo:=0
//_O_OBJECT SET COLOR(vSNo;-62219)
UTIL_setObjectByColour(0; "vSNo"; -62219)

OBJECT SET FORMAT:C236(vSNo; "Choose 'Trial Assembly' to calculate")
ERR_MethodTrackerReturn("StockAss_SNoZ"; $_t_oldMethodName)
