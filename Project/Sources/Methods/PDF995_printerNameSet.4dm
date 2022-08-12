//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_printerNameSet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 18:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_printerNameStr; $_t_oldMethodName; $_t_PrinterName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_printerNameSet")

If (Count parameters:C259>0)
	$_t_PrinterName:=$1
Else 
	$_t_PrinterName:="PDF995"
End if 

<>PDF995_printerNameStr:=$_t_PrinterName

ERR_MethodTrackerReturn("PDF995_printerNameSet"; $_t_oldMethodName)
