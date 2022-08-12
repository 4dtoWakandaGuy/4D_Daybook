//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_AdvancedSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	ARRAY LONGINT:C221($_al_QueryIDs; 0)
	ARRAY LONGINT:C221($_al_SearchIDS; 0)
	ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(SM_al_SearchIds;0)
	//ARRAY LONGINT(SM_al_SearchIDsReturn;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QueryType;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	C_BLOB:C604(SM_blb_SearchBlob)
	C_BOOLEAN:C305($_bo_AndLoaded; $_bo_NoSearch; $_bo_OpenWindow; $_bo_SessionWindowOwner; $2; QV_bo_KeepWindowsize; QV_bo_ReturnQuals; QV_bo_SearchDone; SM_bo_SessionWindow)
	C_LONGINT:C283($_l_And; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_ElementCount; $_l_Index; $_l_Mode; $_l_NextElement; $_l_Not; $_l_offset; $_l_OR; $_l_QueryID)
	C_LONGINT:C283($_l_QueryRow; $_l_SIzeofArray; $_l_TableNumber; $_l_WindowBottomOLD; $_l_WindowLeftOLD; $_l_WindowRightOLD; $_l_WindowTopOLD; $1; $3; QV_l_CurrentTable; QV_l_OK)
	C_LONGINT:C283(SM_al_NextElement; SM_l_QueryMode; SM_l_QuerySearchID; SM_l_ReturnQueryID; SM_l_SearchNumber; SRCH_l_And; SRCH_l_Not; SRCH_l_or; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($4; $5)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitleOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_AdvancedSearch")
//this method will display the advanced qualities window

$_bo_OpenWindow:=False:C215
QV_bo_SearchDone:=False:C215  //this is set to true when a search is done-so the calling method knows if you searched or cancelled
$_l_TableNumber:=Table:C252(->[INFORMATION:55])
If (Count parameters:C259>=1)
	If (Count parameters:C259>=2)
		QV_bo_ReturnQuals:=$2
	Else 
		QV_bo_ReturnQuals:=False:C215
	End if 
	
	QV_l_CurrentTable:=$1
	//Note with qualities there can only be one search as it searches multiple values
	//so subsequent searches would drop back to the calling search
	$_l_QueryID:=0
	$_l_Mode:=0
	$_l_CurrentRow:=1
	If (Count parameters:C259>=3)
		$_l_Mode:=0
		$_l_QueryID:=0
		Case of 
			: ($3<0)
				$_l_Mode:=1  // Dont search we are building
			: ($_l_CurrentRow<=Size of array:C274($4->))
				
				$_l_QueryID:=$4->{$_l_CurrentRow}
				$_l_Mode:=$3
		End case 
		
	End if 
	If ($_l_QueryID=0)
		SM_l_QueryMode:=0
		If ($_l_Mode=1)
			SM_l_QueryMode:=1
			
			SM_l_ReturnQueryID:=0
			ARRAY LONGINT:C221($_al_SearchIDS; 0)
			COPY ARRAY:C226($5->; $_al_SearchIDS)
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
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1988)
		Else 
			
			GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			$_t_WindowTitleOLD:=Get window title:C450
			If (($_l_WindowRightOLD-$_l_WindowLeftOLD)<456) | (($_l_WindowBottomOLD-$_l_WindowTopOLD)<380)
				QV_bo_KeepWindowsize:=False:C215  //if the window is too small ignore if this is true
				
			End if 
			If ($_bo_SessionWindowOwner)
				$_bo_OpenWindow:=True:C214
			End if 
			SET WINDOW TITLE:C213("Find Qualitative Information")
		End if 
		DIALOG:C40([USER:15]; "dQualitiesSearch")
		OK:=QV_l_OK
		QV_bo_KeepWindowsize:=False:C215  //always reset this in here
		If (Not:C34($_bo_OpenWindow))
			SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
			SET WINDOW TITLE:C213($_t_WindowTitleOLD)
		End if 
		//``
		If (Size of array:C274(SM_al_SearchIDsReturn)>0) & (SM_l_QueryMode>0)  //regardless of the cancel?]
			
			ARRAY LONGINT:C221($_al_SearchIDsReturn; 0)
			COPY ARRAY:C226(SM_al_SearchIDsReturn; $_al_SearchIDsReturn)
			COPY ARRAY:C226($_al_SearchIDS; $5->)
			$_l_SIzeofArray:=Size of array:C274($5->)
			INSERT IN ARRAY:C227($5->; Size of array:C274($5->)+1; Size of array:C274($_al_SearchIDsReturn))
			$_l_CurrentRow:=0
			For ($_l_Index; $_l_SIzeofArray+1; Size of array:C274($5->))
				$_l_CurrentRow:=$_l_CurrentRow+1
				$5->{$_l_Index}:=$_al_SearchIDsReturn{$_l_CurrentRow}
			End for 
		Else 
			If (SM_l_QueryMode>0) & (Count parameters:C259>=5)
				COPY ARRAY:C226($_al_SearchIDS; $5->)
			End if 
			
		End if 
		If (SM_l_QueryMode=1) & (OK=1)
			QV_bo_SearchDone:=True:C214
			SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
			If (SM_l_ReturnQueryID=0)  // not a linked query
				SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_al_GroupIDs; ->QV_al_QualityIDs; ->QV_al_QualityLevelLevels; ->QV_al_QualityQualityYears; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_LevelOptions; ->QV_at_YearOptions; ->QV_at_QueryType)
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
				SM_SearchVarsToBlob(->[x_QUERY_PARAMETERS:134]X_SearchValues:5; ->SM_l_ReturnQueryID)
				DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
				SM_l_SearchNumber:=[x_QUERY_PARAMETERS:134]X_ID:1
				UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
				READ ONLY:C145([x_QUERY_PARAMETERS:134])
			End if 
			
			// here save the SRCH_l_And, SRCH_l_or, SRCH_l_Not variables at the end of the blob
			INSERT IN ARRAY:C227($5->; Size of array:C274($5->)+1; 1)
			$5->{Size of array:C274($5->)}:=SM_l_SearchNumber
		End if 
		OK:=1
		//```
	Else 
		//here we need to check the context of the query and if it is not account balances need to pass on the work to the appropriate search
		QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		If ($_l_QueryID<0)
			//this is a reference to a search....
			//when the users are building a search they may select a search from the pop up that they want the system to use
			//the system creates a Set manager owner set which refers to the real search
			$_l_offset:=0
			SM_l_ReturnQueryID:=0
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			$_l_QueryID:=SM_l_ReturnQueryID
			SM_l_ReturnQueryID:=0
			$_bo_AndLoaded:=True:C214
		End if 
		If ([x_QUERY_PARAMETERS:134]X_ID:1#$_l_QueryID)
			QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$_l_QueryID)
		End if 
		If ([x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_TableNumber)
			
			$_l_offset:=SM_LoadSearchParameters($_l_QueryID; True:C214)
			$_l_And:=SRCH_l_And
			$_l_OR:=SRCH_l_or
			$_l_Not:=SRCH_l_Not
			
			If ($_l_Mode=2)  // edit
				SM_l_QUeryMode:=2
				SM_l_QuerySearchID:=$_l_QueryID
				SM_l_ReturnQueryID:=0
				$_bo_OpenWindow:=False:C215
				If (Not:C34(SM_bo_SessionWindow))
					SM_bo_SessionWindow:=True:C214
					$_bo_SessionWindowOwner:=True:C214
					
					$_bo_OpenWindow:=True:C214
					$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
					WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1988)
				Else 
					GET WINDOW RECT:C443($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					$_t_WindowTitleOLD:=Get window title:C450
					If ($_bo_SessionWindowOwner)
						$_bo_OpenWindow:=True:C214
					End if 
					If (($_l_WindowRightOLD-$_l_WindowLeftOLD)<456) | (($_l_WindowBottomOLD-$_l_WindowTopOLD)<380)
						QV_bo_KeepWindowsize:=False:C215  //if the window is too small ignore if this is true
					End if 
					SET WINDOW TITLE:C213("Find Qualitative Information")
				End if 
				
				DIALOG:C40([USER:15]; "dQualitiesSearch")
				
				If (Not:C34($_bo_OpenWindow))
					SET WINDOW RECT:C444($_l_WindowLeftOLD; $_l_WindowTopOLD; $_l_WindowRightOLD; $_l_WindowBottomOLD)
					SET WINDOW TITLE:C213($_t_WindowTitleOLD)
				End if 
				If (SM_l_QueryMode=2) & (OK=1)
					SRCH_l_And:=$_l_And
					SRCH_l_or:=$_l_OR
					SRCH_l_Not:=$_l_Not
					SET BLOB SIZE:C606(SM_blb_SearchBlob; 0)
					If (SM_l_ReturnQueryID=0)  // not a linked query
						SM_SearchVarsToBlob(->SM_blb_SearchBlob; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_al_GroupIDs; ->QV_al_QualityIDs; ->QV_al_QualityLevelLevels; ->QV_al_QualityQualityYears; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_LevelOptions; ->QV_at_YearOptions; ->QV_at_QueryType)
						SM_l_SearchNumber:=SM_SaveSearchParameters(SM_l_QuerySearchID; ""; $_l_TableNumber; -1; ->SM_blb_SearchBlob)
					Else 
						READ WRITE:C146([x_QUERY_PARAMETERS:134])
						QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=SM_l_QuerySearchID)
						[x_QUERY_PARAMETERS:134]X_OwnerID:2:=-1
						[x_QUERY_PARAMETERS:134]X_ContextID:3:=$_l_TableNumber
						SET BLOB SIZE:C606([x_QUERY_PARAMETERS:134]X_SearchValues:5; 0)
						SM_SearchVarsToBlob(->[x_QUERY_PARAMETERS:134]X_SearchValues:5; ->SM_l_ReturnQueryID)
						DB_SaveRecord(->[x_QUERY_PARAMETERS:134])
						SM_l_SearchNumber:=[x_QUERY_PARAMETERS:134]X_ID:1
						UNLOAD RECORD:C212([x_QUERY_PARAMETERS:134])
						READ ONLY:C145([x_QUERY_PARAMETERS:134])
					End if 
					
					
				End if 
				SM_l_QuerySearchID:=0
				//here save the updated SRCH_l_And/or/not paramteres
				SM_l_QueryMode:=0
				
			Else 
				//run
				
				//note if this was done via a Set manager the SRCH_l_And etc will be in the variables so they are loaded too
				$_l_QueryID:=0
				QV_DoSearch(QV_l_CurrentTable)
				QV_bo_SearchDone:=True:C214
			End if 
		Else 
			//search a different table--don't think this can happen here
			//Here put the remaining paramters into an array
			$_l_NextElement:=0
			For ($_l_Index; $_l_CurrentRow; Size of array:C274($4->))
				QUERY:C277([x_QUERY_PARAMETERS:134]; [x_QUERY_PARAMETERS:134]X_ID:1=$4->{$_l_Index})
				If ([x_QUERY_PARAMETERS:134]X_ContextID:3=$_l_TableNumber)
					$_l_NextElement:=$_l_Index
					$_l_Index:=9999999
				End if 
			End for 
			ARRAY LONGINT:C221($_al_QueryIDs; 0)
			//The Array after executing other tables
			ARRAY LONGINT:C221($_al_QueryIDs; (Size of array:C274($4->)-$_l_NextElement)+1)
			$_l_QueryRow:=1
			For ($_l_Index; $_l_NextElement; Size of array:C274($4->))
				$_al_QueryIDs{$_l_QueryRow}:=$4->{$_l_Index}
				$_l_QueryRow:=$_l_QueryRow+1
			End for 
			//Now chop off $3
			ARRAY LONGINT:C221($4->; $_l_NextElement-1)
			SM_al_NextElement:=0
			SM_CrossFileSearch($_l_Mode; $_l_TableNumber; $4; ->SM_al_NextElement)
			COPY ARRAY:C226($_al_QueryIDs; $4->)
			$_l_ElementCount:=Size of array:C274($4->)
			$_l_CurrentRow:=0
			$_bo_NoSearch:=True:C214
			
			
		End if 
		
		//and pass back into $2» any additional parameters
	End if 
	
	
	
	
End if 
If ($_bo_OpenWindow)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	SM_bo_SessionWindow:=False:C215
End if 
ERR_MethodTrackerReturn("QV_AdvancedSearch"; $_t_oldMethodName)
