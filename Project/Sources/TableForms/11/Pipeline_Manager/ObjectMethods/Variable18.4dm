If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable18
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SP_ad_TargetFromDate;0)
	//ARRAY DATE(SP_ad_TargettoDate;0)
	//ARRAY LONGINT(SP_al_atCurrencyID;0)
	//ARRAY LONGINT(SP_al_PipelineStatus;0)
	//ARRAY LONGINT(SP_al_POPCurrencyIDs;0)
	//ARRAY LONGINT(SP_al_RecordModified;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_TargetOGroupID;0)
	//ARRAY LONGINT(SP_al_TargetOPersonID;0)
	//ARRAY LONGINT(SP_al_TargetPeriod;0)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY REAL(SP_ar_atSalesValue;0)
	//ARRAY REAL(SP_ar_PipelineResult;0)
	//ARRAY REAL(SP_ar_TargetProjection;0)
	//ARRAY TEXT(SP_at_AdHocOwner;0)
	//ARRAY TEXT(SP_at_atCurrencyCode;0)
	//ARRAY TEXT(SP_at_atSalesTitle;0)
	//ARRAY TEXT(SP_at_ListboxEditMode;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_TargetOGroupID;0)
	//ARRAY TEXT(SP_at_TargetOPersonID;0)
	//ARRAY TEXT(SP_at_TargetOwner;0)
	//ARRAY TEXT(SP_at_TargetPeriod;0)
	//ARRAY TEXT(SP_at_TargetType;0)
	//ARRAY TEXT(SP_at_tTargetType;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_DATE:C307(SP_D_TFilterFromDate; SP_D_TFilterToDate)
	C_LONGINT:C283($_l_ArraySize; $_l_CurrencyRow; $_l_Index; $_l_RelatedCompanyID; $_l_SalesProjectionStateID; BaddTarget; SP_l_GroupID; SP_l_RelatedCompanyID; SP_l_TButtonMode; SP_l_tFilterType; SP_l_tGroupID)
	C_LONGINT:C283(SP_l_tPersonelID; SP_l_tSalesProjectionStateID; SP_NextTarget)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; SP_t_AdHocName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable18"; Form event code:C388)
If (SP_l_TButtonMode=0)
	Case of 
		: (SP_at_ListboxEditMode=1)
			If (Size of array:C274(SP_al_SalesProjectionID)>0)
				For ($_l_Index; 1; Size of array:C274(SP_al_RecordModified))
					If (SP_al_RecordModified{$_l_Index}>0)
						SP_UpdateTargetFromPV($_l_Index)
					End if 
				End for 
				<>NoUpdate:=False:C215
			End if 
			HIDE WINDOW:C436
			$_l_SalesProjectionStateID:=SP_l_tSalesProjectionStateID
			$_l_RelatedCompanyID:=SP_l_RelatedCompanyID
			
			
			SP_NewTarget(False:C215; False:C215; SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName)
			SP_l_tSalesProjectionStateID:=$_l_SalesProjectionStateID
			SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID; SP_l_tFilterType)
			If (SP_l_tPersonelID>0)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SP_l_tPersonelID)
			Else 
				UNLOAD RECORD:C212([PERSONNEL:11])
				If (SP_l_GroupID>0)
					CREATE RECORD:C68([PERSONNEL:11])
					QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=SP_l_GroupID)
					[PERSONNEL:11]Name:2:=[PERSONNEL_GROUPS:92]Group_Name:2
				Else 
					CREATE RECORD:C68([PERSONNEL:11])
					[PERSONNEL:11]Name:2:="Everyone"
				End if 
			End if 
			
			SHOW WINDOW:C435
		: (SP_at_ListboxEditMode=2)
			<>NoUpdate:=True:C214
			OBJECT SET TITLE:C194(BaddTarget; "Save Target")
			SP_l_TbuttonMode:=1
			$_l_ArraySize:=Size of array:C274(SP_al_SalesProjectionID)
			INSERT IN ARRAY:C227(SP_al_SalesProjectionID; 0)
			INSERT IN ARRAY:C227(SP_at_atSalesTitle; 1; 1)
			INSERT IN ARRAY:C227(SP_al_RecordModified; 1; 1)
			INSERT IN ARRAY:C227(SP_al_atCurrencyID; 1; 1)
			INSERT IN ARRAY:C227(SP_at_atCurrencyCode; 1; 1)
			INSERT IN ARRAY:C227(SP_ar_atSalesValue; 1; 1)
			INSERT IN ARRAY:C227(SP_al_PipelineStatus; 1; 1)
			INSERT IN ARRAY:C227(SP_at_PipelineStatus; 1; 1)
			INSERT IN ARRAY:C227(SP_ar_PipelineResult; 1; 1)
			INSERT IN ARRAY:C227(SP_ad_TargetFromDate; 1; 1)
			INSERT IN ARRAY:C227(SP_ad_TargettoDate; 1; 1)
			INSERT IN ARRAY:C227(SP_al_atCurrencyID; 1; 1)
			INSERT IN ARRAY:C227(SP_at_atCurrencyCode; 1; 1)
			INSERT IN ARRAY:C227(SP_al_TargetPeriod; 1; 1)
			INSERT IN ARRAY:C227(SP_at_TargetPeriod; 1; 1)
			INSERT IN ARRAY:C227(SP_at_AdHocOwner; 1; 1)
			INSERT IN ARRAY:C227(SP_al_TargetOPersonID; 1; 1)
			INSERT IN ARRAY:C227(SP_al_TargetOGroupID; 1; 1)
			INSERT IN ARRAY:C227(SP_at_TargetOPersonID; 1; 1)
			INSERT IN ARRAY:C227(SP_at_TargetOGroupID; 1; 1)
			INSERT IN ARRAY:C227(SP_at_TargetOwner; 1; 1)
			INSERT IN ARRAY:C227(SP_al_TargetType; 1; 1)
			INSERT IN ARRAY:C227(SP_at_TargetType; 1; 1)
			INSERT IN ARRAY:C227(SP_ar_TargetProjection; 1; 1)
			
			SP_at_TargetOwner{1}:=SP_t_AdHocName
			If (SP_l_tPersonelID>0)
				SP_al_TargetOPersonID{1}:=SP_l_tPersonelID
			End if 
			If (SP_l_tGroupID>0)
				SP_al_TargetOGroupID{1}:=SP_l_tGroupID
			End if 
			
			
			
			SP_al_SalesProjectionID{1}:=-(SP_NextTarget)
			SP_NextTarget:=SP_NextTarget+1
			//note if the users switches out of this row
			//and has not entered proper data we dont save it and we delete the row
			//set the TYPES pop-up
			If (Size of array:C274(SP_at_tTargetType)>1)
				//set column 9 to include a pop-up
				//AL_SetEnterable (SP_PowerviewTarget;3;2;SP_at_tTargetType)
				LB_SetChoiceList("lbTarget"; ->SP_at_tTargetType; ->SP_at_TargetType)
			Else 
				//AL_SetEnterable (SP_PowerviewTarget;3;0)
				OBJECT SET ENTERABLE:C238(SP_at_TargetType; False:C215)
				SP_LoadTableNames
				SP_at_tTargetType:=1
				SP_al_TargetType{1}:=SP_al_TargetType{SP_at_tTargetType}
				SP_at_TargetType{1}:=SP_at_tTargetType{SP_at_tTargetType}
			End if 
			SP_at_atCurrencyCode{1}:=<>SYS_t_BaseCurrency
			$_l_CurrencyRow:=Find in array:C230(SP_at_PopCurrencyCodes; <>SYS_t_BaseCurrency)
			If ($_l_CurrencyRow>0)
				SP_al_atCurrencyID{1}:=SP_al_POPCurrencyIDs{$_l_CurrencyRow}
			End if 
			//ARRAY INTEGER($2darray;0;0)
			Case of 
				: (SP_at_ListboxEditMode=1)
					//AL_SetEntryOpts (SP_PowerviewTarget;4;1;0;0;0;".";1)
				: (SP_at_ListboxEditMode=2)
					//AL_SetEntryOpts (SP_PowerviewTarget;2;1;0;0;0;".";1)
			End case 
			//AL_SetCellEnter (SP_PowerviewTarget;1;1;0;0;$2darray;0)
			OBJECT SET ENTERABLE:C238(SP_at_TargetOwner; False:C215)
			//AL_SetCellEnter (SP_PowerviewTarget;2;1;0;0;$2darray;1)
			OBJECT SET ENTERABLE:C238(SP_at_atSalesTitle; True:C214)
			If (SP_al_TargetPeriod{1}>0)
				// todo: Don't know what to do about these pb
				//AL_SetCellEnter (SP_PowerviewTarget;5;1;0;0;$2darray;-1)
				//AL_SetCellEnter (SP_PowerviewTarget;6;1;0;0;$2darray;-1)
			Else 
				//AL_SetCellEnter (SP_PowerviewTarget;5;1;0;0;$2darray;1)
				OBJECT SET ENTERABLE:C238(SP_ad_TargetFromDate; True:C214)
				//AL_SetCellEnter (SP_PowerviewTarget;6;1;0;0;$2darray;1)
				OBJECT SET ENTERABLE:C238(SP_ad_TargettoDate; True:C214)
			End if 
			
			//AL_SetCellEnter (SP_PowerviewTarget;7;1;0;0;$2darray;1)
			OBJECT SET ENTERABLE:C238(SP_at_atCurrencyCode; True:C214)
			//AL_SetCellEnter (SP_PowerviewTarget;9;1;0;0;$2darray;1)
			OBJECT SET ENTERABLE:C238(SP_ar_TargetProjection; True:C214)
			//NG TODO-cell enter
			//AL_SetCellEnter (SP_PowerviewTarget;10;1;0;0;$2darray;1)
			OBJECT SET ENTERABLE:C238(SP_ar_PipelineResult; True:C214)
			
			// todo: what to do about these?
			For ($_l_Index; 1; Size of array:C274(SP_ad_TargettoDate))
				If (SP_ad_TargettoDate{$_l_Index}<Current date:C33(*)) & (SP_ad_TargettoDate{$_l_Index}>!00-00-00!)
					//NG TODO-cell enter
					//AL_SetCellEnter (SP_PowerviewTarget;1;$_l_Index;12;$_l_Index;$2darray;-1)
					//NG TODO-cell enter
					//AL_SetCellEnter (SP_PowerviewTarget;1;$_l_Index;12;$_l_Index;$2darray;0)
				End if 
			End for 
			//AL_UpdateArrays (SP_PowerviewTarget;-2)
			
	End case 
Else 
	<>NoUpdate:=False:C215
	OBJECT SET TITLE:C194(BaddTarget; "Add Target")
	SP_UpdateTargetFromPV(1)
	SP_l_TbuttonMode:=0
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable18"; $_t_oldMethodName)
