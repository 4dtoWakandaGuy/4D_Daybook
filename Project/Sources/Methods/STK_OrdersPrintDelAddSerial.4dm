//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_OrdersPrintDelAddSerial
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:30`Method: STK_OrdersPrintDelAddSerial
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_OrdersPrintDelAddSerial")
$0:=False:C215
ERR_MethodTrackerReturn("STK_OrdersPrintDelAddSerial"; $_t_oldMethodName)
