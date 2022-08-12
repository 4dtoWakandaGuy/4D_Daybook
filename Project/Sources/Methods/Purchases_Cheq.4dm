//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_Cheq
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 13:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_Cheq")
//Project Method Purchases_Cheq 2/3/2(ID 2756-2558)

//Purchases_Cheques
DBI_MenuDisplayRecords("PurchasesCheques")

WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Purchases_Cheq"; $_t_oldMethodName)