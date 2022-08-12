//%attributes = {}

If (False:C215)
	//Project Method Name:      GEN_CULPAbyObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/05/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_OBJECT:C1216($_obj_Attributes; $_obj_CodeUses; $1)
	C_TEXT:C284($_t_RecordCode; $_t_UniqueCode)
End if 
//Code Starts Here

$_obj_Attributes:=$1
If (Not:C34($_obj_Attributes.tableNumber=Null:C1517))
	$_t_UniqueCode:=String:C10($_obj_Attributes.tableNumber)
	If (Type:C295($_obj_Attributes.recordIdent=Is text:K8:3))
		$_t_RecordCode:=$_obj_Attributes.recordIdent
	Else 
		$_t_RecordCode:=String:C10($_obj_Attributes.recordIdent)
	End if 
	$_t_UniqueCode:=("0"*(3-Length:C16(String:C10($_obj_Attributes.tableNumber))))+String:C10($_obj_Attributes.tableNumber)+$_t_RecordCode
	$_obj_CodeUses:=ds:C1482.CODE_USES.query("Code =:1"; $_t_UniqueCode)
	//well the old code does not make much sense!
	
End if 
