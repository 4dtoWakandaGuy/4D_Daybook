//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_FileI
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
	//ARRAY POINTER(PUR_aPtr_LBItemsSetup;0)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_FileI")
FORM SET INPUT:C55([PURCHASE_INVOICES:37]; "Purchases_in")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Purchases_in"
ARRAY POINTER:C280(PUR_aPtr_LBItemsSetup; 0)
ERR_MethodTrackerReturn("Purchases_FileI"; $_t_oldMethodName)