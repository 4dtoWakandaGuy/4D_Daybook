//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InDel
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
	C_LONGINT:C283(vCP; vCT)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InDel")
If (DB_t_CurrentFormUsage2#"NoCan")
	DB_t_CurrentFormUsage:="One"
	Companies_Del
End if 
vCP:=0
vCT:=0
ERR_MethodTrackerReturn("Companies_InDel"; $_t_oldMethodName)