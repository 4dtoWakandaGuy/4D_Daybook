If (False:C215)
	//object Name: [USER]User_In.oLBPriorities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 08:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Priorities;0)
	//ARRAY INTEGER(SD_aI_PriorityDF;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_CurrentSortColumnndex; $_l_event; $_l_FieldNumber; $_l_Index; $_l_SelectedRow; $_l_TableNumber; $_l_Valid; b_ModPriority)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; SD_t_PriorityName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oLBPriorities"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_SelectedRow:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_CurrentSortColumnndex:=LB_GetColumn(->SD_lb_Priorities; $_t_VariableName)
		Case of 
			: ($_l_CurrentSortColumnndex=1)
				If ($_l_SelectedRow>0)
					$_l_Valid:=SD_aI_PriorityDF{$_l_SelectedRow}
					If ($_l_Valid=1)
						Gen_Alert("Change the default by selecting the new default")
					Else 
						For ($_l_Index; 1; Size of array:C274(SD_aI_PriorityDF))
							SD_aI_PriorityDF{$_l_Index}:=0
						End for 
						SD_aI_PriorityDF{$_l_SelectedRow}:=1
						[USER:15]Diary Priority:68:=String:C10(SD_al_PriorityNUM{$_l_SelectedRow})
						SD_bo_ChangePrefs:=True:C214
					End if 
				End if 
				
			: ($_l_CurrentSortColumnndex=2)
				If ($_l_SelectedRow>0)
					SD_t_PriorityName:=SD_at_PriorityNM{$_l_SelectedRow}
					OBJECT SET ENABLED:C1123(b_ModPriority; True:C214)
					//_O_ENABLE BUTTON(b_ModPriority)
				Else 
					SD_t_PriorityName:=""
					OBJECT SET ENABLED:C1123(b_ModPriority; False:C215)
					//_O_DISABLE BUTTON(b_ModPriority)
				End if 
				
		End case 
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oLBPriorities"; $_t_oldMethodName)
