//%attributes = {}
If (False:C215)
	//Project Method Name:      Personnel_currPrefsToArray
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
	//ARRAY TEXT(DOC_at_PDF995Path;0)
	//ARRAY TEXT(PDF_at_995DocsDirPath;0)
	C_TEXT:C284($_t_oldMethodName; DOC_t_PDF995Path; PDF_t_995DocDirPath)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel_currPrefsToArray")

If (DOC_at_PDF995Path>0)
	DOC_at_PDF995Path{DOC_at_PDF995Path}:=DOC_t_PDF995Path
	PDF_at_995DocsDirPath{DOC_at_PDF995Path}:=PDF_t_995DocDirPath
	
End if 

ERR_MethodTrackerReturn("Personnel_currPrefsToArray"; $_t_oldMethodName)
