If (False:C215)
	//object Name: [USER]WS_SetManager.Button5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/04/2011 09:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SM_al_SetContextItemContextID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	C_BOOLEAN:C305(SM_bo_Busy)
	C_LONGINT:C283($_l_ContextID; $_l_event; $_l_FieldNumber; $_l_FrontMostProcess; $_l_ItemReference; $_l_ListItemRow; $_l_SelectedListItem; $_l_SourceProcess; $_l_SourceRow; $_l_SubListID; $_l_TableNumber)
	C_LONGINT:C283(SM_HL_l_SETMANAGER; SM_l_CallBack; SM_l_MonitorCall)
	C_POINTER:C301($_Ptr_SourceObject; $_Ptr_Table)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_VariableName; SM_t_loadedsetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Button5"; Form event code:C388)
SM_bo_Busy:=True:C214
SM_SaveModifiedList

//this button takes the set and saves it to disk
//Hold down the option key to save the current selection
//or drag from the current selection
If (SM_CheckActionOK("Add"; "list"))
	
	$_l_event:=Form event code:C388
	Case of 
		: ($_l_event=On Clicked:K2:4)
			If (Macintosh option down:C545) | (Windows Alt down:C563)
				//then save the list from the current selection
				$_l_FrontMostProcess:=Frontmost process:C327(*)
				If (SM_l_CallBack>0)
					
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 8)
					POST OUTSIDE CALL:C329(SM_l_CallBack)
				End if 
				
			Else 
				
				$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
				If ($_l_SelectedListItem>0)
					GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
					SM_ListItemShared($_l_ItemReference)
					If ($_l_ItemReference<10000)
						//we must get the CONTEXT of the item
						$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
						$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ListItemRow}
						$_l_TableNumber:=SM_TableFromContextID($_l_ContextID)
						//Now Load the saved selection
						SM_t_loadedsetName:=SM_LoadSet($_l_ItemReference; True:C214)
						//we now have a set in memory
						$_Ptr_Table:=Table:C252($_l_TableNumber)
						SAVE SET:C184("TempSet"; "")
					Else 
						//      ALERT("You must select a list to save to a set")
						Gen_Alert("You must select a list to save to a set.")
					End if 
				End if 
			End if 
			
		: ($_l_event=On Drop:K2:12)
			_O_DRAG AND DROP PROPERTIES:C607($_Ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
			
			SET PROCESS VARIABLE:C370($_l_SourceProcess; SM_l_MonitorCall; 8)
			POST OUTSIDE CALL:C329($_l_SourceProcess)
	End case 
End if 
SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ:WS_SetManager,BListtodisk"; $_t_oldMethodName)
