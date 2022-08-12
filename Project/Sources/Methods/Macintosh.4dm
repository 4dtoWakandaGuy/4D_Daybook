//%attributes = {}
If (False:C215)
	//Project Method Name:      Macintosh
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/02/2010 12:27
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("Macintosh")
$0:=Is macOS:C1572
ERR_MethodTrackerReturn("Macintosh"; $_t_oldMethodName)
