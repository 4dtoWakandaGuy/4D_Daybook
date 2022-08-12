If (False:C215)
	//object Name: [CUSTOM_FIELD_DEFINITiONS]CustomFieldDef_In.Combo Box1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(<>DB_at_TableNames;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CUSTOM_FIELD_DEFINITiONS].CustomFieldDef_In.Combo Box1"; Form event code:C388)
If (<>DB_at_TableNames=0)
	<>DB_at_TableNames:=1
End if 
[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3:=<>DB_al_TableNums{<>DB_at_TableNames}
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [CUSTOM_FIELD_DEFINITiONS].CustomFieldDef_In.Combo Box1"; $_t_oldMethodName)