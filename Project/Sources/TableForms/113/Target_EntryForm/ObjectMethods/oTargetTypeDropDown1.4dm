//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY TEXT(SP_at_tTargetType;0)
	C_LONGINT:C283($_l_AddedItemID; $_l_event; $_l_ListID; SP_l_FindByClassID)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesProjectionType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Pop-up/Drop-down List1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SP_at_tTargetType>0)
			If (SP_al_TargetType{SP_at_tTargetType}>0)
				SP_t_SalesProjectionType:=SP_at_tTargetType{SP_at_tTargetType}
				[SALES_PROJECTION:113]Class_ID:2:=SP_al_TargetType{SP_at_tTargetType}
				SP_l_FindByClassID:=[SALES_PROJECTION:113]Class_ID:2
			Else 
				$_l_ListID:=AA_GetListID(-1; -1; "Target Type"; "SP_S55_TargetType")
				$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID)
				AA_LoadListbyID($_l_ListID; ->SP_at_tTargetType; ->SP_al_TargetType; True:C214)
				
			End if 
		Else 
			
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Pop-up/Drop-down List1"; $_t_oldMethodName)
