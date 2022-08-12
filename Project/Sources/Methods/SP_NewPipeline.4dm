//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_NewPipeline
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
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_RestrictionListID; $10; $11; $2; $3; SP_l_CurrencyID; SP_l_DIARYRELATEDID; SP_l_ProjectionGroupID; SP_l_ProjectionPersonID; SP_l_relatedCOmpanyID)
	C_LONGINT:C283(SP_l_relatedContactID; SP_l_RelatedRecordID; SP_l_relatedTableNUM; SP_l_Save; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($6; $7; SP_R_SalesProjectionCosts; SP_R_SalesProjectionValue)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_oldMethodName; $4; $5; $8; $9; SP_t_SalesOrderNUM; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_NewPipeline")
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
	SP_LoadLinkTypes(False:C215)
	If (Count parameters:C259>=3)
		SP_l_relatedTableNUM:=$3
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
	If (Count parameters:C259>=11)
		SP_l_DIARYRELATEDID:=$11
	Else 
		SP_l_DIARYRELATEDID:=0
	End if 
	
	//if this is related to a diary item we should get the diary item
	//and if THAT is related to a JOB/ORDER/PROJECT
	//get the values/dates and status from that
	READ WRITE:C146([SALES_PROJECTION:113])
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 4)
	FORM SET INPUT:C55([SALES_PROJECTION:113]; "SalesProjectionEntry")
	WIN_t_CurrentInputForm:="SalesProjectionEntry"
	ADD RECORD:C56([SALES_PROJECTION:113]; *)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	UNLOAD RECORD:C212([SALES_PROJECTION:113])
	READ ONLY:C145([SALES_PROJECTION:113])
	
End if 
If ($_bo_NewProcess)
	Process_End
End if 
ERR_MethodTrackerReturn("SP_NewPipeline"; $_t_oldMethodName)