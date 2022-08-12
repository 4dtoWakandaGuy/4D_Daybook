//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_GetOwnedTopLevelListNames
	//------------------ Method Notes ------------------
	//This method is based on AA_GetTopLevelListNames. Thas a new parameter at the start with the Data owner ID
	//this is to enable the holding of multiple data owners within the same data file
	//this is a transitional method
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 11:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ListIDS; 0)
	ARRAY LONGINT:C221($_al_PropertyNumber; 0)
	ARRAY TEXT:C222($_at_AListNames; 0)
	ARRAY TEXT:C222($_at_ListProperties; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	C_BOOLEAN:C305($_bo_ListAllowed; $_bo_OK)
	C_LONGINT:C283($_l_Access; $_l_Access2; $_l_DataOwnerID; $_l_Delay; $_l_Index; $_l_Offset; $_l_Reference; $_l_Repeats; $_l_Retries; $1)
	C_POINTER:C301($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_GetOwnedTopLevelListNames")

$_l_DataOwnerID:=$1



QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=0; *)
QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$_l_DataOwnerID)

If (Records in selection:C76([X_LISTS:111])>0)  //We have some faulty lists
	$_l_Retries:=0
	While (Semaphore:C143("LoadingListofLists"))  //about to write-stop everyone
		$_l_Retries:=$_l_Retries+1
		DelayTicks(60*(1+$_l_Retries))
	End while 
	READ WRITE:C146([X_LISTS:111])
	If (In transaction:C397)
		//an apply to selection causes probs if we are in a trnsaction
		For ($_l_Index; 1; Records in selection:C76([X_LISTS:111]))
			LOAD RECORD:C52([X_LISTS:111])
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[X_LISTS:111]; 1)
				If (Not:C34($_bo_OK))
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(10*$_l_Delay)
					
				End if 
				
			Until ($_bo_OK)
			If ([X_LISTS:111]x_ID:1=0)
				[X_LISTS:111]x_ID:1:=AA_GetNextIDinMethod(->[X_LISTS:111]x_ID:1)
			End if 
			DB_SaveRecord(->[X_LISTS:111])
			AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
			NEXT RECORD:C51([X_LISTS:111])
		End for 
	Else 
		DB_lockFile(->[X_LISTS:111])
		APPLY TO SELECTION:C70([X_LISTS:111]; [X_LISTS:111]x_ID:1:=0)
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[X_LISTS:111]))
		
	End if 
	UNLOAD RECORD:C212([X_LISTS:111])
	READ ONLY:C145([X_LISTS:111])
	READ WRITE:C146([LIST_ITEMS:95])
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=0)
	QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_Data_Owner_ID:10=$1)
	If (In transaction:C397)
		//an apply to selection causes probs if we are in a trnsaction
		For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
			LOAD RECORD:C52([LIST_ITEMS:95])
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[LIST_ITEMS:95]; 1)
				If (Not:C34($_bo_OK))
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(10*$_l_Delay)
					
				End if 
			Until ($_bo_OK)
			If ([LIST_ITEMS:95]X_ID:3=0)
				[LIST_ITEMS:95]X_ID:3:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
			End if 
			DB_SaveRecord(->[LIST_ITEMS:95])
			AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
			NEXT RECORD:C51([LIST_ITEMS:95])
		End for 
	Else 
		DB_lockFile(->[LIST_ITEMS:95])
		APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3:=0)
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[LIST_ITEMS:95]))
	End if 
	UNLOAD RECORD:C212([LIST_ITEMS:95])
	READ ONLY:C145([LIST_ITEMS:95])
	CLEAR SEMAPHORE:C144("LoadingListofLists")  //release everyone
	
End if 
QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2#""; *)
QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$1)
ARRAY TEXT:C222($_at_AListNames; 0)
ARRAY LONGINT:C221($_al_ListIDS; 0)
SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; $_al_ListIDS; [X_LISTS:111]x_ListName:2; $_at_AListNames)
ARRAY TEXT:C222($_at_ListProperties; Size of array:C274($_al_ListIDS))
FIRST RECORD:C50([X_LISTS:111])
SORT ARRAY:C229($_al_ListIDS; $_at_AListNames)
For ($_l_Index; 1; Size of array:C274($_al_ListIDS))
	If ($_l_Index<=Size of array:C274($_al_ListIDS))
		If ($_al_ListIDS{$_l_Index}=$_al_ListIDS{$_l_Index-1})
			//we have 2 lists with the same id
			If ($_al_ListIDS{$_l_Index}=1)
				READ WRITE:C146([X_LISTS:111])
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_al_ListIDS{$_l_Index}; *)
				QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$1)
				DELETE RECORD:C58([X_LISTS:111])
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2#"")
				QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$1)
				ARRAY TEXT:C222($_at_AListNames; 0)
				ARRAY LONGINT:C221($_al_ListIDS; 0)
				SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; $_al_ListIDS; [X_LISTS:111]x_ListName:2; $_at_AListNames)
				ARRAY TEXT:C222($_at_ListProperties; Size of array:C274($_al_ListIDS))
				FIRST RECORD:C50([X_LISTS:111])
				$_l_Index:=1
			End if 
		End if 
	End if 
End for 
For ($_l_Index; 1; Size of array:C274($_al_ListIDS))
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY LONGINT:C221($_al_PropertyNumber; 0)
	ARRAY TEXT:C222($_at_PropertyValue; 0)
	$_l_Offset:=0
	BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyNames; $_l_Offset)
	BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_al_PropertyNumber; $_l_Offset)
	BLOB TO VARIABLE:C533([X_LISTS:111]x_ListValues:6; $_at_PropertyValue; $_l_Offset)
	$_l_Reference:=Find in array:C230($_at_PropertyNames; "ACCESS")
	If ($_l_Reference>0)
		$_l_Access:=$_al_PropertyNumber{$_l_Reference}
	Else 
		$_l_Access:=0
	End if 
	$_bo_ListAllowed:=False:C215
	//Any list being loaded with an owner ID of -1 are system related-its not the cureent user that matters
	Case of 
		: (User in group:C338(Current user:C182; "Designer")) | (Current user:C182="Designer") | ($1=-1)
			
			$_l_Access2:=4
		: (User in group:C338(Current user:C182; "Administrator")) | (Current user:C182="Administrator")
			$_l_Access2:=2
		Else 
			$_l_Access2:=1
	End case 
	
	Repeat 
		If (Not:C34($_l_Access ?? 5))
			$_bo_ListAllowed:=($_l_Access ?? $_l_Access2)
			If (Not:C34($_bo_ListAllowed))
				$_l_Access2:=$_l_Access2-1
			End if 
			
			
		Else 
			$_l_Access2:=-1
		End if 
	Until ($_l_Access2<=0) | ($_bo_ListAllowed)
	If (Count parameters:C259>=2)
		Case of 
			: ($_bo_ListAllowed)
				APPEND TO ARRAY:C911($2->; $_al_ListIDS{$_l_Index})
				APPEND TO ARRAY:C911($3->; $_at_AListNames{$_l_Index})
			: ($_l_Access=0)
				APPEND TO ARRAY:C911($2->; $_al_ListIDS{$_l_Index})
				APPEND TO ARRAY:C911($3->; $_at_AListNames{$_l_Index})
				
		End case 
	End if 
End for 
UNLOAD RECORD:C212([X_LISTS:111])
UNLOAD RECORD:C212([LIST_ITEMS:95])
ERR_MethodTrackerReturn("AA_GetOwnedTopLevelListNames"; $_t_oldMethodName)