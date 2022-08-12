//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_ListAddOWNEDitembyID
	//------------------ Method Notes ------------------
	//Based on AA_ListadditembyID
	//although list items dont get an owner id(the list is owned so by inference the items are owned)
	//if we are dealing with owned lists then this method must KNOW the list is owned so if it loads list items etc it will load the correct seleciton
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 10:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305(AA_bo_ListsInited; AA_bo_ListInitiation; WS_bo_ListItemComplete)
	C_LONGINT:C283($_l_DataOwnerID; $_l_Index; $_l_ListAddProcess; $_l_ListID; $_l_ListPosition; $_l_Retries; $0; $1; $2; WS_l_ListItemaddedID)
	C_TEXT:C284($_t_ListName; $_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_ListAddOWNEDitembyID")
//This simple method will display a form with the current entries
//in a list and let the user add new one

//C_TEXT($1;$_t_ListName)
$_l_Retries:=0
While (Semaphore:C143("AddingToList"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 



$0:=0
If (Count parameters:C259>=1)
	$_l_DataOwnerID:=$1
	$_l_ListID:=$2
	If ($_l_ListID>0)
		If (Not:C34(AA_bo_ListsInited))
			$_l_Retries:=0
			While (Semaphore:C143("$LoadingListofLists"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End while 
			ARRAY TEXT:C222(AA_at_ListNames; 0)
			ARRAY LONGINT:C221(AA_al_ListIDS; 0)
			AA_GetOwnedTopLevelListNames($_l_DataOwnerID; ->AA_al_ListIDS; ->AA_at_ListNames)
			AA_bo_ListsInited:=True:C214
			CLEAR SEMAPHORE:C144("$LoadingListofLists")
		End if 
		
		$_l_Retries:=0
		While (Semaphore:C143("$LoadingListofLists"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(60*(1+$_l_Retries))
		End while 
		$_l_ListPosition:=Find in array:C230(AA_al_ListIDS; $_l_ListID)
		If ($_l_ListPosition<0)
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
			If (Records in selection:C76([X_LISTS:111])>0)
				$_t_ListName:=[X_LISTS:111]x_ListName:2
			Else 
				$_t_ListName:=""
			End if 
		Else 
			$_t_ListName:=AA_at_ListNames{$_l_ListPosition}
		End if 
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		
		If ($_t_ListName#"")
			$_l_Retries:=0
			While (Semaphore:C143("$LoadingListofLists"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(60*(1+$_l_Retries))
			End while 
			$_l_ListPosition:=Find in array:C230(AA_at_ListNames; $_t_ListName)
			CLEAR SEMAPHORE:C144("$LoadingListofLists")
			If ([X_LISTS:111]x_ID:1#$_l_ListID)
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
			End if 
			If (Count parameters:C259>=3)
				//the items to add are passed as parameters
				$_l_Retries:=0
				While (Semaphore:C143("LoadingListofLists"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(60*(1+$_l_Retries))
				End while 
				If (Not:C34(In transaction:C397))
					READ WRITE:C146([LIST_ITEMS:95])
					For ($_l_Index; 3; Count parameters:C259)
						CREATE RECORD:C68([LIST_ITEMS:95])
						[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
						[LIST_ITEMS:95]List_Entry:2:=${$_l_Index}
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						If (Count parameters:C259>2)
							$0:=99999
						Else 
							$0:=[LIST_ITEMS:95]X_ID:3
						End if 
						
					End for 
				Else 
					//We are in a transaction these records must be created outside the transaction
					For ($_l_Index; 3; Count parameters:C259)
						$_l_ListAddProcess:=New process:C317("AA_ListCreateIteminprocess"; 128000; "Create List item"; $_l_ListID; ${$_l_Index})
					End for 
					
				End if 
				UNLOAD RECORD:C212([LIST_ITEMS:95])
				READ ONLY:C145([LIST_ITEMS:95])
				CLEAR SEMAPHORE:C144("LoadingListofLists")
				
			Else 
				HIDE PROCESS:C324(Current process:C322)
				WS_l_ListItemaddedID:=0
				WS_bo_ListItemComplete:=False:C215
				$_l_ListAddProcess:=New process:C317("AA_ListAddIteminProcess"; 128000; "AddListItem"; $_t_ListName; Current process:C322; $_l_DataOwnerID)
				$_l_Retries:=0
				Repeat 
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				Until (WS_bo_ListItemComplete)
				SHOW PROCESS:C325(Current process:C322)
				BRING TO FRONT:C326(Current process:C322)
				$0:=WS_l_ListItemaddedID
				
			End if 
		Else 
			$0:=0
			
			
		End if 
		
	End if 
End if 
UNLOAD RECORD:C212([X_LISTS:111])
UNLOAD RECORD:C212([LIST_ITEMS:95])

CLEAR SEMAPHORE:C144("AddingToList")








ERR_MethodTrackerReturn("AA_ListAddOWNEDitembyID"; $_t_oldMethodName)
ERR_MethodTrackerReturn("AA_ListAddOWNEDitembyID"; $_t_oldMethodName)