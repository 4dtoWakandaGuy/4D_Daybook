//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ListAddItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 20:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305(AA_bo_ListsInited; WS_bo_ListItemComplete)
	C_LONGINT:C283($_l_FieldNumber; $_l_Index; $_l_ListID; $_l_ListPosition; $_l_Process; $_l_TableNumber; $_l_Tries; $0; WS_l_ListItemaddedID)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_ListName; $_t_oldMethodName; $2; $3; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_ListAddItem")
//This simple method will display a form with the current entries
//in a list and let the user add new one

$_l_Tries:=0
While (Semaphore:C143("AddingToList"))
	$_l_Tries:=$_l_Tries+1
	DelayTicks(2*(1+$_l_Tries))
End while 
If (Count parameters:C259>=1)
	
	$_l_TableNumber:=Table:C252($1)
	$_l_FieldNumber:=Field:C253($1)
	$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FieldNumber)
	
	$0:=0
	
	If ($_l_ListID>0)
		
		If (Not:C34(AA_bo_ListsInited))
			$_l_Tries:=0
			While (Semaphore:C143("$LoadingListofLists"))
				$_l_Tries:=$_l_Tries+1
				DelayTicks(2*(1+$_l_Tries))
			End while 
			ARRAY TEXT:C222(AA_at_ListNames; 0)
			ARRAY LONGINT:C221(AA_al_ListIDS; 0)
			AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
			AA_bo_ListsInited:=True:C214
			CLEAR SEMAPHORE:C144("$LoadingListofLists")
		End if 
		
		
		
		While (Semaphore:C143("$LoadingListofLists"))
			DelayTicks
			
		End while 
		//NG here have to check that this will works for sublists..currently this only loads the
		$_l_ListPosition:=Find in array:C230(AA_al_ListIDS; $_l_ListID)
		If ($_l_ListPosition>0)
			$_t_ListName:=AA_at_ListNames{$_l_ListPosition}
		Else 
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
			$_t_ListName:=[X_LISTS:111]x_ListName:2
		End if 
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		If ([X_LISTS:111]x_ListName:2#$_t_ListName)
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName)
		End if 
		If (Count parameters:C259>=2)
			//the items to add are passed as parameters
			$_l_Tries:=0
			While (Semaphore:C143("LoadingListofLists"))
				$_l_Tries:=$_l_Tries+1
				DelayTicks(2*(1+$_l_Tries))
			End while 
			For ($_l_Index; 2; Count parameters:C259)
				CREATE RECORD:C68([LIST_ITEMS:95])
				[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
				[LIST_ITEMS:95]List_Entry:2:=${$_l_Index}
				DB_SaveRecord(->[LIST_ITEMS:95])
				AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				$0:=[LIST_ITEMS:95]X_ID:3
			End for 
			UNLOAD RECORD:C212([LIST_ITEMS:95])
			READ ONLY:C145([LIST_ITEMS:95])
			CLEAR SEMAPHORE:C144("LoadingListofLists")
			
		Else 
			HIDE PROCESS:C324(Current process:C322)
			WS_l_ListItemaddedID:=0
			WS_bo_ListItemComplete:=False:C215
			$_l_Process:=New process:C317("AA_ListAddIteminProcess"; 128000; "AddListItem"; $_t_ListName; Current process:C322)
			$_l_Tries:=0
			Repeat 
				$_l_Tries:=$_l_Tries+1
				DelayTicks(60*(1+$_l_Tries))
			Until (WS_bo_ListItemComplete)
			SHOW PROCESS:C325(Current process:C322)
			BRING TO FRONT:C326(Current process:C322)
			$0:=WS_l_ListItemaddedID
			
		End if 
		
	End if 
End if 

CLEAR SEMAPHORE:C144("AddingToList")
ERR_MethodTrackerReturn("AA_ListAddItem"; $_t_oldMethodName)
