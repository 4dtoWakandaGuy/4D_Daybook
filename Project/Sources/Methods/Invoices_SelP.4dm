//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 10:17`Method: Invoices_SelP
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
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; INV_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; $DATEF; $DATET; VDoDateF; VDoDateT; viDateF; viDateT; VRdateF; VRDateT; vSDateF; vSDateT)
	C_LONGINT:C283($_l_And; $_l_ArraySize; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID)
	C_LONGINT:C283($_l_QueryRow; $_l_Records; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset)
	C_LONGINT:C283(bd9; CH0; CH1; CH2; CH3; CH4; CH5; CH6; CH7; CH8; cNAA)
	C_LONGINT:C283(cNAL; cSIS; r0; r1; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not)
	C_LONGINT:C283(SRCH_l_or; VDoDateFOffset; VDoDateTOffset; ViDateFOffset; ViDateTOffset; vIn; VRDateFOffset; VRDateTOffset; VsDateFOffset; VsDateTOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; $1; VamountF; VamountT; VChargesF; VChargesT; VDueF; VDueTo)
	C_REAL:C285(VinvF; vInvT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; VAnalCodeT; Varea; VCompCode)
	C_TEXT:C284(VCompName; vContactName; VContCode; Vevent; VForename; VInvNoF; VInvNoT; VJob; Vlayer; Vname; VProdCode)
	C_TEXT:C284(Vsales; VSELPREV; VStage; Vsurname; VTerms; Vtitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_SelP")
$_bo_OpenWindow:=False:C215
//Project Method Invoices_SelP 26/3/2(ID-18216-4508)
Sel_Beginning(False:C215; ->[INVOICES:39])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
ACC_l_PeriodFromOffset:=0
ACC_l_PeriodToOffset:=0
ViDateFOffset:=0
VRDateFOffset:=0
VDoDateFOffset:=0
VsDateFOffset:=0
ViDateTOffset:=0
VRDateTOffset:=0
VDoDateTOffset:=0
VsDateTOffset:=0

$_l_TableNumber:=Table:C252(->[INVOICES:39])
$_l_ElementCount:=0
$_bo_NoSearch:=False:C215  // used for cross file search
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vIn=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
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
			Sel_Beginning2(False:C215; ->[INVOICES:39])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[INVOICES:39])
	End if 
	
	
	If (vSelPrev#"•FSC")
		Invoices_SelPvs
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
			Open_AnyTypeWindow(322; 528; 4; Term_SLPLWT("Find Sales Ledger Transactions"))
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213(Term_SLPLWT("Find Sales Ledger Transactions"))
		End if 
		DIALOG:C40([INVOICES:39]; "dInv_Sel")
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		If (SM_l_QueryMode>0)
			If (Size of array:C274(SM_al_SearchIDsReturn)>0)  //regardless of the cancel?]
				ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
				COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
				COPY ARRAY:C226($_al_SearchIDs; $3->)
				$_l_ArraySize:=Size of array:C274($3->)
				INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; Size of array:C274($_al_SearchIDsReturn))
				$_l_CurrentRow:=0
				For ($_l_Index; $_l_ArraySize+1; Size of array:C274($3->))
					$_l_CurrentRow:=$_l_CurrentRow+1
					$3->{$_l_Index}:=$_al_SearchIDsReturn{$_l_CurrentRow}
				End for 
			Else 
				If (SM_l_QueryMode>0)
					COPY ARRAY:C226($_al_SearchIDs; $3->)
					
				End if 
				
			End if 
		End if 
		
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VContCode; ->VForename; ->Vsurname; ->VInvNoF; ->VInvNoT; ->viDateF; ->viDateT)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->ACC_t_AnalysisCodeFrom; ->VAnalCodeT; ->VStage; ->VJob; ->VRdateF; ->VRDateT; ->VinvF; ->VInvT)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VChargesF; ->VChargesT; ->VDueF; ->VDueTo; ->VamountF; ->VamountT; ->VDoDateF; ->VDoDateT; ->vSDateF; ->vSDateT)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->VTerms; ->VProdCode; ->Vevent; ->Vname; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->cSIS)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAA; ->cNAL; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->CH8; ->r0; ->r1)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ViDateFOffset; ->VRDateFOffset; ->VDoDateFOffset; ->VsDateFOffset; ->ViDateTOffset; ->VRDateTOffset; ->VDoDateTOffset; ->VsDateTOffset)
				
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
				$_l_offset:=0
				SET BLOB SIZE:C606([x_QUERY_PARAMETERS:134]X_SearchValues:5; 0)
				SM_SearchVarsToBlob(->[x_QUERY_PARAMETERS:134]X_SearchValues:5; ->SM_l_ReturnQueryID; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
				SM_l_SearchNumber:=[x_QUERY_PARAMETERS:134]X_ID:1
				UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
				READ ONLY:C145([x_QUERY_PARAMETERS:134])
			End if 
			
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
			If (Not:C34(INV_bo_FFLoaded))
				SM_SetUpFFArray(->[INVOICES:39])
				INV_bo_FFLoaded:=True:C214
			End if 
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ViDateFOffset:=0
			VRDateFOffset:=0
			VDoDateFOffset:=0
			VsDateFOffset:=0
			ViDateTOffset:=0
			VRDateTOffset:=0
			VDoDateTOffset:=0
			VsDateTOffset:=0
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
			If (ViDateFOffset#0)
				Case of 
					: (ViDateFOffset>0)
						vIDateF:=Current date:C33-ViDateFOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRDateFOffset#0)
				Case of 
					: (VRDateFOffset>0)
						vRDateF:=Current date:C33-VRDateFOffset
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					: (VRDateFOffset>-100)
						//months
						vRDateF:=Add to date:C393(Current date:C33; 0; VRDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					Else 
						//years
						vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDoDateFOffset#0)
				Case of 
					: (VDoDateFOffset>0)
						vDODateF:=Current date:C33-VDoDateFOffset
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					: (VDoDateFOffset>-100)
						//months
						vDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					Else 
						//years
						vDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End case 
			End if 
			If (VSDateFOffset#0)
				Case of 
					: (VSDateFOffset>0)
						vSDateF:=Current date:C33-VSDateFOffset
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					: (VSDateFOffset>-100)
						//months
						vSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					Else 
						//years
						vSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
				End case 
			End if 
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateT:=Current date:C33-ViDateTOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRDateTOffset#0)
				Case of 
					: (VRDateTOffset>0)
						vRDateT:=Current date:C33-VRDateTOffset
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					: (VRDateTOffset>-100)
						//months
						vRDateT:=Add to date:C393(Current date:C33; 0; VRDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					Else 
						//years
						vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDoDateTOffset#0)
				Case of 
					: (VDoDateTOffset>0)
						vDODateT:=Current date:C33-VDoDateTOffset
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					: (VDoDateTOffset>-100)
						//months
						vDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					Else 
						//years
						vDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End case 
				
			End if 
			If (VSDateTOffset#0)
				Case of 
					: (VSDateTOffset>0)
						vSDateT:=Current date:C33-VSDateTOffset
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					: (VSDateTOffset>-100)
						//months
						vSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					Else 
						//years
						vSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
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
			If (Not:C34(INV_bo_FFLoaded))
				SM_SetUpFFArray(->[INVOICES:39])
				INV_bo_FFLoaded:=True:C214
			End if 
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ViDateFOffset:=0
			VRDateFOffset:=0
			VDoDateFOffset:=0
			VsDateFOffset:=0
			ViDateTOffset:=0
			VRDateTOffset:=0
			VDoDateTOffset:=0
			VsDateTOffset:=0
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
			If (ViDateFOffset#0)
				Case of 
					: (ViDateFOffset>0)
						vIDateF:=Current date:C33-ViDateFOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRDateFOffset#0)
				Case of 
					: (VRDateFOffset>0)
						vRDateF:=Current date:C33-VRDateFOffset
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					: (VRDateFOffset>-100)
						//months
						vRDateF:=Add to date:C393(Current date:C33; 0; VRDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					Else 
						//years
						vRDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDoDateFOffset#0)
				Case of 
					: (VDoDateFOffset>0)
						vDODateF:=Current date:C33-VDoDateFOffset
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					: (VDoDateFOffset>-100)
						//months
						vDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					Else 
						//years
						vDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End case 
			End if 
			If (VSDateFOffset#0)
				Case of 
					: (VSDateFOffset>0)
						vSDateF:=Current date:C33-VSDateFOffset
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					: (VSDateFOffset>-100)
						//months
						vSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					Else 
						//years
						vSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
				End case 
			End if 
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateT:=Current date:C33-ViDateTOffset
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					: (ViDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oInvoiceDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRDateTOffset#0)
				Case of 
					: (VRDateTOffset>0)
						vRDateT:=Current date:C33-VRDateTOffset
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					: (VRDateTOffset>-100)
						//months
						vRDateT:=Add to date:C393(Current date:C33; 0; VRDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
					Else 
						//years
						vRDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oPostedDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDoDateTOffset#0)
				Case of 
					: (VDoDateTOffset>0)
						vDODateT:=Current date:C33-VDoDateTOffset
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					: (VDoDateTOffset>-100)
						//months
						vDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
					Else 
						//years
						vDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDateDueT@"; True:C214)
				End case 
				
			End if 
			If (VSDateTOffset#0)
				Case of 
					: (VSDateTOffset>0)
						vSDateT:=Current date:C33-VSDateTOffset
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					: (VSDateTOffset>-100)
						//months
						vSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
					Else 
						//years
						vSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oStatementDateT@"; True:C214)
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
					$_bo_OpenWindow:=True:C214
					Open_AnyTypeWindow(322; 528; 4; Term_SLPLWT("Find Sales Ledger Transactions"))
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					SET WINDOW TITLE:C213(Term_SLPLWT("Find Sales Ledger Transactions"))
				End if 
				DIALOG:C40([INVOICES:39]; "dInv_Sel")
				If (Not:C34($_bo_OpenWindow))
					SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					SET WINDOW TITLE:C213($_t_WindowTitleOLD)
				End if 
				
				//here resave the values
				If (SM_l_QueryMode=2) & (OK=1)
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->VContCode; ->VForename; ->Vsurname; ->VInvNoF; ->VInvNoT; ->viDateF; ->viDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->ACC_t_AnalysisCodeFrom; ->VAnalCodeT; ->VStage; ->VJob; ->VRdateF; ->VRDateT; ->VinvF; ->VInvT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VChargesF; ->VChargesT; ->VDueF; ->VDueTo; ->VamountF; ->VamountT; ->VDoDateF; ->VDoDateT; ->vSDateF; ->vSDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->VTerms; ->VProdCode; ->Vevent; ->Vname; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer; ->cSIS)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAA; ->cNAL; ->CH0; ->CH1; ->CH2; ->CH3; ->CH4; ->CH5; ->CH6; ->CH7; ->CH8; ->r0; ->r1)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_PeriodFromOffset; ->ACC_l_PeriodToOffset; ->ViDateFOffset; ->VRDateFOffset; ->VDoDateFOffset; ->VsDateFOffset; ->ViDateTOffset; ->VRDateTOffset; ->VDoDateTOffset; ->VsDateTOffset)
						
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
					
					// here save the SRCH_l_And, SRCH_l_or, SRCH_l_Not variables at the end of the blob
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
			$_l_QueryRow:=1
			For ($_l_Index; $_l_NextElement; Size of array:C274($2->))
				$_al_QueryIDs{$_l_QueryRow}:=$2->{$_l_Index}
				$_l_QueryRow:=$_l_QueryRow+1
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
			vIn:=0
		End if 
	Else 
		Sel_SIString(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; vInvNoF; vInvNoT)
		Sel_S(->[INVOICES:39]; ->[INVOICES:39]Company_Code:2; vCompCode)
		Sel_S(->[INVOICES:39]; ->[INVOICES:39]Contact_Code:3; vContCode)
		Sel_SIDate(->[INVOICES:39]; ->[INVOICES:39]Invoice_Date:4; vIDateF; vIDateT)
		Sel_SIDate(->[INVOICES:39]; ->[INVOICES:39]Due_Date:18; vDoDateF; vDoDateT)
		Sel_SIDate(->[INVOICES:39]; ->[INVOICES:39]Statement_Date:34; vSDateF; vSDateT)
		Sel_SSUB(->[INVOICES:39]; ->[INVOICES:39]Invoice_Number:1; vProdCode; ->[INVOICES_ITEMS:161]; ->[INVOICES_ITEMS:161]Product_Code:1)
		
		Sel_S(->[INVOICES:39]; ->[INVOICES:39]UK_EC:21; vName)
		Sel_S(->[INVOICES:39]; ->[INVOICES:39]Person:42; vSales)
		If (bd9=0)
			Sel_SINum(->[INVOICES:39]; ->[INVOICES:39]Total_Due:7; vDueF; vDueTo)
		End if 
		Sel_SIString(->[INVOICES:39]; ->[INVOICES:39]Period_Code:13; ACC_t_PeriodFrom; ACC_t_PeriodTo)
		Sel_SIString(->[INVOICES:39]; ->[INVOICES:39]Analysis_Code:17; ACC_t_AnalysisCodeFrom; vAnalCodeT)
		Sel_SIString(->[INVOICES:39]; ->[INVOICES:39]Credit_Stage:22; vStage; vJob)
		If ((ch7=1) & (bd9=0))
			QUERY:C277([INVOICES:39]; [INVOICES:39]Total_Due:7#0)
			Master2(->[INVOICES:39])
		End if 
		If (ch8=1)
			QUERY:C277([INVOICES:39]; [INVOICES:39]Statement_Date:34=!00-00-00!)
			Master2(->[INVOICES:39])
		End if 
		Sel_c06(->[INVOICES:39]; ->[INVOICES:39]State:10; -1; 0; 1; 2; 3; -2; -3)
		Sel_SCurr(->[INVOICES:39]; ->[INVOICES:39]Currency_Code:27; ACC_t_CurrencyCode)
		Sel_SLay(->[INVOICES:39]; ->[INVOICES:39]Layer_Code:38; vLayer)
		Sel_S(->[INVOICES:39]; ->[INVOICES:39]Area_Code:29; vArea)
		
		If ((vAmountF#0) | (vAmountT#0))
			If (vAmountT=0)
				$DateF:=!1980-01-01!
			Else 
				$DateF:=<>DB_d_CurrentDate-vAmountT
			End if 
			$DateT:=<>DB_d_CurrentDate-vAmountF
			If (r0=1)
				Sel_SIDate(->[INVOICES:39]; ->[INVOICES:39]Invoice_Date:4; $DateF; $DateT)
			Else 
				Sel_SIDate(->[INVOICES:39]; ->[INVOICES:39]Due_Date:18; $DateF; $DateT)
			End if 
		End if 
		Sel_SIS(->[INVOICES:39])
		Sel_SSStrSin(->[INVOICES:39]; ->[INVOICES:39]Debtors_Account:15; Acc_t_AccountCodeFrom)
		Sel_SSStrSin(->[INVOICES:39]; ->[INVOICES:39]Bank_Account:16; Acc_t_AccountCodeTo)
		Sel_SSStrSin(->[INVOICES:39]; ->[INVOICES:39]Terms:11; vTerms)
		Sel_SSDate(->[INVOICES:39]; ->[INVOICES:39]Posted_Date:8; vRDateF; vRDateT)
		If (bd9=0)
			Sel_SSNum(->[INVOICES:39]; ->[INVOICES:39]Total_Invoiced:5; vInvF; vInvT)
			Sel_SSNum(->[INVOICES:39]; ->[INVOICES:39]Total_Paid:6; vChargesF; vChargesT)
		End if 
		If (vCompName#"")
			Comp_SelPOther(->[INVOICES:39]; ->[INVOICES:39]Company_Code:2; "Master2"; vCompName)
		End if 
		//TRACE
		Vtitle:=""
		If (vContactname#"")
			
			AA_LoadNameArrays
			AA_ParseName(vContactname; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
			If (vForename#"") & (vSurname="")
				//vSurname:=vForename
			End if 
		End if 
		
		If ((vForename#"") | (vSurname#"") | (Vtitle#""))
			Cont_SelPOther(->[INVOICES:39]; ->[INVOICES:39]Contact_Code:3; "Master2"; vForename; vSurname; Vtitle)
		End if 
		// If (bd9=1)
		// Invoices_SelTot
		// End if
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("INVOICES"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[INVOICES:39])
					End if 
				End if 
			End for 
			
		End if 
		Big_One(->[INVOICES:39])
	End if 
End while 
Sel_Ending(->[INVOICES:39])

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
ERR_MethodTrackerReturn("Invoices_SelP"; $_t_oldMethodName)