If (False:C215)
	//Project Form Method Name: DB_PrintOutputForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/01/2012 09:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	C_BOOLEAN:C305($_bo_UseContext; DB_bo_NoLoad; DB_bo_RootTabDefined)
	C_LONGINT:C283($_l_ContextRow; $_l_event; DB_l_CurrentDisplayedForm; DB_l_RootTabTable)
	C_POINTER:C301($_ptr_ArrayofColumnFonts; $_ptr_ArrayReferences; $_ptr_LBTable; $_ptr_ListboxAreaOLD; $_ptr_ListBoxSetup)
	C_REAL:C285(DB_Lb_PrintFields)
	C_TEXT:C284($_t_ButtPrefix; $_t_LevelID; $_t_LevelSTR2; $_t_ObjectPrefix; $_t_oldMethodName; DB_t_CurrentContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM DB_PrintOutputForm"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (DB_t_CurrentContext#"")
			$_bo_UseContext:=True:C214
			If (DB_bo_RootTabDefined)
				$_bo_UseContext:=False:C215
				If (DB_l_RootTabTable=DB_l_CurrentDisplayedForm)
					$_bo_UseContext:=True:C214
				End if 
			End if 
			If ($_bo_UseContext)
				$_l_ContextRow:=Find in array:C230(DB_at_ContextNames; DB_t_CurrentContext)
			Else 
				$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
			End if 
		Else 
			$_l_ContextRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		End if 
		
		$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_ContextRow}
		$_ptr_ListboxAreaOLD:=$_ptr_ListBoxSetup->{1}
		$_ptr_ListBoxSetup->{1}:=->DB_Lb_PrintFields
		$_ptr_ListboxAreaOLD:=$_ptr_ListBoxSetup->{1}
		$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
		$_ptr_ArrayofColumnFonts:=$_ptr_ListBoxSetup->{16}
		$_t_LevelID:=$_ptr_ArrayReferences->{1}
		$_t_LevelSTR2:=Substring:C12($_t_LevelID; 2; Length:C16($_t_LevelID))
		$_t_ObjectPrefix:="o"+$_t_LevelSTR2
		$_t_ButtPrefix:="o"+$_t_LevelSTR2+"_L"
		$_ptr_LBTable:=$_ptr_ListBoxSetup->{10}
		LBi_LoadSetup($_ptr_ListBoxSetup)
		LB_StyleSettings($_ptr_ListboxAreaOLD; $_ptr_ArrayReferences->{2}; $_ptr_ArrayofColumnFonts->{1}; $_t_ObjectPrefix; $_ptr_LBTable; 256; "Black"; 1)  // set colours, fonts etc. 29/06/06 pb
		
		DB_SetFormSize(DB_l_CurrentDisplayedForm; ->DB_Lb_PrintFields; 0; 0; False:C215)
		$_ptr_ListBoxSetup->{1}:=$_ptr_ListboxAreaOLD
		
End case 
ERR_MethodTrackerReturn("FM DB_PrintOutputForm"; $_t_oldMethodName)
