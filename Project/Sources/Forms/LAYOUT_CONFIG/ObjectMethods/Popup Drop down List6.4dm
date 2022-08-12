If (False:C215)
	//object Method Name: Object Name:      LAYOUT_CONFIG.Popup Drop down List6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2011 13:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LL_al_FieldNos;0)
	//ARRAY LONGINT(LL_al_FieldNums;0)
	//ARRAY LONGINT(LL_al_TableIDs;0)
	//ARRAY POINTER(DB_aptr_Setup;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldNames;0)
	C_BOOLEAN:C305($_bo_NoAdd; DB_bo_RecordModified; LAY_bo_RecordEdited; LAY_bo_ShowLastColumn)
	C_LONGINT:C283($_l_ArrayType; $_l_Column; $_l_FieldRow; $_l_Index; $_l_Number; $_l_TableRow; LAY_l_ConfigCancel; LAY_l_ConfigSave)
	C_POINTER:C301($_ptr_Array; $_ptr_ArrayEnterability; $_ptr_ArrayFieldPointers; $_ptr_ArrayPointerArrayNames; $_ptr_ArrayPointers; $_ptr_ArrayReferences; $_ptr_ArrayTitles; $_Ptr_Field; $_ptr_ThisColumnArray)
	C_TEXT:C284($_t_arrayConstruct; $_t_LevelID; $_t_NumberDesignation; $_t_oldMethodName; $_t_ThisColumnArrayName; $_t_Word; LL_t_FieldName; vTitle13)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LAYOUT_CONFIG.Popup Drop down List6"; Form event code:C388)

If (LL_at_FieldName>0)
	If ([LIST_LAYOUTS:96]Field_Number:3#LL_al_FieldNums{LL_at_FieldName})
		If (Size of array:C274(DB_aptr_Setup)>=20)
			
			LAY_bo_RecordEdited:=True:C214
			DB_bo_RecordModified:=True:C214
			OBJECT SET VISIBLE:C603(LAY_l_ConfigSave; True:C214)
			OBJECT SET VISIBLE:C603(LAY_l_ConfigCancel; True:C214)
			[LIST_LAYOUTS:96]Field_Number:3:=LL_al_FieldNums{LL_at_FieldName}
			[LIST_LAYOUTS:96]Title:4:=LL_at_FieldName{LL_at_FieldName}
			LL_t_FieldName:=LL_at_FieldName{LL_at_FieldName}
			$_l_Column:=[LIST_LAYOUTS:96]Order:7
			$_ptr_ArrayPointers:=DB_aptr_Setup{3}
			$_ptr_ArrayPointerArrayNames:=DB_aptr_Setup{4}
			$_ptr_ArrayTitles:=DB_aptr_Setup{12}
			$_ptr_ArrayEnterability:=DB_aptr_Setup{14}
			$_t_ThisColumnArrayName:=$_ptr_ArrayPointerArrayNames->{$_l_Column}
			$_Ptr_Field:=Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)
			$_ptr_ArrayReferences:=DB_aptr_Setup{9}
			$_t_LevelID:=$_ptr_ArrayReferences->{1}
			$_l_ArrayType:=0
			Case of 
				: (Position:C15("LB_al"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is longint:K8:6
					
				: (Position:C15("LB_ai"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is integer:K8:5
					
				: (Position:C15("LB_ar"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is real:K8:4
				: (Position:C15("LB_at"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is text:K8:3
				: (Position:C15("LB_at"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is text:K8:3
				: (Position:C15("LB_abo"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is boolean:K8:9
				: (Position:C15("LB_aTi"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is time:K8:8
				: (Position:C15("LB_ad"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is date:K8:7
				: (Position:C15("LB_apic"; $_t_ThisColumnArrayName)>0)
					$_l_ArrayType:=Is picture:K8:10
					
				Else 
					$_l_ArrayType:=Is text:K8:3
					//unknown type!
			End case 
			
			$_bo_NoAdd:=False:C215
			Case of 
					
				: (Type:C295($_Ptr_Field->)=Is longint:K8:6)
					$_t_Word:="LB_al"
					If ($_l_ArrayType=Is longint:K8:6)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is integer:K8:5)
					$_t_Word:="LB_ai"
					If ($_l_ArrayType=Is integer:K8:5)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is real:K8:4)
					$_t_Word:="LB_ar"
					If ($_l_ArrayType=Is real:K8:4)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is alpha field:K8:1)
					$_t_Word:="LB_aT"
					If ($_l_ArrayType=Is alpha field:K8:1)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is text:K8:3)
					$_t_Word:="LB_aT"
					If ($_l_ArrayType=Is text:K8:3)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is boolean:K8:9)
					$_t_Word:="LB_abo"
					If ($_l_ArrayType=Is boolean:K8:9)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is time:K8:8)
					$_t_Word:="LB_ati"
					If ($_l_ArrayType=Is longint:K8:6)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is date:K8:7)
					$_t_Word:="LB_ad"
					If ($_l_ArrayType=Is date:K8:7)
						$_bo_NoAdd:=True:C214
					End if 
				: (Type:C295($_Ptr_Field->)=Is picture:K8:10)
					$_t_Word:="LB_apic"
					If ($_l_ArrayType=Is picture:K8:10)
						$_bo_NoAdd:=True:C214
					End if 
				Else 
					$_t_Word:="LB_aT"
					If ($_l_ArrayType=Is text:K8:3)
						$_bo_NoAdd:=True:C214
					End if 
					//unknown type!
			End case 
			If ($_bo_NoAdd=False:C215)
				//we are changing the array type
				For ($_l_Index; Size of array:C274($_ptr_ArrayPointerArrayNames->); 1; -1)  //this gets the highest used already array number
					$_t_NumberDesignation:=$_ptr_ArrayPointerArrayNames->{$_l_Index}
					If (Position:C15($_t_arrayConstruct; $_t_NumberDesignation)>0)
						$_t_NumberDesignation:=Replace string:C233($_t_NumberDesignation; $_t_arrayConstruct+"_"+$_t_LevelID+"_"; "")
						$_l_Index:=0
					End if 
				End for 
				
				$_l_Number:=Num:C11($_t_NumberDesignation)
				$_t_NumberDesignation:=$_t_arrayConstruct+"_"+$_t_LevelID+"_"+String:C10($_l_Number+1)
				
				$_ptr_Array:=Get pointer:C304($_t_NumberDesignation)
				
				$_ptr_ArrayPointers->{$_l_Column}:=$_ptr_Array
				$_ptr_ArrayPointerArrayNames->{$_l_Column}:=$_t_NumberDesignation
				
				
			End if 
			$_ptr_ArrayFieldPointers:=DB_aptr_Setup{2}
			$_ptr_ArrayFieldPointers->{$_l_Column}:=Field:C253([LIST_LAYOUTS:96]Table_Number:2; [LIST_LAYOUTS:96]Field_Number:3)
			
			
			
			$_ptr_ArrayTitles->{$_l_Column}:=[LIST_LAYOUTS:96]Title:4
			LAY_bo_ShowLastColumn:=True:C214
			LBi_LoadSetup(->DB_aptr_Setup)
		Else 
			Gen_Alert("ERROR")
		End if 
	End if 
Else 
	If ([LIST_LAYOUTS:96]Field_Number:3>0)
		$_l_FieldRow:=Find in array:C230(LL_al_FieldNos; [LIST_LAYOUTS:96]Field_Number:3)
		If ($_l_FieldRow>0)
			LL_t_FieldName:=LL_at_FieldName{$_l_FieldRow}
		Else 
			$_l_TableRow:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]Table_Number:2)
			If ($_l_TableRow>0)
				$_l_FieldRow:=Find in array:C230(LL_al_FieldNos{$_l_TableRow}; [LIST_LAYOUTS:96]Field_Number:3)
				If ($_l_FieldRow>0)
					LL_t_FieldName:=LL_at_FieldNames{$_l_TableRow}{$_l_FieldRow}
					
				Else 
					LL_t_FieldName:="???"
				End if 
				
			End if 
			
			
		End if 
	End if 
End if 
vTitle13:=Layouts_Type
ERR_MethodTrackerReturn("OBJ LAYOUT_CONFIG.Popup Drop down List6"; $_t_oldMethodName)
