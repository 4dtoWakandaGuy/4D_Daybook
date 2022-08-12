//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF995_iNIFilePathGetDefault
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/08/2009 18:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF995_iNIFilePathGetDefault")


$0:="C:\\Program Files\\pdf995\\res\\pdf995.ini"

ERR_MethodTrackerReturn("PDF995_iNIFilePathGetDefault"; $_t_oldMethodName)
