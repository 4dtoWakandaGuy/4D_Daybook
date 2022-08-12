//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_getReady
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 11:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ClearOutput; $_bo_ResetPrinter; $_bo_Semaphore; $1; $2; $3; PDF_bo_995PrinterResetOK; PDF_bo_995SemaphoreGainedOK)
	C_TEXT:C284($_t_CentralPDFPath; $_t_oldMethodName; PDF995_currentPrinterStr)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_getReady")

If (Count parameters:C259>0)
	$_bo_Semaphore:=$1
Else 
	$_bo_Semaphore:=True:C214
End if 
If (Count parameters:C259>1)
	$_bo_ResetPrinter:=$2
Else 
	$_bo_ResetPrinter:=True:C214
End if 
If (Count parameters:C259>2)
	$_bo_ClearOutput:=$3
Else 
	$_bo_ClearOutput:=True:C214
End if 

PDF_bo_995SemaphoreGainedOK:=False:C215
PDF_bo_995PrinterResetOK:=False:C215

If ($_bo_Semaphore)
	While (Semaphore:C143("PDF_printing"))
		IDLE:C311
		DELAY PROCESS:C323(Current process:C322; 10)
	End while 
	PDF_bo_995SemaphoreGainedOK:=True:C214
End if 

PDF995_processingFileSet(PDF995_processingFileGet)
PDF995_batchFileSet(PDF995_batchFileGet; PDF995_processingFileGet)  //Tue, Jan 31, 2006 bwalia: added

PDF995_targetPathSet

If ($_bo_ResetPrinter)
	PDF995_currentPrinterStr:=PDF995_defaultPrinterGet
	PDF_bo_995PrinterResetOK:=PDF995_defaultPrinterSet(PDF995_printerNameGet)
End if 

If ($_bo_ClearOutput)
	$_t_CentralPDFPath:=PDF995_targetPathGet
	If (Test path name:C476($_t_CentralPDFPath)=Is a document:K24:1)
		//DELETE DOCUMENT($_t_CentralPDFPath)
		PDF995_DoDocument("DELETE DOCUMENT"; $_t_CentralPDFPath)  //changed kmw 29/10/08 v631b120c (so that Error_Procs can gather more info)
		
	End if 
End if 

ERR_MethodTrackerReturn("PDF995_getReady"; $_t_oldMethodName)
