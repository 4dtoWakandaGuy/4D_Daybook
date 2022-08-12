//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_SelP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 21:00
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
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_Messages; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; $1; DIA_bo_FFLoaded; SD2_bo_MinResult; SM_bo_SessionWindow; WIN_bo_TrackerInited)
	C_DATE:C307(VDnDateF; VDnDateT; VdodateF; VdodateT)
	C_LONGINT:C283($_l_And; $_l_ArraySize; $_l_CurrentRow; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID)
	C_LONGINT:C283($_l_Records; $_l_SearchRow; $_l_TableNumber; $_l_WhilesCounter; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowReferenceRow; $_l_WindowRightOLD; $_l_WindowTopOLD; $2; ch1)
	C_LONGINT:C283(ch2; cNAA; cNAL; cSetAdd; cSetMod; cSIS; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber)
	C_LONGINT:C283(SRCH_l_And; SRCH_l_Not; SRCH_l_or; vD; VDnDateFOffset; VDnDatetOffset; VDoDateFOffset; VDoDatetOffset; WIN_l_CurrentWinRef)
	C_POINTER:C301($3; $4)
	C_REAL:C285(VvalueF; VvalueT)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; DIA_t_actionCode; DIA_t_actionName; Vcallcode; VCompcode; vCompName; vContactname; vContCode; VContrCode; Vevent)
	C_TEXT:C284(VforeName; VGroup; VJob; VLetterCode; VOrderCode; Vpriority; VProduct; VResDesc; VResult; vSales; VSELPREV)
	C_TEXT:C284(VStage; Vstatus; Vsuperior; Vsurname; VTele; VTerms; Vtitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_SelP")
//Diary_SelP
$_bo_OpenWindow:=False:C215

If (Count parameters:C259>=1)
	$_bo_Messages:=$1
Else 
	$_bo_Messages:=False:C215
End if 
If ($_bo_Messages)
	ERASE WINDOW:C160
	MESSAGE:C88("Entering SelBeginning  ")
End if 
$_l_ElementCount:=0
If (Count parameters:C259>=3)
	$_l_ElementCount:=Size of array:C274($3->)
End if 
$_l_TableNumber:=Table:C252(->[DIARY:12])
Sel_Beginning($_bo_Messages; ->[DIARY:12])
$_l_CurrentRow:=1
$_l_QueryID:=0
$_l_Mode:=0
$_bo_NoSearch:=False:C215  // used for cross file search
$_l_WhilesCounter:=0

While ((vD=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_CurrentRow<=$_l_ElementCount)
	$_l_WhilesCounter:=$_l_WhilesCounter+1
	IDLE:C311  // 03/04/03 pb
	If (Count parameters:C259>=3)
		$_l_Mode:=0
		$_l_QueryID:=0
		Case of 
			: ($2<0)
				$_l_Mode:=1  // Dont search we are building
			: ($_l_CurrentRow<=Size of array:C274($3->))
				$_l_QueryID:=$3->{$_l_CurrentRow}
				$_l_Mode:=$2
		End case 
		
	End if 
	If ($_bo_Messages)
		ERASE WINDOW:C160
		MESSAGE:C88("Entering SelBeginning2 because VD="+String:C10(Vd)+" or SRCH_l_And="+String:C10(SRCH_l_And)+" or SRCH_l_or="+String:C10(SRCH_l_or)+" or SRCH_l_Not="+String:C10(SRCH_l_Not))
	End if 
	If ($_l_Mode=0)
		If ($_l_WhilesCounter=1)
			Sel_Beginning2($_bo_Messages; ->[DIARY:12])
		End if 
	Else 
		Sel_Beginning2($_bo_Messages; ->[DIARY:12])
	End if 
	
	
	If (vSelPrev#"•FSC")
		If ($_bo_Messages)
			ERASE WINDOW:C160
			MESSAGE:C88("Entering Diary_SelPvs because vSelPrev="+vSelPrev)
		End if 
		Diary_SelPvs($_bo_Messages)
	End if 
	If ($_l_QueryID=0)
		SM_l_QueryMode:=0
		If ($_l_Mode=1)
			SM_l_QueryMode:=1
			
			SM_l_ReturnQueryID:=0
			ARRAY LONGINT:C221($_al_SearchIDs; 0)
			COPY ARRAY:C226($4->; $_al_SearchIDs)
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
		Else 
			ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
			ARRAY LONGINT:C221(SM_al_SearchIds; 0)  // Declare this so it can be passed as a pointer(in build mode it IS empty
		End if 
		ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
		$_bo_OpenWindow:=False:C215
		If (Not:C34(SM_bo_SessionWindow))
			SM_bo_SessionWindow:=True:C214
			$_bo_SessionWindowOwner:=True:C214
			
			$_bo_OpenWindow:=True:C214
			Open_AnyTypeWindow(353; 530; 4; "Find Diary Items")
			
		Else 
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			SET WINDOW TITLE:C213("Find Diary Items")
		End if 
		DIALOG:C40([DIARY:12]; "dDiary_Sel")
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226($_al_SearchIDs; $4->)
			$_l_ArraySize:=Size of array:C274($4->)
			INSERT IN ARRAY:C227($4->; Size of array:C274($4->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_CurrentRow:=0
			For ($_l_Index; $_l_ArraySize+1; Size of array:C274($4->))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$4->{$_l_Index}:=$_al_SearchIDsReturn{$_l_CurrentRow}
			End for 
		Else 
			If (SM_l_QueryMode>0)
				COPY ARRAY:C226($_al_SearchIDs; $4->)
				
			End if 
			
		End if 
		If (SM_l_QueryMode=1) & (OK=1)
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompcode; ->vCompName; ->vContCode; ->VforeName; ->Vsurname; ->Vsuperior; ->VdodateF; ->VDnDateF; ->VdodateT; ->VDnDateT; ->VvalueF; ->VvalueT)
				
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSales; ->VGroup; ->VTele; ->Vpriority; ->Vstatus; ->DIA_t_actionCode; ->DIA_t_actionName; ->VLetterCode; ->VTerms; ->VResult)
				
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VResDesc; ->VProduct; ->VJob; ->VStage; ->VContrCode; ->VOrderCode; ->Vevent; ->Vcallcode; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactname)
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VDoDateFOffset; ->VDnDatetOffset; ->VDoDatetOffset; ->VDnDatetOffset)
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
			INSERT IN ARRAY:C227($4->; Size of array:C274($4->)+1; 1)
			$4->{Size of array:C274($4->)}:=SM_l_SearchNumber
			
		End if 
		SM_l_QueryMode:=0
		WS_KeepFocus
		
	Else 
		//here we need to check the context of the query and if it is not  need to pass on the work to the appropriate search
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		$_bo_AndLoaded:=False:C215
		If ($_l_QueryID<0)
			//this is a reference to a search....
			//when the users are building a search they may select a search from the pop up that they want the system to use
			//the system creates a Set manager owner set which refers to the real search
			$_l_offset:=0
			SM_l_ReturnQueryID:=0
			If (Not:C34(DIA_bo_FFLoaded))
				SM_SetUpFFArray(->[DIARY:12])
				DIA_bo_FFLoaded:=True:C214
			End if 
			VDoDateFOffset:=0
			VDnDatetOffset:=0
			VDoDatetOffset:=0
			VDnDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			
			If (VDnDateFOffset#0)
				Case of 
					: (VDnDateFOffset>0)
						VDnDateF:=Current date:C33-VDnDateFOffset
					: (VDnDateFOffset>-100)
						//months
						VDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
					Else 
						//years
						VDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VDnDateTOffset#0)
				Case of 
					: (VDnDateTOffset>0)
						VDnDateF:=Current date:C33-VDnDateTOffset
					: (VDnDateTOffset>-100)
						//months
						VDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
					Else 
						//years
						VDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
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
			If (Not:C34(DIA_bo_FFLoaded))
				SM_SetUpFFArray(->[DIARY:12])
				DIA_bo_FFLoaded:=True:C214
			End if 
			VDoDateFOffset:=0
			VDnDatetOffset:=0
			VDoDatetOffset:=0
			VDnDatetOffset:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			
			If (VDnDateFOffset#0)
				Case of 
					: (VDnDateFOffset>0)
						VDnDateF:=Current date:C33-VDnDateFOffset
					: (VDnDateFOffset>-100)
						//months
						VDnDateF:=Add to date:C393(Current date:C33; 0; VDnDateFOffset; 0)
					Else 
						//years
						VDnDateF:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateFOffset)/100); 0; 0)
				End case 
			End if 
			If (VDnDateTOffset#0)
				Case of 
					: (VDnDateTOffset>0)
						VDnDateF:=Current date:C33-VDnDateTOffset
					: (VDnDateTOffset>-100)
						//months
						VDnDateT:=Add to date:C393(Current date:C33; 0; VDnDateTOffset; 0)
					Else 
						//years
						VDnDateT:=Add to date:C393(Current date:C33; -(Abs:C99(VDnDateTOffset)/100); 0; 0)
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
			$_bo_NoSearch:=False:C215
			If ($_l_Mode=2)  // edit
				$_bo_NoSearch:=False:C215
				SM_l_QueryMode:=2
				SM_l_QuerySearchID:=$_l_QueryID
				SM_l_ReturnQueryID:=0
				$_bo_OpenWindow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWindow:=True:C214
					Open_AnyTypeWindow(353; 530; 4; "Find Diary Items")
					
				Else 
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					SET WINDOW TITLE:C213("Find Diary Items")
				End if 
				DIALOG:C40([DIARY:12]; "dDiary_Sel")
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
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompcode; ->vCompName; ->vContCode; ->VforeName; ->Vsurname; ->Vsuperior; ->VdodateF; ->VDnDateF; ->VdodateT; ->VDnDateT; ->VvalueF; ->VvalueT)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->vSales; ->VGroup; ->VTele; ->Vpriority; ->Vstatus; ->DIA_t_actionCode; ->DIA_t_actionName; ->VLetterCode; ->VTerms; ->VResult)
						
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VResDesc; ->VProduct; ->VJob; ->VStage; ->VContrCode; ->VOrderCode; ->Vevent; ->Vcallcode; ->cSIS; ->cNAA; ->cNAL; ->cSetAdd; ->cSetMod)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldNames; ->vContactname)
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VDoDateFOffset; ->VDnDatetOffset; ->VDoDatetOffset; ->VDnDatetOffset)
						
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
			//Here put the remaining paramters into an array
			$_l_NextElement:=0
			For ($_l_Index; $_l_CurrentRow; Size of array:C274($3->))
				QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$3->{$_l_Index})
				If ([x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_TableNumber)
					$_l_NextElement:=$_l_Index
					$_l_Index:=9999999
				End if 
			End for 
			ARRAY LONGINT:C221($_al_QueryIDs; 0)
			//The Array after executing other tables
			ARRAY LONGINT:C221($_al_QueryIDs; (Size of array:C274($3->)-$_l_NextElement)+1)
			$_l_SearchRow:=1
			For ($_l_Index; $_l_NextElement; Size of array:C274($3->))
				$_al_QueryIDs{$_l_SearchRow}:=$3->{$_l_Index}
				$_l_SearchRow:=$_l_SearchRow+1
			End for 
			//Now chop off $3
			ARRAY LONGINT:C221($3->; $_l_NextElement-1)
			SM_al_NextElement:=0
			SM_CrossFileSearch($_l_Mode; $_l_TableNumber; $3; ->SM_al_NextElement)
			COPY ARRAY:C226($_al_QueryIDs; $3->)
			$_l_ElementCount:=Size of array:C274($3->)
			$_l_CurrentRow:=0
			$_bo_NoSearch:=True:C214
			
		End if 
		
		//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
		$_l_QueryID:=0
		$_l_CurrentRow:=$_l_CurrentRow+1
		If ($_l_CurrentRow>Size of array:C274($3->)) | ($_l_Mode=2)  // edit will not call each window at the same time
			//must break out
			SRCH_l_And:=0
			SRCH_l_or:=0
			SRCH_l_Not:=0
		End if 
		
		
	End if 
	
	If (OK=0) | ($_l_Mode#0) | ($_bo_NoSearch=True:C214)
		If (SRCH_l_And=0) & (SRCH_l_or=0) & (SRCH_l_Not=0)
			vD:=0
		End if 
		
	Else 
		If ($_bo_Messages)
			ERASE WINDOW:C160
			MESSAGE:C88("Entering Sel_RemSets ")
		End if 
		Sel_RemSets("Diary"; $_bo_Messages; ->[DIARY:12])
		If ($_bo_Messages)
			ERASE WINDOW:C160
			MESSAGE:C88("Searching Company Code"+Vcompcode)
		End if 
		Sel_S(->[DIARY:12]; ->[DIARY:12]Company_Code:1; vCompCode)
		If ($_bo_Messages)
			ERASE WINDOW:C160
			MESSAGE:C88("Searching Contact Code"+Vcompcode)
		End if 
		Sel_S(->[DIARY:12]; ->[DIARY:12]Contact_Code:2; vContCode)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Priority:17; vPriority)
		Sel_SIBetDate(->[DIARY:12]; ->[DIARY:12]Date_Do_From:4; ->[DIARY:12]Date_Do_To:33; vDoDateF; vDoDateT)
		Sel_SIBetDate(->[DIARY:12]; ->[DIARY:12]Date_Done_From:5; ->[DIARY:12]Date_Done_To:34; vDnDateF; vDnDateT)
		Sel_SRadio(->[DIARY:12]; ->[DIARY:12]Done:14; ch1; False:C215)
		Sel_SRadio(->[DIARY:12]; ->[DIARY:12]Done:14; ch2; True:C214)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Person:8; vSales)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Product_Code:13; vProduct)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; vSuperior)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Action_Code:9; DIA_t_actionCode)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Result_Code:11; vResult)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Document_Code:15; vLetterCode)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Job_Code:19; vJob)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Stage_Code:21; vStage)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Order_Code:26; vOrderCode)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Call_Code:25; vCallCode)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Originator:23; vTele)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Status:30; vStatus)
		Sel_S(->[DIARY:12]; ->[DIARY:12]Script_Code:29; vTerms)
		
		Master_UseSS(->[DIARY:12]; SD2_bo_MinResult)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Deleted:43#1)
		Master2(->[DIARY:12]; SD2_bo_MinResult)
		If (vGroup#"")
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=vGroup)
			If (Records in selection:C76([PERSONNEL:11])>0)
				FIRST RECORD:C50([PERSONNEL:11])
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1; *)
				NEXT RECORD:C51([PERSONNEL:11])
				While (Not:C34(End selection:C36([PERSONNEL:11])))
					QUERY:C277([DIARY:12];  | ; [DIARY:12]Person:8=[PERSONNEL:11]Initials:1; *)
					NEXT RECORD:C51([PERSONNEL:11])
				End while 
				QUERY:C277([DIARY:12])
				Master2(->[DIARY:12])
			End if 
		End if 
		
		Sel_SIS(->[DIARY:12])
		Sel_SSStrSin(->[DIARY:12]; ->[DIARY:12]Action_Code:9; DIA_t_actionName)
		Sel_SSStrSin(->[DIARY:12]; ->[DIARY:12]Result_Code:11; vResDesc)
		Sel_SSNum(->[DIARY:12]; ->[DIARY:12]Value:16; vValuef; vValuet)
		If (vCompName#"")
			Comp_SelPOther(->[DIARY:12]; ->[DIARY:12]Company_Code:1; "Master2"; vCompName)
		End if 
		Vtitle:=""
		If (vContactname#"")
			AA_LoadNameArrays
			AA_ParseName(vContactname; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
		End if 
		If ((vForename#"") | (vSurname#""))
			Cont_SelPOther(->[DIARY:12]; ->[DIARY:12]Contact_Code:2; "Master2"; vForename; vSurname; Vtitle)
		End if 
		If (Size of array:C274(CUS_at_DisplayedData)>0)
			For ($_l_Index; 1; Size of array:C274(CUS_at_DisplayedData))
				If (CUS_at_DisplayedData{$_l_Index}#"") | (CUS_at_PageText{$_l_Index}#"")
					$_l_Records:=FurthFld_Find2("DIARY"; FUR_at_CustomFieldNames{$_l_Index}; CUS_at_DisplayedData{$_l_Index}; CUS_at_PageText{$_l_Index}; 1)
					If ($_l_Records>0)
						Master2(->[DIARY:12])
					End if 
				End if 
			End for 
			
		End if 
		
		Big_One(->[DIARY:12])
	End if 
End while 
Sel_Ending(->[DIARY:12])

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

CREATE SET:C116([DIARY:12]; "SearchResults")  //added kmw - 02/07/08

SD2_bo_MinResult:=False:C215
ERR_MethodTrackerReturn("Diary_SelP"; $_t_oldMethodName)
