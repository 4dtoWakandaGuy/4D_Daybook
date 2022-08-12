//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_QueryIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; SRCH_d_TransToDate; VDoDateF; VDoDateT; VTDateF)
	C_LONGINT:C283($_l_And; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID; $_l_QueryRow)
	C_LONGINT:C283($_l_SizeofArray; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowRightOLD; $_l_WindowRow; $_l_WindowTopOLD; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset; ACC_l_PeriodFromOffset)
	C_LONGINT:C283(ACC_l_PeriodToOffset; ACC_l_TransDateFromOffset; ACC_l_TransDateToOffset; CH0; CH1; Ch2; cNAA; cNAL; cSIS; R1; R2)
	C_LONGINT:C283(SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; VDoDateFOffset; VDoDatetOffset; VNo1)
	C_LONGINT:C283(VNo2; vTr; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285($1; VamountF; VamountT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; Vlayer; VSELPREV; VText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_SelP")
$_bo_OpenWindow:=False:C215
ACC_l_PeriodFromOffset:=0
ACC_l_PeriodToOffset:=0
ACC_l_EntryDateFromOffset:=0
ACC_l_TransDateFromOffset:=0
VDoDateFOffset:=0
ACC_l_EntryDateToOffset:=0
ACC_l_TransDateToOffset:=0
VDoDatetOffset:=0
//TransB_SelP
Sel_Beginning(False:C215; ->[TRANSACTION_BATCHES:30])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
$_l_ElementCount:=0
$_bo_NoSearch:=False:C215  // used for cross file search
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vTr=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
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
			Sel_Beginning2(False:C215; ->[TRANSACTION_BATCHES:30])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[TRANSACTION_BATCHES:30])
	End if 
	
	If (vSelPrev#"•FSC")
		TransB_SelPvs
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
			Open_AnyTypeWindow(277; 428; 4; "Find Transaction Batches")
			
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Transaction Batches")
		End if 
		DIALOG:C40([TRANSACTION_BATCHES:30]; "dTransB_Sel")
		
		
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
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VNo1; ->VNo2; ->Vlayer; ->VamountF; ->VamountT; ->VText; ->VDoDateF; ->VDoDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VTDateF; ->R1; ->R2; ->CH0; ->CH1; ->Ch2; ->SRCH_d_TransToDate; ->cSIS; ->cNAA; ->cNAL)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->VDoDateFOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset; ->VDoDatetOffset)
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
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ACC_l_EntryDateFromOffset:=0
			ACC_l_TransDateFromOffset:=0
			VDoDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			ACC_l_TransDateToOffset:=0
			VDoDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ACC_l_TransDateFromOffset#0)
				Case of 
					: (ACC_l_TransDateFromOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateFromOffset
					: (ACC_l_TransDateFromOffset>-100)
						//months
						VtDateF:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateFromOffset; 0)
					Else 
						//years
						VtDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateFromOffset)/100); 0; 0)
				End case 
			End if 
			If (ACC_l_TransDateToOffset#0)
				Case of 
					: (ACC_l_TransDateToOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateToOffset
					: (ACC_l_TransDateToOffset>-100)
						//months
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateToOffset; 0)
					Else 
						//years
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateToOffset)/100); 0; 0)
				End case 
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
			If (ACC_l_TransDateFromOffset#0)
				Case of 
					: (ACC_l_TransDateFromOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateFromOffset
					: (ACC_l_TransDateFromOffset>-100)
						//months
						VtDateF:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateFromOffset; 0)
					Else 
						//years
						VtDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateFromOffset)/100); 0; 0)
				End case 
			End if 
			If (ACC_l_TransDateToOffset#0)
				Case of 
					: (ACC_l_TransDateToOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateToOffset
					: (ACC_l_TransDateToOffset>-100)
						//months
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateToOffset; 0)
					Else 
						//years
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateToOffset)/100); 0; 0)
				End case 
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
			If (VDoDateFOffset#0)
				Case of 
					: (VDoDateFOffset>0)
						VDoDateF:=Current date:C33-VDoDateFOffset
					: (VDoDateFOffset>-100)
						//months
						VDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
					Else 
						//years
						VDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VDoDateTOffset#0)
				Case of 
					: (VDoDateTOffset>0)
						VDoDateF:=Current date:C33-VDoDateTOffset
					: (VDoDateTOffset>-100)
						//months
						VDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
					Else 
						//years
						VDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
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
			ACC_l_PeriodFromOffset:=0
			ACC_l_PeriodToOffset:=0
			ACC_l_EntryDateFromOffset:=0
			ACC_l_TransDateFromOffset:=0
			VDoDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			ACC_l_TransDateToOffset:=0
			VDoDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ACC_l_TransDateFromOffset#0)
				Case of 
					: (ACC_l_TransDateFromOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateFromOffset
					: (ACC_l_TransDateFromOffset>-100)
						//months
						VtDateF:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateFromOffset; 0)
					Else 
						//years
						VtDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateFromOffset)/100); 0; 0)
				End case 
			End if 
			If (ACC_l_TransDateToOffset#0)
				Case of 
					: (ACC_l_TransDateToOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateToOffset
					: (ACC_l_TransDateToOffset>-100)
						//months
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateToOffset; 0)
					Else 
						//years
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateToOffset)/100); 0; 0)
				End case 
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
			If (ACC_l_TransDateFromOffset#0)
				Case of 
					: (ACC_l_TransDateFromOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateFromOffset
					: (ACC_l_TransDateFromOffset>-100)
						//months
						VtDateF:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateFromOffset; 0)
					Else 
						//years
						VtDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateFromOffset)/100); 0; 0)
				End case 
			End if 
			If (ACC_l_TransDateToOffset#0)
				Case of 
					: (ACC_l_TransDateToOffset>0)
						VtDateF:=Current date:C33-ACC_l_TransDateToOffset
					: (ACC_l_TransDateToOffset>-100)
						//months
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; 0; ACC_l_TransDateToOffset; 0)
					Else 
						//years
						SRCH_d_TransToDate:=Add to date:C393(Current date:C33; -(Abs:C99(ACC_l_TransDateToOffset)/100); 0; 0)
				End case 
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
			If (VDoDateFOffset#0)
				Case of 
					: (VDoDateFOffset>0)
						VDoDateF:=Current date:C33-VDoDateFOffset
					: (VDoDateFOffset>-100)
						//months
						VDoDateF:=Add to date:C393(Current date:C33; 0; VDoDateFOffset; 0)
					Else 
						//years
						VDoDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VDoDateTOffset#0)
				Case of 
					: (VDoDateTOffset>0)
						VDoDateF:=Current date:C33-VDoDateTOffset
					: (VDoDateTOffset>-100)
						//months
						VDoDateT:=Add to date:C393(Current date:C33; 0; VDoDateTOffset; 0)
					Else 
						//years
						VDoDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDoDateTOffset)/100); 0; 0)
				End case 
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
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWindow:=True:C214
					Open_AnyTypeWindow(277; 428; 4; "Find Transaction Batches")
					
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Transaction Batches")
				End if 
				DIALOG:C40([TRANSACTION_BATCHES:30]; "dTransB_Sel")
				
				
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
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VNo1; ->VNo2; ->Vlayer; ->VamountF; ->VamountT; ->VText; ->VDoDateF; ->VDoDateT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VTDateF; ->R1; ->R2; ->CH0; ->CH1; ->Ch2; ->SRCH_d_TransToDate; ->cSIS; ->cNAA; ->cNAL)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->ACC_l_TransDateFromOffset; ->VDoDateFOffset; ->ACC_l_EntryDateToOffset; ->ACC_l_TransDateToOffset; ->VDoDatetOffset)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
						SM_l_SearchNumber:=SM_SaveSearchParameters(SM_l_QuerySearchID; ""; $_l_TableNumber; -1; ->SM_blb_SearchBlob)
					Else 
						READ WRITE:C146([x_QUERY_PARAMETERS:134])
						QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=SM_l_QuerySearchID)
						[x_QUERY_PARAMETERS:134]X_OwnerID:2:=-1
						[x_QUERY_PARAMETERS:134]X_ContextID:3:=$_l_TableNumber
						$_l_offset:=0
						SET BLOB SIZE:C606([x_QUERY_PARAMETERS:134]X_SearchValues:5; 0)
						VARIABLE TO BLOB:C532(SM_l_ReturnQueryID; [x_QUERY_PARAMETERS:134]X_SearchValues:5; $_l_offset)
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
			
			vTr:=0
		End if 
		
	Else 
		Sel_SINum(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Batch_Number:10; vNo1; vNo2)
		Sel_SIDate(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Batch_Date:1; vTDateF; SRCH_d_TransToDate)
		Sel_SRadio(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Reverse:14; r1; True:C214)
		Sel_SRadio(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Reverse:14; r2; False:C215)
		Sel_c02(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]State:15; 0; 1; 2)
		Sel_SIS(->[TRANSACTION_BATCHES:30])
		Sel_SSDate(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Entry_Date:6; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
		Sel_SSDate(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Posted_Date:16; vDoDateF; vDoDateT)
		Sel_SSNum(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Batch_Amount:3; vAmountF; vAmountT)
		Sel_SSStrSin(->[TRANSACTION_BATCHES:30]; ->[TRANSACTION_BATCHES:30]Description:12; vText)
		
		Big_One(->[TRANSACTION_BATCHES:30])
	End if 
End while 
Sel_Ending(->[TRANSACTION_BATCHES:30])
If ($_bo_OpenWindow)
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowRow}
		End if 
	End if 
	
	SM_bo_SessionWindow:=False:C215
End if 
ERR_MethodTrackerReturn("TransB_SelP"; $_t_oldMethodName)
