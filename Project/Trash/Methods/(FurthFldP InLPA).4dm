//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      FurthFldP InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(a01Inte1;0)
	//ARRAY INTEGER(a01Inte2;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BOOLEAN:C305($_bo_AllOff; $_bo_AllOn)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $1; vJB)
	C_TEXT:C284($_t_AccessCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFldP InLPA")
//FurthFldP InLPA

READ WRITE:C146([CUSTOM_FIELDS_PERSONNEL:100])
$_t_AccessCode:=Str LeadZeros(String:C10(vJB); 3)+Str_TrailSpaces([PERSONNEL:11]Initials:1; 5)
QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1=($_t_AccessCode+"@"))
DELETE SELECTION:C66([CUSTOM_FIELDS_PERSONNEL:100])
$_l_Index:=Size of array:C274(FUR_at_CustomFieldFormat)
If ($_l_Index>0)
	$_bo_AllOn:=True:C214
	$_bo_AllOff:=True:C214
	For ($_l_CurrentRow; 1; $_l_Index)
		If ((a01Inte1{$_l_CurrentRow}=0) | (a01Inte2{$_l_CurrentRow}=1))
			$_bo_AllOn:=False:C215
		End if 
		If ((a01Inte1{$_l_CurrentRow}=1) | (a01Inte2{$_l_CurrentRow}=1))
			$_bo_AllOff:=False:C215
		End if 
	End for 
	If (($_bo_AllOn=False:C215) & ($_bo_AllOff=False:C215))
		$_l_CurrentRow:=1
		While ($_l_CurrentRow<=Size of array:C274(FUR_at_CustomFieldFormat))
			IDLE:C311  // 03/04/03 pb
			If ((a01Inte1{$_l_CurrentRow}=1) | (a01Inte2{$_l_CurrentRow}=1))
				FUR_at_CustomFieldNames{$_l_CurrentRow}:=$_t_AccessCode+("2"*Num:C11((a01Inte1{$_l_CurrentRow}=1) & (a01Inte2{$_l_CurrentRow}=0)))+("3"*Num:C11(a01Inte2{$_l_CurrentRow}=1))
				$_l_CurrentRow:=$_l_CurrentRow+1
			Else 
				DELETE FROM ARRAY:C228(FUR_at_CustomFieldFormat; $_l_CurrentRow; 1)
				DELETE FROM ARRAY:C228(FUR_at_CustomFieldNames; $_l_CurrentRow; 1)
				DELETE FROM ARRAY:C228(a01Inte1; $_l_CurrentRow; 1)
				DELETE FROM ARRAY:C228(a01Inte2; $_l_CurrentRow; 1)
			End if 
		End while 
		ARRAY TO SELECTION:C261(FUR_at_CustomFieldNames; [CUSTOM_FIELDS_PERSONNEL:100]Table_Personnel_Access:1; FUR_at_CustomFieldFormat; [CUSTOM_FIELDS_PERSONNEL:100]FD_Code:2)
	End if 
End if 
READ ONLY:C145([CUSTOM_FIELDS_PERSONNEL:100])
UNLOAD RECORD:C212([CUSTOM_FIELDS_PERSONNEL:100])
ARRAY TEXT:C222(FUR_at_CustomFieldFormat; 0)
ARRAY TEXT:C222(FUR_at_CustomFieldNames; 0)
ARRAY INTEGER:C220(a01Inte1; 0)
ARRAY INTEGER:C220(a01Inte2; 0)
ERR_MethodTrackerReturn("FurthFldP InLPA"; $_t_oldMethodName)