//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_SelP
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
	ARRAY LONGINT:C221($_al_QueryIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(SM_l_aSearchIDs;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	//ARRAY TEXT(COM_at_CompanyTypes;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_andLoaded; $_bo_NoSearch; $_bo_OpenWIndow; $_bo_SessionWindowOwner; COM_bo_FFLoaded; COM_bo_TypesInited; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1; vDateT2; vDateT3; vDateT4)
	C_DATE:C307(vDateT5; vDoDateF; VDoDateT; VfDateF; VFDateT; VSDateF; VSDateT)
	C_LONGINT:C283($_l_And; $_l_CurrentRow; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_Or; $_l_QueryID; $_l_QueryRow; $_l_Records)
	C_LONGINT:C283($_l_SizeofArray; $_l_TableNumber; $_l_WhileCount; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; ACC_l_EntryDateFromOffset; ACC_l_EntryDateToOffset)
	C_LONGINT:C283(ch1; cNAA; cNAL; cSetAdd; cSetMod; cSIS; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber)
	C_LONGINT:C283(SRCH_l_And; SRCH_l_Not; SRCH_l_or; vAct1; vAct2; vAct3; vAct4; vAct5; vC; VDoDateFOffset; VDoDatetOffset)
	C_LONGINT:C283(VfDateFOffset; VfDatetOffset; VfDatetOffset:; vNo1; vNo2; vNo3; vNo4; vNo5; VrStateL; VsDateFOffset; VsDatetOffset)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_REAL:C285(VDiscountF; vDiscountT; VValueF; VvalueT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; Varea; VComments; VcompCode; vCompName; vContrCode; VCountry; VCounty; vDesc1; vDesc2)
	C_TEXT:C284(vDesc3; vDesc4; vDesc5; VLocation; VOmit; VpostCode; vProbCode; VProdCode; vrstate; Vsales; VSELPREV)
	C_TEXT:C284(Vsource; Vstatus; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vSubGroup5; VSuperior; Vtel; Vtele; vTitle1)
	C_TEXT:C284(vTitle2; vTitle3; vTitle4; vTitle5; Vtown; Vtype)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelP")
//Comp_SelP
//Rollo 8/7/2004 - introduced the word individuals
$_bo_OpenWIndow:=False:C215
ACC_l_EntryDateFromOffset:=0
VsDateFOffset:=0
ACC_l_EntryDateToOffset:=0
VsDatetOffset:=0
VSDateFOffset:=0
VDoDateFOffset:=0
VfDatetOffset:=0
VDoDatetOffset:=0

If (Not:C34(COM_bo_TypesInited))
	ARRAY TEXT:C222(COM_at_CompanyTypes; 4)
	
	COM_at_CompanyTypes{1}:="Show Companies only"
	COM_at_CompanyTypes{2}:="Show Private Individuals only"
	COM_at_CompanyTypes{3}:="-"
	COM_at_CompanyTypes{4}:="Show Companies and Private Individuals"
	COM_bo_TypesInited:=True:C214
End if 

Sel_Beginning(False:C215; ->[COMPANIES:2])

$_l_Mode:=0
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_SizeofArray:=0
$_bo_NoSearch:=False:C215  // used for cross file search
If (Count parameters:C259>=2)
	$_l_SizeofArray:=Size of array:C274($2->)
End if 
$_l_TableNumber:=Table:C252(->[COMPANIES:2])
$_l_WhileCount:=0
While ((vC=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_SizeofArray)
	$_l_WhileCount:=$_l_WhileCount+1
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
	IDLE:C311  // 03/04/03 pb
	If ($_l_Mode=0)
		If ($_l_WhileCount=1)
			Sel_Beginning2(False:C215; ->[COMPANIES:2])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[COMPANIES:2])
	End if 
	
	If (vSelPrev#"•FSC")
		Comp_SelPvs
	End if 
	If ($_l_QueryID=0)
		SM_l_QueryMode:=0
		If ($_l_Mode=1)
			SM_l_QueryMode:=1
			
			SM_l_ReturnQueryID:=0
			ARRAY LONGINT:C221(SM_l_aSearchIDs; 0)
			COPY ARRAY:C226($3->; SM_l_aSearchIDs)
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
		Else 
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
		End if 
		
		$_bo_OpenWIndow:=False:C215
		If (Not:C34(SM_bo_SessionWindow))
			SM_bo_SessionWindow:=True:C214
			$_bo_SessionWindowOwner:=True:C214
			
			$_bo_OpenWIndow:=True:C214
			Open_AnyTypeWindow(355; 529; 4; "Find Companies")  //542 `343 542  `335 530
			
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWIndow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Companies")
		End if 
		DIALOG:C40([COMPANIES:2]; "dComp_Sel")
		If (Not:C34($_bo_OpenWIndow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226(SM_l_aSearchIDs; $3->)
			$_l_SizeofArray:=Size of array:C274($3->)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_CurrentRow:=0
			For ($_l_Index; $_l_SizeofArray+1; Size of array:C274($3->))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$3->{$_l_Index}:=$_al_SearchIDsReturn{$_l_CurrentRow}
			End for 
		Else 
			If (SM_l_QueryMode>0)
				COPY ARRAY:C226(SM_l_aSearchIDs; $3->)
				
			End if 
			
		End if 
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vrstate; ->VrStateL; ->VcompCode; ->vCompName; ->Vtown; ->VCounty; ->VCountry; ->Vstatus; ->Vtype; ->Vsource; ->VDiscountF)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDiscountT; ->VValueF; ->VvalueT; ->SRCH_d_EntryDateFrom; ->VSDateT; ->VFDateT; ->VComments; ->VProdCode; ->vDoDateF; ->VDoDateT)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VSuperior; ->VpostCode; ->Vtel; ->Varea; ->Vsales; ->Vtele; ->VOmit; ->VLocation; ->vProbCode; ->vContrCode; ->cSIS; ->cNAA)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset; ->VSDateFOffset; ->VDoDateFOffset; ->VfDatetOffset; ->VDoDatetOffset)
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
	Else 
		//here we need to check the context of the query and if it is not account balances need to pass on the work to the appropriate search
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		$_bo_andLoaded:=False:C215
		If ($_l_QueryID<0)
			//this is a reference to a search....
			//when the users are building a search they may select a search from the pop up that they want the system to use
			//the system creates a Set manager owner set which refers to the real search
			$_l_offset:=0
			SM_l_ReturnQueryID:=0
			If (Not:C34(COM_bo_FFLoaded))
				SM_SetUpFFArray(->[SERVICE_CALLS:20])
				COM_bo_FFLoaded:=True:C214
			End if 
			ACC_l_EntryDateFromOffset:=0
			VsDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VsDatetOffset:=0
			VSDateFOffset:=0
			VDoDateFOffset:=0
			VfDatetOffset:=0
			VDoDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (VSDateFOffset#0)
				Case of 
					: (VSDateFOffset>0)
						VSDateF:=Current date:C33-VSDateFOffset
					: (VSDateFOffset>-100)
						//months
						VSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
					Else 
						//years
						VSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
				End case 
				
			End if 
			If (VSDateTOffset#0)
				Case of 
					: (VSDateTOffset>0)
						VSDateF:=Current date:C33-VSDateTOffset
					: (VSDateTOffset>-100)
						//months
						VSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
					Else 
						//years
						VSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
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
			
			If (VfDateFOffset#0)
				Case of 
					: (VfDateFOffset>0)
						VfDateF:=Current date:C33-VfDateFOffset
					: (VfDateFOffset>-100)
						//months
						VfDateF:=Add to date:C393(Current date:C33; 0; VfDateFOffset; 0)
					Else 
						//years
						VfDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VfDateTOffset#0)
				Case of 
					: (VfDateTOffset>0)
						VfDateF:=Current date:C33-VfDateTOffset
					: (VfDateTOffset>-100)
						//months
						VfDateT:=Add to date:C393(Current date:C33; 0; VfDateTOffset; 0)
					Else 
						//years
						VfDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateTOffset)/100); 0; 0)
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
			If (VfDateFOffset#0)
				Case of 
					: (VfDateFOffset>0)
						VfDateF:=Current date:C33-VfDateFOffset
					: (VfDateFOffset>-100)
						//months
						VfDateF:=Add to date:C393(Current date:C33; 0; VfDateFOffset; 0)
					Else 
						//years
						VfDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateFOffset)/100); 0; 0)
				End case 
				
			End if 
			If (VfDateTOffset#0)
				Case of 
					: (VfDateTOffset>0)
						VfDateF:=Current date:C33-VfDateTOffset
					: (VfDateTOffset>-100)
						//months
						VfDateT:=Add to date:C393(Current date:C33; 0; VfDateTOffset; 0)
					Else 
						//years
						VfDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateTOffset)/100); 0; 0)
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
			$_bo_andLoaded:=True:C214
		End if 
		If ([x_QUERY_PARAMETERS:134]X_ID:1#$_l_QueryID)
			QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		End if 
		If ([x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_TableNumber)
			If (Not:C34($_bo_andLoaded))
				SRCH_l_And:=0
				SRCH_l_or:=0
				SRCH_l_Not:=0
			End if 
			If (Not:C34(COM_bo_FFLoaded))
				SM_SetUpFFArray(->[SERVICE_CALLS:20])
				COM_bo_FFLoaded:=True:C214
			End if 
			ACC_l_EntryDateFromOffset:=0
			VsDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VsDatetOffset:=0
			VSDateFOffset:=0
			VDoDateFOffset:=0
			VfDatetOffset:=0
			VDoDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			If (VSDateFOffset#0)
				Case of 
					: (VSDateFOffset>0)
						VSDateF:=Current date:C33-VSDateFOffset
					: (VSDateFOffset>-100)
						//months
						VSDateF:=Add to date:C393(Current date:C33; 0; VSDateFOffset; 0)
					Else 
						//years
						VSDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateFOffset)/100); 0; 0)
				End case 
				
			End if 
			If (VSDateTOffset#0)
				Case of 
					: (VSDateTOffset>0)
						VSDateF:=Current date:C33-VSDateTOffset
					: (VSDateTOffset>-100)
						//months
						VSDateT:=Add to date:C393(Current date:C33; 0; VSDateTOffset; 0)
					Else 
						//years
						VSDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VSDateTOffset)/100); 0; 0)
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
			
			If (VfDateFOffset#0)
				Case of 
					: (VfDateFOffset>0)
						VfDateF:=Current date:C33-VfDateFOffset
					: (VfDateFOffset>-100)
						//months
						VfDateF:=Add to date:C393(Current date:C33; 0; VfDateFOffset; 0)
					Else 
						//years
						VfDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VfDateTOffset#0)
				Case of 
					: (VfDateTOffset>0)
						VfDateF:=Current date:C33-VfDateTOffset
					: (VfDateTOffset>-100)
						//months
						VfDateT:=Add to date:C393(Current date:C33; 0; VfDateTOffset; 0)
					Else 
						//years
						VfDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateTOffset)/100); 0; 0)
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
			If (VfDateFOffset#0)
				Case of 
					: (VfDateFOffset>0)
						VfDateF:=Current date:C33-VfDateFOffset
					: (VfDateFOffset>-100)
						//months
						VfDateF:=Add to date:C393(Current date:C33; 0; VfDateFOffset; 0)
					Else 
						//years
						VfDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateFOffset)/100); 0; 0)
				End case 
				
			End if 
			If (VfDateTOffset#0)
				Case of 
					: (VfDateTOffset>0)
						VfDateF:=Current date:C33-VfDateTOffset
					: (VfDateTOffset>-100)
						//months
						VfDateT:=Add to date:C393(Current date:C33; 0; VfDateTOffset; 0)
					Else 
						//years
						VfDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VfDateTOffset)/100); 0; 0)
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
			$_l_Or:=SRCH_l_or
			$_l_Not:=SRCH_l_Not
			$_bo_NoSearch:=False:C215
			If ($_l_Mode=2)  // edit
				SM_l_ReturnQueryID:=0
				SM_l_QueryMode:=2
				SM_l_QuerySearchID:=$_l_QueryID
				$_bo_OpenWIndow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWIndow:=True:C214
					Open_AnyTypeWindow(350; 528; 4; "Find Companies")  //542 `343 542  `335 530
					
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWIndow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Companies")
				End if 
				DIALOG:C40([COMPANIES:2]; "dComp_Sel")
				If (Not:C34($_bo_OpenWIndow))
					SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					SET WINDOW TITLE:C213($_t_WindowTitleOLD)
				End if 
				
				//here resave the values
				If (SM_l_QueryMode=2) & (OK=1)
					SRCH_l_And:=$_l_And
					SRCH_l_or:=$_l_Or
					SRCH_l_Not:=$_l_Not
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vrstate; ->VrStateL; ->VcompCode; ->vCompName; ->Vtown; ->VCounty; ->VCountry; ->Vstatus; ->Vtype; ->Vsource; ->VDiscountF)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDiscountT; ->VValueF; ->VvalueT; ->SRCH_d_EntryDateFrom; ->VSDateT; ->VFDateT; ->VComments; ->VProdCode; ->vDoDateF; ->VDoDateT)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VSuperior; ->VpostCode; ->Vtel; ->Varea; ->Vsales; ->Vtele; ->VOmit; ->VLocation; ->vProbCode; ->vContrCode; ->cSIS; ->cNAA)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset; ->VSDateFOffset; ->VDoDateFOffset; ->VfDatetOffset; ->VDoDatetOffset)
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
			$_l_SizeofArray:=Size of array:C274($2->)
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
	
	If (OK=0) | ($_l_Mode#0) | ($_bo_NoSearch)
		If (SRCH_l_And=0) & (SRCH_l_or=0) & (SRCH_l_Not=0)
			vC:=0
		End if 
		
	Else 
		If (Count parameters:C259>=1)
			Sel_RemSets("Comp"; False:C215; ->[COMPANIES:2])
		Else 
			
			Sel_RemSets("Comp"; True:C214; ->[COMPANIES:2])
		End if 
		
		Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; vCompCode)
		Sel_SIDate(->[COMPANIES:2]; ->[COMPANIES:2]Entry_Date:16; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
		Sel_SIDate(->[COMPANIES:2]; ->[COMPANIES:2]Modified_Date:32; vSDateF; vSDateT)
		Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Omit:17; vOmit)
		Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Their_Account_Number:48; vContrCode)
		Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Mailsort_SSC:49; vLocation)
		Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Mailsort_OFN:50; vProbCode)
		Sel_S(->[COMPANIES:2]; ->[COMPANIES:2]Telephone:9; vTel)
		Comp_SelPifs
		Sel_SIS(->[COMPANIES:2])
		Sel_SSDate(->[COMPANIES:2]; ->[COMPANIES:2]Financial_Year:27; vFDatef; vFDatet)
		Sel_SSNum(->[COMPANIES:2]; ->[COMPANIES:2]Size:15; vdiscountf; vdiscountt)
		Sel_SSNum(->[COMPANIES:2]; ->[COMPANIES:2]Record_State:62; VrStateL; VrStateL)
		Sel_SSNum(->[COMPANIES:2]; ->[COMPANIES:2]Value:31; vValuef; vValuet)
		If (VComments#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="COM"; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Result_Description:12="@"+vComments+"@"; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Company_Code:1#"")
			DISTINCT VALUES:C339([DIARY:12]Company_Code:1; $_at_CompanyCodes)
			QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
			CREATE SET:C116([COMPANIES:2]; "CommentMatch")
			Master_UseSS(->[COMPANIES:2])
			If (Records in set:C195("Master")>0)
				INTERSECTION:C121("CommentMatch"; "Master"; "Master")
				USE SET:C118("Master")
			Else 
				CREATE SET:C116([COMPANIES:2]; "Master")
			End if 
			
			//Sel_SSStrSin (->[COMPANIES];->[COMPANIES]Comments;vComments)
		End if 
		If ((vDoDateF>!00-00-00!) | (vDoDateT>!00-00-00!))
			Master_UseSS(->[COMPANIES:2])
			QUERY SELECTION BY FORMULA:C207([COMPANIES:2]; Comp_DrySrch)
			QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61#1)
			If (COM_at_CompanyTypes>0)
				Case of 
					: (COM_at_CompanyTypes=1)  //COmpanies
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37#True:C214)
					: (COM_at_CompanyTypes=2)  //people
						QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Private:37=True:C214)
				End case 
			End if 
			
			
			Master2(->[COMPANIES:2])
		End if 
		//SM_SearchVarsToBlob (->SM_blb_SearchBlob;->CUS_at_DisplayedData;->CUS_at_PageText;->FUR_at_CustomFieldNames)
		
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("COMPANIES"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[COMPANIES:2])
					End if 
				End if 
			End for 
			
		End if 
		Master_UseSS(->[COMPANIES:2])
		
		QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61#1)
		Master2(->[COMPANIES:2])
		Big_One(->[COMPANIES:2])
		
	End if 
End while 
Sel_Ending(->[COMPANIES:2])
If ($_bo_OpenWIndow)
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	SM_bo_SessionWindow:=False:C215
End if 
ERR_MethodTrackerReturn("Comp_SelP"; $_t_oldMethodName)