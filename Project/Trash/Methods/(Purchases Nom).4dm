//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases Nom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:51
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

$_t_oldMethodName:=ERR_MethodTracker("Purchases Nom")
//Purchases Nom
DBI_MenuDisplayRecords("PurchasesPost")
ERR_MethodTrackerReturn("Purchases Nom"; $_t_oldMethodName)