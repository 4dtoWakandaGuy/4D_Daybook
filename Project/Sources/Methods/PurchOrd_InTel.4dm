//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_InTel
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

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_InTel")
RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
Gen_ShowTel
ERR_MethodTrackerReturn("PurchOrd_InTel"; $_t_oldMethodName)