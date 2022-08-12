//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF_EncrpytEditPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/09/2011 14:32 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF_EncrpytEditPrefs")


Open_AnyTypeWindow(270; 320; 1; "")  //;"User: "+◊User)
DIALOG:C40("PDF_SecureSettings")
CLOSE WINDOW:C154
PDF_EncyptLoadPrefs(True:C214)
ERR_MethodTrackerReturn("PDF_EncrpytEditPrefs"; $_t_oldMethodName)