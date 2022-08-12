If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Popup Drop down List1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:26
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
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldNames;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_FieldColumn; $_l_TableNumberRow)
	C_TEXT:C284($_t_oldMethodName; LL_t_FieldName; vTitle13)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List1"; Form event code:C388)
If (LL_at_FieldName>0)
	
	[LIST_LAYOUTS:96]Field_Number:3:=LL_al_FieldNums{LL_at_FieldName}
	[LIST_LAYOUTS:96]Title:4:=LL_at_FieldName{LL_at_FieldName}
	LL_t_FieldName:=LL_at_FieldName{LL_at_FieldName}
Else 
	If ([LIST_LAYOUTS:96]Field_Number:3>0)
		$_l_FieldColumn:=Find in array:C230(LL_al_FieldNos; [LIST_LAYOUTS:96]Field_Number:3)
		If ($_l_FieldColumn>0)
			LL_t_FieldName:=LL_at_FieldName{$_l_FieldColumn}
		Else 
			$_l_TableNumberRow:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]Table_Number:2)
			If ($_l_TableNumberRow>0)
				$_l_FieldColumn:=Find in array:C230(LL_al_FieldNos{$_l_TableNumberRow}; [LIST_LAYOUTS:96]Field_Number:3)
				If ($_l_FieldColumn>0)
					LL_t_FieldName:=LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldColumn}
					
				Else 
					LL_t_FieldName:="???"
				End if 
				
			End if 
			
			
		End if 
	End if 
End if 

vTitle13:=Layouts_Type
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List1"; $_t_oldMethodName)
