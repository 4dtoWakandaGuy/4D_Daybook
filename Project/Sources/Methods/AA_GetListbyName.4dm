//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_GetListbyName
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 02/12/2010 17:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	C_BOOLEAN:C305(<>SYS_bo_ListArraysinit; $_bo_CheckByName; $_bo_CheckProperties; $_bo_Create; $_bo_NoCreate; $_bo_Reload; $2; AA_bo_ListsInited)
	C_LONGINT:C283($_l_AttributesNum; $_l_ListID; $_l_ListIDPosition; $_l_Position; $_l_PropertiesListID; $_l_SubListNUM; $_l_Tries; $0)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_attributes; $_t_ListName; $_t_oldMethodName; $_t_Properties; $1; AA_t_CallingMethod; DB_t_ErrTrackingStack)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_GetListbyName")

$_bo_Reload:=False:C215


$0:=0
If (Count parameters:C259>=1)
	$_t_ListName:=$1
Else 
	$_t_ListName:=""
End if 
If (Count parameters:C259>=2)
	$_bo_CheckProperties:=$2
Else 
	$_bo_CheckProperties:=False:C215
End if 
If (Count parameters:C259>=1)
	
	If ($_t_ListName#"")
		$_l_Tries:=0
		While (Semaphore:C143("$LoadingListofLists"))
			$_l_Tries:=$_l_Tries+1
			DelayTicks(2*$_l_Tries)
		End while 
		If (Not:C34(AA_bo_ListsInited))
			
			ARRAY TEXT:C222(AA_at_ListNames; 0)
			ARRAY LONGINT:C221(AA_al_ListIDS; 0)
			AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
			AA_bo_ListsInited:=True:C214
		End if 
		CLEAR SEMAPHORE:C144("$LoadingListofLists")
		$_bo_CheckByName:=True:C214
		$_l_ListIDPosition:=Find in array:C230(AA_at_ListNames; $_t_ListName)
		If ($_l_ListIDPosition>0)
			$0:=AA_al_ListIDS{$_l_ListIDPosition}
			$_bo_CheckByName:=False:C215
		Else 
			If (Count parameters:C259>=2)
				
				//this call is for the properties list
				//so if the property does not exist we can create it
				If ($_bo_CheckProperties)
					$_bo_CheckByName:=True:C214
					UNLOAD RECORD:C212([X_LISTS:111])
					ARRAY TEXT:C222(AA_at_ListProperties; 0)
					ARRAY LONGINT:C221(AA_al_ListPropertyIDs; 0)
					ARRAY TEXT:C222(AA_at_PropertiesListProperties; 0)
					
					$_l_PropertiesListID:=AA_GetListbyName("List Properties"; False:C215)
					
					AA_t_CallingMethod:="AA_GetListbyName"
					$_l_ListID:=AA_LoadListByName("List Properties"; ->AA_at_ListProperties; ->AA_al_ListPropertyIDs; False:C215; ->AA_at_PropertiesListProperties)
					$_l_ListIDPosition:=Find in array:C230(AA_at_ListProperties; $_t_ListName)
					If ($_l_ListIDPosition<0)  //this item does not exist so add it
						$_l_Tries:=0
						While (Semaphore:C143("LoadingListofLists"))
							$_l_Tries:=$_l_Tries+1
							DelayTicks(2*$_l_Tries)
						End while 
						READ WRITE:C146([X_LISTS:111])
						CREATE RECORD:C68([X_LISTS:111])
						[X_LISTS:111]x_ListName:2:=$_t_ListName
						$_l_AttributesNum:=0 ?+ 5
						AA_SetListProperty("ACCESS"; $_l_AttributesNum)
						DB_SaveRecord(->[X_LISTS:111])
						AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
						$_l_ListID:=[X_LISTS:111]x_ID:1
						UNLOAD RECORD:C212([X_LISTS:111])
						READ ONLY:C145([X_LISTS:111])
						READ WRITE:C146([LIST_ITEMS:95])
						CREATE RECORD:C68([LIST_ITEMS:95])
						[LIST_ITEMS:95]List_Entry:2:=$_t_ListName
						[LIST_ITEMS:95]X_ListID:4:=$_l_PropertiesListID
						
						AA_SetListItemProperty("SUBLIST"; $_l_ListID)
						
						DB_SaveRecord(->[LIST_ITEMS:95])
						
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
						CLEAR SEMAPHORE:C144("Loadinglistoflists")
						$0:=$_l_ListID
						$_bo_Reload:=True:C214
					Else 
						//update it
						//We only need the propeties when we are here
						
						$_bo_Create:=False:C215
						$_t_Properties:=AA_at_PropertiesListProperties{$_l_ListIDPosition}
						If ($_t_Properties#"")
							$_l_Position:=Position:C15("SUBLIST:"; $_t_Properties)
							If ($_l_Position>0)
								$_t_Properties:=Substring:C12($_t_Properties; $_l_Position+Length:C16("SUBLIST:"); Length:C16($_t_Properties))
								$_l_Position:=Position:C15(Char:C90(13); $_t_Properties)
								If ($_l_Position>0)
									$_t_Properties:=Substring:C12($_t_Properties; 1; $_l_Position-1)
								End if 
								$_l_SubListNUM:=Num:C11($_t_Properties)
								If ($_l_SubListNUM>0)
									$_l_Tries:=0
									While (Semaphore:C143("LoadingListofLists"))
										$_l_Tries:=$_l_Tries+1
										DelayTicks(2*$_l_Tries)
									End while 
									READ WRITE:C146([X_LISTS:111])
									QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_SubListNUM)
									If (Records in selection:C76([X_LISTS:111])>0)
										[X_LISTS:111]x_ListName:2:=$_t_ListName
										DB_SaveRecord(->[X_LISTS:111])
										AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
										$0:=[X_LISTS:111]x_ID:1
										UNLOAD RECORD:C212([X_LISTS:111])
										READ ONLY:C145([X_LISTS:111])
										CLEAR SEMAPHORE:C144("Loadinglistoflists")
										$_bo_Reload:=True:C214
									Else 
										CLEAR SEMAPHORE:C144("Loadinglistoflists")
										$_bo_Create:=True:C214
									End if 
								Else 
									$_bo_Create:=True:C214
								End if 
							Else 
								$_bo_Create:=True:C214
							End if 
						Else 
							$_bo_Create:=True:C214
						End if 
						If ($_bo_Create=True:C214)
							$_l_Tries:=0
							While (Semaphore:C143("LoadingListofLists"))
								$_l_Tries:=$_l_Tries+1
								DelayTicks(2*$_l_Tries)
							End while 
							READ WRITE:C146([X_LISTS:111])
							CREATE RECORD:C68([X_LISTS:111])
							[X_LISTS:111]x_ListName:2:=$_t_ListName
							$_l_AttributesNum:=0 ?+ 5
							AA_SetListProperty("ACCESS"; $_l_AttributesNum)
							DB_SaveRecord(->[X_LISTS:111])
							AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
							$_l_ListID:=[X_LISTS:111]x_ID:1
							UNLOAD RECORD:C212([X_LISTS:111])
							READ ONLY:C145([X_LISTS:111])
							$_l_PropertiesListID:=AA_GetListbyName("List Properties"; False:C215)
							READ WRITE:C146([LIST_ITEMS:95])
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=AA_al_ListPropertyIDs{$_l_ListIDPosition})
							[LIST_ITEMS:95]List_Entry:2:=$_t_ListName
							[LIST_ITEMS:95]X_ListID:4:=$_l_PropertiesListID
							AA_SetListItemProperty("SUBLIST"; $_l_ListID)
							DB_SaveRecord(->[LIST_ITEMS:95])
							AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
							$0:=$_l_ListID
							UNLOAD RECORD:C212([LIST_ITEMS:95])
							READ ONLY:C145([LIST_ITEMS:95])
							CLEAR SEMAPHORE:C144("Loadinglistoflists")
							$_bo_Reload:=True:C214
						End if 
						
						
						
					End if 
					
				End if   //$_bo_CheckProperties=TRUE
				Gen_Alert("Attempting to load list "+$_t_ListName+" Which does not exist")
			End if   //Count parameters not >=2
			
		End if   //$_t_ListName is found in list of lists array
		If ($_bo_CheckByName)  //1 `Name was not found in list AND name is not a property
			//      (either less than 2 parameters or $_bo_CheckProperties=False
			$_l_Tries:=0
			While (Semaphore:C143("LoadingListofLists"))
				$_l_Tries:=$_l_Tries+1
				DelayTicks(2*$_l_Tries)
			End while 
			READ ONLY:C145([X_LISTS:111])
			QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName)
			If (Records in selection:C76([X_LISTS:111])=0)  //2
				//Record does not exist
				READ WRITE:C146([X_LISTS:111])
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName)
				If (Records in selection:C76([X_LISTS:111])=0)  //3
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$_t_ListName)
					$_l_ListID:=0
					$_bo_NoCreate:=False:C215
					If (Records in selection:C76([LIST_ITEMS:95])>0)  //4
						QUERY SELECTION:C341([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4>0)
						$_l_ListID:=[LIST_ITEMS:95]X_ListID:4
						If ($_l_ListID>0)  //5
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_l_ListID)
							If (Records in selection:C76([X_LISTS:111])=1)  //6
								//the list exist with a different name??
								$_l_ListIDPosition:=Find in array:C230(AA_al_ListIDS; $_l_ListID)
								$_l_ListID:=0
								If ($_l_ListIDPosition>0)  //6
									$0:=AA_al_ListIDS{$_l_ListIDPosition}
									$_bo_NoCreate:=True:C214
								End if   //6
							End if   //6
						End if   //5
					End if   //4
					If (Not:C34($_bo_NoCreate))  //7
						CREATE RECORD:C68([X_LISTS:111])
						[X_LISTS:111]x_ListName:2:=$_t_ListName
						If ($_l_ListID>0)
							[X_LISTS:111]x_ID:1:=$_l_ListID
						End if 
						AA_CheckUUID(Table:C252(->[X_LISTS:111]))
						<>SYS_t_LastSavedTableName:="X_LISTS"
						SAVE RECORD:C53([X_LISTS:111])
						$0:=[X_LISTS:111]x_ID:1
						$_bo_Reload:=True:C214
					End if   //7
					UNLOAD RECORD:C212([X_LISTS:111])
					READ ONLY:C145([X_LISTS:111])
				End if   //3
			Else 
				$0:=[X_LISTS:111]x_ID:1
				//record exist just need to reload the arrays
				$_bo_Reload:=True:C214
			End if   //2
			CLEAR SEMAPHORE:C144("Loadinglistoflists")
		End if 
	Else 
		Gen_Alert("Trying to obtain a list with no name from "+DB_t_ErrTrackingStack)
		
	End if   //$_t_ListName is empty
Else 
	
	Gen_Alert("Attempting to load a list without passing a list name parameter")
End if   //no parameters

If ($_bo_Reload)
	$_l_Tries:=0
	While (Semaphore:C143("$LoadingListofLists"))
		$_l_Tries:=$_l_Tries+1
		DelayTicks(2*$_l_Tries)
	End while 
	
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
	
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
	
	
End if 
ERR_MethodTrackerReturn("AA_GetListbyName"; $_t_oldMethodName)
