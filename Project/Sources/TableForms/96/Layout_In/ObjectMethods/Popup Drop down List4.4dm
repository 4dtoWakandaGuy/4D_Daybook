If (False:C215)
	//object Name: [LIST_LAYOUTS]Layout_In.Popup Drop down List4
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
	//ARRAY LONGINT(LL_al_FIeldNums2;0)
	//ARRAY TEXT(LL_at_FieldName2;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_FIeldRow)
	C_TEXT:C284($_t_oldMethodName; LL_t_FieldName2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List4"; Form event code:C388)
If (LL_at_FieldName2>0)
	[LIST_LAYOUTS:96]X_Related_Field:16:=LL_al_FIeldNums2{LL_at_FieldName2}
	LL_t_FieldName2:=LL_at_FieldName2{LL_at_FieldName2}
Else 
	If ([LIST_LAYOUTS:96]X_Related_Field:16>0)
		$_l_FIeldRow:=Find in array:C230(LL_al_FIeldNums2; [LIST_LAYOUTS:96]X_Related_Field:16)
		
		LL_at_FieldName2:=$_l_FIeldRow
		LL_t_FieldName2:=LL_at_FieldName2{LL_at_FieldName2}
	End if 
End if 

DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [LIST_LAYOUTS].Layout_In.Popup Drop down List4"; $_t_oldMethodName)
