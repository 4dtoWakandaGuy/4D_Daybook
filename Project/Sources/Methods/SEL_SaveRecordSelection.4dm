//%attributes = {}
If (False:C215)
	//Project Method Name:      SEL_SaveRecordSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   15/05/2010 22:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetContextIDs;0)
	//ARRAY TEXT(SM_at_SetContexts;0)
	C_LONGINT:C283($_l_AddToItemRef; $_l_Index; $_l_TableNumber; DB_l_CurrentDisplayedForm; SM_l_ContextItemID)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_SelectionMenuItem; $_t_SelectionName; $_t_TableName; DB_t_CUrrentMenuReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SEL_SaveRecordSelection")

If (DB_l_CurrentDisplayedForm>0)
	
	If (Records in set:C195("ListboxSet0")>0)
		USE SET:C118("ListboxSet0")
	End if 
	$_Ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
	
	$_t_TableName:=Table name:C256(DB_l_CurrentDisplayedForm)
	$_t_TableName:=Get localized string:C991("Table_"+$_t_TableName)
	
	$_l_AddToItemRef:=0
	For ($_l_Index; 1; Size of array:C274(SM_at_SetContexts))
		If ((SM_al_SetContextIDs{$_l_Index}-10000)>0) & ((SM_al_SetContextIDs{$_l_Index}-10000)<Get last table number:C254)
			$_l_TableNumber:=SM_TableFromContextID(SM_al_SetContextIDs{$_l_Index})
			If ($_l_TableNumber=DB_l_CurrentDisplayedForm)
				$_l_AddToItemRef:=SM_al_SetContextIDs{$_l_Index}
			End if 
		End if 
	End for 
	If ($_l_AddToItemRef#0)
		
		$_t_SelectionName:=Gen_Request("Name the selection of"+$_t_TableName+" to Save"; "")
		If ($_t_SelectionName#"")
			SM_l_ContextItemID:=AA_GetNextIDinMethod(->SM_l_ContextItemID)
			SM_UpdateArrays("PER"; $_t_SelectionName; -(SM_l_ContextItemID); $_l_AddToItemRef)
			SM_UPDATEDATA
			$_t_SelectionMenuItem:=Get localized string:C991("Menu_Selections")
			DB_AddToMenu(DB_t_CUrrentMenuReference; $_t_SelectionMenuItem; -1; $_t_SelectionName; "DB_SelectSet"; ""; String:C10(SM_l_ContextItemID))
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("SEL_SaveRecordSelection"; $_t_oldMethodName)
