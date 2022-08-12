//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      QuickAdd Update
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
	//Array REAL(ORD_ar_QuickAddQuantity;0)
	C_LONGINT:C283(vAct1; vAct2)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vProdCode; vProdName; vSerialNo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QuickAdd Update")
If (vAct1#0)
	ORD_AT_QuickAddProdCode{vAct1}:=vProdCode
	ORD_AT_QuickAddProdName{vAct1}:=vProdName
	ORD_ar_QuickAddQuantity{vAct1}:=vQuantity
	ORD_AT_QuickAddSerialNo{vAct1}:=vSerialNo
End if 
vAct2:=Size of array:C274(ORD_AT_QuickAddProdCode)
ERR_MethodTrackerReturn("QuickAdd Update"; $_t_oldMethodName)