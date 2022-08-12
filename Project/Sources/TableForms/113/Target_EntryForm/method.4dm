If (False:C215)
	//Table Form Method Name: [SALES_PROJECTION]Target_EntryForm
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
	//ARRAY DATE(SP_ad_TargetProjectionDate;0)
	//ARRAY LONGINT(SP_al_CurrencyIDs;0)
	//ARRAY LONGINT(SP_al_GroupIDs;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_TargetProjectionID;0)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY REAL(SP_ar_TargetProjectionAmount;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_CurrencyNames;0)
	//ARRAY TEXT(SP_at_GroupCodes;0)
	//ARRAY TEXT(SP_at_GroupNames;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_PeriodCodes;0)
	//ARRAY TEXT(SP_at_tTargetType;0)
	C_BOOLEAN:C305($_bo_OK; DB_bo_NoLoad; SP_bo_SetupMultiple)
	C_DATE:C307(SP_D_TargetProjectionDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AddedItemID; $_l_event; $_l_ListID; $_l_Process; $_l_StatusRow; BaddMiultiple; BaddPAT; SP_l_DefaultGroupID; SP_l_DefaultPersonID; SP_l_Mode)
	C_LONGINT:C283(SP_l_MultiType; SP_l_ProjectionGroupID; SP_l_Type; SP_l_UsersnGroups; vSD_SelCalendar2)
	C_PICTURE:C286(SP_pic_UGPopUP)
	C_REAL:C285(SP_R_TargetProjectionAmount)
	C_TEXT:C284(<>PER_t_CurrentUserName; <>SYS_t_BaseCurrency; $_t_oldMethodName; SP_t_DefaultOwner; SP_t_PeriodCode; SP_t_SalesCurrency; SP_t_SalesProjectionPerson; SP_t_SalesProjectionState; SP_t_SalesProjectionType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SALES_PROJECTION].Target_EntryForm"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SALES_PROJECTION:113]); "Target_EntryForm")
		SP_t_SalesProjectionType:=""
		SP_l_Mode:=0
		
		ARRAY DATE:C224(SP_ad_TargetProjectionDate; 0)
		ARRAY REAL:C219(SP_ar_TargetProjectionAmount; 0)
		ARRAY LONGINT:C221(SP_al_TargetProjectionID; 0)
		OBJECT SET VISIBLE:C603(SP_D_TargetProjectionDate; False:C215)
		OBJECT SET VISIBLE:C603(SP_R_TargetProjectionAmount; False:C215)
		OBJECT SET ENTERABLE:C238(SP_R_TargetProjectionAmount; False:C215)
		OBJECT SET ENTERABLE:C238(SP_D_TargetProjectionDate; False:C215)
		
		
		If (SP_l_UsersnGroups>0)
			CLEAR LIST:C377(SP_l_UsersnGroups; *)
		End if 
		[SALES_PROJECTION:113]Forcast_LevelID:3:=2
		SP_l_Type:=2  //its a target
		SP_LoadStates(SP_l_Type)
		$_l_ListID:=AA_GetListID(-1; -1; "Target Type"; "SP_S55_TargetType")
		ARRAY TEXT:C222(SP_at_tTargetType; 0)
		ARRAY LONGINT:C221(SP_al_TargetType; 0)
		AA_LoadListbyID($_l_ListID; ->SP_at_tTargetType; ->SP_al_TargetType; False:C215)
		If ([SALES_PROJECTION:113]Class_ID:2>0)
			If (Size of array:C274(SP_al_TargetType)=0)
				$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Personal Target"; "Team Target")
				AA_LoadListbyID($_l_ListID; ->SP_at_tTargetType; ->SP_al_TargetType; False:C215)
			End if 
		End if 
		AA_LoadListbyID($_l_ListID; ->SP_at_tTargetType; ->SP_al_TargetType; True:C214)
		If ([SALES_PROJECTION:113]Status:20>0)
			$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; [SALES_PROJECTION:113]Status:20)
			If ($_l_StatusRow>0)
				SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_StatusRow}
			Else 
				SP_t_SalesProjectionState:="Unknown"
			End if 
		Else 
			SP_t_SalesProjectionState:="Not Set"
		End if 
		
		ARRAY TEXT:C222(SP_at_GroupCodes; 0)
		ARRAY TEXT:C222(SP_at_GroupNames; 0)
		ARRAY LONGINT:C221(SP_al_GroupIDs; 0)
		If ([SALES_PROJECTION:113]PersonnelOwnerID:4=0) & ([SALES_PROJECTION:113]PersonnelGroupID:5=0) & ([SALES_PROJECTION:113]ProjectionAdHocOwner:26="")
			If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Manager"))
				SP_GetUsersAndGroups
				SP_t_SalesProjectionPerson:=""
			Else 
				SP_t_SalesProjectionPerson:=<>PER_t_CurrentUserName
				[SALES_PROJECTION:113]PersonnelOwnerID:4:=<>PER_l_CurrentUserID
				OBJECT SET VISIBLE:C603(SP_l_UsersnGroups; False:C215)
				OBJECT SET VISIBLE:C603(SP_pic_UGPopUP; False:C215)
			End if 
			
		Else 
			OBJECT SET VISIBLE:C603(SP_l_UsersnGroups; False:C215)
			OBJECT SET VISIBLE:C603(SP_pic_UGPopUP; False:C215)
			Case of 
				: ([SALES_PROJECTION:113]ProjectionAdHocOwner:26#"")
					SP_t_SalesProjectionPerson:=[SALES_PROJECTION:113]ProjectionAdHocOwner:26
				: ([SALES_PROJECTION:113]PersonnelOwnerID:4>0)
					SP_t_SalesProjectionPerson:=SP_loadPersonnel([SALES_PROJECTION:113]PersonnelOwnerID:4)
				: ([SALES_PROJECTION:113]PersonnelGroupID:5>0)
					SP_l_ProjectionGroupID:=[SALES_PROJECTION:113]PersonnelGroupID:5
					SP_t_SalesProjectionPerson:=SP_LoadPersonelGroup([SALES_PROJECTION:113]PersonnelGroupID:5)
			End case 
		End if 
		If (SP_l_DefaultPersonID>0)
			[SALES_PROJECTION:113]PersonnelOwnerID:4:=SP_l_DefaultPersonID
			SP_t_SalesProjectionPerson:=SP_loadPersonnel([SALES_PROJECTION:113]PersonnelOwnerID:4)
			
		End if 
		If (SP_l_DefaultGroupID>0)
			[SALES_PROJECTION:113]PersonnelGroupID:5:=SP_l_DefaultGroupID
			If (SP_l_DefaultPersonID=0)
				SP_t_SalesProjectionPerson:=SP_LoadPersonelGroup([SALES_PROJECTION:113]PersonnelGroupID:5)
			End if 
		End if 
		If (SP_t_DefaultOwner#"")
			[SALES_PROJECTION:113]ProjectionAdHocOwner:26:=SP_t_DefaultOwner
		End if 
		SP_l_DefaultPersonID:=0
		SP_l_DefaultGroupID:=0
		SP_t_DefaultOwner:=""
		
		If ([SALES_PROJECTION:113]ProjectionFromDate:22=!00-00-00!) & ([SALES_PROJECTION:113]ProjectiontoDate:23=!00-00-00!) & ([SALES_PROJECTION:113]ProjectionPeriodID:25=0)
			SP_GetPeriods
		Else 
			OBJECT SET VISIBLE:C603(*; "PCT_PeriodPOPUP"; False:C215)
			OBJECT SET VISIBLE:C603(SP_at_PeriodCodes; False:C215)
			Case of 
				: ([SALES_PROJECTION:113]ProjectionPeriodID:25>0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=[SALES_PROJECTION:113]ProjectionPeriodID:25)
					SP_t_PeriodCode:=[PERIODS:33]Period_Code:1
					[SALES_PROJECTION:113]ProjectionFromDate:22:=[PERIODS:33]From_Date:3
					[SALES_PROJECTION:113]ProjectiontoDate:23:=[PERIODS:33]To_Date:4
				: ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
					// a result is in for this
					OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ProjectionFromDate:22; False:C215)
					OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ProjectiontoDate:23; False:C215)
					OBJECT SET VISIBLE:C603(*; "PCT_Fromdate"; False:C215)
					OBJECT SET VISIBLE:C603(*; "PCT_Todate"; False:C215)
					OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
			End case 
			
		End if 
		If ([SALES_PROJECTION:113]CurrencyID:12>0)
			READ ONLY:C145([CURRENCIES:71])
			QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=[SALES_PROJECTION:113]CurrencyID:12)
			SP_t_SalesCurrency:=[CURRENCIES:71]Currency_Code:1
			OBJECT SET VISIBLE:C603(SP_at_CurrencyNames; False:C215)
			OBJECT SET VISIBLE:C603(*; "PICT_CurrencyCode"; False:C215)
		Else 
			READ ONLY:C145([CURRENCIES:71])
			ALL RECORDS:C47([CURRENCIES:71])
			SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; SP_at_CurrencyCode; [CURRENCIES:71]Currency_Name:2; SP_at_CurrencyNames; [CURRENCIES:71]X_ID:3; SP_al_CurrencyIDs)
			OBJECT SET VISIBLE:C603(SP_at_CurrencyNames; True:C214)
			OBJECT SET VISIBLE:C603(*; "PICT_CurrencyCode"; True:C214)
			If (<>SYS_t_BaseCurrency#"")
				READ ONLY:C145([CURRENCIES:71])
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
				[SALES_PROJECTION:113]CurrencyID:12:=[CURRENCIES:71]X_ID:3
				SP_t_SalesCurrency:=<>SYS_t_BaseCurrency
			End if 
			
		End if 
		If ([SALES_PROJECTION:113]x_ID:1>0)
			SET WINDOW TITLE:C213("Update Target")
			WS_AutoscreenSize(3; 321; 589)
		Else 
			SET WINDOW TITLE:C213("Enter Target")
			WS_AutoscreenSize(3; 321; 589)
			[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
			[SALES_PROJECTION:113]Forcast_LevelID:3:=2
		End if 
		$_l_Process:=New process:C317("SP_LoadTargetProjections"; 3200; "Get Projections"; [SALES_PROJECTION:113]x_ID:1)
		If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
			OBJECT SET VISIBLE:C603(BaddPAT; False:C215)
		End if 
		
		If ([SALES_PROJECTION:113]PersonnelOwnerID:4>0) | ([SALES_PROJECTION:113]PersonnelGroupID:5>0) | ([SALES_PROJECTION:113]ProjectionAdHocOwner:26#"")
			OBJECT SET VISIBLE:C603(BaddMiultiple; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(BaddMiultiple; False:C215)
		End if 
		If (SP_bo_SetupMultiple)
			SP_l_MultiType:=0
			Case of 
				: ([SALES_PROJECTION:113]ProjectionPeriodID:25>0)  //
					//this is a period based projection
					SP_l_MultiType:=1
				: ([SALES_PROJECTION:113]ProjectionFromDate:22#!00-00-00!) & ([SALES_PROJECTION:113]ProjectiontoDate:23#!00-00-00!)
					//this is a date based projection
					SP_l_MultiType:=2
			End case 
			$_bo_OK:=True:C214
			$_bo_OK:=SP_SetUpMultiple(SP_l_MultiType; [SALES_PROJECTION:113]ProjectionPeriodID:25; [SALES_PROJECTION:113]ProjectionFromDate:22; [SALES_PROJECTION:113]ProjectiontoDate:23; True:C214)
			If ($_bo_OK)
				SP_SetUpPView
				//AL_UpdateArrays (SP_Powerview;-2)
			Else 
				CANCEL:C270
			End if 
			
			
		End if 
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [SALES_PROJECTION].Target_EntryForm"; $_t_oldMethodName)
