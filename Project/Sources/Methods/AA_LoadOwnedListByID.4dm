//%attributes = {}
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyNums; 0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_PropertyValues; 0)
	//ARRAY TEXT(AA_at_ListNames;0)
	C_BOOLEAN:C305(<>AA_bo_ListsDeclared; $5; AA_bo_ListsInited)
	C_LONGINT:C283($_l_Delays; $_l_FieldNumber; $_l_Index; $_l_Index2; $_l_InsertIndex; $_l_ListID; $_l_ListIDOLD; $_l_Retries; $_l_TableNumber; $1; $2)
	C_OBJECT:C1216($_Obj_ListItem; $_Obj_ListItems)
	C_POINTER:C301($_ptr_2DPropertyNames; $_ptr_2DPropertyNums; $_ptr_2DPropertyValues; $_ptr_ListIDS; $_ptr_ListItemIDs; $_ptr_ListItemsArray; $_ptr_PropertyArray; $_ptr_PropertyNames; $_ptr_PropertyNUMS; $_ptr_PropertyValues; $3)
	C_POINTER:C301($4; $6; $7; $8; $9)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_ListName; $_t_oldMethodName; $_t_VariableName; DB_t_Methodname)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LoadOwnedListByID")

//this method will load a list by its list number
//this is needed for sublists


$_l_Delays:=0

If (Not:C34(AA_bo_ListsInited))
	$_l_Retries:=0
	While (Semaphore:C143("$LoadingListofLists"))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
		$_l_Delays:=$_l_Delays+1
		If ($_l_Delays>10)
			DelayTicks(60)
		End if 
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

//AA_LoadListByID
//This method loads a list-by ID
DB_t_Methodname:=Current method name:C684
READ ONLY:C145([X_LISTS:111])
If (Count parameters:C259>=4)
	If ($2=0)
		Gen_Alert("Error in AA_LoadlistbyID")
	Else 
		$_l_ListID:=$2
		$_ptr_ListItemsArray:=$3
		$_ptr_ListItemIDs:=$4
		//TRACE
		
		
		If (GenValidatePointer($3)) & (GenValidatePointer($4))
			ARRAY TEXT:C222($_ptr_ListItemsArray->; 0)
			ARRAY LONGINT:C221($_ptr_ListItemIDs->; 0)
			$_l_ListIDOLD:=$_l_ListID
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ListID; *)
			QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_Item_Status:7>=0)
			If (Records in selection:C76([LIST_ITEMS:95])>0)
				SELECTION TO ARRAY:C260([LIST_ITEMS:95]X_ID:3; $_ptr_ListItemIDs->; [LIST_ITEMS:95]List_Entry:2; $_ptr_ListItemsArray->)
				//filters in here etc for other stuff later
				//List may just have had ID added or been created
			Else 
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID; *)
				QUERY:C277([X_LISTS:111];  & ; [X_LISTS:111]x_ListDataOwnerID:7=$1)
				$_t_ListName:=[X_LISTS:111]x_ListName:2
				READ WRITE:C146([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$_t_ListName)
				CREATE SET:C116([LIST_ITEMS:95]; "$Related")
				QUERY SELECTION:C341([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=0)
				If (Records in selection:C76([LIST_ITEMS:95])>0)
					$_l_Retries:=0
					While (Semaphore:C143("LoadingListofLists"))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*(1+$_l_Retries))
						
					End while 
					If (In transaction:C397)
						//an apply to selection causes probs if we are in a trnsaction
						For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
							If ([LIST_ITEMS:95]X_ID:3=0)
								[LIST_ITEMS:95]X_ID:3:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
							End if 
							[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
							AA_CheckUUID(Table:C252(->[LIST_ITEMS:95]))
							<>SYS_t_LastSavedTableName:="LIST_ITEMS"
							SAVE RECORD:C53([LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
							NEXT RECORD:C51([LIST_ITEMS:95])
						End for 
					Else 
						DB_lockFile(->[LIST_ITEMS:95])
						APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4:=$_l_ListID)
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
					End if 
					CLEAR SEMAPHORE:C144("LoadingListofLists")
				Else 
					//not a new list
					USE SET:C118("$Related")
					QUERY SELECTION:C341([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=0)
					If (Records in selection:C76([LIST_ITEMS:95])>0)
						$_l_Retries:=0
						While (Semaphore:C143("LoadingListofLists"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*(1+$_l_Retries))
						End while 
						If (In transaction:C397)
							//an apply to selection causes probs if we are in a trnsaction
							For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
								If ([LIST_ITEMS:95]X_ID:3=0)
									[LIST_ITEMS:95]X_ID:3:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
								End if 
								AA_CheckUUID(Table:C252(->[LIST_ITEMS:95]))
								<>SYS_t_LastSavedTableName:="LIST_ITEMS"
								SAVE RECORD:C53([LIST_ITEMS:95])
								AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
								NEXT RECORD:C51([LIST_ITEMS:95])
							End for 
						Else 
							APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3:=0)
						End if 
						CLEAR SEMAPHORE:C144("LoadingListofLists")
						
					End if 
					
				End if 
				UNLOAD RECORD:C212([LIST_ITEMS:95])
				READ ONLY:C145([LIST_ITEMS:95])
				
			End if 
			If (Count parameters:C259>=5)
				If ($5=True:C214)
					//add to array for user entry
					AA_Loadlistinsertnew($_ptr_ListItemIDs; $_ptr_ListItemsArray)
					//  INSERT ELEMENT($_ptr_ListItemIDs->;99999999;2)
					//  INSERT ELEMENT($_ptr_ListItemsArray->;99999999;2)
					// $_ptr_ListItemsArray->{(Size of array($_ptr_ListItemsArray->))-1}:="-"
					//  $_ptr_ListItemsArray->{Size of array($_ptr_ListItemsArray->)}:="New Entry"
				End if 
			End if 
			If (Count parameters:C259>=6)
				//Load Properties
				If (Count parameters:C259>=9)
					$_ptr_PropertyArray:=$6
					ARRAY TEXT:C222($_ptr_PropertyArray->; Size of array:C274($_ptr_ListItemsArray->))
					//The following are pointers to 2D arrays
					$_ptr_2DPropertyNames:=$7
					RESOLVE POINTER:C394($7; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
					$_ptr_2DPropertyNums:=$8
					$_ptr_2DPropertyValues:=$9
					ARRAY TEXT:C222($_ptr_2DPropertyValues->; Size of array:C274($_ptr_ListItemsArray->); 0)
					ARRAY TEXT:C222($_ptr_2DPropertyNames->; Size of array:C274($_ptr_ListItemsArray->); 0)
					ARRAY LONGINT:C221($_ptr_2DPropertyNums->; Size of array:C274($_ptr_ListItemsArray->); 0)
					//
					For ($_l_Index; 1; Size of array:C274($_ptr_ListIDS->))
						$_Obj_ListItems:=ds:C1482.LIST_ITEMS.query("X_ID =:1"; $_ptr_ListIDS->{$_l_Index})
						If ($_Obj_ListItems.length>0)
							$_Obj_ListItem:=$_Obj_ListItems[0]
							ARRAY TEXT:C222($_at_PropertyNames; 0)
							ARRAY LONGINT:C221($_al_PropertyNUMS; 0)
							ARRAY TEXT:C222($_at_PropertyValues; 0)
							AA_GetListItemProperties($_Obj_ListItem; ->$_at_PropertyNames; ->$_al_PropertyNUMS; ->$_at_PropertyValues)
							For ($_l_Index2; 1; Size of array:C274($_at_PropertyValues))
								APPEND TO ARRAY:C911($_ptr_PropertyNames->{$_l_Index}; $_at_PropertyNames{$_l_Index2})
								APPEND TO ARRAY:C911($_ptr_PropertyNUMS->{$_l_Index}; $_al_PropertyNUMS{$_l_Index2})
								APPEND TO ARRAY:C911($_ptr_PropertyValues->{$_l_Index}; $_at_PropertyValues{$_l_Index2})
							End for 
							
						End if 
					End for 
					
					
				Else   //Load old style properties
					$_ptr_PropertyArray:=$6
					ARRAY TEXT:C222($_ptr_PropertyArray->; Size of array:C274($_ptr_ListItemsArray->))
					
					For ($_l_Index; 1; Size of array:C274($_ptr_ListItemIDs->))
						$_Obj_ListItems:=ds:C1482.LIST_ITEMS.query("X_ID =:1"; $_ptr_ListIDS->{$_l_Index})
						If ($_Obj_ListItems.length>0)
							$_Obj_ListItem:=$_Obj_ListItems[0]
							
							$_ptr_PropertyArray->{$_l_Index}:=BLOB to text:C555($_Obj_ListItem.X_Item_Attributes; 3)
						End if 
						//NEXT RECORD([LIST_ITEMS])
					End for 
				End if 
			End if 
			
		Else 
			Gen_Alert("Serious problem in AA_LoadListbyID, when called from "+$_t_oldMethodName)
			
		End if 
	End if 
	
End if 

UNLOAD RECORD:C212([X_LISTS:111])
UNLOAD RECORD:C212([LIST_ITEMS:95])
ERR_MethodTrackerReturn("AA_LoadOwnedListByID"; $_t_oldMethodName)
