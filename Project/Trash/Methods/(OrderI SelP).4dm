//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:51
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
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(SYS_at_RecordStateNames;0)
	C_BLOB:C604(SM_bl_ReturnBlob; SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; ORD_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(VDNDateF; VDNDateT; ViDateF; ViDateT; VRdDateF; VRdDateT)
	C_LONGINT:C283($_l_And; $_l_ArraySize; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID)
	C_LONGINT:C283($_l_QueryRow; $_l_Records; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; cNAA)
	C_LONGINT:C283(cNAL; cSetAdd; cSetMod; cSIS; r0; r1; r2; r3; r4; r5; r6)
	C_LONGINT:C283(r7; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; VDnDateFOffset; VDnDateTOffset)
	C_LONGINT:C283(ViDateFOffset; ViDateTOffset; VItemNum; vOrdI; VRdDateFOffset; VRdDateTOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285(VamountF; VamountT; VMarginF; VMarginT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; ACC_t_CurrencyCode; Varea; vContactName; vCOntrCode; VInvNoF; VInvNoT; vItemRef; Vlayer; VOrderCode)
	C_TEXT:C284(vOrderNo; VProbCode; VProdCode; vProdName; VSales; VSELPREV; VSerialNo; VSolCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SelP")
//OrderI_SelP
$_bo_OpenWindow:=False:C215
ViDateFOffset:=0
VRdDateFOffset:=0
VDnDateFOffset:=0
ViDateTOffset:=0
VRdDateTOffset:=0
VDnDateTOffset:=0


Sel_Beginning(False:C215; ->[ORDER_ITEMS:25])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
$_l_ElementCount:=0
$_bo_NoSearch:=False:C215  // used for cross file search
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vOrdI=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
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
			Sel_Beginning2(False:C215; ->[ORDER_ITEMS:25])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[ORDER_ITEMS:25])
	End if 
	
	//here we need to check the context of the query and if it is not account balances need to pass on the work to the appropriate search
	
	//SM_LoadSearchParameters ($_l_QueryID)
	//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
	//$_l_QueryID:=0
	
	If (vSelPrev#" FSC")
		OrderI_SelPvs
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
			$_bo_SessionWindowOwner:=True:C214
			
			SM_bo_SessionWindow:=True:C214
			$_bo_OpenWindow:=True:C214
			Open_AnyTypeWindow(322; 528; 4; "Find Order Items")
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Order items")
		End if 
		DIALOG:C40([ORDER_ITEMS:25]; "dItems Sel")
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
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VOrderCode; ->VSolCode; ->VProdCode; ->vProdName; ->VSerialNo; ->VSales; ->VProbCode; ->VItemNum; ->vItemRef; ->VInvNoF; ->VInvNoT; ->ViDateF; ->ViDateT)
				SM_SearchVarsToBlob(->SM_bl_ReturnBlob; ->VDNDateF; ->VDNDateT; ->VRdDateF; ->VRdDateT; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vOrderNo; ->vCOntrCode; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cSetMod; ->r0; ->r1; ->r2; ->r3; ->r4; ->r5; ->r6; ->r7; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ViDateFOffset; ->VRdDateFOffset; ->VDnDateFOffset; ->ViDateTOffset; ->VRdDateTOffset; ->VDnDateTOffset)
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
			If (Not:C34(ORD_bo_FFLoaded))
				SM_SetUpFFArray(->[ORDERS:24])
				ORD_bo_FFLoaded:=True:C214
			End if 
			ViDateFOffset:=0
			VRdDateFOffset:=0
			VDnDateFOffset:=0
			ViDateTOffset:=0
			VRdDateTOffset:=0
			VDnDateTOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (VDnDateFOffset#0)
				Case of 
					: (VDnDateFOffset>0)
						vDnDateF:=Current date:C33-VDnDateFOffset
						
					: (VDnDateFOffset>-100)
						//months
						vDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
						
					Else 
						//years
						vDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
						
				End case 
				
				
			End if 
			If (VDnDateTOffset#0)
				Case of 
					: (VDnDateTOffset>0)
						vDnDateF:=Current date:C33-VDnDateTOffset
						
					: (VDnDateTOffset>-100)
						//months
						vDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
						
					Else 
						//years
						vDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
						
				End case 
				
				
			End if 
			
			
			If (ViDateFOffset#0)
				Case of 
					: (ViDateFOffset>0)
						vIDateF:=Current date:C33-ViDateFOffset
						
					: (ViDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
						
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
						
				End case 
				
				
			End if 
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateF:=Current date:C33-ViDateTOffset
						
					: (ViDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
						
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
						
				End case 
				
				
			End if 
			If (VRdDateFOffset#0)
				Case of 
					: (VRdDateFOffset>0)
						vRdDateF:=Current date:C33-VRdDateFOffset
						
					: (VRdDateFOffset>-100)
						//months
						vRdDateF:=Add to date:C393(Current date:C33; 0; VRdDateFOffset; 0)
						
					Else 
						//years
						vRdDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateFOffset)/100); 0; 0)
						
				End case 
				
				
			End if 
			If (VRdDateTOffset#0)
				Case of 
					: (VRdDateTOffset>0)
						vRdDateF:=Current date:C33-VRdDateTOffset
						
					: (VRdDateTOffset>-100)
						//months
						vRdDateT:=Add to date:C393(Current date:C33; 0; VRdDateTOffset; 0)
						
					Else 
						//years
						vRdDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
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
			If (Not:C34(ORD_bo_FFLoaded))
				SM_SetUpFFArray(->[ORDERS:24])
				ORD_bo_FFLoaded:=True:C214
			End if 
			ViDateFOffset:=0
			VRdDateFOffset:=0
			VDnDateFOffset:=0
			ViDateTOffset:=0
			VRdDateTOffset:=0
			VDnDateTOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (VDnDateFOffset#0)
				Case of 
					: (VDnDateFOffset>0)
						vDnDateF:=Current date:C33-VDnDateFOffset
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					: (VDnDateFOffset>-100)
						//months
						vDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					Else 
						//years
						vDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VDnDateTOffset#0)
				Case of 
					: (VDnDateTOffset>0)
						vDnDateF:=Current date:C33-VDnDateTOffset
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					: (VDnDateTOffset>-100)
						//months
						vDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
					Else 
						//years
						vDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oDeliveryDateT@"; True:C214)
				End case 
				
				
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
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateF:=Current date:C33-ViDateTOffset
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
			If (VRdDateFOffset#0)
				Case of 
					: (VRdDateFOffset>0)
						vRdDateF:=Current date:C33-VRdDateFOffset
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					: (VRdDateFOffset>-100)
						//months
						vRdDateF:=Add to date:C393(Current date:C33; 0; VRdDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					Else 
						//years
						vRdDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
				End case 
				
				
			End if 
			If (VRdDateTOffset#0)
				Case of 
					: (VRdDateTOffset>0)
						vRdDateF:=Current date:C33-VRdDateTOffset
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					: (VRdDateTOffset>-100)
						//months
						vRdDateT:=Add to date:C393(Current date:C33; 0; VRdDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
					Else 
						//years
						vRdDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VRdDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "oRequiredDateT@"; True:C214)
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
				SM_l_QuerySearchID:=$_l_QueryID
				SM_l_ReturnQueryID:=0
				$_bo_OpenWindow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWindow:=True:C214
					Open_AnyTypeWindow(322; 528; 4; "Find Order Items")
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Order Items")
				End if 
				DIALOG:C40([ORDER_ITEMS:25]; "ditems Sel")
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
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VOrderCode; ->VSolCode; ->VProdCode; ->vProdName; ->VSerialNo; ->VSales; ->VProbCode; ->VItemNum; ->vItemRef; ->VInvNoF; ->VInvNoT; ->ViDateF; ->ViDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VDNDateF; ->VDNDateT; ->VamountT; ->VamountF; ->VMarginF; ->VMarginT; ->vOrderNo; ->vCOntrCode; ->SYS_at_RecordStateNames; ->MOD_al_ModuleAccessStatus; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cSetMod; ->r0; ->r1; ->r2; ->r3; ->r4; ->r5; ->r6; ->r7; ->Vsales; ->Varea; ->ACC_t_CurrencyCode; ->Vlayer)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->ViDateFOffset; ->VRdDateFOffset; ->VDnDateFOffset; ->ViDateTOffset; ->VRdDateTOffset; ->VDnDateTOffset)
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
			vOrdI:=0
		End if 
	Else 
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Supplier_Code:20; vProbCode)
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1; vOrderCode)
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Product_Code:2; vProdCode)
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Serial_Number:24; vSerialNo)
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Contract_Code:29; vContrCode)
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Cust_ItemReference:59; vitemRef)
		Sel_SNum(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Item_Number:27; vItemNum)
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Person:14; vSales)
		Sel_SIDate(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Invoice_Date:25; vIDateF; vIDateT)
		Sel_SIDate(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Delivery_Date:11; vDnDateF; vDnDateT)
		Sel_SIDate(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Required_Date:10; vRdDateF; vRdDateT)
		Sel_SIString(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Invoice_Number:17; vInvNoF; vInvNoT)
		Sel_S(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Purchase_Order_Number:18; vOrderNo)
		
		If ((r0=1) | (r1=1) | (r2=1) | (r3=1) | (r4=1) | (r5=1) | (r6=1) | (r7=1))
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1#"")
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r0=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Date:19#!00-00-00!; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Purchase_Order_Number:18#"STOCK")
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r1=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=""; *)
			QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Purchase_Order_Number:18="N")
			QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20#"")
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r2=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Received_Date:21#!00-00-00!; *)
			QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Delivery_Date:11#!00-00-00!)
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r3=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Received_Date:21=!00-00-00!; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Delivery_Date:11=!00-00-00!)
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r4=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11#!00-00-00!)
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r5=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Delivery_Date:11=!00-00-00!)
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r6=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Date:25#!00-00-00!)
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (r7=1)
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Date:25=!00-00-00!)
			Master2(->[ORDER_ITEMS:25])
		End if 
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("ORDER ITEMS"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[ORDER_ITEMS:25])
					End if 
				End if 
			End for 
			
			
		End if 
		Sel_SIS(->[ORDER_ITEMS:25])
		
		If ((vSolCode#"") | (Sel_StatePosNeg#0))
			
			Sel_SetAny("Master2"; ->[ORDER_ITEMS:25])
			If (Count parameters:C259=0)
				
			End if 
			Sel_Beginning3(->[ORDERS:24])
			Sel_S(->[ORDERS:24]; ->[ORDERS:24]Company_Code:1; vSolCode)
			Sel_State(->[ORDERS:24]; ->[ORDERS:24]State:15)
			Master_UseSS(->[ORDERS:24])
			If (Count parameters:C259=0)
				
			End if 
			If (Records in selection:C76([ORDERS:24])=0)
				CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Master")
			Else 
				Load_ManyFast(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "Master2"; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDER_ITEMS:25])
			End if 
			
		End if 
		
		Sel_SSStrSin(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Product_Name:13; vProdName)
		Sel_SSNum(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Sales_Amount:7; vAmountF; vAmountT)
		Sel_SSNum(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Margin:6; vMarginF; vMarginT)
		
		Big_One(->[ORDER_ITEMS:25])
	End if 
End while 
If (Not:C34($_bo_NoSearch))
	Sel_Ending(->[ORDER_ITEMS:25])
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
ERR_MethodTrackerReturn("OrderI_SelP"; $_t_oldMethodName)