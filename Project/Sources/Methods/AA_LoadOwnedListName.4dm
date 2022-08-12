//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LoadOwnedListName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 11:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305(AA_bo_ListsInited)
	C_LONGINT:C283($_l_ListID; $_l_LoadedListRow; $_l_Retries; $0; $1; $2)
	C_TEXT:C284($_t_ListName; $_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadOwnedListName")


If (Not:C34(AA_bo_ListsInited))
	$_l_Retries:=0
	While (Semaphore:C143("$LoadingListofLists"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	AA_GetOwnedTopLevelListNames($1; ->AA_al_ListIDS; ->AA_at_ListNames)
	AA_bo_ListsInited:=True:C214
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
End if 

READ ONLY:C145([X_LISTS:111])
$0:=0
If (Count parameters:C259>=2)
	$_l_ListID:=$2
	$_t_ListName:=$3
	Case of 
		: ($_l_ListID>0)
			$_l_LoadedListRow:=Find in array:C230(AA_al_ListIDS; $_l_ListID)
		: ($_t_ListName#"")
			$_l_LoadedListRow:=Find in array:C230(AA_at_ListNames; $_t_ListName)
	End case 
	If ($_l_LoadedListRow<0)
		//another proc or method could be loading it
		
		$_l_Retries:=0
		While (Semaphore:C143("$LoadingListofLists"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		ARRAY TEXT:C222(AA_at_ListNames; 0)
		ARRAY LONGINT:C221(AA_al_ListIDS; 0)
		AA_GetOwnedTopLevelListNames($1; ->AA_al_ListIDS; ->AA_at_ListNames)
		//On THIS FORM we do need all the list IDs
		AA_bo_ListsInited:=True:C214
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		//``
		$_l_Retries:=0
		While (Semaphore:C143("$LoadingListofLists"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*(1+$_l_Retries))
		End while 
		Case of 
			: ($_l_ListID>0)
				$_l_LoadedListRow:=Find in array:C230(AA_al_ListIDS; $_l_ListID)
			: ($_t_ListName#"")
				$_l_LoadedListRow:=Find in array:C230(AA_at_ListNames; $_t_ListName)
		End case 
		If ($_l_LoadedListRow<0)
			If ($_l_ListID>0)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID; *)
				QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$1)
			Else 
				If ($_t_ListName#"")
					QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName; *)
					QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$1)
				Else 
					REDUCE SELECTION:C351([X_LISTS:111]; 0)
				End if 
			End if 
			
			If (Records in selection:C76([X_LISTS:111])=0)
				$_l_Retries:=0
				While (Semaphore:C143("LoadingListofLists"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				READ WRITE:C146([X_LISTS:111])
				CREATE RECORD:C68([X_LISTS:111])
				[X_LISTS:111]x_ID:1:=$_l_ListID
				[X_LISTS:111]x_ListDataOwnerID:7:=$1
				If ($_t_ListName="")
					[X_LISTS:111]x_ListName:2:="Unknown"+String:C10($_l_ListID)
				Else 
					[X_LISTS:111]x_ListName:2:=$_t_ListName
				End if 
				DB_SaveRecord(->[X_LISTS:111])
				AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
				$_l_ListID:=[X_LISTS:111]x_ID:1
				UNLOAD RECORD:C212([X_LISTS:111])
				READ ONLY:C145([X_LISTS:111])
				$0:=$_l_ListID
				CLEAR SEMAPHORE:C144("LoadingListofLists")
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID; *)
				QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$1)
				$_l_Retries:=0
				While (Semaphore:C143("$LoadingListofLists"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				ARRAY TEXT:C222(AA_at_ListNames; 0)
				ARRAY LONGINT:C221(AA_al_ListIDS; 0)
				//ARRAY STRING(55;AA_at_aallListNames;0)
				//ARRAY LONGINT(AA_al_aallListIDS;0)
				AA_GetOwnedTopLevelListNames($1; ->AA_al_ListIDS; ->AA_at_ListNames)
				//On THIS FORM we do need all the list IDs
				//ALL RECORDS([x_Lists])
				//SELECTION TO ARRAY([x_Lists]x_ID;AA_al_aallListIDs;[x_Lists]x_ListName;AA_at_aallListNames)
				
				AA_bo_ListsInited:=True:C214
				CLEAR SEMAPHORE:C144("$LoadingListofLists")
			End if 
			
		Else 
			$0:=AA_al_ListIDS{$_l_LoadedListRow}
			CLEAR SEMAPHORE:C144("$LoadingListofLists")
			
		End if 
		
	Else 
		$0:=AA_al_ListIDS{$_l_LoadedListRow}
	End if 
	
End if 
UNLOAD RECORD:C212([X_LISTS:111])
UNLOAD RECORD:C212([LIST_ITEMS:95])
ERR_MethodTrackerReturn("AA_LoadOwnedListName"; $_t_oldMethodName)