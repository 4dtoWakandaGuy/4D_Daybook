//%attributes = {}
If (False:C215)
	//Project Method Name:      ZStock_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2010 10:57
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

$_t_oldMethodName:=ERR_MethodTracker("ZStock_List")
//ZProc ("Stock_List";◊K2;Term_StoWT ("Stock Items List"))
ERR_MethodTrackerReturn("ZStock_List"; $_t_oldMethodName)