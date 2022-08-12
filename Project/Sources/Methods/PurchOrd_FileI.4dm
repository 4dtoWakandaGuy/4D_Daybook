//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_FileI
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
	//ARRAY POINTER(POI_aptr_LBSetup;0)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_FileI")
FORM SET INPUT:C55([PURCHASE_ORDERS:57]; "PurchaseOrder_In")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="PurchaseOrder_In"
ARRAY POINTER:C280(POI_aptr_LBSetup; 0)
ERR_MethodTrackerReturn("PurchOrd_FileI"; $_t_oldMethodName)