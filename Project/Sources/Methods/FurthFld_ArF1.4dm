//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_ArF1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/05/2011 10:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldTypes;0)
	//ARRAY TEXT(<>FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SV_at_Field1Relation;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	C_LONGINT:C283($_l_CountFieldNames; $_l_CountFields; $_l_Index; $_l_TableNumber; $_l_TableNumPosition)
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_FilterType; $_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_ArF1")
//FurthFld F1 - add FFs to StatsView_Arrays on startup
If (Count parameters:C259>=1)
	$_ptr_Table:=$1
	If (Count parameters:C259>=2)
		$_t_FilterType:=$2
	End if 
	If ((DB_GetModuleSettingByNUM(1))#5)
		$_l_TableNumber:=Table:C252($1)
		$_l_TableNumPosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
		If (<>SYS_al_TableUniqueField{$_l_TableNumPosition}#0)
			
			If (Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumPosition})=0)
				FurthFld_Arr($_l_TableNumber)
			End if 
			$_l_CountFieldNames:=Size of array:C274(<>FUR_at_CustomFieldNames{$_l_TableNumPosition})
			If ($_l_CountFieldNames#0)
				
				$_l_CountFields:=Size of array:C274(SV_at_FieldName1)
				For ($_l_Index; 1; $_l_CountFieldNames)
					If (<>FUR_at_CustomFieldTypes{$_l_TableNumPosition}{$_l_Index}="@A")
						//$_l_CountFields:=$_l_CountFields+1
						//INSERT IN ARRAY(SV_at_FieldName1;$_l_CountFields;1)
						//INSERT IN ARRAY(SV_at_Field1Relation;$_l_CountFields;1)
						APPEND TO ARRAY:C911(SV_at_FieldName1; "FF:"+<>FUR_at_CustomFieldNames{$_l_TableNumPosition}{$_l_Index})
						APPEND TO ARRAY:C911(SV_at_Field1Relation; "*")
						
					Else 
						If ($_t_FilterType#"S")
							If ((<>FUR_at_CustomFieldTypes{$_l_TableNumPosition}{$_l_Index}="@N") | (<>FUR_at_CustomFieldTypes{$_l_TableNumPosition}{$_l_Index}="@D"))
								//$_l_CountFields:=$_l_CountFields+1
								//INSERT IN ARRAY(SV_at_FieldName1;$_l_CountFields;1)
								//INSERT IN ARRAY(SV_at_Field1Relation;$_l_CountFields;1)
								APPEND TO ARRAY:C911(SV_at_FieldName1; "FF:"+<>FUR_at_CustomFieldNames{$_l_TableNumPosition}{$_l_Index})
								APPEND TO ARRAY:C911(SV_at_Field1Relation; "")
							End if 
						End if 
					End if 
				End for 
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("FurthFld_ArF1"; $_t_oldMethodName)