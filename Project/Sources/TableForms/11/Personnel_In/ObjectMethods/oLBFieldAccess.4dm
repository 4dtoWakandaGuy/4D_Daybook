If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oLBFieldAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2013 15:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PER_lb_AccessTables;0)
	//ARRAY INTEGER(a01Inte1;0)
	//ARRAY INTEGER(a01Inte2;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; vMod2)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oLBFieldAccess"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->PER_lb_AccessTables; $_t_VariableName)
		End if 
		Case of 
			: ($_l_Column=1)
			: ($_l_Column=2)
				a01Inte1{$_l_Row}:=Num:C11(a01Inte1{$_l_Row}=0)
				If ((a01Inte2{$_l_Row}=1) & (a01Inte1{$_l_Row}=0))
					a01Inte2{$_l_Row}:=0
				End if 
				FUR_at_CustomFieldNames:=0
				a01Inte1:=0
				a01Inte2:=0
				vMod2:=True:C214
				DB_bo_RecordModified:=True:C214
			: ($_l_Column=3)
				a01Inte2{$_l_Row}:=Num:C11(a01Inte2{$_l_Row}=0)
				If ((a01Inte1{$_l_Row}=0) & (a01Inte2{$_l_Row}=1))
					a01Inte1{$_l_Row}:=1
				End if 
				FUR_at_CustomFieldNames:=0
				a01Inte1:=0
				a01Inte2:=0
				vMod2:=True:C214
				DB_bo_RecordModified:=True:C214
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oLBFieldAccess"; $_t_oldMethodName)
