//%attributes = {}
If (False:C215)
	//Project Method Name:      QuickAdd_UpLine
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(ch1; vAct1; vAct2)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; vProdCode; vProdName; vSerialNo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QuickAdd_UpLine")
//QuickAdd_Update Line
If ((vProdCode#"") | (vProdName#"") | (vSerialNo#""))
	vAct1:=ORD_AT_QuickAddProdCode
	If ((vAct1=0) | (vAct1=Size of array:C274(ORD_AT_QuickAddProdCode)))
		If (vAct1=0)
			INSERT IN ARRAY:C227(ORD_AT_QuickAddProdCode; 9999; 1)
			INSERT IN ARRAY:C227(ORD_AT_QuickAddProdName; 9999; 1)
			INSERT IN ARRAY:C227(ORD_ar_QuickAddQuantity; 9999; 1)
			INSERT IN ARRAY:C227(ORD_AT_QuickAddSerialNo; 9999; 1)
			vAct1:=Size of array:C274(ORD_AT_QuickAddProdCode)
		End if 
		QuickAdd_Update
		
		If (ch1=0)
			vProdCode:=""
			vProdName:=""
			vQuantity:=1
			GOTO OBJECT:C206(vProdCode)
		End if 
		vSerialNo:=""
		
		ORD_AT_QuickAddProdCode:=0
		ORD_AT_QuickAddProdName:=0
		ORD_ar_QuickAddQuantity:=0
		ORD_AT_QuickAddSerialNo:=0
		vAct1:=ORD_AT_QuickAddProdCode
	Else 
		QuickAdd_Update
		vAct1:=vAct1+1
		ORD_AT_QuickAddProdCode:=vAct1
		ORD_AT_QuickAddProdName:=vAct1
		ORD_ar_QuickAddQuantity:=vAct1
		ORD_AT_QuickAddSerialNo:=vAct1
		
		vProdCode:=ORD_AT_QuickAddProdCode{vAct1}
		vProdName:=ORD_AT_QuickAddProdName{vAct1}
		vQuantity:=ORD_ar_QuickAddQuantity{vAct1}
		vSerialNo:=ORD_AT_QuickAddSerialNo{vAct1}
	End if 
End if 
vAct2:=Size of array:C274(ORD_AT_QuickAddProdCode)
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("QuickAdd_UpLine"; $_t_oldMethodName)