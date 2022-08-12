//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr PP1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Contr PP1")
DB_SaveRecord(->[CONTRACTS:17])
COPY NAMED SELECTION:C331([CONTRACTS:17]; "Contracts")
ERR_MethodTrackerReturn("Contr PP1"; $_t_oldMethodName)