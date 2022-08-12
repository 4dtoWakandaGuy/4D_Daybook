//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont_SelP
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
	ARRAY LONGINT:C221($_al_aSearchIDs; 0)
	ARRAY LONGINT:C221($_al_QueryIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
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
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; COn_bo_FFLoaded; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vDateF1; vDateF2; vDateF3; vDateF4; vDateF5; vDateT1; vDateT2; vDateT3; vDateT4)
	C_DATE:C307(vDateT5; VsDateF; VsDateT)
	C_LONGINT:C283($_l_And; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID; $_l_QueryRow)
	C_LONGINT:C283($_l_Records; $_l_SizeofArray; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; ACC_l_EntryDateFromOffset)
	C_LONGINT:C283(ACC_l_EntryDateToOffset; ch1; cNAA; cNAL; cSetAdd; cSetMod; cSIS; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID)
	C_LONGINT:C283(SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; vAct1; vAct2; vAct3; vAct4; vAct5; VintDateFOffset; VintDatetOffset)
	C_LONGINT:C283(vNo1; vNo2; vNo3; vNo4; vNo5; vO; VsDateFOffset; VsDatetOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; vAccName; vAccount; vAnalysis; Varea; vCalYr; VCharge; Vcomments; vCompCode; VCompName)
	C_TEXT:C284(VContCode; vCountry; vCounty; vDesc1; vDesc2; vDesc3; vDesc4; vDesc5; vemail; VForeName; VJobTitle)
	C_TEXT:C284(Vomit; Vperson; vPersonName; VPostCode; vProdCode; Vrole; VSales; VSELPREV; Vsource; vSource_; VStatus)
	C_TEXT:C284(Vstatus_; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vSubGroup5; Vsurname; vTele; Vtitle; vTitle1; vTitle2)
	C_TEXT:C284(vTitle3; vTitle4; vTitle5; Vtown; VType; Vtype_)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelP")
//Comp_SelP
//Cont_SelP

$_bo_OpenWindow:=False:C215
Sel_Beginning(False:C215; ->[CONTACTS:1])
$_l_ElementCount:=0
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_Mode:=0
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_TableNumber:=Table:C252(->[CONTACTS:1])
$_bo_NoSearch:=False:C215
$_l_WhilesCounter:=0
While ((vO=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
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
	IDLE:C311  // 03/04/03 pb
	If ($_l_Mode=0)
		If ($_l_WhilesCounter=1)
			Sel_Beginning2(False:C215; ->[CONTACTS:1])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[CONTACTS:1])
	End if 
	
	
	If (vSelPrev#"•FSC")
		Comp_SelPvs
		Cont_SelPvs
	End if 
	If ($_l_QueryID=0)
		
		//`
		SM_l_QueryMode:=0
		If ($_l_Mode=1)
			SM_l_QueryMode:=1
			
			SM_l_ReturnQueryID:=0
			ARRAY LONGINT:C221($_al_aSearchIDs; 0)
			COPY ARRAY:C226($3->; $_al_aSearchIDs)
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
		Else 
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
		End if 
		$_bo_OpenWindow:=False:C215
		If (Not:C34(SM_bo_SessionWindow))
			SM_bo_SessionWindow:=True:C214
			$_bo_OpenWindow:=True:C214
			$_bo_SessionWindowOwner:=True:C214
			
			Open_AnyTypeWindow(353; 530; 4; "Find Contacts")
		Else 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Contacts")
		End if 
		
		DIALOG:C40([CONTACTS:1]; "dCont_Sel")
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226($_al_aSearchIDs; $3->)
			$_l_SizeofArray:=Size of array:C274($3->)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_CurrentRow:=0
			For ($_l_Index; $_l_SizeofArray+1; Size of array:C274($3->))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$3->{$_l_Index}:=$_al_SearchIDsReturn{$_l_CurrentRow}
			End for 
		Else 
			If (SM_l_QueryMode>0)
				COPY ARRAY:C226($_al_aSearchIDs; $3->)
				
			End if 
			
		End if 
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCompCode; ->Vtitle; ->VForeName; ->Vsurname; ->VJobTitle; ->Vstatus_; ->Vtype_; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT; ->VCompName; ->Vtown)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCounty; ->vCountry; ->VStatus; ->VType; ->vSource_; ->VContCode; ->Vrole; ->Vomit; ->VCharge; ->Vperson; ->vCalYr; ->vAccName; ->vAccName; ->vemail)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vAnalysis; ->Vcomments; ->VPostCode; ->vProdCode; ->Varea; ->VSales; ->vTele; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vPersonName)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset)
				
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
		//here we need to check the context of the query and if it is not contacts need to pass on the work to the appropriate search
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		$_bo_AndLoaded:=False:C215
		If ($_l_QueryID<0)
			//this is a reference to a search....
			//when the users are building a search they may select a search from the pop up that they want the system to use
			//the system creates a Set manager owner set which refers to the real search
			$_l_offset:=0
			SM_l_ReturnQueryID:=0
			If (Not:C34(COn_bo_FFLoaded))
				SM_SetUpFFArray(->[CONTACTS:1])
				COn_bo_FFLoaded:=True:C214
			End if 
			ACC_l_EntryDateFromOffset:=0
			VintDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VintDatetOffset:=0
			
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
			If (Not:C34(COn_bo_FFLoaded))
				SM_SetUpFFArray(->[CONTACTS:1])
				COn_bo_FFLoaded:=True:C214
			End if 
			ACC_l_EntryDateFromOffset:=0
			VintDateFOffset:=0
			ACC_l_EntryDateToOffset:=0
			VintDatetOffset:=0
			VSDateFOffset:=0
			VSDateF:=!00-00-00!
			VSDateTOffset:=0
			VSDateF:=!00-00-00!
			ACC_l_EntryDateFromOffset:=0
			SRCH_d_EntryDateFrom:=!00-00-00!
			ACC_l_EntryDateToOffset:=0
			SRCH_d_EntryDateFrom:=!00-00-00!
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
					$_bo_OpenWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					Open_AnyTypeWindow(353; 530; 4; "Find Contacts")
				Else 
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					SET WINDOW TITLE:C213("Find Contacts")
				End if 
				
				DIALOG:C40([CONTACTS:1]; "dCont_Sel")
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
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCompCode; ->Vtitle; ->VForeName; ->Vsurname; ->VJobTitle; ->Vstatus_; ->Vtype; ->Vsource; ->SRCH_d_EntryDateFrom; ->SRCH_d_EntryDateTo; ->VsDateF; ->VsDateT; ->VCompName; ->Vtown)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vCounty; ->vCountry; ->VStatus; ->VType; ->vSource_; ->VContCode; ->Vrole; ->Vomit; ->VCharge; ->Vperson; ->vCalYr; ->vAccName; ->vAccName; ->vemail)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vAnalysis; ->Vcomments; ->VPostCode; ->vProdCode; ->Varea; ->VSales; ->vTele; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod; ->ch1; ->vTitle1; ->vSubGroup1)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc1; ->vNo1; ->vAct1; ->vDateF1; ->vDateT1; ->vTitle2; ->vSubGroup2; ->vDesc2; ->vNo2; ->vAct2; ->vDateF2; ->vDateT2; ->vTitle3; ->vSubGroup3; ->vDesc3)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vNo3; ->vAct3; ->vDateF3; ->vDateT3; ->vTitle4; ->vSubGroup4; ->vDesc4; ->vNo4; ->vAct4; ->vDateF4; ->vDateT4; ->vTitle5; ->vSubGroup5; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vDesc5; ->vNo5; ->vAct5; ->vDateF5; ->vDateT5)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vPersonName)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->ACC_l_EntryDateFromOffset; ->VsDateFOffset; ->ACC_l_EntryDateToOffset; ->VsDatetOffset)
						
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
			vO:=0
		End if 
	Else 
		If (Count parameters:C259>=1)
			//$2=False=No messages
			Sel_RemSets("Cont"; False:C215; ->[CONTACTS:1])
		Else 
			//$2=True=messages
			Sel_RemSets("Cont"; True:C214; ->[CONTACTS:1])
			
		End if 
		
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1; vCompCode)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; vContCode)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Role:11; vRole)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Sales_Person:25; vPerson)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Taken_by:29; vCalYr)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Status:14; vStatus_)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Type:15; vType_)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Source:16; vSource_)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Job_Title:6; vJobTitle)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Omit:20; vOmit)
		
		Sel_SSUB(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; vAnalysis; ->[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1; ->[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1)
		
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Duplicate_State:26; vCharge)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]Email_Before_At:30; vAccName)
		Sel_S(->[CONTACTS:1]; ->[CONTACTS:1]EMail_After_At:24; vAccount)
		Sel_SIDate(->[CONTACTS:1]; ->[CONTACTS:1]Entry_Date:17; SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
		Sel_SIDate(->[CONTACTS:1]; ->[CONTACTS:1]Modified_Date:28; vSDateF; vSDateT)
		//TRACE
		Vtitle:=""
		If (VPersonName#"")  //&(VPersonName="")&(VSurname="")
			AA_LoadNameArrays
			AA_ParseName(VPersonName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
		End if 
		Cont_SelPifs(VForename; Vsurname)
		//Master2 (->[CONTACTS])
		Sel_SIS(->[CONTACTS:1])
		Sel_SSStrSin(->[CONTACTS:1]; ->[CONTACTS:1]Title:3; vTitle)
		Sel_SSStrSin(->[CONTACTS:1]; ->[CONTACTS:1]Comments:10; vComments)
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("CONTACTS"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[CONTACTS:1])
					End if 
				End if 
			End for 
			
		End if 
		
		Master_UseSS(->[CONTACTS:1])
		QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
		Master2(->[CONTACTS:1])
		If ((vCompName#"") | (vTown#"") | (vCounty#"") | (vPostcode#"") | (vTele#"") | (vStatus#"") | (vType#"") | (vSource#"") | (vArea#"") | (vSales#"") | (vProdCode#"") | (vCountry#""))
			Sel_Set(->[CONTACTS:1])
			//DEFAULT TABLE([COMPANIES])
			Sel_Beginning3(->[COMPANIES:2])
			Comp_SelPifs
			Master_UseSS(->[COMPANIES:2])
			QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Deleted:61=0)
			
			Cont_SelFComp("Master2")
		End if 
		
		
		
		Big_One(->[CONTACTS:1])
	End if 
End while 
Sel_Ending(->[CONTACTS:1])
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
ERR_MethodTrackerReturn("Cont_SelP"; $_t_oldMethodName)