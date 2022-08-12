//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZMail_Comp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 15:18
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

$_t_oldMethodName:=ERR_MethodTracker("ZMail_Comp")
DBI_MenuDisplayRecords("CompaniesMailing")
ERR_MethodTrackerReturn("ZMail_Comp"; $_t_oldMethodName)