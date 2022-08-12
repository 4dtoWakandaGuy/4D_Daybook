//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_defaultPrinterGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_CurrentPrinter; $_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_defaultPrinterGet")

$_t_CurrentPrinter:=Get current printer:C788

$0:=$_t_CurrentPrinter

ERR_MethodTrackerReturn("PDF995_defaultPrinterGet"; $_t_oldMethodName)
