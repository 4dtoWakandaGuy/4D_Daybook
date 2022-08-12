If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Popup Drop down List5
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
	//ARRAY LONGINT(LL_al_FieldAccess;0)
	//ARRAY LONGINT(LL_al_FieldNos;0)
	//ARRAY LONGINT(LL_al_FIeldNums2;0)
	//ARRAY LONGINT(LL_al_TableIDs;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	//ARRAY TEXT(LL_at_FieldNames;0)
	//ARRAY TEXT(LL_at_TableNames;0)
	//ARRAY TEXT(LL_at_TableNames2;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_FIeldIndex; $_l_TableRow)
	C_TEXT:C284($_t_oldMethodName; LL_t_FieldName2; LL_t_TableName2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List5"; Form event code:C388)
If (LL_at_TableNames2>0)
	$_l_TableRow:=Find in array:C230(LL_at_TableNames; LL_at_TableNames2{LL_at_TableNames2})
	
	If ($_l_TableRow>0)  // it should be
		LL_t_TableName2:=LL_at_TableNames2{LL_at_TableNames2}
		[LIST_LAYOUTS:96]X_Related_Table:15:=LL_al_TableIDs{$_l_TableRow}
		
		ARRAY LONGINT:C221(LL_al_FIeldNums2; 0)
		ARRAY TEXT:C222(LL_at_FieldName2; 0)
		For ($_l_FIeldIndex; 1; Size of array:C274(LL_al_FieldNos{$_l_TableRow}))
			If (User in group:C338(Current user:C182; "Designer"))
				APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableRow}{$_l_FIeldIndex})
				APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableRow}{$_l_FIeldIndex})
				
			Else 
				If (LL_al_FieldAccess{$_l_TableRow}{$_l_FIeldIndex}>0)
					APPEND TO ARRAY:C911(LL_at_FieldName2; LL_at_FieldNames{$_l_TableRow}{$_l_FIeldIndex})
					APPEND TO ARRAY:C911(LL_al_FieldNums2; LL_al_FieldNos{$_l_TableRow}{$_l_FIeldIndex})
				End if 
			End if 
			
		End for 
		LL_t_FieldName2:=""
		LL_at_FieldName2:=1
		[LIST_LAYOUTS:96]X_Related_Field:16:=LL_al_FieldNums2{1}
		LL_t_FieldName2:=LL_at_FieldName2{1}
	End if 
	[LIST_LAYOUTS:96]Enterable:8:=False:C215
Else 
	If ([LIST_LAYOUTS:96]X_Related_Table:15>0)
		$_l_TableRow:=Find in array:C230(LL_al_TableIDs; [LIST_LAYOUTS:96]X_Related_Table:15)
		LL_t_TableName2:=LL_at_TableNames{LL_al_TableIDs}
		
	End if 
End if 
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List5"; $_t_oldMethodName)
