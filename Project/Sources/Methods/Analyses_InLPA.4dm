//%attributes = {}
If (False:C215)
	//Project Method Name:      Analyses_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
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

$_t_oldMethodName:=ERR_MethodTracker("Analyses_InLPA")
DB_SaveRecord(->[IDENTIFIERS:16])
ERR_MethodTrackerReturn("Analyses_InLPA"; $_t_oldMethodName)
