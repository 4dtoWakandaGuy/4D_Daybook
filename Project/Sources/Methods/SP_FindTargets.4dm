//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_FindTargets
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(<>SP_ad_TargetProjectionDate;0)
	//ARRAY DATE(SP_ad_TargetFromDate;0)
	//ARRAY DATE(SP_ad_TargettoDate;0)
	ARRAY LONGINT:C221($_al_CurrencyIDS; 0)
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	//ARRAY LONGINT(SP_al_atCurrencyID;0)
	//ARRAY LONGINT(SP_al_PipelineStatus;0)
	//ARRAY LONGINT(SP_al_RecordModified;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_TargetOGroupID;0)
	//ARRAY LONGINT(SP_al_TargetOPersonID;0)
	//ARRAY LONGINT(SP_al_TargetPeriod;0)
	//ARRAY LONGINT(SP_al_TargetPipelineStatus;0)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY REAL(<>SP_ar_TargetProjectionAmount;0)
	//ARRAY REAL(SP_ar_atSalesValue;0)
	//ARRAY REAL(SP_ar_PipelineResult;0)
	//ARRAY REAL(SP_ar_TargetProjection;0)
	ARRAY TEXT:C222($_at_CurrencyCodes; 0)
	ARRAY TEXT:C222($_at_PersonCodes; 0)
	//ARRAY TEXT(SP_at_AdHocOwner;0)
	//ARRAY TEXT(SP_at_atCurrencyCode;0)
	//ARRAY TEXT(SP_at_atSalesCustomerName;0)
	//ARRAY TEXT(SP_at_atSalesTitle;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_TargetOGroupID;0)
	//ARRAY TEXT(SP_at_TargetOPersonID;0)
	//ARRAY TEXT(SP_at_TargetOwner;0)
	//ARRAY TEXT(SP_at_TargetPeriod;0)
	//ARRAY TEXT(SP_at_TargetPipelineStatus;0)
	//ARRAY TEXT(SP_at_TargetType;0)
	//ARRAY TEXT(SP_at_tTargetType;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_DATE:C307($4; $5)
	C_LONGINT:C283($_l_AddedItemID; $_l_CurrencyRow; $_l_Index; $_l_Index2; $_l_ListID; $_l_StatusRow; $_l_TargetTypeRow; BaddTarget; SP_l_TbuttonMode; SP_NextTarget)
	C_POINTER:C301($6)
	C_REAL:C285($1; $2; $7)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_GroupCode; $_t_oldMethodName; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_FindTargets")
If (Not:C34(<>NoUpdate))
	
	$_l_ListID:=AA_GetListID(-1; -1; "Target Status"; "SP_S55_TargetStatus")
	ARRAY TEXT:C222(SP_at_TargetPipelineStatus; 0)
	ARRAY LONGINT:C221(SP_al_TargetPipelineStatus; 0)
	AA_LoadListbyID($_l_ListID; ->SP_at_TargetPipelineStatus; ->SP_al_TargetPipelineStatus; False:C215)
	If (Size of array:C274(SP_al_TargetPipelineStatus)=0)
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Projection Target"; "Completed Target")
		AA_LoadListbyID($_l_ListID; ->SP_at_TargetPipelineStatus; ->SP_al_TargetPipelineStatus; False:C215)
	End if 
	$_l_ListID:=AA_GetListID(-1; -1; "Target Type"; "SP_S55_TargetType")
	ARRAY TEXT:C222(SP_at_tTargetType; 0)
	ARRAY LONGINT:C221(SP_al_TargetType; 0)
	AA_LoadListbyID($_l_ListID; ->SP_at_tTargetType; ->SP_al_TargetType; False:C215)
	If (Size of array:C274(SP_al_TargetType)=0)
		$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Personal Target"; "Team Target")
		AA_LoadListbyID($_l_ListID; ->SP_at_tTargetType; ->SP_al_TargetType; False:C215)
	End if 
	SP_GetPeriods
	
	READ ONLY:C145([PERSONNEL:11])
	If (Count parameters:C259>=6)
		If ($1>0)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelOwnerID:4=$1)
			CREATE SET:C116([SALES_PROJECTION:113]; "OwnerMatch")
		Else 
			If ($2>0)
				READ ONLY:C145([PERSONNEL_GROUPS:92])
				
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=$2)
				
				
				
				$_t_GroupCode:=[PERSONNEL_GROUPS:92]Group_Code:1
				
				
				UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
				READ ONLY:C145([PERSONNEL:11])
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=$_t_GroupCode; *)
				QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=0)
				SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS; [PERSONNEL:11]Initials:1; $_at_PersonCodes)
				UNLOAD RECORD:C212([PERSONNEL:11])
				CREATE EMPTY SET:C140([SALES_PROJECTION:113]; "OwnerMatch")
				For ($_l_Index; 1; Size of array:C274($_at_PersonCodes))
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelOwnerID:4=$_al_PersonIDS{$_l_Index})
					CREATE SET:C116([SALES_PROJECTION:113]; "OwnerMatch_T")
					UNION:C120("OwnerMatch"; "OwnerMatch_T"; "OwnerMatch")
				End for 
				CLEAR SET:C117("OwnerMatch_T")
			Else 
				If ($3#"") & ($3#"Everyone")
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectionAdHocOwner:26=$3)
					CREATE SET:C116([SALES_PROJECTION:113]; "OwnerMatch")
				Else 
					ALL RECORDS:C47([SALES_PROJECTION:113])
					CREATE SET:C116([SALES_PROJECTION:113]; "OwnerMatch")
				End if 
				
			End if 
			
		End if 
		If ($4#!00-00-00!)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectionFromDate:22>=$4)
			CREATE SET:C116([SALES_PROJECTION:113]; "DateFromMatch")
		Else 
			USE SET:C118("OwnerMatch")
			CREATE SET:C116([SALES_PROJECTION:113]; "DateFromMatch")
		End if 
		If ($5#!00-00-00!)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectiontoDate:23<=$5)
			CREATE SET:C116([SALES_PROJECTION:113]; "DatetoMatch")
		Else 
			USE SET:C118("OwnerMatch")
			CREATE SET:C116([SALES_PROJECTION:113]; "DatetoMatch")
		End if 
		If ($6->>0)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Status:20=$6->)
			CREATE SET:C116([SALES_PROJECTION:113]; "StatusMatch")
		Else 
			USE SET:C118("OwnerMatch")
			CREATE SET:C116([SALES_PROJECTION:113]; "StatusMatch")
		End if 
		If (Count parameters:C259>=7)
			If ($7>0)
				QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Class_ID:2=$7)
				
				CREATE SET:C116([SALES_PROJECTION:113]; "TypeMatch")
			Else 
				USE SET:C118("OwnerMatch")
				CREATE SET:C116([SALES_PROJECTION:113]; "TypeMatch")
			End if 
		Else 
			USE SET:C118("OwnerMatch")
			CREATE SET:C116([SALES_PROJECTION:113]; "TypeMatch")
		End if 
		
		INTERSECTION:C121("OwnerMatch"; "TypeMatch"; "OwnerMatch")
		INTERSECTION:C121("OwnerMatch"; "StatusMatch"; "OwnerMatch")
		INTERSECTION:C121("OwnerMatch"; "DatetoMatch"; "OwnerMatch")
		INTERSECTION:C121("OwnerMatch"; "DateFromMatch"; "OwnerMatch")
		
		READ ONLY:C145([CURRENCIES:71])
		ALL RECORDS:C47([CURRENCIES:71])
		SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; $_at_CurrencyCodes; [CURRENCIES:71]X_ID:3; $_al_CurrencyIDS)
		If (Size of array:C274(SP_al_SalesProjectionID)>0)
			For ($_l_Index2; 1; Size of array:C274(SP_al_RecordModified))
				If (SP_al_RecordModified{$_l_Index2}>0)
					SP_UpdateTargetFromPV($_l_Index2)
				End if 
			End for 
			<>NoUpdate:=False:C215
		End if 
		USE SET:C118("OwnerMatch")
		CLEAR SET:C117("OwnerMatch")
		CLEAR SET:C117("StatusMatch")
		CLEAR SET:C117("DateToMatch")
		CLEAR SET:C117("DateFromMatch")
		QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2)
		
		ARRAY LONGINT:C221(SP_al_SalesProjectionID; 0)
		ARRAY TEXT:C222(SP_at_atSalesTitle; 0)
		ARRAY LONGINT:C221(SP_al_RecordModified; 0)
		ARRAY LONGINT:C221(SP_al_atCurrencyID; 0)
		ARRAY TEXT:C222(SP_at_atCurrencyCode; 0)
		ARRAY REAL:C219(SP_ar_atSalesValue; 0)
		ARRAY LONGINT:C221(SP_al_PipelineStatus; 0)
		ARRAY TEXT:C222(SP_at_PipelineStatus; 0)
		ARRAY REAL:C219(SP_ar_PipelineResult; 0)
		ARRAY DATE:C224(SP_ad_TargetFromDate; 0)
		ARRAY DATE:C224(SP_ad_TargettoDate; 0)
		ARRAY LONGINT:C221(SP_al_atCurrencyID; 0)
		ARRAY TEXT:C222(SP_at_atCurrencyCode; 0)
		ARRAY LONGINT:C221(SP_al_TargetPeriod; 0)
		ARRAY TEXT:C222(SP_at_TargetPeriod; 0)
		ARRAY TEXT:C222(SP_at_AdHocOwner; 0)
		ARRAY LONGINT:C221(SP_al_TargetOPersonID; 0)
		ARRAY LONGINT:C221(SP_al_TargetOGroupID; 0)
		ARRAY TEXT:C222(SP_at_TargetOPersonID; 0)
		ARRAY TEXT:C222(SP_at_TargetOGroupID; 0)
		ARRAY TEXT:C222(SP_at_TargetOwner; 0)
		ARRAY LONGINT:C221(SP_al_TargetType; 0)
		ARRAY TEXT:C222(SP_at_TargetType; 0)
		ARRAY REAL:C219(SP_ar_TargetProjection; 0)
		SP_NextTarget:=1
		SELECTION TO ARRAY:C260([SALES_PROJECTION:113]x_ID:1; SP_al_SalesProjectionID; [SALES_PROJECTION:113]Title:21; SP_at_atSalesTitle; [SALES_PROJECTION:113]CurrencyID:12; SP_al_atCurrencyID; [SALES_PROJECTION:113]GrossValue:13; SP_ar_atSalesValue; [SALES_PROJECTION:113]Status:20; SP_al_PipelineStatus; [SALES_PROJECTION:113]ConvertedSaleValue:19; SP_ar_PipelineResult)
		SELECTION TO ARRAY:C260([SALES_PROJECTION:113]ProjectionFromDate:22; SP_ad_TargetFromDate; [SALES_PROJECTION:113]ProjectiontoDate:23; SP_ad_TargettoDate; [SALES_PROJECTION:113]ProjectionPeriodID:25; SP_al_TargetPeriod; [SALES_PROJECTION:113]PersonnelOwnerID:4; SP_al_TargetOPersonID; [SALES_PROJECTION:113]PersonnelGroupID:5; SP_al_TargetOGroupID; [SALES_PROJECTION:113]ProjectionAdHocOwner:26; SP_at_AdHocOwner; [SALES_PROJECTION:113]Class_ID:2; SP_al_TargetType)
		ARRAY LONGINT:C221(SP_al_RecordModified; Size of array:C274(SP_al_SalesProjectionID))
		ARRAY TEXT:C222(SP_at_atSalesCustomerName; Size of array:C274(SP_al_SalesProjectionID))
		ARRAY REAL:C219(SP_ar_TargetProjection; Size of array:C274(SP_al_SalesProjectionID))
		ARRAY TEXT:C222(SP_at_TargetType; Size of array:C274(SP_al_SalesProjectionID))
		ARRAY TEXT:C222(SP_at_atCurrencyCode; Size of array:C274(SP_al_atCurrencyID))
		ARRAY TEXT:C222(SP_at_PipelineStatus; Size of array:C274(SP_al_PipelineStatus))
		ARRAY TEXT:C222(SP_at_TargetPeriod; Size of array:C274(SP_al_PipelineStatus))
		ARRAY TEXT:C222(SP_at_TargetOPersonID; Size of array:C274(SP_al_PipelineStatus))
		ARRAY TEXT:C222(SP_at_TargetOGroupID; Size of array:C274(SP_al_PipelineStatus))
		ARRAY TEXT:C222(SP_at_TargetOwner; Size of array:C274(SP_al_PipelineStatus))
		READ ONLY:C145([COMPANIES:2])
		For ($_l_Index; 1; Size of array:C274(SP_al_SalesProjectionID))
			If (SP_al_TargetType{$_l_Index}>0)
				$_l_TargetTypeRow:=Find in array:C230(SP_al_TargetType; SP_al_TargetType{$_l_Index})
				If ($_l_TargetTypeRow>0)
					SP_at_TargetType{$_l_Index}:=SP_at_tTargetType{$_l_TargetTypeRow}
				Else 
					SP_al_TargetType{$_l_Index}:=0
				End if 
			Else 
				SP_at_TargetType{$_l_Index}:=""
			End if 
			
			
			
			
			
			If (SP_al_atCurrencyID{$_l_Index}>0)
				$_l_CurrencyRow:=Find in array:C230($_al_CurrencyIDS; SP_al_atCurrencyID{$_l_Index})
				If ($_l_CurrencyRow>0)
					SP_at_atCurrencyCode{$_l_Index}:=$_at_CurrencyCodes{$_l_Index}
				Else 
					SP_at_atCurrencyCode{$_l_Index}:=<>SYS_t_BaseCurrency
				End if 
			Else 
				SP_at_atCurrencyCode{$_l_Index}:=<>SYS_t_BaseCurrency
			End if 
			$_l_StatusRow:=Find in array:C230(SP_al_TargetPipelineStatus; SP_al_PipelineStatus{$_l_Index})
			If ($_l_StatusRow>0)
				SP_at_PipelineStatus{$_l_Index}:=SP_at_TargetPipelineStatus{$_l_StatusRow}
			Else 
				SP_at_PipelineStatus{$_l_Index}:="Unknown"
			End if 
			If (SP_al_TargetPeriod{$_l_Index}>0)
				QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=SP_al_TargetPeriod{$_l_Index})
				SP_at_TargetPeriod{$_l_Index}:=[PERIODS:33]Period_Code:1
			End if 
			If (SP_al_TargetOPersonID{$_l_Index}>0)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SP_al_TargetOPersonID{$_l_Index})
				SP_at_TargetOPersonID{$_l_Index}:=[PERSONNEL:11]Name:2
			End if 
			If (SP_al_TargetOGroupID{$_l_Index}>0)
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=SP_al_TargetOGroupID{$_l_Index})
				SP_at_TargetOGroupID{$_l_Index}:=[PERSONNEL_GROUPS:92]Group_Name:2
			End if 
			If (SP_at_TargetOPersonID{$_l_Index}#"")
				SP_at_TargetOwner{$_l_Index}:=SP_at_TargetOPersonID{$_l_Index}
			Else 
				If (SP_at_TargetOGroupID{$_l_Index}#"")
					SP_at_TargetOwner{$_l_Index}:=SP_at_TargetOGroupID{$_l_Index}
				Else 
					SP_at_TargetOwner{$_l_Index}:=SP_at_AdHocOwner{$_l_Index}
				End if 
			End if 
			SP_LoadTargetProjections(SP_al_SalesProjectionID{$_l_Index})
			SORT ARRAY:C229(<>SP_ad_TargetProjectionDate; <>SP_ar_TargetProjectionAmount; <)
			If (Size of array:C274(<>SP_ar_TargetProjectionAmount)>0)
				SP_ar_TargetProjection{$_l_Index}:=<>SP_ar_TargetProjectionAmount{1}
			End if 
			
		End for 
	End if 
	SP_SetupPowerViewTargets
	OBJECT SET TITLE:C194(BaddTarget; "Add Target")
	
	SP_l_TbuttonMode:=0
	
End if 
ERR_MethodTrackerReturn("SP_FindTargets"; $_t_oldMethodName)
