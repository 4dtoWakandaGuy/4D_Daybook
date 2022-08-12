//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalSelect///12531761
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_PeriodFromDate; 0)
	ARRAY LONGINT:C221($_al_QueryIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_AnySearch; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; ACC_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_And; $_l_arraySIze; $_l_Element; $_l_ElementCount; $_l_Index; $_l_NextElement; $_l_NOT; $_l_offset; $_l_OR; $_l_PeriodID; $_l_QueryID)
	C_LONGINT:C283($_l_QueryIDRow; $_l_SearchMode; $_l_TableNumber; $_l_Whiles; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReferenceRow; $_l_WindowRight; $_l_WindowTitle; $_l_WindowTop; $1)
	C_LONGINT:C283(ACC_l_PeriodFromOffset; ACC_l_PeriodToOffset; cABL; ch5; ch6; ch7; cNAA; cNAL; cSIS; s1; s2)
	C_LONGINT:C283(SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; vAB; vAny; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3; vFilePtr)
	C_REAL:C285(VamountF; VAmountT; vValueF)
	C_TEXT:C284(<>YrPerF; $_t_oldMethodName; $_t_WindowTitle; Acc_t_AccountCodeFrom; Acc_t_AccountCodeTo; ACC_t_AnalysisCodeFrom; ACC_t_CurrencyCode; ACC_t_PeriodFrom; ACC_t_PeriodTo; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; VanalCodeT; vPB; VSELPREV; vText; vTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalSelect")
//ACC_BalSelect
vAB:=1
$_bo_AnySearch:=False:C215
If (Count parameters:C259>=1)
	
	Sel_Beginning(False:C215; ->[ACCOUNT_BALANCES:34])
	
	
Else 
	Sel_Beginning(False:C215; ->[ACCOUNT_BALANCES:34])
	
End if 
//$1=Mode
//S2= variable to return values in( a list of searches in the case of mode 1 returned in an array)
//$3 etc the search ids
$_bo_NoSearch:=False:C215  // used for cross file search
$_l_ElementCount:=0
$_bo_OpenWindow:=False:C215
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_TableNumber:=Table:C252(->[ACCOUNT_BALANCES:34])
$_l_SearchMode:=0
$_l_Element:=1
$_l_QueryID:=0
$_l_Whiles:=0
While ((vAB=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_Element<=$_l_ElementCount)
	$_l_Whiles:=$_l_Whiles+1
	If (Count parameters:C259>=2)
		If ($_l_ElementCount>0)
			$_l_QueryID:=0
			Case of 
				: ($1<0)
					$_l_SearchMode:=1  // Dont search we are building
				: ($_l_Element<=Size of array:C274($2->))
					$_l_QueryID:=$2->{$_l_Element}
					$_l_SearchMode:=$1
			End case 
		End if 
	End if 
	//IDLE  ` 03/04/03 pb
	If ($_l_SearchMode=0)
		If ($_l_Whiles=1)
			Sel_Beginning2(False:C215; ->[ACCOUNT_BALANCES:34])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[ACCOUNT_BALANCES:34])
	End if 
	
	
	Sel_Beginning2(False:C215; ->[ACCOUNT_BALANCES:34])
	
	If (vSelPrev#"•FSC")
		ACC_BalSelelectPrevious
		
		vPB:=""
		If ((DB_t_CurrentFormUsage#"") & (DB_t_CurrentFormUsage#"VAT"))
			vDate:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate); Year of:C25(<>DB_d_CurrentDate))
			$_l_PeriodID:=Check_Period
			ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
			If ([PERIODS:33]NL_Closed:5)
				Period_Find
				If (Records in selection:C76([PERIODS:33])>0)
					ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
				End if 
			End if 
		End if 
		Case of 
			: (DB_t_CurrentFormUsage="P&L@")
				ACC_t_PeriodFrom:=<>YrPerF
			: (DB_t_CurrentFormUsage="VAT")
				vDate:=Date_FromNums(1; Month of:C24(<>DB_d_CurrentDate); Year of:C25(<>DB_d_CurrentDate))
				$_l_PeriodID:=Check_Period
				ACC_t_PeriodTo:=[PERIODS:33]Period_Code:1
				vDate:=[PERIODS:33]To_Date:4-75
				$_l_PeriodID:=Check_Period
				ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
				Acc_t_AccountCodeFrom:=DB_GetLedgerVatInputACC
				Acc_t_AccountCodeTo:=DB_GetLedgerVatInputACC
		End case 
		If ((DB_t_CurrentFormUsage="Budget") | (DB_t_CurrentFormUsage="Both") | (DB_t_CurrentFormUsage="PL_B"))
			vText:="B"
		Else 
			vText:="A"
		End if 
		vFilePtr:=->[ACCOUNT_BALANCES:34]
	End if 
	If (vTitle="")
		vTitle:="Find Account Balances"
	Else 
		vTitle:=Uppers3(Lowercase:C14(vTitle))
		vTitle:=Replace string:C233(vTitle; "Vat"; "VAT")
	End if 
	vValueF:=1
	If ($_l_QueryID=0)
		
		SM_l_QueryMode:=0
		If ($_l_SearchMode=1)
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
			Open_AnyTypeWindow(272; 425; 4; vTitle)
		Else 
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_t_WindowTitle:=Get window title:C450
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			
			SET WINDOW TITLE:C213(vTitle)
		End if 
		DIALOG:C40([ACCOUNT_BALANCES:34]; "dACC_BalSelect")
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			
			SET WINDOW TITLE:C213($_t_WindowTitle)
		End if 
		//CLOSE WINDOW
		
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226($_al_SearchIDs; $3->)
			$_l_arraySIze:=Size of array:C274($3->)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_Element:=0
			For ($_l_Index; $_l_arraySIze+1; Size of array:C274($3->))
				$_l_Element:=$_l_Element+1
				$3->{$_l_Index}:=$_al_SearchIDsReturn{$_l_Element}
			End for 
		Else 
			If (SM_l_QueryMode>0)
				COPY ARRAY:C226($_al_SearchIDs; $3->)
				
			End if 
			
		End if 
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->ACC_t_AnalysisCodeFrom; ->VanalCodeT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VText; ->ACC_t_CurrencyCode; ->VamountF; ->VAmountT; ->ch5; ->ch7; ->ch6; ->cABL; ->vValueF; ->s1; ->s2; ->cSIS; ->cNAA; ->cNAL; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset)
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
				DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
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
		//```
	Else 
		
		
		//````
		//here we need to check the context of the query and if it is not account balances need to pass on the work to the appropriate search
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		$_bo_AndLoaded:=False:C215
		If ($_l_QueryID<0)
			//this is a reference to a search....
			//when the users are building a search they may select a search from the pop up that they want the system to use
			//the system creates a Set manager owner set which refers to the real search
			$_l_offset:=0
			SM_l_ReturnQueryID:=0
			If (Not:C34(ACC_bo_FFLoaded))
				SM_SetUpFFArray(->[ACCOUNT_BALANCES:34])
				ACC_bo_FFLoaded:=True:C214
			End if 
			ACC_l_PeriodToOffset:=0
			ACC_l_PeriodFromOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ACC_l_PeriodFromOffset>0)
				
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
				If (Records in selection:C76([PERIODS:33])>0)
					SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDate)
					SORT ARRAY:C229($_ad_PeriodFromDate; $_at_PeriodCodes; <)
					If ((ACC_l_PeriodFromOffset+1)<Size of array:C274($_ad_PeriodFromDate))
						ACC_t_PeriodFrom:=$_at_PeriodCodes{ACC_l_PeriodFromOffset+1}
					Else 
						ACC_t_PeriodFrom:=$_at_PeriodCodes{1}
					End if 
					If (ACC_l_PeriodToOffset>0)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_PeriodFromDate))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodFromOffset+1}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
					End if 
					
				End if 
				
			Else 
				If (ACC_l_PeriodToOffset>0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
					If (Records in selection:C76([PERIODS:33])>0)
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDate)
						SORT ARRAY:C229($_ad_PeriodFromDate; $_at_PeriodCodes; <)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_PeriodFromDate))
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
			If (Not:C34(ACC_bo_FFLoaded))
				SM_SetUpFFArray(->[ACCOUNT_BALANCES:34])
				ACC_bo_FFLoaded:=True:C214
			End if 
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ACC_l_PeriodFromOffset>0)
				
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=Current date:C33(*))
				If (Records in selection:C76([PERIODS:33])>0)
					SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDate)
					SORT ARRAY:C229($_ad_PeriodFromDate; $_at_PeriodCodes; <)
					If ((ACC_l_PeriodFromOffset+1)<Size of array:C274($_ad_PeriodFromDate))
						ACC_t_PeriodFrom:=$_at_PeriodCodes{ACC_l_PeriodFromOffset+1}
					Else 
						ACC_t_PeriodFrom:=$_at_PeriodCodes{1}
					End if 
					If (ACC_l_PeriodToOffset>0)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_PeriodFromDate))
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
						SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDate)
						SORT ARRAY:C229($_ad_PeriodFromDate; $_at_PeriodCodes; <)
						If ((ACC_l_PeriodToOffset+1)<Size of array:C274($_ad_PeriodFromDate))
							ACC_t_PeriodTo:=$_at_PeriodCodes{ACC_l_PeriodToOffset+1}
						Else 
							ACC_t_PeriodTo:=$_at_PeriodCodes{1}
						End if 
					End if 
				End if 
			End if 
			
			
			
			$_l_And:=SRCH_l_And
			$_l_OR:=SRCH_l_or
			$_l_NOT:=SRCH_l_Not
			
			//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
			$_bo_NoSearch:=False:C215
			If ($_l_SearchMode=2)  // edit
				$_bo_NoSearch:=True:C214
				SM_l_ReturnQueryID:=0
				SM_l_QueryMode:=2
				SM_l_QuerySearchID:=$_l_QueryID
				$_bo_OpenWindow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWindow:=True:C214
					Open_AnyTypeWindow(272; 425; 4; vTitle)
				Else 
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					$_t_WindowTitle:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213(vTitle)
				End if 
				DIALOG:C40([ACCOUNT_BALANCES:34]; "dACC_BalSelect")
				If (Not:C34($_bo_OpenWindow))
					SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					
					SET WINDOW TITLE:C213($_t_WindowTitle)
				End if 
				
				
				//here resave the values
				If (SM_l_QueryMode=2) & (OK=1)
					SRCH_l_And:=$_l_And
					SRCH_l_or:=$_l_OR
					SRCH_l_Not:=$_l_NOT
					
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Acc_t_AccountCodeFrom; ->Acc_t_AccountCodeTo; ->ACC_t_AnalysisCodeFrom; ->VanalCodeT; ->ACC_t_PeriodFrom; ->ACC_t_PeriodTo; ->VText; ->ACC_t_CurrencyCode; ->VamountF; ->VAmountT; ->ch5; ->ch7; ->ch6; ->cABL; ->vValueF; ->s1; ->s2; ->cSIS; ->cNAA; ->cNAL; ->ACC_l_PeriodToOffset; ->ACC_l_PeriodFromOffset)
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
			For ($_l_Index; $_l_Element; Size of array:C274($2->))
				QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$2->{$_l_Index})
				If ([x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_TableNumber)
					$_l_NextElement:=$_l_Index
					$_l_Index:=Size of array:C274($2->)
				End if 
			End for 
			ARRAY LONGINT:C221($_al_QueryIDs; 0)
			//The Array after executing other tables
			ARRAY LONGINT:C221($_al_QueryIDs; (Size of array:C274($2->)-$_l_NextElement)+1)
			$_l_QueryIDRow:=1
			For ($_l_Index; $_l_NextElement; Size of array:C274($2->))
				$_al_QueryIDs{$_l_QueryIDRow}:=$2->{$_l_Index}
				$_l_QueryIDRow:=$_l_QueryIDRow+1
			End for 
			//Now chop off $2
			ARRAY LONGINT:C221($2->; $_l_NextElement-1)
			SM_al_NextElement:=0
			SM_CrossFileSearch($_l_SearchMode; $_l_TableNumber; $2; ->SM_al_NextElement)
			COPY ARRAY:C226($_al_QueryIDs; $2->)
			$_l_ElementCount:=Size of array:C274($2->)
			$_l_Element:=0
			$_bo_NoSearch:=True:C214
			
			
			
		End if 
		$_l_QueryID:=0
		$_l_Element:=$_l_Element+1
		If ($_l_Element>Size of array:C274($2->)) | ($_l_SearchMode=2)  // edit will not call each window at the same time
			//must break out
			SRCH_l_And:=0
			SRCH_l_or:=0
			SRCH_l_Not:=0
		End if 
		
		
		//```
	End if 
	
	
	If (OK=0) | ($_l_SearchMode#0) | ($_bo_NoSearch)
		If (SRCH_l_And=0) & (SRCH_l_or=0) & (SRCH_l_Not=0)
			vAB:=0
		End if 
		
	Else 
		$_bo_AnySearch:=True:C214
		Sel_SIString(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Analysis_Code:1; ACC_t_AnalysisCodeFrom; vAnalCodeT)
		Sel_SIString(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Period_Code:4; ACC_t_PeriodFrom; ACC_t_PeriodTo)
		Sel_SCurr(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Currency_Code:6; ACC_t_CurrencyCode)
		
		If ((DB_t_CurrentFormUsage="Both") | (DB_t_CurrentFormUsage="PL_B"))
			QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Layer_Code:5=DB_GetLedgerActualLayer; *)
			QUERY:C277([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Layer_Code:5=""; *)
			QUERY:C277([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Layer_Code:5=vText)
			Master2(->[ACCOUNT_BALANCES:34])
		Else 
			Sel_SLayer(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Layer_Code:5; vText)
		End if 
		
		If (DB_t_CurrentFormUsage="VAT")
			USE SET:C118("Master")
			CREATE SET:C116([ACCOUNT_BALANCES:34]; "Master1")
		End if 
		
		If ((Acc_t_AccountCodeFrom#"") | (Acc_t_AccountCodeTo#""))
			If (Acc_t_AccountCodeTo="")
				Acc_t_AccountCodeTo:="ZZZZZ"
			End if 
			If (DB_t_CurrentFormUsage="VAT")
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=Acc_t_AccountCodeFrom; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  | ; [ACCOUNT_BALANCES:34]Account_Code:2=Acc_t_AccountCodeTo)
			Else 
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2>=Acc_t_AccountCodeFrom; *)
				QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Account_Code:2<=Acc_t_AccountCodeTo)
			End if 
			Master2(->[ACCOUNT_BALANCES:34])
		End if 
		
		Sel_SSNum(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]Balance:3; vAmountF; vAmountT)
		Sel_SIS(->[ACCOUNT_BALANCES:34])
		If (vAny=0)
			ALL RECORDS:C47([ACCOUNT_BALANCES:34])
			
		Else 
			USE SET:C118("Master")
		End if 
		Big_One(->[ACCOUNT_BALANCES:34])
	End if 
End while 
If ($_bo_AnySearch)
	Sel_Ending(->[ACCOUNT_BALANCES:34])
End if 

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
ERR_MethodTrackerReturn("ACC_BalSelect"; $_t_oldMethodName)
