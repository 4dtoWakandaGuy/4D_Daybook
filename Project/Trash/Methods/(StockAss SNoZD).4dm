//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss_SNoZD
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

$_t_oldMethodName:=ERR_MethodTracker("StockAss_SNoZD")
vSNo:=0
//_O_OBJECT SET COLOR(vSNo;-62219)
UTIL_setObjectByColour(0; "vSNo"; -62219)
//OBJECT SET RGB COLORS(vSNo;UTIL_4DColorToRGB (0);UTIL_4DColorToRGB (241))

OBJECT SET FORMAT:C236(vSNo; "Choose 'Trial Disassembly' to calculate")
ERR_MethodTrackerReturn("StockAss_SNoZD"; $_t_oldMethodName)
