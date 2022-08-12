//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_isPrinterInstalled
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
	//C_UNKNOWN(EP_USE_REGISTRY)
	//C_UNKNOWN(sys_EnumPrinters)
	ARRAY TEXT:C222($_at_PrinterNames; 0)
	C_BOOLEAN:C305($_bo_PrinterOK; $0)
	C_LONGINT:C283($_l_Error; $_l_PrinterRow)
	C_TEXT:C284($_t_FullPrinterName; $_t_oldMethodName; $_t_PrinterName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_isPrinterInstalled")

$_t_PrinterName:=$1

ARRAY TEXT:C222($_at_PrinterNames; 0)

$_bo_PrinterOK:=False:C215

If (Is Windows:C1573)
	
	//get the list of printers installed using 4D native commands
	//PRINTERS LIST($_at_PrinterNames;$printLocationsTxtArr;$printModelsTxtArr)
	$_l_Error:=sys_EnumPrinters($_at_PrinterNames; EP_USE_REGISTRY)
	
	$_l_PrinterRow:=Find in array:C230($_at_PrinterNames; $_t_PrinterName)
	$_bo_PrinterOK:=($_l_PrinterRow>0)
	
	$_l_PrinterRow:=1
	While ((Size of array:C274($_at_PrinterNames)>=$_l_PrinterRow) & ($_bo_PrinterOK=False:C215))
		IDLE:C311
		$_t_FullPrinterName:=$_at_PrinterNames{$_l_PrinterRow}
		$_bo_PrinterOK:=($_t_FullPrinterName=($_t_PrinterName+"@"))
		$_l_PrinterRow:=$_l_PrinterRow+1
	End while 
End if 

$0:=$_bo_PrinterOK

ERR_MethodTrackerReturn("PDF995_isPrinterInstalled"; $_t_oldMethodName)
