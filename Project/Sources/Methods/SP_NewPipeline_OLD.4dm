//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_NewPipeline_OLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_BOOLEAN:C305($_bo_NewProcess; $1)
	C_DATE:C307(SP_D_SalesEnteredDate; SP_D_SalesProjectionDate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_RestrictionListID; $_l_TableRestrictionRow; $2; $3; SP_l_CurrencyID; SP_l_LoadSalesProjectionID; SP_l_ProjectionClassID; SP_l_ProjectionGroupID; SP_l_ProjectionLevelID; SP_l_ProjectionPersonID)
	C_LONGINT:C283(SP_l_relatedCOmpanyID; SP_l_RelatedContactID; SP_l_RelatedRecordID; SP_l_relatedTableNUM; SP_l_SalesProjectionStatusID; SP_l_Save; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($6; $7; SP_R_SalesProjectionACTUAL; SP_R_SalesProjectionCosts; SP_R_SalesProjectionPCT; SP_R_SalesProjectionValue)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_oldMethodName; $4; $5; $8; $9; SP_t_SalesOrderNUM; SP_t_SalesOrderState; SP_t_SalesOrderTitle; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact)
	C_TEXT:C284(SP_T_SalesProjectionDesc; SP_t_SalesProjectionLevel; SP_t_SalesProjectionState; SP_t_SalesProjectionTitle; SP_t_SalesStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_NewPipeline_OLD")
$_bo_NewProcess:=False:C215
If (Count parameters:C259>=2)
	$_bo_NewProcess:=$1
End if 
If ($_bo_NewProcess)
	Start_Process
End if 
$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)

SP_l_LoadSalesProjectionID:=0
SP_t_SalesProjectionContact:=""
SP_t_SalesProjectionCompany:=""
SP_t_SalesStatus:=""
SP_t_SalesOrderTitle:=""
SP_t_SalesOrderState:=""
SP_t_SalesProjectionState:=""
SP_t_SalesProjectionLevel:=""
SP_t_SalesOrderNUM:=""

If (Count parameters:C259>=2)
	If ($2>0)
		SP_l_ProjectionPersonID:=$2
	Else 
		SP_l_ProjectionPersonID:=0
	End if 
	If (<>PER_t_UserGroup#"")
		If ([PERSONNEL_GROUPS:92]Group_Code:1#<>PER_t_UserGroup)
			READ ONLY:C145([PERSONNEL_GROUPS:92])
			QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
			SP_l_ProjectionGroupID:=[PERSONNEL_GROUPS:92]x_ID:12
		Else 
			SP_l_ProjectionGroupID:=[PERSONNEL_GROUPS:92]x_ID:12
		End if 
	Else 
		SP_l_ProjectionGroupID:=0
	End if 
	SP_LoadLinkTypes
	If (Count parameters:C259>=3)
		If ($3>0)
			$_l_TableRestrictionRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252($3)))
			If ($_l_TableRestrictionRow<0)
				SP_l_relatedTableNUM:=AA_ListAddItembyID($_l_RestrictionListID; Table name:C256($3))
				AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
			Else 
				SP_l_relatedTableNUM:=QV_al_TableRestrictionIDs{$_l_TableRestrictionRow}
			End if 
		Else 
			SP_l_relatedTableNUM:=0
		End if 
	Else 
		SP_l_relatedTableNUM:=0
	End if 
	If (Count parameters:C259>=4)
		//we know the number
		SP_t_SalesOrderNUM:=$4
	Else 
		SP_t_SalesOrderNUM:=""
		SP_l_RelatedRecordID:=0
	End if 
	If (Count parameters:C259>=5)
		If ($5#"")
			If ([CURRENCIES:71]Currency_Code:1#$5)
				READ ONLY:C145([CURRENCIES:71])
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$5)
				SP_l_CurrencyID:=[CURRENCIES:71]X_ID:3
			Else 
				SP_l_CurrencyID:=[CURRENCIES:71]X_ID:3
			End if 
		Else 
			SP_l_CurrencyID:=0
		End if 
	Else 
		SP_l_CurrencyID:=0
	End if 
	
	
	If (Count parameters:C259>=6)
		If ($6>0)
			SP_R_SalesProjectionValue:=$6
		Else 
			SP_R_SalesProjectionValue:=0
		End if 
	Else 
		SP_R_SalesProjectionValue:=0
	End if 
	If (Count parameters:C259>7)
		If ($7>0)
			SP_R_SalesProjectionCosts:=$7
		Else 
			SP_R_SalesProjectionCosts:=0
		End if 
	Else 
		SP_R_SalesProjectionCosts:=0
	End if 
	If (Count parameters:C259>=8)
		If ([COMPANIES:2]Company_Code:1#$8)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$8)
		End if 
		SP_l_relatedCOmpanyID:=[COMPANIES:2]x_ID:63
	Else 
		SP_l_relatedCOmpanyID:=0
	End if 
	If (Count parameters:C259>=9)
		
		If ([CONTACTS:1]Contact_Code:2#$9)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$9)
		End if 
		SP_l_relatedContactID:=[CONTACTS:1]x_ID:33
	Else 
		SP_l_relatedContactID:=0
	End if 
	
	
	
	SP_l_Save:=0
	//if this is related to a diary item we should get the diary item
	//and if THAT is related to a JOB/ORDER/PROJECT
	//get the values/dates and status from that
	
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
	DIALOG:C40([USER:15]; "SalesProjectionEntry")
	
	
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (SP_l_Save=1)
		SP_l_Save:=0
		
		READ WRITE:C146([SALES_PROJECTION:113])
		CREATE RECORD:C68([SALES_PROJECTION:113])
		[SALES_PROJECTION:113]Class_ID:2:=SP_l_ProjectionClassID
		
		[SALES_PROJECTION:113]Forcast_LevelID:3:=SP_l_ProjectionLevelID
		[SALES_PROJECTION:113]PersonnelOwnerID:4:=SP_l_ProjectionPersonID
		[SALES_PROJECTION:113]PersonnelGroupID:5:=SP_l_ProjectionGroupID
		[SALES_PROJECTION:113]CompanyID:6:=SP_l_relatedCOmpanyID
		[SALES_PROJECTION:113]ContactID:7:=SP_l_RelatedContactID
		[SALES_PROJECTION:113]RelatedSaleTableID:8:=SP_l_relatedTableNUM
		[SALES_PROJECTION:113]RelatedSaleRecordID:9:=SP_l_RelatedRecordID
		[SALES_PROJECTION:113]Date_Entered:10:=SP_D_SalesEnteredDate
		[SALES_PROJECTION:113]Description:11:=SP_T_SalesProjectionDesc
		[SALES_PROJECTION:113]CurrencyID:12:=SP_l_CurrencyID
		[SALES_PROJECTION:113]GrossValue:13:=SP_R_SalesProjectionValue
		[SALES_PROJECTION:113]GrossCosts:14:=SP_R_SalesProjectionCosts
		[SALES_PROJECTION:113]GrossMargin:15:=SP_CalcMargin(SP_R_SalesProjectionValue; SP_R_SalesProjectionCosts)
		[SALES_PROJECTION:113]Expected_date:16:=SP_D_SalesProjectionDate
		[SALES_PROJECTION:113]Probability:17:=SP_R_SalesProjectionPCT
		
		[SALES_PROJECTION:113]CalculatedProbableValue:18:=SP_calcValue(SP_R_SalesProjectionValue; SP_R_SalesProjectionPCT)
		[SALES_PROJECTION:113]ConvertedSaleValue:19:=SP_R_SalesProjectionACTUAL
		[SALES_PROJECTION:113]Status:20:=SP_l_SalesProjectionStatusID
		[SALES_PROJECTION:113]Title:21:=SP_t_SalesProjectionTitle
		[SALES_PROJECTION:113]ProjectionFromDate:22:=!00-00-00!
		[SALES_PROJECTION:113]ProjectiontoDate:23:=!00-00-00!
		[SALES_PROJECTION:113]ProjectionDatesSort:24:=SP_SortDate(SP_D_SalesProjectionDate)
		DB_SaveRecord(->[SALES_PROJECTION:113])
		AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
		
		
		
		UNLOAD RECORD:C212([SALES_PROJECTION:113])
		READ ONLY:C145([SALES_PROJECTION:113])
	End if 
End if 
If ($_bo_NewProcess)
	Process_End
End if 
ERR_MethodTrackerReturn("SP_NewPipeline_OLD"; $_t_oldMethodName)