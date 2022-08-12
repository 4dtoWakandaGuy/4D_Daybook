//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 10:17`Method: PurchOrd_SelP
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
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; Po_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(ViDateF; ViDateT; VPDateF; VPDateT; VRDateF; VRDateT)
	C_LONGINT:C283($_l_And; $_l_ArraySize; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID)
	C_LONGINT:C283($_l_Records; $_l_SearchRow; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; CH0)
	C_LONGINT:C283(CH1; cNAA; cNAL; cSIS; R0; R1; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber)
	C_LONGINT:C283(SRCH_l_And; SRCH_l_Not; SRCH_l_or; vIDateFOffset; vIDateTOffset; vpDateFOffset; vpDateTOffset; vPu; vRDateFOffset; vRDateTOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; VinvF; vInvT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; ACC_t_CurrencyCode; VAnalysis; VCompCode; VCompName; VCOmpNameC; vContactName; vContCode; vEvent; VforeName)
	C_TEXT:C284(VLayer; VorderNo; VPersonName; VProdCode; VPurchCode; VPurchInvNo; VSELPREV; Vsurname; Vtitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_SelP")

$_bo_OpenWindow:=False:C215
vIDateFOffset:=0
vIDateTOffset:=0
vpDateFOffset:=0
vpDateTOffset:=0
vRDateFOffset:=0
vRDateTOffset:=0
//Purchase Orders_SelP
Sel_Beginning(False:C215; ->[PURCHASE_ORDERS:57])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_TableNumber:=Table:C252(->[PURCHASE_ORDERS:57])
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
			Sel_Beginning2(False:C215; ->[PURCHASE_ORDERS:57])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[PURCHASE_ORDERS:57])
	End if 
	
	
	If (vSelPrev#"•FSC")
		PurchOrd_SelPvs
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
			Open_AnyTypeWindow(322; 528; 4; "Find Purchase Orders")
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Purchase Orders")
		End if 
		
		DIALOG:C40([PURCHASE_ORDERS:57]; "dPurchOrd_Sel")
		
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
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
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->vIDateFOffset; ->vIDateTOffset; ->vpDateFOffset; ->vpDateTOffset; ->vRDateFOffset; ->vRDateTOffset)
				
				
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
			If (Not:C34(Po_bo_FFLoaded))
				SM_SetUpFFArray(->[PURCHASE_ORDERS:57])
				Po_bo_FFLoaded:=True:C214
			End if 
			vIDateFOffset:=0
			vIDateTOffset:=0
			vpDateFOffset:=0
			vpDateTOffset:=0
			vRDateFOffset:=0
			vRDateTOffset:=0
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
			If (Not:C34(Po_bo_FFLoaded))
				SM_SetUpFFArray(->[PURCHASE_ORDERS:57])
				Po_bo_FFLoaded:=True:C214
			End if 
			vIDateFOffset:=0
			vIDateTOffset:=0
			vpDateFOffset:=0
			vpDateTOffset:=0
			vRDateFOffset:=0
			vRDateTOffset:=0
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
					Open_AnyTypeWindow(322; 528; 4; "Find Purchase Orders")
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Purchase Orders")
				End if 
				
				DIALOG:C40([PURCHASE_ORDERS:57]; "dPurchOrd_Sel")
				
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
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->vContCode; ->VforeName; ->Vsurname; ->VPurchCode; ->VPurchInvNo; ->VorderNo; ->VCOmpNameC; ->ViDateF; ->ViDateT; ->VPDateF; ->VPDateT; ->VRDateF; ->VRDateT; ->vInvF; ->vinvT; ->VProdCode; ->VAnalysis; ->ACC_t_CurrencyCode; ->VLayer; ->CH0; ->CH1; ->R0; ->R1; ->cSIS; ->cNAA; ->cNAL)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->vEvent)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactName; ->vIDateFOffset; ->vIDateTOffset; ->vpDateFOffset; ->vpDateTOffset; ->vRDateFOffset; ->vRDateTOffset)
						
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
		Sel_S(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Company_Code:1; vCompCode)
		Sel_S(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Contact_Code:5; vContCode)
		Sel_S(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; vPurchInvNo)
		Sel_SIDate(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Purchase_Order_Date:3; vIDateF; vIDateT)
		Sel_SSUB(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; vProdCode; ->[PURCHASE_ORDERS_ITEMS:169]; ->[PURCHASE_ORDERS_ITEMS:169]Product_Code:1)
		
		
		ch0:=0
		ch1:=0
		For ($_l_Index; 1; Size of array:C274(SYS_at_RecordStateNames))
			If (Position:C15("Unconfirmed"; SYS_at_RecordStateNames{$_l_Index})>0)
				If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
					ch0:=1
					
				End if 
				$_l_Index:=999999
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274(SYS_at_RecordStateNames))
			If (Position:C15("Unconfirmed"; SYS_at_RecordStateNames{$_l_Index})=0) & (Position:C15("confirmed"; SYS_at_RecordStateNames{$_l_Index})>0)
				
				If (MOD_al_ModuleAccessStatus{$_l_Index}=1)
					ch1:=1
					
				End if 
				$_l_Index:=999999
			End if 
		End for 
		
		Sel_c01(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]State:14; -1; 0)
		Sel_State(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Record_State:19)
		Sel_SIDate(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Posted_Date:13; vRdateF; vRdateT)
		If (r1=1)
			QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Posted_Date:13=!00-00-00!)
			Master2(->[PURCHASE_ORDERS:57])
		End if 
		If (r0=1)
			QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Posted_Date:13#!00-00-00!)
			Master2(->[PURCHASE_ORDERS:57])
		End if 
		Sel_S(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Analysis_Code:15; vAnalysis)
		
		Sel_SCurr(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Currency_Code:16; ACC_t_CurrencyCode)
		Sel_SLay(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Layer_Code:17; vLayer)
		Sel_SIS(->[PURCHASE_ORDERS:57])
		
		Sel_SSStrSin(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Supplier_Ref:12; vOrderNo)
		Sel_SSDate(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Supply_by_Date:10; vPDateF; vPDateT)
		Sel_SSNum(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Total_Cost:4; vInvF; vInvT)
		Sel_SSStrSin(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Finance_Method:11; vPurchCode)
		Sel_SSStrSin(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Deliver_to_Company:6; vCompNameC)
		If (vCompName#"")
			Comp_SelPOther(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Company_Code:1; "Master2"; VCompName)
		End if 
		//TRACE
		Vtitle:=""
		If (VPersonName#"")  //&(VPersonName="")&(VSurname="")
			AA_LoadNameArrays
			AA_ParseName(VPersonName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
		End if 
		
		If ((vForename#"") | (vSurname#""))
			Cont_SelPOther(->[PURCHASE_ORDERS:57]; ->[PURCHASE_ORDERS:57]Contact_Code:5; "Master2"; VForename; VSurname)
		End if 
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("PURCHASE ORDERS"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[PURCHASE_ORDERS:57])
					End if 
				End if 
			End for 
			
		End if 
		Big_One(->[PURCHASE_ORDERS:57])
	End if 
End while 
Sel_Ending(->[PURCHASE_ORDERS:57])
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
ERR_MethodTrackerReturn("PurchOrd_SelP"; $_t_oldMethodName)