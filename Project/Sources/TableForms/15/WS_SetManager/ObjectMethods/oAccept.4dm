If (False:C215)
	//object Name: [USER]WS_SetManager.Button2
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
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_BOOLEAN:C305($_bo_Expanded; $_bo_Repeat; SM_bo_Busy)
	C_LONGINT:C283($_l_CollapseIndex; $_l_CurrentSelectedItems; $_l_FieldNumber; $_l_index; $_l_ItemReference; $_l_itemReference2; $_l_OK; $_l_SourceProcess; $_l_SublistID; $_l_SubListID2; $_l_TableNumber)
	C_LONGINT:C283($_l_VirtualTableNumber; SM_HL_l_SETMANAGER; WS_l_ContextID)
	C_TEXT:C284($_t_ItemText; $_t_ItemText2; $_t_oldMethodName; $_t_VariableName; WS_t_ContextLabel)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button2"; Form event code:C388)
$_l_OK:=1
If (WS_t_ContextLabel#"") & (<>DB_at_TableNames>0)
	$_l_VirtualTableNumber:=10000+<>DB_at_TableNames
	Repeat 
		$_bo_Repeat:=False:C215
		For ($_l_index; 1; Count list items:C380(SM_HL_l_SETMANAGER))
			GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_index; $_l_ItemReference; $_t_ItemText)
			SM_ListItemShared($_l_ItemReference)
			If ($_t_ItemText=WS_t_ContextLabel)
				//      ALERT("You already have a context called "+WS_t_ContextLabel+"! Each Con
				Gen_Alert("You already have a context called "+WS_t_ContextLabel+"! Each Context must be unique.")
				$_l_OK:=0
			End if 
			If ($_l_ItemReference=$_l_VirtualTableNumber)
				$_l_VirtualTableNumber:=$_l_VirtualTableNumber+1000
				$_bo_Repeat:=True:C214
			End if 
		End for 
	Until ($_bo_Repeat=False:C215)
	If ($_l_OK=1)
		//we can now add this to the list
		APPEND TO LIST:C376(SM_HL_l_SETMANAGER; WS_t_ContextLabel; $_l_VirtualTableNumber; 0; False:C215)
		SET LIST ITEM PROPERTIES:C386(SM_HL_l_SETMANAGER; $_l_VirtualTableNumber; True:C214; Bold:K14:2; 0)
		////////_o_REDRAW LIST(SM_HL_l_SETMANAGER)
		SM_UpdateArrays("PER"; ""; 0; 0; WS_t_ContextLabel; $_l_VirtualTableNumber)
		For ($_l_CollapseIndex; Count list items:C380(SM_HL_l_SETMANAGER); 1; -1)
			GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_CollapseIndex; $_l_itemReference2; $_t_ItemText2; $_l_SubListID2; $_bo_Expanded)
			
			SET LIST ITEM:C385(SM_HL_l_SETMANAGER; $_l_itemReference2; $_t_ItemText2; $_l_itemReference2; $_l_SubListID2; False:C215)
		End for 
		
		SELECT LIST ITEMS BY REFERENCE:C630(SM_HL_l_SETMANAGER; $_l_VirtualTableNumber)
		$_l_CurrentSelectedItems:=Selected list items:C379(SM_HL_l_SETMANAGER)
		<>DB_at_TableNames:=0
		WS_t_ContextLabel:=""
		WS_l_ContextID:=0
		FORM GOTO PAGE:C247(1)
		
	End if 
End if 
SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Button2"; $_t_oldMethodName)
