//%attributes = {}
If (False:C215)
	//Project Method Name:      Doc_InitPrintPreferences
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
	C_BOOLEAN:C305(PDF_bo_995Enabled)
	C_TEXT:C284($_t_ConfigFIlePath; $_t_oldMethodName; DOC_t_INIFilePath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_InitPrintPreferences")
If (False:C215)
	PDF995_getReady
	
	Case of 
		: ((DOC_t_INIFilePath="") & ($_t_ConfigFIlePath=""))  //core prefs and personal pref are empty
			$_t_ConfigFIlePath:=PDF995_iNIFilePathGetDefault
			
		: ((DOC_t_INIFilePath#"") & ($_t_ConfigFIlePath=""))  //core is not defined but personal prefs are
			$_t_ConfigFIlePath:=DOC_t_INIFilePath  //"C:\\Program Files\\pdf995\\res\\pdf995.ini"
			
		Else 
	End case 
	
	PDF995_iNIFilePathSet($_t_ConfigFIlePath)
	
	PDF995_iNIConfigSetParams
	
	PDF_bo_995Enabled:=PDF995_isEnabled
Else 
	PDF_bo_995Enabled:=False:C215
End if 
ERR_MethodTrackerReturn("Doc_InitPrintPreferences"; $_t_oldMethodName)
