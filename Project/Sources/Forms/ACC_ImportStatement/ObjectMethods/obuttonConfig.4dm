If (False:C215)
	//object Method Name: Object Name:      ACC_ImportStatement.obuttonConfig
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/09/2013 17:18
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>LB_al_FormTables;0)
	//ARRAY POINTER(DB_aptr_BankStatements;0)
	//ARRAY TEXT(<>DB_at_LBViews;0)
	ARRAY TEXT:C222($_at_PersonInitials; 0)
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited; <>PER_bo_SystemSettingAccess; $_bo_LoadSetup)
	C_LONGINT:C283($_l_AddMode; $_l_CountPersons; $_l_DefinitionFormID; $_l_Event; $_l_Index; $_l_No; $_l_Row; DB_l_CurrentDisplayedForm; LAY_l_CurrentDefsFormID; LAY_l_CurrentDefsTable; vAdd)
	C_LONGINT:C283(vNo)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_LBVarPointer; $_Ptr_ListBox)
	C_TEXT:C284($_t_CloseSave; $_t_CurrentDefinitionsName2; $_t_CurrentUserDefinitionsName; $_t_FormName; $_t_LayoutReference; $_t_oldMethodName; DB_t_CallOnCloseorSave; LAY_t_CurrentDefsName; LAY_t_CurrentUserDefs)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_ImportStatement.obuttonConfig"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		//it shoud be!
		$_ptr_LBVarPointer:=->DB_aptr_BankStatements
		$_t_CurrentDefinitionsName2:=""
		//edit the listbox area settings
		If ((<>PER_bo_SystemSettingAccess) & (<>PER_bo_LbDefinitiionsInited))
			//LBi_DelBckgrdElem ($_ptr_LBVarPointer)  `deletes elements from the Interproc arrays
			//LBi_pRefs4upd ($1)  `update the records to reflect changes to the arrays
			$_Ptr_ListBox:=$_ptr_LBVarPointer->{1}
			$_ptr_ArrayReferences:=$_ptr_LBVarPointer->{9}
			$_t_CurrentDefinitionsName2:=$_ptr_ArrayReferences->{6}
			//$Lay2:=DB_t_CurrentFormUsage2
			//$Lay3:=DB_t_CurrentFormUsage3
			$_l_AddMode:=vAdd
			$_l_No:=vNo
			$_t_CurrentDefinitionsName2:=$_ptr_ArrayReferences->{6}
			$_t_CurrentUserDefinitionsName:=$_ptr_ArrayReferences->{7}
			LAY_l_CurrentDefsTable:=DB_l_CurrentDisplayedForm
			LAY_t_CurrentUserDefs:=$_ptr_ArrayReferences->{7}
			LAY_t_CurrentDefsName:=$_ptr_ArrayReferences->{6}
			$_l_DefinitionFormID:=Num:C11(Substring:C12($_t_CurrentDefinitionsName2; 4))
			LAY_l_CurrentDefsFormID:=$_l_DefinitionFormID
			$_t_FormName:=LBI_GetLayoutName($_t_CurrentDefinitionsName2)
			If ($_t_FormName="")
				LB_CheckLayouts(LAY_l_CurrentDefsTable)
				//TRACE
				$_l_Row:=Find in array:C230(<>LB_al_FormTables; LAY_l_CurrentDefsTable)
				If ($_l_Row>0)
					If ($_l_DefinitionFormID<=Size of array:C274(<>DB_at_LBViews{$_l_Row}))
						$_t_FormName:=<>DB_at_LBViews{$_l_Row}{$_l_DefinitionFormID}
					Else 
						$_t_FormName:=$_ptr_ArrayReferences->{9}
						//$_t_FormName:="??"
					End if 
				Else 
					$_t_FormName:="??"
				End if 
			End if 
			
			$_t_CloseSave:=DB_t_CallOnCloseorSave
			DB_t_CallOnCloseorSave:="DClose"
			Open_Pro_Window("Definitions for "+$_t_FormName; 0; 1; ->[LIST_LAYOUTS:96]; "Layouts_Out")
			DIALOG:C40("LAYOUT_CONFIG")
			Close_ProWin
			If ($_t_CurrentUserDefinitionsName="")
				Gen_Confirm("You have been editing the Default Listing Layout Definitions.  "+"You might therefore like to Delete all Personal Definitions"+" (ie those with Personnel Initials)"+" in order that they will revert to the Default."; "Keep them"; "Delete them")
				If (OK=0)
					Gen_Confirm("Are you sure you want to Delete the Personal Definitions?"; "No"; "Yes")
					If (OK=0)
						ALL RECORDS:C47([PERSONNEL:11])
						SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_PersonInitials)
						$_l_CountPersons:=Size of array:C274($_at_PersonInitials)
						For ($_l_Index; 1; $_l_CountPersons)
							$_t_LayoutReference:=$_t_CurrentDefinitionsName2+$_at_PersonInitials{$_l_Index}
							QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_LayoutReference)
							DELETE SELECTION:C66([LIST_LAYOUTS:96])
						End for 
					End if 
				End if 
			End if 
			DB_t_CallOnCloseorSave:=$_t_CloseSave
			//LBi_EditListUpd ($_ptr_LBVarPointer)
			
			
			$_bo_LoadSetup:=True:C214
			
			
			LBi_InclFields(->DB_aptr_BankStatements; True:C214; True:C214)
			LBi_LoadSetup(->DB_aptr_BankStatements)
			UNLOAD RECORD:C212([LIST_LAYOUTS:96])
			
			//vAdd:=$_l_AddMode
			//DB_t_CurrentFormUsage2:=$Lay2
			//DB_t_CurrentFormUsage3:=$Lay3
			//vNo:=$_l_No
			//$ALMode:=0
			
			
		Else 
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ:WS_Buttons,PAL_BUTTON_45"; $_t_oldMethodName)
