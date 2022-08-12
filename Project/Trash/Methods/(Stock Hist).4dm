//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Stock Hist
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 19:08
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

$_t_oldMethodName:=ERR_MethodTracker("Stock Hist")
//Stock Hist
DBI_MenuDisplayRecords("Stock ItemsHistory")
ERR_MethodTrackerReturn("Stock Hist"; $_t_oldMethodName)