//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies OutDe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies OutDe")
DB_t_CurrentFormUsage:="Many"
Companies_Del
ERR_MethodTrackerReturn("Companies OutDe"; $_t_oldMethodName)