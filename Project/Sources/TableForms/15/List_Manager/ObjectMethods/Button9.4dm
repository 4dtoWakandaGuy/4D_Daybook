If (False:C215)
	//object Method Name: Object Name:      [USER].List_Manager.Button9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(AA_HL_ListItems)
	//C_UNKNOWN(CB_LP4)
	//ARRAY LONGINT(AA_al_aallListIDS;0)
	//ARRAY LONGINT(AA_al_aPropertyNum;0)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_ListItemIDs;0)
	//ARRAY LONGINT(AA_al_ListItemsDelete;0)
	//ARRAY LONGINT(AA_al_SubListCRHLID;0)
	//ARRAY LONGINT(AA_al_SublistCRID;0)
	//ARRAY LONGINT(WS_al_AssociateFields;0)
	//ARRAY LONGINT(WS_al_AssociateTables;0)
	//ARRAY TEXT(AA_at_aallListNames;0)
	//ARRAY TEXT(AA_at_APropertyNames;0)
	//ARRAY TEXT(AA_at_aPropertyValue;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	//ARRAY TEXT(WS_at_AssociateFIeldNames;0)
	C_BOOLEAN:C305(AA_bo_ListsInited; AA_Bo_ListtoUpdate; AA_bo_SimulateClick; SM_bo_SimulateClick; $_bo_ListAllowed; AA_bo_ListsInited; AA_bo_SimulateClick; SM_bo_SimulateClick)
	C_LONGINT:C283($_l_access2; $_l_accessPosition; $_l_Index; $_l_OK; $_l_Retries; AA_HL_ListItems; AA_l_CurrentItemID; AA_l_CurrentListiD; AA_l_CurrentSelectedItemID; AA_l_CurrentSelectedProperty; CB_LP4)
	C_LONGINT:C283(WS_l_HLALISTNAMES; $_l_access; $_l_access2; $_l_accessPosition; $_l_Index; $_l_OK; $_l_Retries; AA_l_CurrentItemID; AA_l_CurrentListiD; AA_l_CurrentSelectedProperty; BModProperties)
	C_LONGINT:C283(WS_l_CurrenListID; WS_l_HLALISTNAMES)
	C_TEXT:C284(AA_t_AddorModLabel; AA_t_listName; AA_t_NewListItem; $_t_oldMethodName; AA_t_AddorModLabel; AA_t_listName; AA_t_NewListItem)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].List_Manager.Button9"; Form event code:C388)
If (AA_l_CurrentListiD#0)
	Gen_Alert("BE VERY SURE WHEN DOING THIS THAT THE LIST IS NOT USED!!!")
	
	Gen_Confirm("Are you sure wish to delete list "+AA_t_listName+"?"; "No"; "Yes")
	$_l_OK:=OK
	If ($_l_OK=0)
		OK:=1
		READ WRITE:C146([X_LISTS:111])
		
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=AA_l_CurrentListiD)
		DELETE RECORD:C58([X_LISTS:111])
		WS_l_CurrenListID:=0
		$_l_Retries:=0
		While (Semaphore:C143("$LoadingListofLists"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		ARRAY TEXT:C222(AA_at_ListNames; 0)
		ARRAY LONGINT:C221(AA_al_ListIDS; 0)
		ARRAY TEXT:C222(AA_at_aallListNames; 0)
		ARRAY LONGINT:C221(AA_al_aallListIDS; 0)
		AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
		//On THIS FORM we do need all the list IDs
		ALL RECORDS:C47([X_LISTS:111])
		SELECTION TO ARRAY:C260([X_LISTS:111]x_ID:1; AA_al_aallListIDs; [X_LISTS:111]x_ListName:2; AA_at_aallListNames)
		
		AA_bo_ListsInited:=True:C214
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		AA_bo_SimulateClick:=False:C215
		AA_CheckHeirarchical
		OBJECT SET VISIBLE:C603(BModProperties; False:C215)
		AA_l_CurrentSelectedProperty:=0
		WS_l_HLALISTNAMES:=New list:C375
		AA_HL_ListItems:=New list:C375
		ARRAY LONGINT:C221(WS_al_AssociateTables; 0)
		ARRAY LONGINT:C221(WS_al_AssociateFields; 0)
		ARRAY TEXT:C222(WS_at_AssociateFIeldNames; 0)
		ARRAY LONGINT:C221(WS_al_AssociateTables; 1)
		ARRAY LONGINT:C221(WS_al_AssociateFields; 1)
		ARRAY TEXT:C222(WS_at_AssociateFIeldNames; 1)
		WS_al_AssociateTables{1}:=Table:C252(->[COMPANIES:2])
		WS_al_AssociateFields{1}:=Field:C253(->[COMPANIES:2]Record_State:62)
		WS_at_AssociateFIeldNames{1}:=Table name:C256(Table:C252(WS_al_AssociateTables{1}))+":"+Field name:C257(Field:C253(WS_al_AssociateTables{1}; WS_al_AssociateFields{1}))
		SM_bo_SimulateClick:=False:C215
		
		Case of 
			: (User in group:C338(Current user:C182; "Designer")) | (Current user:C182="Designer")  //| (False)
				$_l_access2:=4
				OBJECT SET VISIBLE:C603(CB_LP4; True:C214)
				FORM GOTO PAGE:C247(2)
			: (User in group:C338(Current user:C182; "administrator")) | (Current user:C182="Administrator")  // | (True)
				$_l_access2:=2
				//GOTO PAGE(2)
				OBJECT SET VISIBLE:C603(CB_LP4; False:C215)
			Else 
				$_l_access2:=1
				OBJECT SET VISIBLE:C603(CB_LP4; False:C215)
		End case 
		
		$_bo_ListAllowed:=False:C215
		
		
		For ($_l_Index; 1; Size of array:C274(AA_at_ListNames))
			//do not put in invisible ones
			$_bo_ListAllowed:=False:C215
			
			Case of 
				: (User in group:C338(Current user:C182; "Designer")) | (Current user:C182="Designer")
					$_l_access2:=4
				: (User in group:C338(Current user:C182; "administrator")) | (Current user:C182="Administrator")
					$_l_access2:=2
				Else 
					$_l_access2:=1
			End case 
			//Get this lists access rights
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=AA_al_ListIDS{$_l_Index})
			ARRAY TEXT:C222(AA_at_APropertyNames; 0)
			ARRAY LONGINT:C221(AA_al_aPropertyNum; 0)
			ARRAY TEXT:C222(AA_at_aPropertyValue; 0)
			AA_GetListProperties(->AA_at_APropertyNames; ->AA_al_aPropertyNum; ->AA_at_aPropertyValue)
			$_l_accessPosition:=Find in array:C230(AA_at_APropertyNames; "ACCESS")
			If ($_l_accessPosition>0)
				$_l_access:=AA_al_aPropertyNum{$_l_accessPosition}
			Else 
				$_l_access:=0
			End if 
			
			Repeat 
				If (Not:C34($_l_access ?? 5))
					$_bo_ListAllowed:=($_l_access ?? $_l_access2)
					If (Not:C34($_bo_ListAllowed))
						$_l_access2:=$_l_access2-1
					End if 
					
					
				Else 
					$_l_access2:=-1
				End if 
			Until ($_l_access2<=0) | ($_bo_ListAllowed)
			Case of 
				: ($_bo_ListAllowed)
					APPEND TO LIST:C376(WS_l_HLALISTNAMES; AA_at_ListNames{$_l_Index}; AA_al_ListIDS{$_l_Index})
				: ($_l_access=0)
					APPEND TO LIST:C376(WS_l_HLALISTNAMES; AA_at_ListNames{$_l_Index}; AA_al_ListIDS{$_l_Index})
			End case 
			
		End for 
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		
		
		ARRAY LONGINT:C221(AA_al_SublistCRID; 0)
		ARRAY LONGINT:C221(AA_al_SubListCRHLID; 0)
		ARRAY TEXT:C222(AA_at_ListItems; 0)
		ARRAY LONGINT:C221(AA_al_ListItemIDs; 0)
		ARRAY LONGINT:C221(AA_al_ListItemsDelete; 0)
		
		AA_t_NewListItem:=""
		AA_l_CurrentItemID:=0
		AA_l_CurrentListiD:=0
		AA_t_AddorModLabel:="Enter New Item"
		//unload any current list
		UNLOAD RECORD:C212([X_LISTS:111])
		AA_LoadListtoManager(0; "")
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].List_Manager.Button9"; $_t_oldMethodName)
