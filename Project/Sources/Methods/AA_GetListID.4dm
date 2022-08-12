//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_GetListID
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListIDS;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(AA_at_ListNames;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_ListAllowed; $_bo_OK; $_bo_Reload; $_bo_UseListUsage; AA_bo_ListsInited; Gen_bo_Create; WS_bo_showCreate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Element; $_l_FieldNumber; $_l_Index; $_l_ListID; $_l_ListIDPosition; $_l_Retries; $_l_TableNumber; $0; $1; $2)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_FieldName; $_t_ListDefaultName; $_t_ListName; $_t_oldMethodName; $_t_Reply; $_t_TableName; $_t_VariableName; $3; $4; DB_t_WindowTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AA_GetListID")
//NG Modified Feb 2004 to ensure a semaphore is set before list of lists is reloaded
READ ONLY:C145([x_ListUsage:112])
READ ONLY:C145([X_LISTS:111])

$_bo_Reload:=False:C215
$0:=0
If (Count parameters:C259>=2)
	$_l_TableNumber:=$1
	$_l_FieldNumber:=$2
	If (Count parameters:C259>=3)
		$_t_ListName:=$3
	Else 
		$_t_ListName:=""
	End if 
	If (Count parameters:C259>=4)
		$_t_VariableName:=$4
	Else 
		$_t_VariableName:=""
	End if 
	$_bo_UseListUsage:=True:C214
	If ($_l_TableNumber#0) & ($_l_FieldNumber#0)  //2
		If ($_l_TableNumber>0) & ($_l_FieldNumber>0)
			QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_TableID:3=$_l_TableNumber; *)
			QUERY:C277([x_ListUsage:112];  & ; [x_ListUsage:112]x_FieldID:4=$_l_FieldNumber)
		Else   //in this case the list is associated with the variable named
			If (Count parameters:C259>=4)  //just to be safe
				QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_VariableName:5=$_t_VariableName)
				If ($_t_ListName#"")
					If ([x_ListUsage:112]x_ListID:2>0)
						QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=[x_ListUsage:112]x_ListID:2)
						If ([X_LISTS:111]x_ListName:2=$_t_ListName)
							$0:=[X_LISTS:111]x_ID:1
							UNLOAD RECORD:C212([X_LISTS:111])
							$_bo_UseListUsage:=False:C215
						Else 
							QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName)
							If (Records in selection:C76([X_LISTS:111])>0)
								$0:=[X_LISTS:111]x_ID:1
								UNLOAD RECORD:C212([X_LISTS:111])
								$_bo_UseListUsage:=False:C215
							Else 
								$_bo_UseListUsage:=True:C214
							End if 
						End if 
					Else 
						QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName)
						If ([X_LISTS:111]x_ListName:2=$_t_ListName)
							$0:=[X_LISTS:111]x_ID:1
							UNLOAD RECORD:C212([X_LISTS:111])
							$_bo_UseListUsage:=False:C215
						End if 
					End if 
				End if 
			Else 
				If (Count parameters:C259>=3)
					If ($_t_ListName#"")
						QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName)
						If ([X_LISTS:111]x_ListName:2=$_t_ListName)
							$0:=[X_LISTS:111]x_ID:1
							UNLOAD RECORD:C212([X_LISTS:111])
							$_bo_UseListUsage:=False:C215
						End if 
						
					End if 
				Else 
					Gen_Alert("PROGRAMMER ERROR")
				End if 
			End if 
		End if 
		
		If (Records in selection:C76([x_ListUsage:112])>0) & ($_bo_UseListUsage)  //3
			If ([x_ListUsage:112]x_ListID:2>0)  //4
				$0:=[x_ListUsage:112]x_ListID:2
				$_bo_OK:=True:C214
			Else   //4
				$_bo_OK:=False:C215
			End if   //4
		Else   //3
			If ($_bo_UseListUsage)
				$_bo_OK:=False:C215
			Else 
				$_bo_OK:=True:C214
			End if 
		End if   //3
		If ($_bo_OK=False:C215)  //5
			If (Count parameters:C259>=3) & ($_t_ListName#"")  //20
				//here we can associated and create the list and update the records
				//first create the record
				QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_ListName)
				If (Records in selection:C76([X_LISTS:111])=0)
					$_l_Retries:=0
					While (Semaphore:C143("LoadingListofLists"))
						
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*$_l_Retries)
					End while 
					READ WRITE:C146([X_LISTS:111])
					CREATE RECORD:C68([X_LISTS:111])
					[X_LISTS:111]x_ListName:2:=$_t_ListName
					DB_SaveRecord(->[X_LISTS:111])
					AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
					$_l_ListID:=[X_LISTS:111]x_ID:1
					$0:=$_l_ListID
					UNLOAD RECORD:C212([X_LISTS:111])
					READ ONLY:C145([X_LISTS:111])
					CLEAR SEMAPHORE:C144("Loadinglistoflists")
					$_bo_Reload:=True:C214
				Else 
					$_l_ListID:=[X_LISTS:111]x_ID:1
					$0:=$_l_ListID
				End if 
				//we now have a list
				//now create the relationship
				CREATE RECORD:C68([x_ListUsage:112])
				[x_ListUsage:112]x_ListID:2:=$_l_ListID
				[x_ListUsage:112]x_TableID:3:=$_l_TableNumber
				[x_ListUsage:112]x_FieldID:4:=$_l_FieldNumber
				If (Count parameters:C259>=4)
					[x_ListUsage:112]x_VariableName:5:=$_t_VariableName
				End if 
				DB_SaveRecord(->[x_ListUsage:112])
				AA_CheckFileUnlocked(->[x_ListUsage:112]x_ID:1)
				UNLOAD RECORD:C212([x_ListUsage:112])
				READ ONLY:C145([x_ListUsage:112])
				//now get any list items and associate them
				$_l_Retries:=0
				While (Semaphore:C143("LoadingListofLists"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*$_l_Retries)
				End while 
				READ WRITE:C146([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]List_Name:1=$_t_ListName; *)
				QUERY:C277([LIST_ITEMS:95];  & ; [LIST_ITEMS:95]X_ListID:4=0)
				FIRST RECORD:C50([LIST_ITEMS:95])
				If (In transaction:C397)  //an apply to selection causes probs if we are in a trnsaction
					For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
						If ([LIST_ITEMS:95]X_ID:3=0)
							[LIST_ITEMS:95]X_ID:3:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
						End if 
						[LIST_ITEMS:95]X_ListID:4:=$_l_ListID
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						NEXT RECORD:C51([LIST_ITEMS:95])
					End for 
				Else 
					DB_lockFile(->[LIST_ITEMS:95])
					APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4:=$_l_ListID)
					AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
				End if 
				UNLOAD RECORD:C212([LIST_ITEMS:95])
				READ ONLY:C145([LIST_ITEMS:95])
				CLEAR SEMAPHORE:C144("Loadinglistoflists")
				//this has now associated those items with the list
				//and given them an ID as well
			Else   //29
				$_t_TableName:=Table name:C256($_l_TableNumber)
				$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
				$_t_ListDefaultName:=""
				If (User in group:C338(Current user:C182; "administrator"))  //6
					Case of 
						: ($_t_VariableName#"")
							$_t_ListDefaultName:=$_t_VariableName
						: ($_t_ListName#"")
							$_t_ListDefaultName:=$_t_ListName
						: ($_l_TableNumber>0) & ($_l_FieldNumber>0)
							$_t_ListDefaultName:=AA_DBNormaliseFieldNames($_l_TableNumber; $_l_FieldNumber)
							
					End case 
					//this user can set up the list
					//Load List names
					SHOW PROCESS:C325(Current process:C322)
					BRING TO FRONT:C326(Current process:C322)
					Gen_Confirm("No list has been associated with "+$_t_ListDefaultName+Char:C90(13)+" Would you like to set this up now?")
					If (OK=1)  //7
						If (Not:C34(AA_bo_ListsInited))
							$_l_Retries:=0
							While (Semaphore:C143("$LoadingListofLists"))
								$_l_Retries:=$_l_Retries+1
								DelayTicks(2*$_l_Retries)
							End while 
							ARRAY TEXT:C222(AA_at_ListNames; 0)
							ARRAY LONGINT:C221(AA_al_ListIDS; 0)
							AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
							AA_bo_ListsInited:=True:C214
							CLEAR SEMAPHORE:C144("$LoadingListofLists")
						End if 
						ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(AA_at_ListNames))
						ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(AA_at_ListNames))
						
						CLEAR SEMAPHORE:C144("$LoadingListofLists")
						$_l_Element:=0
						$_bo_ListAllowed:=False:C215
						For ($_l_Index; 1; Size of array:C274(AA_at_ListNames))  //8
							//do not put in invisible ones
							$_l_Element:=$_l_Element+1
							GEN_at_DropDownMenu{$_l_Element}:=AA_at_ListNames{$_l_Index}
							GEN_al_DropDownMenuID{$_l_Element}:=AA_al_ListIDS{$_l_Index}
						End for   //8
						ARRAY TEXT:C222(GEN_at_DropDownMenu; $_l_Element)
						ARRAY LONGINT:C221(GEN_al_DropDownMenuID; $_l_Element)
						$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
						WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
						WS_bo_showCreate:=True:C214
						DB_t_WindowTitle:="List For: "+$_t_ListDefaultName
						DIALOG:C40([USER:15]; "Gen_PopUpChoice")
						CLOSE WINDOW:C154
						WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
						If (Gen_bo_Create)  //
							Repeat 
								$_bo_Continue:=True:C214
								$_t_Reply:=Gen_Request("Enter List Name:"; $_t_ListDefaultName)
								If (OK=1)  //
									If ($_t_Reply#"")
										QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2=$_t_Reply)
										If (Records in selection:C76([X_LISTS:111])=0)
											$_l_Retries:=0
											While (Semaphore:C143("LoadingListofLists"))
												$_l_Retries:=$_l_Retries+1
												DelayTicks(2*$_l_Retries)
											End while 
											READ WRITE:C146([X_LISTS:111])
											CREATE RECORD:C68([X_LISTS:111])
											[X_LISTS:111]x_ListName:2:=$_t_Reply
											$_bo_Reload:=True:C214
											$_bo_Continue:=True:C214
											//the record ID is created in the trigger
											DB_SaveRecord(->[X_LISTS:111])
											AA_CheckFileUnlocked(->[X_LISTS:111]x_ID:1)
											$_l_ListID:=[X_LISTS:111]x_ID:1
											UNLOAD RECORD:C212([X_LISTS:111])
											READ ONLY:C145([X_LISTS:111])
											CLEAR SEMAPHORE:C144("LoadingListofLists")
										Else 
											$_bo_Continue:=False:C215
										End if 
									Else 
										$_bo_Continue:=False:C215
										Gen_Confirm("There is already a list called "+$_t_Reply; "Use"; "Retry")
										If (Ok=1)
											$_bo_Reload:=True:C214
											$_bo_Continue:=True:C214
										End if 
										
									End if 
									If ($_bo_Continue)
										$_l_Retries:=0
										While (Test semaphore:C652("$LoadingListofLists"))  //local to this machine
											$_l_Retries:=$_l_Retries+1
											DelayTicks(2*$_l_Retries)
										End while 
										ARRAY TEXT:C222(AA_at_ListNames; 0)
										ARRAY LONGINT:C221(AA_al_ListIDS; 0)
										AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
										CLEAR SEMAPHORE:C144("$LoadingListofLists")
										$_l_ListIDPosition:=Find in array:C230(AA_al_ListIDS; $_l_ListID)
										If ($_l_ListIDPosition>0)  //16
											ARRAY TEXT:C222(GEN_at_DropDownMenu; 1)
											GEN_at_DropDownMenu{1}:=AA_at_ListNames{$_l_ListIDPosition}
											GEN_al_DropDownMenuID{1}:=$_l_ListID
											GEN_at_DropDownMenu:=1
										End if   //16
									End if 
								End if   //
							Until ($_bo_Continue) | (OK=0)
						End if 
						
						If (GEN_at_DropDownMenu>0)  //17
							READ WRITE:C146([x_ListUsage:112])
							If ($_l_TableNumber>0) & ($_l_FieldNumber>0)
								QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_TableID:3=$_l_TableNumber; *)
								QUERY:C277([x_ListUsage:112];  & ; [x_ListUsage:112]x_FieldID:4=$_l_FieldNumber)
							Else 
								If (Count parameters:C259>=4)
									QUERY:C277([x_ListUsage:112]; [x_ListUsage:112]x_VariableName:5=$_t_VariableName)
								Else 
									Gen_Alert("PROGRAMMER ERROR")
								End if 
							End if 
							If (Records in selection:C76([x_ListUsage:112])>0)  //18
								[x_ListUsage:112]x_ListID:2:=GEN_al_DropDownMenuID{GEN_at_DropDownMenu}
								DB_SaveRecord(->[x_ListUsage:112])
								AA_CheckFileUnlocked(->[x_ListUsage:112]x_ID:1)
							Else   //18
								CREATE RECORD:C68([x_ListUsage:112])
								[x_ListUsage:112]x_ListID:2:=GEN_al_DropDownMenuID{GEN_at_DropDownMenu}
								[x_ListUsage:112]x_TableID:3:=$_l_TableNumber
								[x_ListUsage:112]x_FieldID:4:=$_l_FieldNumber
								If (Count parameters:C259>=4)
									[x_ListUsage:112]x_VariableName:5:=$_t_VariableName
								End if 
								DB_SaveRecord(->[x_ListUsage:112])
								AA_CheckFileUnlocked(->[x_ListUsage:112]x_ID:1)
							End if   //18
							$0:=[x_ListUsage:112]x_ListID:2
							UNLOAD RECORD:C212([x_ListUsage:112])
							READ ONLY:C145([x_ListUsage:112])
						Else   //17
							$0:=0
						End if   //17
					Else 
						$0:=0
					End if   //7
				Else   //6
					SHOW PROCESS:C325(Current process:C322)
					BRING TO FRONT:C326(Current process:C322)
					Gen_Alert("Sorry, there has been no list associated with"+Char:C90(13)+$_t_FieldName+Char:C90(13)+"Contact your administrator to have this corrected")
					$0:=0
				End if   //6
			End if   //20
		End if   //5
	Else   //2
		//here we have been passed a list name
		
		If ($_t_ListName#"")  //19
			$0:=AA_GetListbyName($_t_ListName)
		End if   //19
	End if   //2
End if 
If ($_bo_Reload)
	$_l_Retries:=0
	While (Test semaphore:C652("$LoadingListofLists"))  //local to this machine
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End while 
	ARRAY TEXT:C222(AA_at_ListNames; 0)
	ARRAY LONGINT:C221(AA_al_ListIDS; 0)
	AA_GetTopLevelListNames(->AA_al_ListIDS; ->AA_at_ListNames)
	CLEAR SEMAPHORE:C144("$LoadingListofLists")
End if 
UNLOAD RECORD:C212([X_LISTS:111])
UNLOAD RECORD:C212([LIST_ITEMS:95])
ERR_MethodTrackerReturn("AA_GetListID"; $_t_oldMethodName)
