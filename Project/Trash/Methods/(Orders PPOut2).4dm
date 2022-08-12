//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPOut2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 14:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAdd; vNo)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPOut2")
DB_t_CurrentFormUsage2:=""
vAdd:=0

FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Items OutPrint")
MESSAGES ON:C181
//CLEAR NAMED SELECTION("Orders")
USE NAMED SELECTION:C332("Items")
CLEAR NAMED SELECTION:C333("Items")
DB_t_CurrentFormUsage:=""
vNo:=Records in selection:C76([ORDER_ITEMS:25])
ERR_MethodTrackerReturn("Orders PPOut2"; $_t_oldMethodName)