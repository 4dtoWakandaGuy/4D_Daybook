//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_SelP
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
	ARRAY LONGINT:C221($_al_SearchIDs; 0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_SCCodes; 0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; SM_bo_SessionWindow; SVS_bo_FFLoaded; WIN_bo_TrackerInited)
	C_DATE:C307(VCDateF; VcDateT; VsDateF; VsDateT)
	C_LONGINT:C283($_l_AND; $_l_ArraySize; $_l_Element; $_l_Index; $_l_NextElement; $_l_NOT; $_l_offset; $_l_OR; $_l_QueryID; $_l_QueryRow; $_l_TableNumber)
	C_LONGINT:C283($_l_Whiles; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReferenceRow; $_l_WindowRIght; $_l_WindowRow; $_l_WindowTop; $1; $_l_ElementCount; $_l_Mode; CH0)
	C_LONGINT:C283(CH1; CH2; cNAA; cNAL; cSIS; SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And)
	C_LONGINT:C283(SRCH_l_Not; SRCH_l_or; vCalls; WIN_l_CurrentWinRef)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD; VCallCode; vCharge; VCompCode; VCompName; VContCode; VContrCode; VForename; VPerson; Vpriority)
	C_TEXT:C284(VProbCode; VProbDesc; VProdCode; VprodName; VSELPREV; VserialNo; VSolCode; VSolDesc; VSurname; Vtele)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_SelP")
//Calls_Sel
$_bo_OpenWindow:=False:C215

$_bo_NoSearch:=False:C215  // used for cross file search

Sel_Beginning(False:C215; ->[SERVICE_CALLS:20])
$_l_ElementCount:=0
If (Count parameters:C259>=2)
	$_l_ElementCount:=Size of array:C274($2->)
End if 
$_l_TableNumber:=Table:C252(->[SERVICE_CALLS:20])

$_l_Element:=1
$_l_QueryID:=0
$_l_Mode:=0
$_l_Whiles:=0
While ((vCalls=1) & ((SRCH_l_And=1) | (SRCH_l_or=1) | (SRCH_l_Not=1))) | ($_l_Element<=$_l_ElementCount)
	$_l_Whiles:=$_l_Whiles+1
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
	IDLE:C311  // 03/04/03 pb
	If ($_l_Mode=0)
		If ($_l_Whiles=1)
			Sel_Beginning2(False:C215; ->[SERVICE_CALLS:20])
		End if 
	Else 
		Sel_Beginning2(False:C215; ->[SERVICE_CALLS:20])
	End if 
	
	
	If (vSelPrev#"•FSC")
		Calls_SelPvs
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
		ARRAY LONGINT:C221(SM_al_SearchIDsReturn; 0)  //Note that this array will be used again at any sublevels)
		
		
		$_bo_OpenWindow:=False:C215
		If (Not:C34(SM_bo_SessionWindow))
			$_bo_SessionWindowOwner:=True:C214
			
			SM_bo_SessionWindow:=True:C214
			$_bo_OpenWindow:=True:C214
			Open_AnyTypeWindow(322; 528; 4; "Find Calls")
		Else 
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			$_t_WindowTitleOLD:=Get window title:C450
			
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			
			SET WINDOW TITLE:C213("Find Calls")
		End if 
		DIALOG:C40([SERVICE_CALLS:20]; "dCalls_Sel")
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		
		
		
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226($_al_SearchIDs; $3->)
			$_l_ArraySize:=Size of array:C274($3->)
			INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_Element:=0
			For ($_l_Index; $_l_ArraySize+1; Size of array:C274($3->))
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
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->Vpriority; ->VContCode; ->VForename; ->VSurname; ->VCallCode; ->VContrCode; ->VPerson; ->Vtele; ->vCharge; ->VProbCode; ->VProbDesc; ->VSolCode; ->VSolDesc; ->VProdCode; ->VprodName; ->VserialNo; ->VCDateF; ->VcDateT; ->VsDateF; ->VsDateT; ->CH0; ->CH1; ->CH2; ->cSIS; ->cNAA; ->cNAL)
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
		
		//```
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
			If (Not:C34(SVS_bo_FFLoaded))
				SM_SetUpFFArray(->[SERVICE_CALLS:20])
				SVS_bo_FFLoaded:=True:C214
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
			If (Not:C34(SVS_bo_FFLoaded))
				SM_SetUpFFArray(->[SERVICE_CALLS:20])
				SVS_bo_FFLoaded:=True:C214
			End if 
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
			$_l_AND:=SRCH_l_And
			$_l_OR:=SRCH_l_or
			$_l_NOT:=SRCH_l_Not
			$_bo_NoSearch:=False:C215
			If ($_l_Mode=2)  // edit
				$_bo_NoSearch:=True:C214
				SM_l_ReturnQueryID:=0
				SM_l_QueryMode:=2
				SM_l_QuerySearchID:=$_l_QueryID
				$_bo_OpenWindow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWindow:=True:C214
					Open_AnyTypeWindow(322; 528; 4; "Find Calls")
				Else 
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
					$_t_WindowTitleOLD:=Get window title:C450
					
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					SET WINDOW TITLE:C213("Find Calls")
				End if 
				DIALOG:C40([SERVICE_CALLS:20]; "dCalls_Sel")
				If (Not:C34($_bo_OpenWindow))
					SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
					SET WINDOW TITLE:C213($_t_WindowTitleOLD)
				End if 
				
				//here resave the values
				If (SM_l_QueryMode=2) & (OK=1)
					SRCH_l_And:=$_l_AND
					SRCH_l_or:=$_l_OR
					SRCH_l_Not:=$_l_NOT
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->VCompCode; ->VCompName; ->Vpriority; ->VContCode; ->VForename; ->VSurname; ->VCallCode; ->VContrCode; ->VPerson; ->Vtele; ->vCharge; ->VProbCode; ->VProbDesc; ->VSolCode; ->VSolDesc; ->VProdCode; ->VprodName; ->VserialNo; ->VCDateF; ->VcDateT; ->VsDateF; ->VsDateT; ->CH0; ->CH1; ->CH2; ->cSIS; ->cNAA; ->cNAL)
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
			$_l_ElementCount:=Size of array:C274($2->)
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
			vCalls:=0
		End if 
		
	Else 
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Person:11; vPerson)
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Supervisor:13; vTele)
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Company_Code:1; vCompCode)
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; vCallCode)
		Sel_SSUB(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; vContrCode; ->[SERVICE_CALLS_PRODUCTS:152]; ->[SERVICE_CALLS_PRODUCTS:152]Product_Code:1)
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Priority:10; vPriority)
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Charge:8; vCharge)
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Problem_Code:14; vProbCode)
		Sel_S(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Solution_Code:16; vSolCode)
		Sel_SSUB(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Code:4; vProdCode; ->[SERVICE_CALLS_PRODUCTS:152]; ->[SERVICE_CALLS_PRODUCTS:152]Product_Code:1)
		Sel_SIDate(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Call_Date:5; vCDateF; vCDateT)
		Sel_SRadio(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Resolved:9; ch1; False:C215)
		Sel_SRadio(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Resolved:9; ch2; True:C214)
		If (ch0=1)
			QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Charge:8="")
			Master2(->[SERVICE_CALLS:20])
		End if 
		Sel_SIS(->[SERVICE_CALLS:20])
		Sel_SSStrSin(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Contact_Code:2; vContCode)
		Sel_SSStrSin(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Problem_Description:15; vProbDesc)
		Sel_SSStrSin(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Solution_Description:17; vSolDesc)
		
		QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Serial_Number:2=vSerialNo)
		SELECTION TO ARRAY:C260([SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8; $_at_SCCodes)
		QUERY WITH ARRAY:C644([SERVICE_CALLS:20]Call_Code:4; $_at_SCCodes)
		CREATE SET:C116([SERVICE_CALLS:20]; "$Set1")
		Master_UseSS(->[SERVICE_CALLS:20])
		CREATE SET:C116([SERVICE_CALLS:20]; "$Set2")
		INTERSECTION:C121("$set1"; "$set2"; "$set1")
		USE SET:C118("$set1")
		Master2(->[SERVICE_CALLS:20])
		//Sel_SSStrSin (->[SERVICE CALLS];->[SERVICE CALLS]PRODUCTS'Serial No;vSerialNo)
		Sel_SSDate(->[SERVICE_CALLS:20]; ->[SERVICE_CALLS:20]Solution_Date:18; vSDateF; vSDateT)
		
		If (vCompName#"")
			Sel_Set(->[SERVICE_CALLS:20])
			//DEFAULT TABLE([COMPANIES])
			Sel_Beginning3(->[COMPANIES:2])
			Comp_SelPName(vCompName)
			Master_UseSS(->[COMPANIES:2])
			//DEFAULT TABLE([SERVICE CALLS])
			Load_ManyI(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; "Master2"; ->[SERVICE_CALLS:20]Company_Code:1; ->[SERVICE_CALLS:20])
		End if 
		
		If (vProdName#"")
			Sel_Set(->[SERVICE_CALLS:20])
			If (cNAA=1)
				vProdName:=Sel_AtSign(vProdName)
			End if 
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Name:2=vProdName)
			QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Product_Code:1=vProdName)
			SELECTION TO ARRAY:C260([SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8; $_at_SCCodes)
			CREATE EMPTY SET:C140([SERVICE_CALLS:20]; "Master")
			QUERY WITH ARRAY:C644([SERVICE_CALLS:20]Call_Code:4; $_at_SCCodes)
			CREATE SET:C116([SERVICE_CALLS:20]; "Master")
			//Load_ManyI (->[SERVICE CALLS_PRODUCTS];->[SERVICE CALLS_PRODUCTS];"Master2";->[SERVICE CALLS]PRODUCTS'Product Code;->[SERVICE CALLS])
		End if 
		
		If ((vForename#"") | (vSurname#""))
			Sel_Set(->[SERVICE_CALLS:20])
			//DEFAULT TABLE([CONTACTS])
			Sel_Beginning3(->[CONTACTS:1])
			Cont_SelPifs(vForename; vSurname)
			Master_UseSS(->[CONTACTS:1])
			//DEFAULT TABLE([SERVICE CALLS])
			Load_ManyI(->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; "Master2"; ->[SERVICE_CALLS:20]Contact_Code:2; ->[SERVICE_CALLS:20])
		End if 
		
		Big_One(->[SERVICE_CALLS:20])
	End if 
End while 
Sel_Ending(->[SERVICE_CALLS:20])
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
ERR_MethodTrackerReturn("Calls_SelP"; $_t_oldMethodName)