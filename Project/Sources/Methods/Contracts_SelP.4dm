//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:59
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
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; CONT_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF5; vDateT5; VsDateF; VsDateT)
	C_LONGINT:C283($_l_And; $_l_ArraySize; $_l_Element; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID; $_l_QueryRow)
	C_LONGINT:C283($_l_SizeofArray; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; cNAA; cNAL)
	C_LONGINT:C283(cSIS; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; vAct5; vContr)
	C_LONGINT:C283(vNo5; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_Table; $2; $3)
	C_TEXT:C284($_t_AnalysisCode; $_t_oldMethodName; $_t_WindowTitleOLD; vCompCode; vContCode; vContrCode; vDesc5; vJob; VorderCode; VprodCode; VSELPREV)
	C_TEXT:C284(VType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_SelP")
//Contracts_SelP
$_bo_OpenWindow:=False:C215
If (Count parameters:C259=0)
	$_ptr_Table:=Current default table:C363
	$_l_TableNumber:=Table:C252($_ptr_Table)
	
	//DEFAULT TABLE([CONTRACTS])
End if 
Sel_Beginning(False:C215; ->[CONTRACTS:17])
$_l_Element:=1
$_l_QueryID:=0
$_l_Mode:=0
$_bo_NoSearch:=False:C215  // used for cross file search
$_l_TableNumber:=Table:C252(->[CONTRACTS:17])
$_l_ArraySize:=0
If (Count parameters:C259>=2)
	$_l_ArraySize:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vContr=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_Element<=$_l_ArraySize)
	$_l_WhilesCounter:=$_l_WhilesCounter+1
	If (Count parameters:C259>=2)
		$_l_Mode:=0
		$_l_QueryID:=0
		Case of 
			: ($1<0)
				$_l_Mode:=1  // Dont search we are building
			: ($_l_Element<=Size of array:C274($2->))
				$_l_QueryID:=$2->{$_l_Element}
				$_l_Mode:=$1
		End case 
		
	End if 
	If ($_l_Mode=0)
		If ($_l_WhilesCounter=1)
			Sel_Beginning2(False:C215; ->[CONTRACTS:17])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[CONTRACTS:17])
	End if 
	
	
	If (vSelPrev#"•FSC")
		Contracts_SelPv
	End if 
	If ($_l_QueryID=0)
		//`
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
			Open_AnyTypeWindow(277; 428; 4; "Find Contracts")
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Contracts")
		End if 
		DIALOG:C40([CONTRACTS:17]; "dContr_Sel")
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
			$_l_Element:=0
			For ($_l_Index; $_l_SizeofArray+1; Size of array:C274($3->))
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
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cSIS; ->cNAA; ->cNAL; ->vCompCode; ->vContCode; ->vContrCode; ->VType; ->VsDateF; ->VsDateT; ->SRCH_d_EntryDateTo; ->vJob; ->VorderCode; ->VprodCode)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
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
			If (Not:C34(CONT_bo_FFLoaded))
				SM_SetUpFFArray(->[CONTRACTS:17])
				CONT_bo_FFLoaded:=True:C214
			End if 
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
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
			If (Not:C34(CONT_bo_FFLoaded))
				SM_SetUpFFArray(->[CONTRACTS:17])
				CONT_bo_FFLoaded:=True:C214
			End if 
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			$_l_And:=SRCH_l_And
			$_l_OR:=SRCH_l_or
			$_l_Not:=SRCH_l_Not
			//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
			$_bo_NoSearch:=False:C215
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
					Open_AnyTypeWindow(277; 428; 4; "Find Contracts")
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Contracts")
				End if 
				DIALOG:C40([CONTRACTS:17]; "dContr_Sel")
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
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cSIS; ->cNAA; ->cNAL; ->vCompCode; ->vContCode; ->vContrCode; ->VType; ->VsDateF; ->VsDateT; ->SRCH_d_EntryDateTo; ->vJob; ->VorderCode; ->VprodCode)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
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
			$_l_ArraySize:=Size of array:C274($2->)
			$_l_Element:=0
			$_bo_NoSearch:=True:C214
			
			
		End if 
		$_l_QueryID:=0
		$_l_Element:=$_l_Element+1
		If ($_l_Element>Size of array:C274($2->)) | ($_l_Mode=2)  // edit will not call each window at the same time
			//must break out
			SRCH_l_And:=0
			SRCH_l_or:=0
			SRCH_l_Not:=0
		End if 
		
		
		
		
	End if 
	
	If (OK=0) | ($_l_Mode#0) | ($_bo_NoSearch=True:C214)
		
		If (SRCH_l_And=0) & (SRCH_l_or=0) & (SRCH_l_Not=0)
			vContr:=0
		End if 
		
	Else 
		Sel_S(->[CONTRACTS:17]; ->[CONTRACTS:17]Company_Code:1; vCompCode)
		Sel_S(->[CONTRACTS:17]; ->[CONTRACTS:17]Contact_Code:2; vContCode)
		Sel_S(->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3; vContrCode)
		Sel_S(->[CONTRACTS:17]; ->[CONTRACTS:17]Supplier_Company:9; vJob)
		Sel_S(->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Type_Code:4; vType)
		Sel_SIS(->[CONTRACTS:17])
		Sel_SSStrSin(->[CONTRACTS:17]; ->[CONTRACTS:17]Supplier_Contact:10; vOrderCode)
		Sel_SSDate(->[CONTRACTS:17]; ->[CONTRACTS:17]Start_Date:5; vSDatef; vSDateT)
		Sel_SSDate(->[CONTRACTS:17]; ->[CONTRACTS:17]End_Date:6; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
		
		If (vProdCode#"")
			$_t_AnalysisCode:=Sel_AtSign(vProdCode)
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_AnalysisCode)
			Join_SelFast(->[CONTRACT_RECORD_ANALYSIS:88]; ->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1; ->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3)
			Master2(->[CONTRACTS:17])
			
		End if 
		
		Big_One(->[CONTRACTS:17])
		
	End if 
End while 
Sel_Ending(->[CONTRACTS:17])
If ($_l_TableNumber>0)
	$_ptr_Table:=Table:C252($_l_TableNumber)
	//DEFAULT TABLE($_ptr_Table->)
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
ERR_MethodTrackerReturn("Contracts_SelP"; $_t_oldMethodName)