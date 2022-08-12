//%attributes = {}
If (False:C215)
	//Project Method Name:      PersonGr_InLPA2
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
	//ARRAY BOOLEAN(CU_abo_CodeUsed;0)
	ARRAY INTEGER:C220($_ai_CodeUse; 0)
	//ARRAY INTEGER(CU_ai_CodeNo;0)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	ARRAY TEXT:C222($_at_Code; 0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	C_BOOLEAN:C305($_bo_All)
	C_LONGINT:C283($_l_ArraySize; $_l_CountRecords; $_l_Element; $_l_Index; vNo3)
	C_TEXT:C284($_t_Code; $_t_Code2; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PersonGr_InLPA2")
//PersonGr_InLPA2 - the bit that saves the States Allocations


If ((vNo3>0) & (vNo3<Size of array:C274(<>DB_at_TableNames)))
	$_l_ArraySize:=Size of array:C274(CU_at_CodeUse)
	
	READ WRITE:C146([CODE_USES:91])
	$_t_Code:="092"+[PERSONNEL_GROUPS:92]Group_Code:1+(" "*(5-Length:C16([PERSONNEL_GROUPS:92]Group_Code:1)))+("0"*(3-Length:C16(String:C10(vNo3))))+String:C10(vNo3)
	$_t_Code2:=$_t_Code+"@"
	QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_Code2)  //Find Code uses with a prefix of this Group
	$_l_CountRecords:=Records in selection:C76([CODE_USES:91])
	ARRAY TEXT:C222($_at_Code; 0)
	ARRAY INTEGER:C220($_ai_CodeUse; 0)
	
	$_bo_All:=True:C214
	$_l_Element:=0
	For ($_l_Index; 1; $_l_ArraySize)
		//CU_abo_CodeUsed{$_l_Index}:=TRUE
		//*/
		If ((CU_abo_CodeUsed{$_l_Index}) | (CU_ai_CodeNo{$_l_Index}#0) | (GEN_ar_Value{$_l_Index}#0))
			
			If ((Not:C34(CU_abo_CodeUsed{$_l_Index})) | (CU_ai_CodeNo{$_l_Index}#0) | (GEN_ar_Value{$_l_Index}#0))
				$_bo_All:=False:C215
			End if 
			$_l_Element:=$_l_Element+1
			INSERT IN ARRAY:C227($_at_Code; $_l_Element; 1)
			INSERT IN ARRAY:C227($_ai_CodeUse; $_l_Element; 1)
			$_at_Code{$_l_Element}:=$_t_Code+CU_at_CodeUse{$_l_Index}
			$_ai_CodeUse{$_l_Element}:=Num:C11(CU_abo_CodeUsed{$_l_Index})+(2*(Num:C11(CU_ai_CodeNo{$_l_Index}=1)))+(4*(Num:C11(GEN_ar_Value{$_l_Index}=1)))
		Else 
			$_bo_All:=False:C215
		End if 
		///*
	End for 
	$_l_ArraySize:=Size of array:C274($_at_Code)
	If (($_l_CountRecords>$_l_ArraySize) | ($_bo_All))
		DELETE SELECTION:C66([CODE_USES:91])
	End if 
	If (($_l_ArraySize>0) & (Not:C34($_bo_All)))
		ARRAY TO SELECTION:C261($_at_Code; [CODE_USES:91]Code:1; $_ai_CodeUse; [CODE_USES:91]Use:2)
	End if 
	UNLOAD RECORD:C212([CODE_USES:91])
	READ ONLY:C145([CODE_USES:91])
End if 
ERR_MethodTrackerReturn("PersonGr_InLPA2"; $_t_oldMethodName)
