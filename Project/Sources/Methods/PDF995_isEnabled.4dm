//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_isEnabled
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
	C_BOOLEAN:C305($_bo_PDF995isEnabled; $0)
	C_TEXT:C284($_t_oldMethodName; $_t_PDF995PrinterName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_isEnabled")


$_t_PDF995PrinterName:=PDF995_printerNameGet

$_bo_PDF995isEnabled:=False:C215

Case of 
	: (Is macOS:C1572)
		//Log it is not windows
	: ($_t_PDF995PrinterName="")
		//printer name for PDF995 is not set
	: (PDF995_isPrinterInstalled($_t_PDF995PrinterName)=False:C215)
		//printer is not installed
	: (PDF995_iNIFilePathGet="")
		//config file ini file path not set
	: (PDF995_targetPathGet="")
		//target file path not set
	Else   //all is ok so PDF995 is ready to be used
		$_bo_PDF995isEnabled:=True:C214
End case 

$0:=$_bo_PDF995isEnabled

ERR_MethodTrackerReturn("PDF995_isEnabled"; $_t_oldMethodName)
