//%attributes = {}
If (False:C215)
	//Project Method Name:      QuickAdd_Arr
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
	//Array Text(ORD_AT_QuickAddProdCode;0)
	//Array Text(ORD_AT_QuickAddProdName;0)
	//Array Text(ORD_AT_QuickAddSerialNo;0)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QuickAdd_Arr")
ARRAY TEXT:C222(ORD_AT_QuickAddProdCode; $1)
ARRAY TEXT:C222(ORD_AT_QuickAddProdName; $1)
ARRAY REAL:C219(ORD_ar_QuickAddQuantity; $1)
ARRAY TEXT:C222(ORD_AT_QuickAddSerialNo; $1)
ERR_MethodTrackerReturn("QuickAdd_Arr"; $_t_oldMethodName)