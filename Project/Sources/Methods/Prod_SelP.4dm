//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Prod_SelP`Description
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_QueryIDS; 0)
	ARRAY LONGINT:C221($_al_SearchIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; PRD_bo_FFLoaded; PRD_bo_FilterLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; VintDateF; VintDateT)
	C_LONGINT:C283($_l_And; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID; $_l_QueryRow)
	C_LONGINT:C283($_l_Records; $_l_SizeofArray; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; ACC_l_EntryDateFromOffset)
	C_LONGINT:C283(ACC_l_EntryDateToOffset; CH1; CH2; CH3; cNAA; cNAL; cSetAdd; cSetMod; cSIS; PRD_l_FilterNLA; SM_al_NextElement)
	C_LONGINT:C283(SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; VintDateFOffset; VintDatetOffset; vP; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285(VAmountF; VAmountT; vValueF; vValueT)
	C_TEXT:C284($_t_analysisCode; $_t_oldMethodName; $_t_WindowTitleOLD; Enclosures; vAnalysis; vBrand; VComments; vEnclosures; Vgroup; VLetterCode; vModelCode)
	C_TEXT:C284(vProblem; VProdCode; vProdName; vProduct; VSELPREV; Vsuperior; Vsupplier)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_SelP")
//Prod_SelP
$_bo_OpenWindow:=False:C215
ACC_l_EntryDateFromOffset:=0
VintDateFOffset:=0
ACC_l_EntryDateToOffset:=0
VintDatetOffset:=0


Sel_Beginning(False:C215; ->[PRODUCTS:9])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
$_l_ElementCount:=0
$_bo_NoSearch:=False:C215  // used for cross file search
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_WhilesCounter:=0
While ((vP=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
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
			Sel_Beginning2(False:C215; ->[PRODUCTS:9])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[PRODUCTS:9])
	End if 
	
	If (vSelPrev#"•FSC")
		Prod_SelPvs
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
			Open_AnyTypeWindow(353; 530; 4; "Find Products")
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Products")
		End if 
		
		DIALOG:C40([PRODUCTS:9]; "dProd_Sel")
		
		
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
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Vgroup; ->vBrand; ->vProduct; ->vModelCode; ->VProdCode; ->vProdName; ->VComments; ->vEnclosures; ->Vsuperior; ->VAmountF; ->VAmountT; ->vValueF; ->vValueT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VintDateF; ->VintDateT; ->Vsupplier; ->VLetterCode; ->vProblem; ->vLetterCode; ->vAnalysis; ->CH1; ->CH2; ->CH3; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VintDateFOffset; ->ACC_l_EntryDateToOffset; ->VintDatetOffset)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
				SM_l_SearchNumber:=AA_GetNextID(->SM_l_SearchNumber)
				SM_l_SearchNumber:=SM_SaveSearchParameters(0; "SMQuery_"+String:C10(SM_l_SearchNumber); $_l_TableNumber; -1; ->SM_blb_SearchBlob)
			Else 
				SM_l_SearchNumber:=AA_GetNextID(->SM_l_SearchNumber)
				SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->SM_l_ReturnQueryID; ->SRCH_l_And; ->SRCH_l_or; ->SRCH_l_Not)
				SM_l_SearchNumber:=AA_GetNextID(->SM_l_SearchNumber)
				SM_l_SearchNumber:=SM_SaveSearchParameters(0; "SMQuery_"+String:C10(SM_l_SearchNumber); $_l_TableNumber; -1; ->SM_blb_SearchBlob)
				READ WRITE:C146([x_QUERY_PARAMETERS:134])
				QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=SM_l_SearchNumber)
				[x_QUERY_PARAMETERS:134]X_ID:1:=-[x_QUERY_PARAMETERS:134]X_ID:1
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
			If (Not:C34(PRD_bo_FFLoaded))
				SM_SetUpFFArray(->[PRODUCTS:9])
				PRD_bo_FFLoaded:=True:C214
			End if 
			ACC_l_EntryDateFromOffset:=0
			VintDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VintDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (VintDateFOffset#0)
				Case of 
					: (VintDateFOffset>0)
						VintDateF:=Current date:C33-VintDateFOffset
					: (VintDateFOffset>-100)
						//months
						VintDateF:=Add to date:C393(Current date:C33; 0; VintDateFOffset; 0)
					Else 
						//years
						VintDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VintDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VintDateTOffset#0)
				Case of 
					: (VintDateTOffset>0)
						VintDateF:=Current date:C33-VintDateTOffset
					: (VintDateTOffset>-100)
						//months
						VintDateT:=Add to date:C393(Current date:C33; 0; VintDateTOffset; 0)
					Else 
						//years
						VintDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VintDateTOffset)/100); 0; 0)
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
			If (Not:C34(PRD_bo_FFLoaded))
				SM_SetUpFFArray(->[PRODUCTS:9])
				PRD_bo_FFLoaded:=True:C214
			End if 
			ACC_l_EntryDateFromOffset:=0
			VintDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VintDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (VintDateFOffset#0)
				Case of 
					: (VintDateFOffset>0)
						VintDateF:=Current date:C33-VintDateFOffset
					: (VintDateFOffset>-100)
						//months
						VintDateF:=Add to date:C393(Current date:C33; 0; VintDateFOffset; 0)
					Else 
						//years
						VintDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VintDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VintDateTOffset#0)
				Case of 
					: (VintDateTOffset>0)
						VintDateF:=Current date:C33-VintDateTOffset
					: (VintDateTOffset>-100)
						//months
						VintDateT:=Add to date:C393(Current date:C33; 0; VintDateTOffset; 0)
					Else 
						//years
						VintDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VintDateTOffset)/100); 0; 0)
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
					Open_AnyTypeWindow(353; 530; 4; "Find Products")
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Products")
				End if 
				DIALOG:C40([PRODUCTS:9]; "dProd_Sel")
				
				//here resave the values
				If (SM_l_QueryMode=2) & (OK=1)
					SRCH_l_And:=$_l_And
					SRCH_l_or:=$_l_OR
					SRCH_l_Not:=$_l_Not
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->Vgroup; ->vBrand; ->vProduct; ->vModelCode; ->VProdCode; ->vProdName; ->VComments; ->vEnclosures; ->Vsuperior; ->VAmountF; ->VAmountT; ->vValueF; ->vValueT; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VintDateF; ->VintDateT; ->Vsupplier; ->VLetterCode; ->vProblem; ->vLetterCode; ->vAnalysis; ->CH1; ->CH2; ->CH3; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VintDateFOffset; ->ACC_l_EntryDateToOffset; ->VintDatetOffset)
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
	If (Not:C34(PRD_bo_FilterLoaded))
		PRD_l_FilterNLA:=ProductDeletionPreferences
		PRD_bo_FilterLoaded:=True:C214
	End if 
	
	If (OK=0) | ($_l_Mode#0) | ($_bo_NoSearch=True:C214)
		If (SRCH_l_And=0) & (SRCH_l_or=0) & (SRCH_l_Not=0)
			vP:=0
		End if 
		
	Else 
		Sel_RemSets("Prod"; False:C215; ->[PRODUCTS:9])
		Sel_S(->[PRODUCTS:9]; ->[PRODUCTS:9]Group_Code:3; vGroup)
		Sel_S(->[PRODUCTS:9]; ->[PRODUCTS:9]Brand_Code:4; vBrand)
		Sel_S(->[PRODUCTS:9]; ->[PRODUCTS:9]Model_Code:5; vModelCode)
		Sel_S(->[PRODUCTS:9]; ->[PRODUCTS:9]Short_Code:19; vProduct)
		Sel_S(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; vProdCode)
		Sel_S(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Name:2; vProdName)
		Sel_S(->[PRODUCTS:9]; ->[PRODUCTS:9]Superior:15; vSuperior)
		Sel_SSUB(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; vSupplier; ->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Company_Code:1)
		Sel_SSUB(->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; vLetterCode; ->[PRODUCTS_SUPPLIERS:148]; ->[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4)
		Sel_SRadio(->[PRODUCTS:9]; ->[PRODUCTS:9]Price_List:8; ch1; True:C214)
		Sel_SRadio(->[PRODUCTS:9]; ->[PRODUCTS:9]Maintain_Stock:14; ch2; True:C214)
		Sel_SRadio(->[PRODUCTS:9]; ->[PRODUCTS:9]Serial_Numbered:17; ch3; True:C214)
		Sel_SINum(->[PRODUCTS:9]; ->[PRODUCTS:9]Standard_Price:16; vValueF; vValueT)
		Sel_SIS(->[PRODUCTS:9])
		Sel_SSNum(->[PRODUCTS:9]; ->[PRODUCTS:9]Sales_Price:9; vAmountf; vAmountT)
		Sel_SSDate(->[PRODUCTS:9]; ->[PRODUCTS:9]Modified_Date:10; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
		
		Sel_SSDate(->[PRODUCTS:9]; ->[PRODUCTS:9]Available_From_Date:21; vintDatef; vintDateT)
		Sel_SSStrSin(->[PRODUCTS:9]; ->[PRODUCTS:9]Description:6; vComments)
		Sel_SSStrSin(->[PRODUCTS:9]; ->[PRODUCTS:9]Enclosures:20; Enclosures)
		Sel_SSStrSin(->[PRODUCTS:9]; ->[PRODUCTS:9]Commodity_Code:38; vProblem)
		
		If (vAnalysis#"")
			$_t_analysisCode:=Sel_AtSign(vAnalysis)
			QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_analysisCode)
			Join_SelFast(->[CONTRACT_RECORD_ANALYSIS:88]; ->[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; 2)
			Master2(->[PRODUCTS:9])
		End if 
		Master_UseSS(->[PRODUCTS:9])
		COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
		If (PRD_l_FilterNLA=1)
			QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
		Else 
			QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
		End if 
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("PRODUCTS"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[PRODUCTS:9])
					End if 
				End if 
			End for 
			
		End if 
		Master2(->[PRODUCTS:9])
		Big_One(->[PRODUCTS:9])
	End if 
End while 
Sel_Ending(->[PRODUCTS:9])
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
ERR_MethodTrackerReturn("Prod_SelP"; $_t_oldMethodName)