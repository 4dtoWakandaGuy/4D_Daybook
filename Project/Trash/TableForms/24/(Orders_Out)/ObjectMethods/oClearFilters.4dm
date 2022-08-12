If (False:C215)
	//object Name: [ORDERS]Orders_Out.oClearFilters
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
	//C_UNKNOWN(cNAA)
	//C_UNKNOWN(cNAL)
	//C_UNKNOWN(vAnalysis)
	//C_UNKNOWN(vAttendType)
	//C_UNKNOWN(VSales)
	//C_UNKNOWN(vSelPrev)
	//C_UNKNOWN(vSource)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(ORD_al_StatePos;0)
	//ARRAY TEXT(ORD_at_StateNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BOOLEAN:C305(ORD_bo_UnfilteredSetKnown)
	C_DATE:C307(vIDateF)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; cNAA; cNAL; $_l_event; $_l_Index; $_l_SizeofArray; ORD_l_SetID)
	C_TEXT:C284(ACC_t_CurrencyCode; ORD_t_SelectedStates; vAnalysis; vAttendType; VSales; vSelPrev; vSource; $_t_oldMethodName; ACC_t_CurrencyCode; ORD_t_SelectedStates)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.oClearFilters"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		cNAL:=0
		cNAA:=0
		vAnalysis:=""
		VSales:=""
		vAttendType:=""
		vSource:=""
		ACC_t_CurrencyCode:=""
		vIDateF:=!00-00-00!
		ORD_t_SelectedStates:=""
		$_l_SizeofArray:=Size of array:C274(MOD_al_ModuleAccessStatus)
		ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; 0)
		ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; $_l_SizeofArray)
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
		
		If (ORD_bo_UnfilteredSetKnown)
			USE SET:C118("OrdSelection"+String:C10(ORD_l_SetID))
		Else 
			ALL RECORDS:C47([ORDERS:24])
			vSelPrev:=""
			Orders_Sel("")
			ORD_l_SetID:=0
			ORD_l_SetID:=AA_GetNextID(->ORD_l_SetID)
			CREATE SET:C116([ORDERS:24]; "OrdSelection"+String:C10(ORD_l_SetID))
			ORD_bo_UnfilteredSetKnown:=True:C214
		End if 
		
		
		SRCH_Applyfilterstoselection(->[ORDERS:24])
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.oClearFilters"; $_t_oldMethodName)
