//%attributes = {}
If (False:C215)
	//Project Method Name:      Furth_LBI_Mod
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
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldFormat;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_Column; $_l_RowNumber; $2; $3; bd35)
	C_POINTER:C301($_Ptr_ListBoxArea; $1)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_CustomFieldType; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Furth_LBI_Mod")
// LB_Modfurth
// 06/07/06 pb
// replaces the ALModFurth on exit callback on the Further Fields forms
// Parameters: $1 = pointer to the listbox area
// example: LB_ModFurth (Self)


$_Ptr_ListBoxArea:=$1
If (bd35=0)  //This is here to ensure that this proc only gets used once
	bd35:=1  //because otherwise it will get a $2=8 (left the area) when you open another wind
	//AL_GetCurrCell ($1;bd36;$_l_RowNumber)  `Column; Row
	$_l_Column:=$2  // column
	$_l_RowNumber:=$3
	Case of 
		: ($_l_Column=2)
			If ((Length:C16(FUR_at_CustomFieldTypes{$_l_RowNumber})>1) & (DB_t_CurrentFormUsage3#"MC"))
				Gen_Alert("You do not have access to modify this Further Field")
				CUS_at_DisplayedData{$_l_RowNumber}:=CUS_at_DisplayedData{0}
			Else 
				$_t_CustomFieldType:=Substring:C12(FUR_at_CustomFieldTypes{$_l_RowNumber}; 1; 1)
				Case of 
					: ($_t_CustomFieldType="N")
						If (DB_t_CurrentFormUsage3#"MC")
							Macro_AccTypeFF(FUR_at_CustomFieldNames{$_l_RowNumber})
							
						End if 
						If (FUR_at_CustomFieldFormat{$_l_RowNumber}="")
							CUS_at_DisplayedData{$_l_RowNumber}:=String:C10(Num:C11(CUS_at_DisplayedData{$_l_RowNumber}))
						Else 
							CUS_at_DisplayedData{$_l_RowNumber}:=String:C10(Num:C11(CUS_at_DisplayedData{$_l_RowNumber}); FUR_at_CustomFieldFormat{$_l_RowNumber})
						End if 
					: ($_t_CustomFieldType="D")
						If (DB_t_CurrentFormUsage3#"MC")
							Macro_AccTypeFF(FUR_at_CustomFieldNames{$_l_RowNumber})
							
						End if 
						If (FUR_at_CustomFieldFormat{$_l_RowNumber}="")
							CUS_at_DisplayedData{$_l_RowNumber}:=String:C10(Date:C102(CUS_at_DisplayedData{$_l_RowNumber}))
						Else 
							CUS_at_DisplayedData{$_l_RowNumber}:=String:C10(Date:C102(CUS_at_DisplayedData{$_l_RowNumber}); FUR_at_CustomFieldFormat{$_l_RowNumber})
						End if 
					Else 
						If (($_t_CustomFieldType="A") | (FUR_at_CustomFieldFormat{$_l_RowNumber}#""))
							CUS_at_DisplayedData{$_l_RowNumber}:=Uppers2(CUS_at_DisplayedData{$_l_RowNumber})
						End if 
						If (FUR_at_CustomFieldFormat{$_l_RowNumber}#"")
							If (FUR_at_CustomFieldFormat{$_l_RowNumber}="Pictures")
								If (DB_t_CurrentFormUsage3="MC")
									Check_MinorNC(->CUS_at_DisplayedData{$_l_RowNumber}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Picture")
								Else 
									$_t_CurrentFormUsage:=DB_t_CurrentFormUsage3
									DB_t_CurrentFormUsage3:="FurthFld: "+FUR_at_CustomFieldNames{$_l_RowNumber}
									Check_Minor(->CUS_at_DisplayedData{$_l_RowNumber}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Pictures In"; "Picture")
									DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage
								End if 
							Else 
								Check_Lists(->CUS_at_DisplayedData{$_l_RowNumber}; FUR_at_CustomFieldFormat{$_l_RowNumber})
							End if 
							DB_bo_RecordModified:=True:C214
						End if 
						If (DB_t_CurrentFormUsage3#"MC")
							Macro_AccTypeFF(FUR_at_CustomFieldNames{$_l_RowNumber})
						End if 
						If ($_t_CustomFieldType="A")
							If (Length:C16(CUS_at_DisplayedData{$_l_RowNumber})>31)
								//BEEP
								CUS_at_DisplayedData{$_l_RowNumber}:=Substring:C12(CUS_at_DisplayedData{$_l_RowNumber}; 1; 31)
							End if 
						End if 
				End case 
				If (DB_t_CurrentFormUsage3="MC")
					If (CUS_at_PageText{$_l_RowNumber}="")
						CUS_at_PageText{$_l_RowNumber}:=CUS_at_DisplayedData{$_l_RowNumber}
					End if 
				End if 
			End if 
			
		: ($_l_Column=3)  //possible only in More Choices
			$_t_CustomFieldType:=Substring:C12(FUR_at_CustomFieldTypes{$_l_RowNumber}; 1; 1)
			Case of 
				: ($_t_CustomFieldType="N")
					If (FUR_at_CustomFieldFormat{$_l_RowNumber}="")
						CUS_at_PageText{$_l_RowNumber}:=String:C10(Num:C11(CUS_at_PageText{$_l_RowNumber}))
					Else 
						CUS_at_PageText{$_l_RowNumber}:=String:C10(Num:C11(CUS_at_PageText{$_l_RowNumber}); FUR_at_CustomFieldFormat{$_l_RowNumber})
					End if 
				: ($_t_CustomFieldType="D")
					If (FUR_at_CustomFieldFormat{$_l_RowNumber}="")
						CUS_at_PageText{$_l_RowNumber}:=String:C10(Date:C102(CUS_at_PageText{$_l_RowNumber}))
					Else 
						CUS_at_PageText{$_l_RowNumber}:=String:C10(Date:C102(CUS_at_PageText{$_l_RowNumber}); FUR_at_CustomFieldFormat{$_l_RowNumber})
					End if 
				Else 
					If (($_t_CustomFieldType="A") | (FUR_at_CustomFieldFormat{$_l_RowNumber}#""))
						CUS_at_PageText{$_l_RowNumber}:=Uppers2(CUS_at_PageText{$_l_RowNumber})
					End if 
					If (FUR_at_CustomFieldFormat{$_l_RowNumber}#"")
						If (FUR_at_CustomFieldFormat{$_l_RowNumber}="Pictures")
							Check_MinorNC(->CUS_at_PageText{$_l_RowNumber}; ""; ->[PICTURES:85]; ->[PICTURES:85]Picture_Code:1; ->[PICTURES:85]Picture_Name:2; "Picture")
						Else 
							Check_Lists(->CUS_at_PageText{$_l_RowNumber}; FUR_at_CustomFieldFormat{$_l_RowNumber})
						End if 
					End if 
					If ($_t_CustomFieldType="A")
						If (Length:C16(CUS_at_PageText{$_l_RowNumber})>31)
							BEEP:C151
							CUS_at_PageText{$_l_RowNumber}:=Substring:C12(CUS_at_PageText{$_l_RowNumber}; 1; 31)
						End if 
					End if 
			End case 
			
	End case 
	//AL_UpdateArrays (eALFurth;-1)
	DB_bo_RecordModified:=True:C214
	bd35:=0
End if 
ERR_MethodTrackerReturn("Furth_LBI_Mod"; $_t_oldMethodName)