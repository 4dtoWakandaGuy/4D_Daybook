//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_iNIFilePathGet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 11:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>PDF995_IniFilePathCopyStr; <>PDF995_IniFilePathStr; $_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_iNIFilePathGet")

PDF995_constantsInit

If ((<>PDF995_IniFilePathStr="") | (<>PDF995_IniFilePathCopyStr=""))
	PDF995_iNIFilePathSet("")  //will ask for path if not compiled
End if 

$0:=<>PDF995_IniFilePathStr

ERR_MethodTrackerReturn("PDF995_iNIFilePathGet"; $_t_oldMethodName)
