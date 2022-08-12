//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ZStock_Hist
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZStock_Hist")
ZProc("Stock_Hist"; DB_ProcessMemoryinit(2); Term_StoWT("View Stock_History"))
ERR_MethodTrackerReturn("ZStock_Hist"; $_t_oldMethodName)