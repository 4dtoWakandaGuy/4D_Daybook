If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Popup Drop down List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2009 16:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LL_al_FieldAccess;0)
	//ARRAY LONGINT(LL_al_FieldNos;0)
	//ARRAY LONGINT(LL_al_FieldNums;0)
	//ARRAY LONGINT(LL_al_FIeldNums2;0)
	//ARRAY LONGINT(LL_al_TableIDs;0)
	//ARRAY TEXT(LL_at_FieldName;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	//ARRAY TEXT(LL_at_FieldNames;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_FieldColumn; $_l_FieldsIndex; $_l_TableNumberRow)
	C_TEXT:C284($_t_oldMethodName; LL_t_FieldName; LL_t_TableName; vTitle13)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List2"; Form event code:C388)

If (LL_at_TableNames>0)
	[LIST_LAYOUTS:96]Table_Number:2:=LL_al_TableIDs{LL_at_TableNames}
	$_l_TableNumberRow:=Find in array:C230(LL_al_tableIDs; [LIST_LAYOUTS:96]Table_Number:2)
	LL_t_TableName:=LL_at_TableNames{LL_at_TableNames}
	
	If ($_l_TableNumberRow>0)
		ARRAY LONGINT:C221(LL_al_FieldNums; 0)
		ARRAY LONGINT:C221(LL_al_FIeldNums2; 0)
		ARRAY TEXT:C222(LL_at_FieldName; 0)
		ARRAY TEXT:C222(LL_at_FieldName2; 0)
		For ($_l_FieldsIndex; 1; Size of array:C274(LL_al_FieldNos{$_l_TableNumberRow}))
			If (User in group:C338(Current user:C182; "Designer"))
				APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldsIndex})
				APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberRow}{$_l_FieldsIndex})
				APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldsIndex})
				APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberRow}{$_l_FieldsIndex})
				
			Else 
				If (LL_al_FieldAccess{$_l_TableNumberRow}{$_l_FieldsIndex}>0)
					APPEND TO ARRAY:C911(LL_at_FieldName; LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldsIndex})
					APPEND TO ARRAY:C911(LL_al_FieldNums; LL_al_FieldNos{$_l_TableNumberRow}{$_l_FieldsIndex})
					APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldsIndex})
					APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableNumberRow}{$_l_FieldsIndex})
					
				End if 
			End if 
			
		End for 
		$_l_FieldColumn:=Find in array:C230(LL_al_FieldNos{$_l_TableNumberRow}; [LIST_LAYOUTS:96]Field_Number:3)
		If ($_l_FieldColumn>0)
			LL_t_FieldName:=LL_at_FieldNames{$_l_TableNumberRow}{$_l_FieldColumn}
		Else 
			LL_t_FieldName:="???"
		End if 
	End if 
	
	
	//COPY ARRAY(◊Fields{◊Files};◊FieldL)
	//◊FieldL:=1
	[LIST_LAYOUTS:96]Field_Number:3:=LL_al_FieldNums2{1}
	[LIST_LAYOUTS:96]Title:4:=LL_at_FieldName2{1}
	LL_t_FieldName:=LL_at_FieldName{1}
	vTitle13:=Layouts_Type
	If ([LIST_LAYOUTS:96]Table_Number:2#Num:C11(Substring:C12([LIST_LAYOUTS:96]Layout_Reference:1; 1; 3)))
		[LIST_LAYOUTS:96]Enterable:8:=False:C215
	End if 
Else 
	If ([LIST_LAYOUTS:96]Table_Number:2>0)
		//◊Files:=Find in array(◊Files_ID;[LIST LAYOUTS]File No)
	End if 
End if 
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List2"; $_t_oldMethodName)
