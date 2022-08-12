If (False:C215)
	//object Name: [USER]WS_SetManager.Radio Button2
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
	//ARRAY LONGINT(SM_al_SetitemsClassID;0)
	//ARRAY LONGINT(SM_al_SetitemsID;0)
	C_BOOLEAN:C305($_bo_SaveItem; SM_bo_Busy)
	C_LONGINT:C283($_l_ContextID; $_l_SelectedListItem; $_l_FieldNumber; $_l_ItemReference; $_l_ListItemRow; $_l_ProcessState; $_l_ProcessTime; $_l_SelectedItemRef; $_l_SourceProcess; $_l_SubListID; $_l_TableNumber)
	C_LONGINT:C283($srcElement; SM_HL_l_SETMANAGER; SM_l_CallBack; SM_l_MonitorCall; SM_l_UpdateOnCallBackID; SM_RB_1; SM_RB_2; SM_RB_3; SM_RB_4; SM_RB_5; SM_SaveSelection)
	C_POINTER:C301($_Ptr_Table)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_ProcessName; $_t_VariableName; SM_t_loadedsetName; SM_t_UseSetName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Radio Button2"; Form event code:C388)
//THIS WILL CALL THE CALL BACK PROCESS AND REQUEST
// THAT THE CURRENT SELECTION IS SAVED INTO A SET
//THE SET WILL BE PASSED TO THIS PROCESS
//IT WILL BE SAVED INTO A NEW SET
OBJECT SET ENABLED:C1123(SM_SaveSelection; False:C215)
//_O_DISABLE BUTTON(SM_SaveSelection)
$_l_SelectedListItem:=Selected list items:C379(SM_HL_l_SETMANAGER)
$_bo_SaveItem:=False:C215
$_l_SelectedItemRef:=0
SM_l_UpdateOnCallBackID:=0
SM_t_loadedsetName:=""
//the above object( $_bo_SaveItem) is so we know
//that intersections and set comparisons can be saved
//selection class 854 is entirely based on Macros(dynamic sets)
//so an intersection etc just updates the screen cannot update the selection
If ($_l_SelectedListItem>0)
	GET LIST ITEM:C378(SM_HL_l_SETMANAGER; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SubListID)
	If ($_l_ItemReference<10000)  // an item is selected(max 9999 lists!)
		//it should be here because we are disabling the buttons
		$_l_SelectedItemRef:=$_l_ItemReference
		$_l_ListItemRow:=Find in array:C230(SM_al_SetitemsID; $_l_ItemReference)
		
		Case of 
			: ($_l_ListItemRow<0)
				$_bo_SaveItem:=False:C215
			: (SM_al_SetitemsClassID{$_l_ListItemRow}=853) | (SM_al_SetitemsClassID{$_l_ListItemRow}=852)
				$_bo_SaveItem:=True:C214
			Else 
				$_bo_SaveItem:=False:C215
		End case 
	End if 
End if 

Case of 
	: (SM_RB_1=1)  //save set-this will return the set
		If ($_l_SelectedItemRef#0)
			//Gen_Confirm ("Add to list "+$_t_ItemText+"?";"Yes";"No")
			// If (SM_SaveSelection=1)
			
			
			SM_t_loadedsetName:=SM_LoadSet($_l_SelectedItemRef; False:C215; True:C214)
			SM_l_UpdateOnCallBackID:=$_l_SelectedItemRef
			//End if
			
			If (SM_l_CallBack>0)
				PROCESS PROPERTIES:C336(SM_l_CallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 29/05/02
				If ($_l_ProcessState>=0)  // 29/05/02
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 1)
					POST OUTSIDE CALL:C329(SM_l_CallBack)
					
				End if 
			End if 
		End if 
		SM_RB_1:=0
	: (SM_RB_3=1)
		If ($_l_SelectedItemRef#0)
			If (SM_l_CallBack>0) & ($_l_SelectedItemRef#0)
				//First we must get the set into memory
				SM_t_loadedsetName:=SM_LoadSet($_l_SelectedItemRef)
				USE SET:C118(SM_t_loadedsetName)
				$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ListItemRow}
				$_l_TableNumber:=SM_TableFromContextID($_l_ContextID)
				SM_RB_2:=0
				If ($_bo_SaveItem)
					//Gen_Confirm ("Save modified version of list?";"Yes";"No")
					If (SM_SaveSelection=1)
						SM_l_UpdateOnCallBackID:=$_l_SelectedItemRef
					End if 
				End if 
				If (SM_l_CallBack>0)
					PROCESS PROPERTIES:C336(SM_l_CallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 29/05/02
					If ($_l_ProcessState>=0)  // 29/05/02
						$_Ptr_Table:=Table:C252($_l_TableNumber)
						CREATE SET:C116($_Ptr_Table->; "<>SM_CallSet"+String:C10($_l_TableNumber))
						SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_t_UseSetName; "<>SM_CallSet"+String:C10($_l_TableNumber))
						SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_UpdateOnCallBackID; SM_l_UpdateOnCallBackID)
						SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 2)
						POST OUTSIDE CALL:C329(SM_l_CallBack)
						
					End if 
				End if 
			End if 
		End if 
		
	: (SM_RB_2=1)  //unite
		If ($_l_SelectedItemRef#0)
			If (SM_l_CallBack>0) & ($_l_SelectedItemRef#0)
				SM_t_loadedsetName:=SM_LoadSet($_l_SelectedItemRef)
				USE SET:C118(SM_t_loadedsetName)
				$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ListItemRow}
				$_l_TableNumber:=SM_TableFromContextID($_l_ContextID)
			End if 
			SM_RB_3:=0
			If ($_bo_SaveItem)
				//Gen_Confirm ("Save modified version of list?";"Yes";"No")
				If (SM_SaveSelection=1)
					SM_l_UpdateOnCallBackID:=$_l_SelectedItemRef
				End if 
			End if 
			$_Ptr_Table:=Table:C252($_l_TableNumber)
			If (SM_l_CallBack>0)
				PROCESS PROPERTIES:C336(SM_l_CallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 29/05/02
				If ($_l_ProcessState>=0)  // 29/05/02
					
					CREATE SET:C116($_Ptr_Table->; "<>SM_CallSet"+String:C10($_l_TableNumber))
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_t_UseSetName; "<>SM_CallSet"+String:C10($_l_TableNumber))
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_UpdateOnCallBackID; SM_l_UpdateOnCallBackID)
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 3)
					POST OUTSIDE CALL:C329(SM_l_CallBack)
					
				End if 
			End if 
			
		End if 
	: (SM_RB_4=1)
		If ($_l_SelectedItemRef#0)
			If (SM_l_CallBack>0) & ($_l_SelectedItemRef#0)
				SM_t_loadedsetName:=SM_LoadSet($_l_SelectedItemRef; True:C214)
				USE SET:C118(SM_t_loadedsetName)
				$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ListItemRow}
				$_l_TableNumber:=SM_TableFromContextID($_l_ContextID)
			Else 
				$_l_TableNumber:=SM_TableFromContextID($_l_ContextID)
				
			End if 
			SM_RB_4:=0
			If ($_bo_SaveItem)
				// Gen_Confirm ("Save modified version of list?";"Yes";"No")
				If (SM_SaveSelection=1)
					SM_l_UpdateOnCallBackID:=$_l_SelectedItemRef
				End if 
			End if 
			$_Ptr_Table:=Table:C252($_l_TableNumber)
			If (SM_l_CallBack>0)
				PROCESS PROPERTIES:C336(SM_l_CallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 29/05/02
				If ($_l_ProcessState>=0)  // 29/05/02
					CREATE SET:C116($_Ptr_Table->; "<>SM_CallSet"+String:C10($_l_TableNumber))
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_t_UseSetName; "<>SM_CallSet"+String:C10($_l_TableNumber))
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_UpdateOnCallBackID; SM_l_UpdateOnCallBackID)
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 4)
					POST OUTSIDE CALL:C329(SM_l_CallBack)
					
				End if 
			End if 
			
		End if 
	: (SM_RB_5=1) & ($_l_SelectedItemRef#0)
		If ($_l_SelectedItemRef#0)
			If (SM_l_CallBack>0) & ($_l_SelectedItemRef#0)
				SM_t_loadedsetName:=SM_LoadSet($_l_SelectedItemRef)
				USE SET:C118(SM_t_loadedsetName)
				$_l_ContextID:=SM_al_SetContextItemContextID{$_l_ListItemRow}
				$_l_TableNumber:=SM_TableFromContextID($_l_ContextID)
				
				
			End if 
			SM_RB_5:=0
			If ($_bo_SaveItem)
				//Gen_Confirm ("Save modified version of list?";"Yes";"No")
				If (SM_SaveSelection=1)
					SM_l_UpdateOnCallBackID:=$_l_SelectedItemRef
				End if 
			End if 
			$_Ptr_Table:=Table:C252($_l_TableNumber)
			If (SM_l_CallBack>0)
				PROCESS PROPERTIES:C336(SM_l_CallBack; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 29/05/02
				If ($_l_ProcessState>=0)  // 29/05/02
					CREATE SET:C116($_Ptr_Table->; "<>SM_CallSet"+String:C10($_l_TableNumber))
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_t_UseSetName; "<>SM_CallSet"+String:C10($_l_TableNumber))
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_UpdateOnCallBackID; SM_l_UpdateOnCallBackID)
					SET PROCESS VARIABLE:C370(SM_l_CallBack; SM_l_MonitorCall; 5)
					POST OUTSIDE CALL:C329(SM_l_CallBack)
				End if 
			End if 
		End if 
		
End case 
SM_SaveSelection:=0
SM_bo_Busy:=False:C215
ERR_MethodTrackerReturn("OBJ:WS_SetManager,Baction"; $_t_oldMethodName)