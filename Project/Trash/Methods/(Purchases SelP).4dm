//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 10:17`Method: Purchases_SelP
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_FromDates; 0)
	ARRAY LONGINT:C221($_al_QueryIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; PUR_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_DateF; $_d_DateT; ViDateF; ViDateT; VpDateF; VpDateT; VRDateF; VRDateT)
	C_LONGINT:C283($_l_And; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID; $_l_Records)
	C_LONGINT:C283($_l_SearchRow; $_l_SizeofArray; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; ACC_l_PeriodFromOffset)
	C_LONGINT:C283(ACC_l_PeriodToOffset; CH0; CH1; CH2; CH3; CH4; CH5; CH6; CH7; cNAA; cNAL)
	C_LONGINT:C283(cSIS; R0; R1; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or)
	C_LONGINT:C283(VIDateFOffset; ViDateTOffset; VPDateFOffset; VPDateTOffset; vPu; VRDateFOffset; VRDateTOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; VChargesF; VChargesT; VDueF; VDueTo; VinvF)
	C_REAL:C285(vInvT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; VCompCode; VCompName)
	C_TEXT:C284(vContactName; VEvent; VJob; VLayer; VName; VOrderNo; VProdCode; VPurchCode; VPurchInvNo; VSELPREV; VStage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_SelP")
//Project Method Purchases_SelP 2/3/2(ID-15558-4222)

$_bo_OpenWindow:=False:C215

//Purchases_SelP

Sel_Beginning(False:C215; ->[PURCHASE_INVOICES:37])
VIDateFOffset:=0
VPDateFOffset:=0
VRDateFOffset:=0

ViDateTOffset:=0
VPDateTOffset:=0
VRDateTOffset:=0
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_TableNumber:=Table:C252(->[PURCHASE_INVOICES:37])
$_l_ElementCount:=0
$_bo_NoSearch:=False:C215  // used for cross file search
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vPu=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
	$_l_WhilesCounter:=$_l_WhilesCounter+1
	If (Count parameters:C259>=2)
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
			Sel_Beginning2(False:C215; ->[PURCHASE_INVOICES:37])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[PURCHASE_INVOICES:37])
	End if 
	
	If (vSelPrev#"•FSC")
		Purch_SelPvs
	End if 
	
	If ($_l_QueryID=0)
		SM_l_QueryMode:=0
		If ($_l_Mode=1)
			SM_l_QueryMode:=1
			SM_l_ReturnQueryID:=0
			ARRAY LONGINT:C221($_al_SearchIDs; 0)
			COPY ARRAY:C226($3->; $_al_SearchIDs)
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
			
			Open_AnyTypeWindow(361; 692; 4; Term_SLPLWT("Find Purchase Ledger Transactions"))
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213(Term_SLPLWT("Find Purchase Ledger Transactions"))
		End if 
		DIALOG:C40([PURCHASE_INVOICES:37]; "dPurch Sel")
		
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226($_al_SearchIDs; $3->)
			$_l_SizeofArray:=Size of array:C274($3->)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_CurrentRow:=0
			For ($_l_Index; $_l_SizeofArray+1; Size of array:C274($3->))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$3->{$_l_Index}:=$_al_SearchIDsReturn{$_l_CurrentRow}
			End for 
		Else 
			If (SM_l_QueryMode>0)
				COPY ARRAY:C226($_al_SearchIDs; $3->)
				
			End if 
			
		End if 
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VPurchCode; ->VPurchInvNo; ->VOrderNo; ->ViDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_AnalysisCodeFrom; ->ACC_t_PeriodTo; ->VAnalCodeT; ->VStage; ->VJob; ->VpDateF)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VRDateF; ->VamountF; ->VInvF; ->VChargesF; ->VDueF; ->Acc_t_AccountCodeFrom; ->VpDateT; ->VRDateT; ->VamountT; ->VInvT; ->VChargesT; ->VDueTo; ->Acc_t_AccountCodeTo; ->VProdCode; ->VName)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VEvent; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->VIDateFOffset; ->VPDateFOffset; ->VRDateFOffset; ->ViDateTOffset; ->VPDateTOffset; ->VRDateTOffset)
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
			
			// here save the SRCH_l_And, SRCH_l_or, SRCH_l_Not variables at the end of the blob
			
			// here save the SRCH_l_And, SRCH_l_or, SRCH_l_Not variables at the end of the blob
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
			If (Not:C34(PUR_bo_FFLoaded))
				SM_SetUpFFArray(->[PURCHASE_INVOICES:37])
				PUR_bo_FFLoaded:=True:C214
			End if 
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			VIDateFOffset:=0
			VPDateFOffset:=0
			VRDateFOffset:=0
			
			ViDateTOffset:=0
			VPDateTOffset:=0
			VRDateTOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
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
			If (vPDateFOffset#0)
				Case of 
					: (vPDateFOffset>0)
						vPDateF:=Current date:C33-vPDateFOffset
					: (vPDateFOffset>-100)
						//months
						vPDateF:=Add to date:C393(Current date:C33; 0; vPDateFOffset; 0)
					Else 
						//years
						vPDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vPDateTOffset#0)
				Case of 
					: (vPDateTOffset>0)
						vPDateF:=Current date:C33-vPDateTOffset
					: (vPDateTOffset>-100)
						//months
						vPDateT:=Add to date:C393(Current date:C33; 0; vPDateTOffset; 0)
					Else 
						//years
						vPDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateTOffset)/100); 0; 0)
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
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset+1}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
					End if 
				End if 
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
			If (Not:C34(PUR_bo_FFLoaded))
				SM_SetUpFFArray(->[PURCHASE_INVOICES:37])
				PUR_bo_FFLoaded:=True:C214
			End if 
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			VIDateFOffset:=0
			VPDateFOffset:=0
			VRDateFOffset:=0
			
			ViDateTOffset:=0
			VPDateTOffset:=0
			VRDateTOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
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
			If (vPDateFOffset#0)
				Case of 
					: (vPDateFOffset>0)
						vPDateF:=Current date:C33-vPDateFOffset
					: (vPDateFOffset>-100)
						//months
						vPDateF:=Add to date:C393(Current date:C33; 0; vPDateFOffset; 0)
					Else 
						//years
						vPDateF:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (vPDateTOffset#0)
				Case of 
					: (vPDateTOffset>0)
						vPDateF:=Current date:C33-vPDateTOffset
					: (vPDateTOffset>-100)
						//months
						vPDateT:=Add to date:C393(Current date:C33; 0; vPDateTOffset; 0)
					Else 
						//years
						vPDateT:=Add to date:C393(Current date:C33; -(Abs:C99(vPDateTOffset)/100); 0; 0)
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
			
			
			
			$_l_And:=SRCH_l_And
			$_l_OR:=SRCH_l_or
			$_l_Not:=SRCH_l_Not
			
			//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
			$_bo_NoSearch:=False:C215
			If ($_l_Mode=2)  // edit
				$_bo_NoSearch:=True:C214
				SM_l_QueryMode:=2
				SM_l_QuerySearchID:=$_l_QueryID
				SM_l_ReturnQueryID:=0
				$_bo_OpenWindow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_OpenWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					Open_AnyTypeWindow(322; 528; 4; Term_SLPLWT("Find Purchase Ledger Transactions"))
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213(Term_SLPLWT("Find Purchase Ledger Transactions"))
				End if 
				DIALOG:C40([PURCHASE_INVOICES:37]; "dPurch Sel")
				
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
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VPurchCode; ->VPurchInvNo; ->VOrderNo; ->ViDateF; ->ViDateT; ->ACC_t_PeriodFrom; ->ACC_t_AnalysisCodeFrom; ->ACC_t_PeriodTo; ->VAnalCodeT; ->VStage; ->VJob; ->VpDateF)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VRDateF; ->VamountF; ->VInvF; ->VChargesF; ->VDueF; ->Acc_t_AccountCodeFrom; ->VpDateT; ->VRDateT; ->VamountT; ->VInvT; ->VChargesT; ->VDueTo; ->Acc_t_AccountCodeTo; ->VProdCode; ->VName)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VEvent; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->VIDateFOffset; ->VPDateFOffset; ->VRDateFOffset; ->ViDateTOffset; ->VPDateTOffset; ->VRDateTOffset)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
						
						SM_l_SearchNumber:=SM_SaveSearchParameters(SM_l_QuerySearchID; ""; $_l_TableNumber; -1; ->SM_blb_SearchBlob)
					Else 
						READ WRITE:C146([x_QUERY_PARAMETERS:134])
						QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=SM_l_QuerySearchID)
						[x_QUERY_PARAMETERS:134]X_OwnerID:2:=-1
						[x_QUERY_PARAMETERS:134]X_ContextID:3:=$_l_TableNumber
						$_l_offset:=0
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
			ARRAY LONGINT:C221($_al_QueryIDs; 0)
			//The Array after executing other tables
			ARRAY LONGINT:C221($_al_QueryIDs; (Size of array:C274($2->)-$_l_NextElement)+1)
			$_l_SearchRow:=1
			For ($_l_Index; $_l_NextElement; Size of array:C274($2->))
				$_al_QueryIDs{$_l_SearchRow}:=$2->{$_l_Index}
				$_l_SearchRow:=$_l_SearchRow+1
			End for 
			//Now chop off $2
			ARRAY LONGINT:C221($2->; $_l_NextElement-1)
			SM_al_NextElement:=0
			SM_CrossFileSearch($_l_Mode; $_l_TableNumber; $2; ->SM_al_NextElement)
			COPY ARRAY:C226($_al_QueryIDs; $2->)
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
			vPu:=0
		End if 
		
	Else 
		Sel_S(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; vPurchCode)
		Sel_S(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Company_Code:2; vCompCode)
		Sel_S(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; vPurchInvNo)
		Sel_SIString(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Period_Code:3; ACC_t_PeriodFrom; ACC_t_PeriodTo)
		Sel_SIString(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Analysis_Code:15; ACC_t_AnalysisCodeFrom; vAnalCodeT)
		Sel_SIString(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Credit_Stage:34; vStage; vJob)
		Sel_SIDate(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Invoice_Date:5; vIDateF; vIDateT)
		Sel_SSUB(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Purchase_Code:1; vProdCode; ->[PURCHASE_INVOICE_ITEMS:158]; ->[PURCHASE_INVOICE_ITEMS:158]Product_Code:1)
		Sel_S(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]UK_EC:18; vName)
		Sel_SINum(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Total_Due:9; vDueF; vDueTo)
		Sel_SIDate(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Due_Date:17; vRdateF; vRdateT)
		If (ch7=1)
			QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Total_Due:9#0)
			Master2(->[PURCHASE_INVOICES:37])
		End if 
		If (ch6=1)
			QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Due_Date:17=!00-00-00!)
			Master2(->[PURCHASE_INVOICES:37])
		End if 
		Sel_c05(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]State:24; 0; 2; 3; -2; -3; 1)
		
		Sel_SCurr(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Currency_Code:23; ACC_t_CurrencyCode)
		Sel_SLay(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Layer_Code:28; vLayer)
		Sel_SIS(->[PURCHASE_INVOICES:37])
		Sel_SSStrSin(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Order_Number:10; vOrderNo)
		Sel_SSStrSin(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Creditors_Account:13; Acc_t_AccountCodeFrom)
		Sel_SSStrSin(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Bank_Account:14; Acc_t_AccountCodeTo)
		Sel_SSDate(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Posted_Date:12; vPDateF; vPDateT)
		Sel_SSNum(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Total_Invoiced:7; vInvF; vInvT)
		Sel_SSNum(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Total_Paid:8; vChargesF; vChargesT)
		
		If ((vAmountF#0) | (vAmountT#0))
			If (vAmountT=0)
				$_d_DateF:=!1980-01-01!
			Else 
				$_d_DateF:=<>DB_d_CurrentDate-vAmountT
			End if 
			$_d_DateT:=<>DB_d_CurrentDate-vAmountF
			If (r0=1)
				Sel_SIDate(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Invoice_Date:5; $_d_DateF; $_d_DateT)
			Else 
				Sel_SIDate(->[PURCHASE_INVOICES:37]; ->[PURCHASE_INVOICES:37]Due_Date:17; $_d_DateF; $_d_DateT)
			End if 
		End if 
		
		If ((vCompName#"") | (ch6=1))
			Sel_Set(->[PURCHASE_INVOICES:37])
			
			//DEFAULT TABLE([COMPANIES])
			Sel_Beginning3(->[COMPANIES:2])
			Comp_SelPName(vCompName)
			
			If (ch6=1)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Autopay_Number:47#"")
				Master2(->[COMPANIES:2])
			End if 
			QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61#1)
			Master2(->[COMPANIES:2])
			Master_UseSS(->[COMPANIES:2])
			
			Load_ManyFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; "Master2"; ->[PURCHASE_INVOICES:37]Company_Code:2; ->[PURCHASE_INVOICES:37])
		End if 
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("PURCHASES"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[PURCHASE_INVOICES:37])
					End if 
				End if 
			End for 
			
		End if 
		Big_One(->[PURCHASE_INVOICES:37])
	End if 
End while 
Sel_Ending(->[PURCHASE_INVOICES:37])
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
ERR_MethodTrackerReturn("Purchases_SelP"; $_t_oldMethodName)