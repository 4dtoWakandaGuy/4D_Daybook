//%attributes = {}
If (False:C215)
	//Project Method Name:      PrintViaPDF
	//------------------ Method Notes ------------------
	//this method saved the print settings to a document.
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_NewPrintSettings; $_blb_PrintSettings)
	C_BOOLEAN:C305($_bo_OptionKey)
	C_LONGINT:C283($_bo_IsAvailable; $_bo_IsSet; $_l_DocumentExists; $_l_OK)
	C_TEXT:C284($_t_CurrentActiveDirectory; $_t_DocumentName; $_t_NewSettings; $_t_oldMethodName; $OLDSettings)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PrintViaPDF")


$_t_CurrentActiveDirectory:=Get 4D folder:C485
$_t_DocumentName:=$_t_CurrentActiveDirectory+"PrintPDFsetup.xrt"
$_l_DocumentExists:=Test path name:C476($_t_DocumentName)
$_l_OK:=0
$_bo_OptionKey:=Gen_Option  //control key-to reset settings
If ($_l_DocumentExists=1) & (Not:C34($_bo_OptionKey))
	//the settings are saved
	$_l_OK:=1
Else 
	If (Not:C34($_bo_OptionKey)) | (Not:C34($_l_DocumentExists=1))
		CONFIRM:C162("Settings For PDF Printing are not saved, would you like to set them up now?"; "Yes"; "No")
	Else 
		CONFIRM:C162(" Would you like to redo settings for printing via PDF?"; "Yes"; "No")
	End if 
	
	If (OK=1)
		SET BLOB SIZE:C606($_blb_PrintSettings; 0)
		
		//$_bo_IsAvailable:=‘11999;42‘($_blb_PrintSettings)<--was ap print settings to blob
		$_l_isAvailable:=Print settings to BLOB:C1433($_blb_PrintSettings)
		//BLOB to text($pr$oldSettings)
		//$_bo_IsAvailable:=@XX_AP PrintRec to text ($OLDSettings)
		PRINT SETTINGS:C106
		CONFIRM:C162("Have you setup for PDF printing using your print driver?"; "No"; "Yes")
		If (OK=0)
			SET BLOB SIZE:C606($_blb_NewPrintSettings; 0)
			
			//$_bo_IsAvailable:=‘11999;42‘($_blb_NewPrintSettings)<--was ap print settings to blob
			$_l_isAvailable:=Print settings to BLOB:C1433($_blb_PrintSettings)
			//$_bo_IsAvailable:=@XX_AP PrintRec to text ($_t_NewSettings)
			//$_t_NewSettings now contains the text for printing to via pdf
			$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; "XRTF")
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			BLOB TO DOCUMENT:C526(document; $_blb_NewPrintSettings)
			//SEND PACKET($_ti_DocumentRef;$_t_NewSettings)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			//$_bo_IsSet:=‘11999;43‘($_blb_PrintSettings)
			$_l_isAvailable:=BLOB to print settings:C1434($_blb_PrintSettings)
			//$_bo_IsSet:=@XX_AP Text to PrintRec ($OLDSettings)
			$_l_DocumentExists:=Test path name:C476($_t_DocumentName)
			If ($_l_DocumentExists=1)
				//the settings are saved
				$_l_OK:=1
			End if 
			
		End if 
	End if 
End if 
If ($_l_OK=1)  // we can read the document
	SET BLOB SIZE:C606($_blb_NewPrintSettings; 0)
	//$_ti_DocumentRef:=Open Document($_t_DocumentName)
	//RECEIVE PACKET($_ti_DocumentRef;$_t_NewSettings;120)
	//Close DocUMENT($_ti_DocumentRef)
	DOCUMENT TO BLOB:C525($_t_DocumentName; $_blb_NewPrintSettings)
	If ($_t_NewSettings#"")
		//$_bo_IsAvailable:=‘11999;42‘($_blb_PrintSettings)
		$_l_isAvailable:=Print settings to BLOB:C1433($_blb_PrintSettings)
		//$_bo_IsAvailable:=@XX_AP PrintRec to text ($OLDSettings)
		//$_bo_IsSet:=@XX_AP Text to PrintRec ($_t_NewSettings)
		//$_bo_IsSet:=‘11999;43‘($_blb_PrintSettings)
		$_l_isAvailable:=BLOB to print settings:C1434($_blb_PrintSettings)
		
		//PRINT SETTINGS  `for testing only
	End if 
End if 
ERR_MethodTrackerReturn("PrintViaPDF"; $_t_oldMethodName)
