//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_defaultPrinterSet
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
	C_BOOLEAN:C305($_bo_OK; $_bo_SetPrinter; $_bo_Us4DCommand; $0; $2)
	C_LONGINT:C283($_l_Error)
	C_TEXT:C284($_t_NewPrinter; $_t_oldMethodName; $_t_PDF995PrinterName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_defaultPrinterSet")

If (Count parameters:C259>0)
	$_t_PDF995PrinterName:=$1
Else 
	$_t_PDF995PrinterName:=PDF995_printerNameGet
End if 
//
If (Count parameters:C259>1)
	$_bo_Us4DCommand:=$2
Else 
	$_bo_Us4DCommand:=False:C215
End if 

$_bo_OK:=False:C215
If ((Is Windows:C1573) & ($_t_PDF995PrinterName#""))
	
	$_bo_SetPrinter:=(PDF995_isPrinterInstalled($_t_PDF995PrinterName))
	
	If ($_bo_SetPrinter=False:C215)
		$_t_PDF995PrinterName:=PDF995_printerFullNameGet($_t_PDF995PrinterName)  //try full name instead
		$_bo_SetPrinter:=(PDF995_isPrinterInstalled($_t_PDF995PrinterName))
	End if 
	
	If ($_bo_SetPrinter)
		If ($_bo_Us4DCommand) | (True:C214)
			SET CURRENT PRINTER:C787($_t_PDF995PrinterName)
			$_bo_OK:=OK=1
		Else 
			
			$_t_NewPrinter:=$_t_PDF995PrinterName
			$_l_Error:=sys_SetDefPrinter($_t_NewPrinter)
			If ($_l_Error>0)  // No error
				$_bo_OK:=True:C214  // continue with your code
			Else 
				PDF995_errorSet(Current method name:C684+"::The printer could not be switched.")
			End if 
		End if 
	Else 
		PDF995_errorSet(Current method name:C684+"::The printer could not be found.")
	End if 
End if 

$0:=$_bo_OK

ERR_MethodTrackerReturn("PDF995_defaultPrinterSet"; $_t_oldMethodName)
