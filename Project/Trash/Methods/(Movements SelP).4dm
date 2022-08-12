//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
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
	ARRAY TEXT:C222($_at_StockMovementCodes; 0)
	//ARRAY TEXT(STK_at_NoCopyFrom;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_Load; $_bo_NoSearch; $_bo_OpenWindow; $_bo_QueryinSelection; $_bo_SessionWindowOwner; MOV_bo_FFLoaded; SM_bo_SessionWindow; STK_bo_NoCopyFromSet; STK_bo_UseDeliveryReference; WIN_bo_TrackerInited)
	C_DATE:C307(vDeliveryDate; ViDateF; ViDateT)
	C_LONGINT:C283($_l_And; $_l_CharacterPosition; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID)
	C_LONGINT:C283($_l_SizeofArray; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; cNAA; cNAL)
	C_LONGINT:C283(cSIS; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; STOCK_l_Context; VDoDateFOffset)
	C_LONGINT:C283(VDoDateTOffset; ViDateFOffset; ViDateTOffset; vPu; VRDateFOffset; VRDateTOffset; VsDateFOffset; VsDateTOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_Type; $_t_WindowTitleOLD; ACC_t_CurrencyCode; STK_t_DeliveryReference; Vanalysis; VcompCode; VcompName; VContCode; VContrCode; vDeliveryReference)
	C_TEXT:C284(vJobCode; Vlayer; Vprodcode; VSELPREV; VType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements_SelP")
//Movements_SelP

$_bo_OpenWindow:=False:C215
ViDateFOffset:=0
ViDateTOffset:=0

Sel_Beginning(False:C215; ->[STOCK_MOVEMENTS:40])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_TableNumber:=Table:C252(->[STOCK_MOVEMENTS:40])
$_l_ElementCount:=0
$_bo_NoSearch:=False:C215  // used for cross file search
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vPu=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
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
			Sel_Beginning2(False:C215; ->[STOCK_MOVEMENTS:40])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[STOCK_MOVEMENTS:40])
	End if 
	
	If (vSelPrev#"•FSC")
		Movt_SelPvs
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
			Open_AnyTypeWindow(272; 425; 4; "Find Stock Movements")
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Stock Movements")
		End if 
		DIALOG:C40([STOCK_MOVEMENTS:40]; "dMove Sel")
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
				
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VcompCode; ->VcompName; ->VType; ->VContrCode; ->VContCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateF; ->ViDateT; ->Vprodcode; ->vDeliveryReference; ->vDeliveryDate; ->ViDateFOffset; ->ViDateTOffset; ->cSIS; ->cNAA; ->cNAL)
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
			If (Not:C34(MOV_bo_FFLoaded))
				SM_SetUpFFArray(->[STOCK_MOVEMENTS:40])
				MOV_bo_FFLoaded:=True:C214
			End if 
			ViDateFOffset:=0
			ViDateTOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ViDateFOffset#0)
				Case of 
					: (ViDateFOffset>0)
						vIDateF:=Current date:C33-ViDateFOffset
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					: (ViDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
				End case 
				
				
			End if 
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateT:=Current date:C33-ViDateTOffset
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					: (ViDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
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
			If (Not:C34(MOV_bo_FFLoaded))
				SM_SetUpFFArray(->[STOCK_MOVEMENTS:40])
				MOV_bo_FFLoaded:=True:C214
			End if 
			ViDateFOffset:=0
			ViDateTOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (ViDateFOffset#0)
				Case of 
					: (ViDateFOffset>0)
						vIDateF:=Current date:C33-ViDateFOffset
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					: (ViDateFOffset>-100)
						//months
						vIDateF:=Add to date:C393(Current date:C33; 0; ViDateFOffset; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					Else 
						//years
						vIDateF:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateFOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
				End case 
				
				
			End if 
			If (ViDateTOffset#0)
				Case of 
					: (ViDateTOffset>0)
						vIDateT:=Current date:C33-ViDateTOffset
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					: (ViDateTOffset>-100)
						//months
						vIDateT:=Add to date:C393(Current date:C33; 0; ViDateTOffset; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
					Else 
						//years
						vIDateT:=Add to date:C393(Current date:C33; -(Abs:C99(ViDateTOffset)/100); 0; 0)
						OBJECT SET VISIBLE:C603(*; "ovIDateT@"; True:C214)
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
					Open_AnyTypeWindow(272; 425; 4; "Find Stock Movements")
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Stock Movements")
				End if 
				DIALOG:C40([STOCK_MOVEMENTS:40]; "dMove Sel")
				If (Not:C34($_bo_OpenWindow))
					SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					SET WINDOW TITLE:C213($_t_WindowTitleOLD)
				End if 
				
				//here resave the values
				If (SM_l_QueryMode=2) & (OK=1)
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						SRCH_l_And:=$_l_And
						SRCH_l_or:=$_l_OR
						SRCH_l_Not:=$_l_Not
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VcompCode; ->VcompName; ->VType; ->VContrCode; ->VContCode; ->Vanalysis; ->ACC_t_CurrencyCode; ->Vlayer; ->ViDateF; ->ViDateT; ->Vprodcode; ->Vprodcode; ->vDeliveryReference; ->vDeliveryDate; ->ViDateFOffset; ->ViDateTOffset; ->cSIS; ->cNAA; ->cNAL)
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
					
					//
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
			$_l_CurrentRow:=1
			For ($_l_Index; $_l_NextElement; Size of array:C274($2->))
				$_al_QueryIDs{$_l_CurrentRow}:=$2->{$_l_Index}
				$_l_CurrentRow:=$_l_CurrentRow+1
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
		Sel_S(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Type:6; vType)
		Sel_S(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Type_Number:4; vContrCode)
		Sel_S(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; vContCode)
		Sel_S(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Company_From:2; vCompCode)
		Sel_S(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Type_Number:4; vJobCode)
		Sel_S(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Analysis_Code:9; vAnalysis)
		Sel_SCurr(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Currency_Code:10; ACC_t_CurrencyCode)
		Sel_SLay(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Layer_Code:11; vLayer)
		Sel_SIDate(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Date:5; vIDateF; vIDateT)
		Sel_SIS(->[STOCK_MOVEMENTS:40])
		If (vProdCode#"")
			Sel_Set(->[STOCK_MOVEMENTS:40])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=vProdCode)
			SELECTION TO ARRAY:C260([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
			QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
			//``````
			
			If (vDeliveryReference#"")
				COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Before")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=vDeliveryReference+"@")
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
					USE NAMED SELECTION:C332("$before")
				End if 
				
			End if 
			If (vDeliveryDate#!00-00-00!)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44=vDeliveryDate)
			End if 
			
			Load_OneFast(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "Master2")
		Else 
			
			If (vDeliveryReference#"") | (vDeliveryDate#!00-00-00!)
				Sel_Set(->[STOCK_MOVEMENTS:40])
				Case of 
					: (Records in selection:C76([STOCK_MOVEMENTS:40])>0) & (Records in selection:C76([STOCK_MOVEMENTS:40])<Records in table:C83([STOCK_MOVEMENTS:40]))
						SELECTION TO ARRAY:C260([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovementCodes)
						QUERY WITH ARRAY:C644([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovementCodes)
						$_bo_QueryinSelection:=True:C214
					Else 
						$_bo_QueryinSelection:=False:C215
				End case 
				$_bo_Load:=False:C215
				If (vDeliveryReference#"")
					$_t_Type:="="
					$_l_CharacterPosition:=Position:C15("#"; vDeliveryReference)
					If ($_l_CharacterPosition=1)
						$_t_Type:="#"
						vDeliveryReference:=Substring:C12(vDeliveryReference; 2)
					Else 
						$_l_CharacterPosition:=Position:C15(">="; vDeliveryReference)
						If ($_l_CharacterPosition=1)
							$_t_Type:=">="
							vDeliveryReference:=Substring:C12(vDeliveryReference; 3)
						Else 
							$_l_CharacterPosition:=Position:C15("<="; vDeliveryReference)
							If ($_l_CharacterPosition=1)
								$_t_Type:="<="
								vDeliveryReference:=Substring:C12(vDeliveryReference; 3)
							Else 
								$_l_CharacterPosition:=Position:C15(">"; vDeliveryReference)
								If ($_l_CharacterPosition=1)
									$_t_Type:=">"
									vDeliveryReference:=Substring:C12(vDeliveryReference; 2)
								Else 
									$_l_CharacterPosition:=Position:C15("<"; vDeliveryReference)
									If ($_l_CharacterPosition=1)
										$_t_Type:="<"
										vDeliveryReference:=Substring:C12(vDeliveryReference; 2)
										If ($_l_CharacterPosition=1)
											$_t_Type:="<"
											vDeliveryReference:=Substring:C12(vDeliveryReference; 2)
										Else 
											$_l_CharacterPosition:=Position:C15("="; vDeliveryReference)
											If ($_l_CharacterPosition=1)
												$_t_Type:="="
												vDeliveryReference:=Substring:C12(vDeliveryReference; 2)
												
											End if 
										End if 
									Else 
										$_l_CharacterPosition:=Position:C15("<"; vDeliveryReference)
									End if 
								End if 
							End if 
						End if 
					End if 
					If ($_bo_QueryinSelection)
						COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "$Before")
						
						
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; $_t_Type; vDeliveryReference+"@")
						
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							
							USE NAMED SELECTION:C332("$before")
						Else 
							If (STOCK_l_Context<0)  //only applies when doing a copy from previous
								STK_bo_UseDeliveryReference:=True:C214  // if search by delivery reference then when opening the movement only show items with the reference
								STK_t_DeliveryReference:=vDeliveryReference+"@"
							End if 
							
						End if 
						$_bo_Load:=True:C214
					Else 
						
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43; $_t_Type; vDeliveryReference+"@")
						
						If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
							
							ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
						Else 
							If (STOCK_l_Context<0)  //only applies when doing a copy from previous
								STK_bo_UseDeliveryReference:=True:C214  // if search by delivery reference then when opening the movement only show items with the reference
								STK_t_DeliveryReference:=vDeliveryReference+"@"
							End if 
							
						End if 
						$_bo_Load:=True:C214
					End if 
					If (vDeliveryDate#!00-00-00!)
						$_bo_Load:=True:C214
						QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44=vDeliveryDate)
					End if 
				Else 
					If (vDeliveryDate#!00-00-00!)
						$_bo_Load:=True:C214
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44=vDeliveryDate)
					End if 
				End if 
				If ($_bo_Load)
					Load_OneFast(->[STOCK_MOVEMENT_ITEMS:27]; ->[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; ->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; "Master2")
				End if 
			End if 
		End if 
		If (vCompName#"")
			Comp_SelPOther(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Company_From:2; "Master2"; vCompName)
		End if 
		If (STK_bo_NoCopyFromSet)
			If (Size of array:C274(STK_at_NoCopyFrom)>0)
				CREATE SET:C116([STOCK_MOVEMENTS:40]; "$Current")
				
				QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Movement_Type:6; STK_at_NoCopyFrom)
				If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$takeOut")
					DIFFERENCE:C122("$current"; "$takeOut"; "$Current")
					USE SET:C118("$current")
				Else 
					USE SET:C118("$current")
				End if 
			End if 
		End if 
		
		Big_One(->[STOCK_MOVEMENTS:40])
	End if 
End while 
Sel_Ending(->[STOCK_MOVEMENTS:40])
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
ERR_MethodTrackerReturn("Movements_SelP"; $_t_oldMethodName)
