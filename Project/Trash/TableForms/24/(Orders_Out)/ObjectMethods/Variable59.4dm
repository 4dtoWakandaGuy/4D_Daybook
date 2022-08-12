If (False:C215)
	//object Name: [ORDERS]Orders_Out.Variable59
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(ORD_al_StatePos;0)
	//ARRAY TEXT(ORD_at_StateNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(ORD_bo_UnfilteredSetKnown)
	C_LONGINT:C283($_l_ModuleRow; $_l_Index; $_l_ModuleRow; ORD_l_SetID)
	C_TEXT:C284(ORD_t_SelectedStates; $_t_oldMethodName; ORD_t_SelectedStates)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.Variable59"; Form event code:C388)
If (ORD_at_StateNames>0)
	If (ORD_at_StateNames<Size of array:C274(ORD_at_StateNames))
		If (Position:C15("Select"; ORD_at_StateNames{ORD_at_StateNames})=1)
			For ($_l_Index; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
				MOD_al_ModuleAccessStatus{$_l_Index}:=0
			End for 
		End if 
		$_l_ModuleRow:=ORD_al_StatePos{ORD_at_StateNames}
		MOD_al_ModuleAccessStatus{$_l_ModuleRow}:=Abs:C99((MOD_al_ModuleAccessStatus{$_l_ModuleRow})-1)
	Else 
		For ($_l_Index; 1; Size of array:C274(MOD_al_ModuleAccessStatus))
			MOD_al_ModuleAccessStatus{$_l_Index}:=0
		End for 
	End if 
	ARRAY TEXT:C222(ORD_at_StateNames; 0)
	ARRAY LONGINT:C221(ORD_al_StatePos; 0)
	ORD_t_SelectedStates:=""
	For ($_l_Index; 1; Size of array:C274(SYS_at_RecordStateNames))
		APPEND TO ARRAY:C911(ORD_at_StateNames; "Select "+SYS_at_RecordStateNames{$_l_Index})
		APPEND TO ARRAY:C911(ORD_al_StatePos; $_l_Index)
		If (MOD_al_ModuleAccessStatus{$_l_Index}=0)
			APPEND TO ARRAY:C911(ORD_at_StateNames; "Add "+SYS_at_RecordStateNames{$_l_Index})
			APPEND TO ARRAY:C911(ORD_al_StatePos; $_l_Index)
		Else 
			APPEND TO ARRAY:C911(ORD_at_StateNames; "Subtract "+SYS_at_RecordStateNames{$_l_Index})
			APPEND TO ARRAY:C911(ORD_al_StatePos; $_l_Index)
			If (ORD_t_SelectedStates="")
				ORD_t_SelectedStates:=SYS_at_RecordStateNames{$_l_Index}
			Else 
				ORD_t_SelectedStates:=ORD_t_SelectedStates+", "+SYS_at_RecordStateNames{$_l_Index}
			End if 
		End if 
		
	End for 
	APPEND TO ARRAY:C911(ORD_at_StateNames; "Clear All States ")
	APPEND TO ARRAY:C911(ORD_al_StatePos; 0)
	If (Not:C34(ORD_bo_UnfilteredSetKnown))
		//Remember the current selection
		ORD_l_SetID:=0
		ORD_l_SetID:=AA_GetNextID(->ORD_l_SetID)
		CREATE SET:C116([ORDERS:24]; "OrdSelection"+String:C10(ORD_l_SetID))
		ORD_bo_UnfilteredSetKnown:=True:C214
		
	Else 
		USE SET:C118("OrdSelection"+String:C10(Ord_l_SetID))
	End if 
	SRCH_Applyfilterstoselection(->[ORDERS:24])
	
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.Variable59"; $_t_oldMethodName)
