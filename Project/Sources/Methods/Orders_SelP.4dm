//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:52
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_FromDates; 0)
	ARRAY LONGINT:C221($_al_aSearchIDs; 0)
	ARRAY LONGINT:C221($_al_QueryIDS; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; ORDi_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; VFDateF; VFDateT; viDateF; ViDateT; VRDateF; VRDateT; VsDateF; VsDateT)
	C_LONGINT:C283($_l_And; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID; $_l_QueryRow)
	C_LONGINT:C283($_l_Records; $_l_SIzeofArray; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; ACC_l_EntryDateFromOffset)
	C_LONGINT:C283(ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; cNAA; cNAL; cSetAdd; cSetMod; cSIS; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID)
	C_LONGINT:C283(SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; VFDateFOffset; VFDateTOffset; ViDateFOffset; ViDateTOffset; vOrd; vProcaMod)
	C_LONGINT:C283(VRDateFOffset; VRDateTOffset; VSDateFOffset; VSDateTOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285(VamountF; VamountT; VMarginF; vMarginPF; vMarginPT; VMarginT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; $Title; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; Enclosures; Vanalysis; vArea; VattendType; VComments)
	C_TEXT:C284(VCompCode; VCompName; vContactName; VcontCode; vEnclosures; vEvent; VForename; vLayer; VorderCode; vOrderNo; VPersonName)
	C_TEXT:C284(vProdCode; VSales; VSELPREV; Vsource; VSurname; vTele; Vtitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_SelP")
//Orders_SelP
$_bo_OpenWindow:=False:C215
ACC_l_PeriodFromOffset:=0
ACC_l_PeriodToOffset:=0
ACC_l_EntryDateFromOffset:=0
VSDateFOffset:=0
ViDateFOffset:=0
VFDateFOffset:=0
VRDateFOffset:=0

ACC_l_EntryDateToOffset:=0
VSDateTOffset:=0
ViDateTOffset:=0
VFDateTOffset:=0
VRDateTOffset:=0

Sel_Beginning(False:C215; ->[ORDERS:24])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_TableNumber:=Table:C252(->[ORDERS:24])
$_l_ElementCount:=0
$_bo_NoSearch:=False:C215  // used for cross file search

If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vOrd=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
	$_l_WhilesCounter:=$_l_WhilesCounter+1
	If (Count parameters:C259>=2)
		$_l_Mode:=0
		$_l_QueryID:=0
		Case of 
			: ($1<0)
				$_l_Mode:=1  // Dont search we are building
				
			: ($_l_CurrentRow<=Size of array:C274($2->))
				$_l_QueryID:=$2->{$_l_CurrentRow}
				$_l_Mode:=$1
		End case 
		
	End if 
	If ($_l_Mode=0)
		If ($_l_WhilesCounter=1)
			Sel_Beginning2(False:C215; ->[ORDERS:24])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[ORDERS:24])
	End if 
	
	
	
	If (vSelPrev#"•FSC")
		Orders_SelPvs
	End if 
	If (vProcaMod=13)
		$Title:=Term_OrdWT("Find in SalesBook")
	Else 
		$Title:="Find Sales Orders"
	End if 
	
	If ($_l_QueryID=0)
		SM_l_QueryMode:=0
		If ($_l_Mode=1)
			SM_l_QueryMode:=1
			SM_l_ReturnQueryID:=0
			ARRAY LONGINT:C221($_al_aSearchIDs; 0)
			COPY ARRAY:C226($3->; $_al_aSearchIDs)
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
			
			
		Else 
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
			
			
		End if 
		
		$_bo_OpenWindow:=False:C215
		If (Not:C34(SM_bo_SessionWindow))
			SM_bo_SessionWindow:=True:C214
			$_bo_SessionWindowOwner:=True:C214
			
			$_bo_OpenWindow:=True:C214
			Open_AnyTypeWindow(383; 529; 4; $Title)
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213($Title)
		End if 
		DIALOG:C40([ORDERS:24]; "dOrders_Sel")
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226($_al_aSearchIDs; $3->)
			$_l_SIzeofArray:=Size of array:C274($3->)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_CurrentRow:=0
			For ($_l_Index; $_l_SIzeofArray+1; Size of array:C274($3->))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$3->{$_l_Index}:=$_al_SearchIDsReturn{$_l_CurrentRow}
			End for 
		Else 
			If (SM_l_QueryMode>0)
				COPY ARRAY:C226($_al_aSearchIDs; $3->)
				
			End if 
			
		End if 
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				
				
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->SRCH_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ACC_l_EntryDateFromOffset; ->VSDateFOffset; ->ViDateFOffset; ->VFDateFOffset; ->VRDateFOffset; ->ACC_l_EntryDateToOffset; ->VSDateTOffset; ->ViDateTOffset; ->VFDateTOffset; ->VRDateTOffset)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
				SM_l_SearchNumber:=AA_GetNextID(->SM_l_SearchNumber)
				SM_l_SearchNumber:=SM_SaveSearchParameters(0; "SMQuery_"+String:C10(SM_l_SearchNumber); $_l_TableNumber; -1; ->SM_blb_SearchBlob)
			Else 
				SM_l_SearchNumber:=AA_GetNextID(->SM_l_SearchNumber)
				READ WRITE:C146([x_QUERY_PARAMETERS:134])
				CREATE RECORD:C68([x_QUERY_PARAMETERS:134])
				[x_QUERY_PARAMETERS:134]Search_Name:4:="SMQuery_"+String:C10(SM_l_SearchNumber)
				[x_QUERY_PARAMETERS:134]X_OwnerID:2:=-1
				[x_QUERY_PARAMETERS:134]X_ContextID:3:=$_l_TableNumber
				[x_QUERY_PARAMETERS:134]X_ID:1:=-(AA_GetNextID(->[x_QUERY_PARAMETERS:134]X_ID:1))
				SET BLOB SIZE:C606([x_QUERY_PARAMETERS:134]X_SearchValues:5; 0)
				SM_SearchVarsToBlob(->[x_QUERY_PARAMETERS:134]X_SearchValues:5; ->SM_l_ReturnQueryID; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
				DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
				SM_l_SearchNumber:=[x_QUERY_PARAMETERS:134]X_ID:1
				UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
				READ ONLY:C145([x_QUERY_PARAMETERS:134])
			End if 
			
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; 1)
			$3->{Size of array:C274($3->)}:=SM_l_SearchNumber
			
		End if 
		SM_l_QueryMode:=0
		
		WS_KeepFocus
		
		
		//``
	Else 
		//here we need to check the context of the query and if it is not account balances need to pass on the work to the appropriate search
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		$_bo_AndLoaded:=False:C215
		If ($_l_QueryID<0)
			//this is a reference to a search....
			//when the users are building a search they may select a search from the pop up that they want the system to use
			//the system creates a Set manager owner set which refers to the real search
			$_l_offset:=0
			SM_l_ReturnQueryID:=0
			If (Not:C34(ORDi_bo_FFLoaded))
				SM_SetUpFFArray(->[ORDER_ITEMS:25])
				ORDi_bo_FFLoaded:=True:C214
			End if 
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ACC_l_EntryDateFromOffset:=0
			VSDateFOffset:=0
			ViDateFOffset:=0
			VFDateFOffset:=0
			VRDateFOffset:=0
			
			ACC_l_EntryDateToOffset:=0
			VSDateTOffset:=0
			ViDateTOffset:=0
			VFDateTOffset:=0
			VRDateTOffset:=0
			
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ACC_l_PeriodFromOffset>0)
				
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
				If (Records in selection:C76([PERIODS:33])>0)
					SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
					SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
					If ((ACC_l_PeriodFromOffset+1)<Size of array:C274($_ad_FromDates))
						ACC_t_PeriodFrom:=$_at_PeriodCodes{ACC_l_PeriodFromOffset}
					Else 
						ACC_t_PeriodFrom:=$_at_PeriodCodes{1}
					End if 
					If (ACC_l_PeriodToOffset>0)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_FromDates))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodToOffset+1}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
					End if 
					
				End if 
				
			Else 
				If (ACC_l_PeriodToOffset>0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
						SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_FromDates))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodToOffset+1}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
					End if 
				End if 
			End if 
			
			If (ACC_l_EntryDateFromOffset#0)
				Case of 
					: (ACC_l_EntryDateFromOffset>0)
						SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
					: (ACC_l_EntryDateFromOffset>-100)
						//months
						SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
				End case 
			End if 
			If (ACC_l_EntryDateToOffset#0)
				Case of 
					: (ACC_l_EntryDateToOffset>0)
						SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
					: (ACC_l_EntryDateToOffset>-100)
						//months
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
				End case 
				
			End if 
			If (VsDateFOffset#0)
				Case of 
					: (VsDateFOffset>0)
						VsDateF:=Current date:C33-VsDateFOffset
					: (VsDateFOffset>-100)
						//months
						VsDateF:=Add to date:C393(Current date:C33; 0; VsDateFOffset; 0)
					Else 
						//years
						VsDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VsDateTOffset#0)
				Case of 
					: (VsDateTOffset>0)
						VsDateF:=Current date:C33-VsDateTOffset
					: (VsDateTOffset>-100)
						//months
						VsDateT:=Add to date:C393(Current date:C33; 0; VsDateTOffset; 0)
					Else 
						//years
						VsDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateTOffset)/100); 0; 0)
				End case 
			End if 
			If (vIDateFOffset#0)
				Case of 
					: (vIDateFOffset>0)
						vIDateF:=Current date:C33-vIDateFOffset
					: (vIDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; vIDateFOffset; 0)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vIDateTOffset#0)
				Case of 
					: (vIDateTOffset>0)
						vIDateF:=Current date:C33-vIDateTOffset
					: (vIDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; vIDateTOffset; 0)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateTOffset)/100); 0; 0)
				End case 
			End if 
			If (vFDateFOffset#0)
				Case of 
					: (vFDateFOffset>0)
						vFDateF:=Current date:C33-vFDateFOffset
					: (vFDateFOffset>-100)
						//months
						vFDateF:=Add to date:C393(Current date:C33; 0; vFDateFOffset; 0)
					Else 
						//years
						vFDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vFDateTOffset#0)
				Case of 
					: (vFDateTOffset>0)
						vFDateF:=Current date:C33-vFDateTOffset
					: (vFDateTOffset>-100)
						//months
						vFDateT:=Add to date:C393(Current date:C33; 0; vFDateTOffset; 0)
					Else 
						//years
						vFDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateTOffset)/100); 0; 0)
				End case 
			End if 
			If (vRDateFOffset#0)
				Case of 
					: (vRDateFOffset>0)
						vRDateF:=Current date:C33-vRDateFOffset
					: (vRDateFOffset>-100)
						//months
						vRDateF:=Add to date:C393(Current date:C33; 0; vRDateFOffset; 0)
					Else 
						//years
						vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vRDateTOffset#0)
				Case of 
					: (vRDateTOffset>0)
						vRDateF:=Current date:C33-vRDateTOffset
					: (vRDateTOffset>-100)
						//months
						vRDateT:=Add to date:C393(Current date:C33; 0; vRDateTOffset; 0)
					Else 
						//years
						vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateTOffset)/100); 0; 0)
				End case 
			End if 
			
			
			
			$_l_QueryID:=SM_l_ReturnQueryID
			SM_l_ReturnQueryID:=0
			$_bo_AndLoaded:=True:C214
		End if 
		If ([x_QUERY_PARAMETERS:134]X_ID:1#$_l_QueryID)
			QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		End if 
		If ([x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_TableNumber)
			If (Not:C34($_bo_AndLoaded))
				SRCH_l_And:=0
				SRCH_l_or:=0
				SRCH_l_Not:=0
			End if 
			If (Not:C34(ORDi_bo_FFLoaded))
				SM_SetUpFFArray(->[ORDER_ITEMS:25])
				ORDi_bo_FFLoaded:=True:C214
			End if 
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ACC_l_EntryDateFromOffset:=0
			VSDateFOffset:=0
			ViDateFOffset:=0
			VFDateFOffset:=0
			VRDateFOffset:=0
			
			ACC_l_EntryDateToOffset:=0
			VSDateTOffset:=0
			ViDateTOffset:=0
			VFDateTOffset:=0
			VRDateTOffset:=0
			
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ACC_l_PeriodFromOffset>0)
				
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
				If (Records in selection:C76([PERIODS:33])>0)
					SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
					SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
					If ((ACC_l_PeriodFromOffset+1)<Size of array:C274($_ad_FromDates))
						ACC_t_PeriodFrom:=$_at_PeriodCodes{ACC_l_PeriodFromOffset+1}
					Else 
						ACC_t_PeriodFrom:=$_at_PeriodCodes{1}
					End if 
					If (ACC_l_PeriodToOffset>0)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_FromDates))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodToOffset+1}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
					End if 
					
				End if 
				
			Else 
				If (ACC_l_PeriodToOffset>0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_FromDates)
						SORT ARRAY:C229($_ad_FromDates; $_at_PeriodCodes; <)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_FromDates))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodToOffset+1}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
					End if 
				End if 
			End if 
			
			If (ACC_l_EntryDateFromOffset#0)
				Case of 
					: (ACC_l_EntryDateFromOffset>0)
						SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateFromOffset
					: (ACC_l_EntryDateFromOffset>-100)
						//months
						SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateFromOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateFrom:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateFromOffset)/100); 0; 0)
				End case 
			End if 
			If (ACC_l_EntryDateToOffset#0)
				Case of 
					: (ACC_l_EntryDateToOffset>0)
						SRCH_d_EntryDateFrom:=Current date:C33-ACC_l_EntryDateToOffset
					: (ACC_l_EntryDateToOffset>-100)
						//months
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; 0; ACC_l_EntryDateToOffset; 0)
					Else 
						//years
						SRCH_d_EntryDateTo:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_EntryDateToOffset)/100); 0; 0)
				End case 
				
			End if 
			If (VsDateFOffset#0)
				Case of 
					: (VsDateFOffset>0)
						VsDateF:=Current date:C33-VsDateFOffset
					: (VsDateFOffset>-100)
						//months
						VsDateF:=Add to date:C393(Current date:C33; 0; VsDateFOffset; 0)
					Else 
						//years
						VsDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VsDateTOffset#0)
				Case of 
					: (VsDateTOffset>0)
						VsDateF:=Current date:C33-VsDateTOffset
					: (VsDateTOffset>-100)
						//months
						VsDateT:=Add to date:C393(Current date:C33; 0; VsDateTOffset; 0)
					Else 
						//years
						VsDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VsDateTOffset)/100); 0; 0)
				End case 
			End if 
			If (vIDateFOffset#0)
				Case of 
					: (vIDateFOffset>0)
						vIDateF:=Current date:C33-vIDateFOffset
					: (vIDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; vIDateFOffset; 0)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vIDateTOffset#0)
				Case of 
					: (vIDateTOffset>0)
						vIDateF:=Current date:C33-vIDateTOffset
					: (vIDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; vIDateTOffset; 0)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vIDateTOffset)/100); 0; 0)
				End case 
			End if 
			If (vFDateFOffset#0)
				Case of 
					: (vFDateFOffset>0)
						vFDateF:=Current date:C33-vFDateFOffset
					: (vFDateFOffset>-100)
						//months
						vFDateF:=Add to date:C393(Current date:C33; 0; vFDateFOffset; 0)
					Else 
						//years
						vFDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vFDateTOffset#0)
				Case of 
					: (vFDateTOffset>0)
						vFDateF:=Current date:C33-vFDateTOffset
					: (vFDateTOffset>-100)
						//months
						vFDateT:=Add to date:C393(Current date:C33; 0; vFDateTOffset; 0)
					Else 
						//years
						vFDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vFDateTOffset)/100); 0; 0)
				End case 
			End if 
			If (vRDateFOffset#0)
				Case of 
					: (vRDateFOffset>0)
						vRDateF:=Current date:C33-vRDateFOffset
					: (vRDateFOffset>-100)
						//months
						vRDateF:=Add to date:C393(Current date:C33; 0; vRDateFOffset; 0)
					Else 
						//years
						vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vRDateTOffset#0)
				Case of 
					: (vRDateTOffset>0)
						vRDateF:=Current date:C33-vRDateTOffset
					: (vRDateTOffset>-100)
						//months
						vRDateT:=Add to date:C393(Current date:C33; 0; vRDateTOffset; 0)
					Else 
						//years
						vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vRDateTOffset)/100); 0; 0)
				End case 
			End if 
			
			
			
			
			$_l_And:=SRCH_l_And
			$_l_OR:=SRCH_l_or
			$_l_Not:=SRCH_l_Not
			$_bo_NoSearch:=False:C215
			//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
			
			If ($_l_Mode=2)  // edit
				
				$_bo_NoSearch:=True:C214
				SM_l_QueryMode:=2
				SM_l_ReturnQueryID:=0
				SM_l_QuerySearchID:=$_l_QueryID
				$_bo_OpenWindow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWindow:=True:C214
					Open_AnyTypeWindow(383; 529; 4; $Title)
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213($Title)
				End if 
				DIALOG:C40([ORDERS:24]; "dOrders_Sel"+("S"*Num:C11(DB_GetModuleSettingByNUM(1)=5)))
				If (Not:C34($_bo_OpenWindow))
					SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					SET WINDOW TITLE:C213($_t_WindowTitleOLD)
				End if 
				//here resave the values
				If (SM_l_QueryMode=2) & (OK=1)
					SRCH_l_And:=$_l_And
					SRCH_l_or:=$_l_OR
					SRCH_l_Not:=$_l_Not
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VcontCode; ->VForename; ->VSurname; ->VorderCode; ->VSales; ->VattendType; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->viDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VFDateF; ->VFDateT; ->VRDateF; ->VRDateT; ->SRCH_d_EntryDateFrom; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vMarginPF; ->vMarginPT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VComments; ->vEnclosures; ->vOrderNo; ->vTele; ->vProdCode; ->vEvent; ->vArea; ->Vanalysis; ->ACC_t_CurrencyCode; ->vLayer; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ACC_l_EntryDateFromOffset; ->VSDateFOffset; ->ViDateFOffset; ->VFDateFOffset; ->VRDateFOffset; ->ACC_l_EntryDateToOffset; ->VSDateTOffset; ->ViDateTOffset; ->VFDateTOffset; ->VRDateTOffset)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
						
						SM_l_SearchNumber:=SM_SaveSearchParameters(SM_l_QuerySearchID; ""; $_l_TableNumber; -1; ->SM_blb_SearchBlob)
					Else 
						READ WRITE:C146([x_QUERY_PARAMETERS:134])
						QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=SM_l_QuerySearchID)
						[x_QUERY_PARAMETERS:134]X_OwnerID:2:=-1
						[x_QUERY_PARAMETERS:134]X_ContextID:3:=$_l_TableNumber
						SET BLOB SIZE:C606([x_QUERY_PARAMETERS:134]X_SearchValues:5; 0)
						SM_SearchVarsToBlob(->[x_QUERY_PARAMETERS:134]X_SearchValues:5; ->SM_l_ReturnQueryID; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
						DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
						SM_l_SearchNumber:=[x_QUERY_PARAMETERS:134]X_ID:1
						UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
						READ ONLY:C145([x_QUERY_PARAMETERS:134])
					End if 
					SRCH_l_And:=0
					SRCH_l_or:=0
					SRCH_l_Not:=0
					
					
				End if 
				SM_l_QuerySearchID:=0
				//here save the updated SRCH_l_And/or/not paramteres
				SM_l_QueryMode:=0
			End if 
			//Note that if we are editing you dont have multiple values passed to this method!
		Else 
			$_l_NextElement:=0
			For ($_l_Index; $_l_CurrentRow; Size of array:C274($2->))
				QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$2->{$_l_Index})
				If ([x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_TableNumber)
					$_l_NextElement:=$_l_Index
					$_l_Index:=9999999
				End if 
			End for 
			ARRAY LONGINT:C221($_al_QueryIDS; 0)
			//The Array after executing other tables
			ARRAY LONGINT:C221($_al_QueryIDS; (Size of array:C274($2->)-$_l_NextElement)+1)
			$_l_QueryRow:=1
			For ($_l_Index; $_l_NextElement; Size of array:C274($2->))
				$_al_QueryIDS{$_l_QueryRow}:=$2->{$_l_Index}
				$_l_QueryRow:=$_l_QueryRow+1
			End for 
			//Now chop off $2
			ARRAY LONGINT:C221($2->; $_l_NextElement-1)
			SM_al_NextElement:=0
			SM_CrossFileSearch($_l_Mode; $_l_TableNumber; $2; ->SM_al_NextElement)
			COPY ARRAY:C226($_al_QueryIDS; $2->)
			$_l_ElementCount:=Size of array:C274($2->)
			$_l_CurrentRow:=0
			$_bo_NoSearch:=True:C214
			
		End if 
		$_l_QueryID:=0
		$_l_CurrentRow:=$_l_CurrentRow+1
		If ($_l_CurrentRow>Size of array:C274($2->)) | ($_l_Mode=2)  // edit will not call each window at the same time
			
			//must break out
			SRCH_l_And:=0
			SRCH_l_or:=0
			SRCH_l_Not:=0
		End if 
		
		
		
		
	End if 
	
	If (OK=0) | ($_l_Mode#0) | ($_bo_NoSearch=True:C214)
		
		If (SRCH_l_And=0) & (SRCH_l_or=0) & (SRCH_l_Not=0)
			
			vOrd:=0
		End if 
	Else 
		
		Sel_RemSets("Ord"; False:C215; ->[ORDERS:24])
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Company_Code:1; vCompCode)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Contact_Code:2; vContCode)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; vOrderCode)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Person:5; vSales)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Source:18; vSource)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Analysis_Code:33; vAnalysis)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Your_Order_Number:10; vOrderNo)
		Sel_SIDate(->[ORDERS:24]; ->[ORDERS:24]Enquiry_Date:25; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
		Sel_SIDate(->[ORDERS:24]; ->[ORDERS:24]Quotation_Date:26; vSDateF; vSDateT)
		Sel_SIDate(->[ORDERS:24]; ->[ORDERS:24]Order_Date:4; vIDateF; vIDateT)
		Sel_SIDate(->[ORDERS:24]; ->[ORDERS:24]Forecast_Date:23; vFDateF; vFDateT)
		Sel_State(->[ORDERS:24]; ->[ORDERS:24]State:15)
		Sel_SCurr(->[ORDERS:24]; ->[ORDERS:24]Currency_Code:32; ACC_t_CurrencyCode)
		Sel_SLay(->[ORDERS:24]; ->[ORDERS:24]Layer_Code:47; vLayer)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Area_Code:35; vArea)
		Sel_S(->[ORDERS:24]; ->[ORDERS:24]Order_Type:43; vAttendType)
		Sel_SIString(->[ORDERS:24]; ->[ORDERS:24]Order_Period:42; ACC_t_PeriodFrom; ACC_t_PeriodTo)
		Sel_SIS(->[ORDERS:24])
		Sel_SSDate(->[ORDERS:24]; ->[ORDERS:24]Required_Date:9; vRDateF; vRDateT)
		Sel_SSStrSin(->[ORDERS:24]; ->[ORDERS:24]Taken_By:17; vTele)
		Sel_SSStrSin(->[ORDERS:24]; ->[ORDERS:24]Comments:14; vComments)
		Sel_SSStrSin(->[ORDERS:24]; ->[ORDERS:24]Enclosures:21; Enclosures)
		Sel_SSNum(->[ORDERS:24]; ->[ORDERS:24]Total_Amount:6; vAmountF; vAmountT)
		Sel_SSNum(->[ORDERS:24]; ->[ORDERS:24]Total_Margin:12; vMarginF; vMarginT)
		Sel_SSNum(->[ORDERS:24]; ->[ORDERS:24]Total_Margin_PC:13; vMarginPF; vMarginPT)
		
		If (vProdCode#"")
			Sel_SetAny("OrMaster"; ->[ORDERS:24])
			If (cNAA=0)
				vProdCode:=Sel_AtSign(vProdCode)
			End if 
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=vProdCode)
			Load_OneFast(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "OrMaster")
		End if 
		If (vCompName#"")
			Comp_SelPOther(->[ORDERS:24]; ->[ORDERS:24]Company_Code:1; "OrMaster"; vCompName)
		End if 
		
		
		Vtitle:=""
		If (VPersonName#"")  //&(VPersonName="")&(VSurname="")
			
			AA_LoadNameArrays
			AA_ParseName(VPersonName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
		Else 
			If (vContactname#"")
				If (Position:C15(" "; vContactname)=0) & (False:C215)
					vForename:=vContactname
					vSurname:=vContactname
				Else 
					AA_LoadNameArrays
					AA_ParseName(vContactname; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
					If (vForename#"") & (vSurname="")
						vSurname:=vForename
						vForename:=""
					End if 
				End if 
			End if 
		End if 
		If ((vForename#"") | (vSurname#""))
			Cont_SelPOther(->[ORDERS:24]; ->[ORDERS:24]Contact_Code:2; "OrMaster"; vForename; Vsurname)
		End if 
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("ORDERS"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[ORDERS:24])
					End if 
				End if 
			End for 
			
		End if 
		Big_One(->[ORDERS:24])
	End if 
End while 
Sel_Ending(->[ORDERS:24])
If ($_bo_OpenWindow)
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	SM_bo_SessionWindow:=False:C215
End if 

//Sel_EndArrClear
ERR_MethodTrackerReturn("Orders_SelP"; $_t_oldMethodName)
