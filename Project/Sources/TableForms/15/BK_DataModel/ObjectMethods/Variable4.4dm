If (False:C215)
	//object Name: [USER]BK_DataModel.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BKClear; 0)
	//ARRAY LONGINT(BK_al_ADBFIELDNUM;0)
	//ARRAY LONGINT(BK_al_aDBTableNum;0)
	//ARRAY LONGINT(BK_al_ConnectIDs;0)
	//ARRAY LONGINT(BK_al_MapRecID;0)
	//ARRAY LONGINT(BK_al_PsuedoNumber;0)
	//ARRAY LONGINT(BK_al_SortNumber;0)
	//ARRAY LONGINT(BK_al_ConnectServerIDS;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	//ARRAY TEXT(BK_at_BKFieldName;0)
	//ARRAY TEXT(BK_at_CONNECTSTORENMS;0)
	//ARRAY TEXT(BK_at_CONNECTSTOREPASSWORDS;0)
	//ARRAY TEXT(BK_at_DBFieldName;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305(GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_ArraySize; $_l_CharacterPosition; $_l_Element; $_l_FieldPosition; $_l_Index; $_l_offset; $_l_ServerID; $_l_CurrentWinRefOLD; BK_l_SelectedStore; DM_l_start; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_BK_StoreName; $_t_BKFilePath; $_t_FieldName; $_t_FieldNames; $_t_oldMethodName; $_t_Password; $_t_QueryResult; $_t_QueryString; BK_t_BKCONTEXT; DB_t_WindowTitle; DM_t_BKFilePath)
	C_TEXT:C284(DM_t_qty)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Variable4"; Form event code:C388)
//here the user will need to select a store(the context must be defined already)
If (BK_t_BKCONTEXT="")
	Gen_Alert("You must set a business kit context first!")
Else 
	//select a store to connect to
	//if no stores cannot connect!!!
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
	QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4<-100)
	//these are the stores
	ARRAY LONGINT:C221(BK_al_ConnectIDs; 0)
	ARRAY LONGINT:C221(BK_al_ConnectServerIDS; 0)
	ARRAY TEXT:C222(BK_at_CONNECTSTORENMS; 0)
	ARRAY TEXT:C222(BK_at_CONNECTSTOREPASSWORDS; 0)
	SELECTION TO ARRAY:C260([PREFERENCES:116]Pref_OwnerID:4; BK_al_ConnectServerIDS; [PREFERENCES:116]IDNumber:1; BK_al_ConnectIDs)
	ARRAY TEXT:C222(BK_at_CONNECTSTORENMS; Size of array:C274(BK_al_ConnectServerIDS))
	ARRAY TEXT:C222(BK_at_CONNECTSTOREPASSWORDS; Size of array:C274(BK_al_ConnectServerIDS))
	FIRST RECORD:C50([PREFERENCES:116])
	For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))
		$_l_offset:=0
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BK_at_CONNECTSTORENMS{$_l_Index}; $_l_offset)
		End if 
		
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; BK_at_CONNECTSTOREPASSWORDS{$_l_Index}; $_l_offset)
		End if 
		
		NEXT RECORD:C51([PREFERENCES:116])
	End for 
	If (Size of array:C274(BK_at_CONNECTSTORENMS)>0)
		//put the names up for selection
		ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(BK_at_CONNECTSTORENMS))
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(BK_at_CONNECTSTORENMS))
		For ($_l_Index; 1; Size of array:C274(BK_at_CONNECTSTORENMS))
			GEN_at_DropDownMenu{$_l_Index}:=BK_at_CONNECTSTORENMS{$_l_Index}
			GEN_al_DropDownMenuID{$_l_Index}:=BK_al_ConnectIDs{$_l_Index}
		End for 
		
		GEN_Bo_ShowCreate:=False:C215
		DB_t_WindowTitle:="Select Store"
		GEN_at_DropDownMenu:=0
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1)
		DIALOG:C40([USER:15]; "Gen_PopUpChoice")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		BK_l_SelectedStore:=GEN_at_DropDownMenu
		If (BK_l_SelectedStore>0)
			$_l_ServerID:=BK_al_ConnectServerIDS{BK_l_SelectedStore}
			$_t_Password:=BK_at_CONNECTSTOREPASSWORDS{BK_l_SelectedStore}
			$_t_BK_StoreName:=BK_at_CONNECTSTORENMS{BK_l_SelectedStore}
			$_l_offset:=0
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ServerID)
			DM_BKServerBlobtoVars
			$_t_BKFilePath:=DM_SetFilePath(DM_t_BKFilePath; "Temp4")
			If (True:C214)
				If (BK_t_BKCONTEXT#"ITM")
					$_t_QueryString:=""
					//$_t_QueryString:="*Ts>="+4DBKC_ToolsString ("GET TIMESTAMP GMT";String(Current date-1);String(Current time))
				Else 
					$_t_QueryString:="All"
				End if 
				DM_l_start:=1
				DM_t_qty:="1"
				$_t_QueryResult:="0"
				//$_t_QueryResult:=4DBKC_ImportFileFrom4DBK (DM_t_BKServerIP;DM_l_BkserverPort;30;60;$_t_Password;$_t_BK_StoreName;BK_t_BKCONTEXT;$_t_QueryString;$_t_BKFilePath;"";DM_t_qty)
			Else 
				$_t_QueryResult:="0"
			End if 
			If ($_t_QueryResult#"[Err@")
				$_l_Element:=0
				If (Test path name:C476($_t_BKFilePath)=Is a document:K24:1)
					
					
					$_ti_DocumentRef:=DB_OpenDocument($_t_BKFilePath)
					RECEIVE PACKET:C104($_ti_DocumentRef; $_t_FieldNames; Char:C90(13))
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					ARRAY TEXT:C222($_at_FieldNames; 99)
					$_t_FieldNames:=Replace string:C233($_t_FieldNames; Char:C90(13); "")
					Repeat 
						$_l_CharacterPosition:=Position:C15(Char:C90(9); $_t_FieldNames)
						If ($_l_CharacterPosition>0)
							$_t_FieldName:=Substring:C12($_t_FieldNames; 1; $_l_CharacterPosition-1)
							$_t_FieldNames:=Substring:C12($_t_FieldNames; $_l_CharacterPosition+1; Length:C16($_t_FieldNames))
						Else 
							$_t_FieldName:=$_t_FieldNames
							$_t_FieldNames:=""
						End if 
						If ($_t_FieldName#"")
							$_l_FieldPosition:=Find in array:C230($_at_FieldNames; "")
							If ($_l_FieldPosition<0)
								$_l_ArraySize:=Size of array:C274($_at_FieldNames)
								INSERT IN ARRAY:C227($_at_FieldNames; $_l_ArraySize+1; 99)
								$_l_FieldPosition:=$_l_ArraySize+1
							End if 
							$_t_FieldName:=Replace string:C233($_t_FieldName; "["; "")
							$_t_FieldName:=Replace string:C233($_t_FieldName; "]"; "")
							$_at_FieldNames{$_l_FieldPosition}:=$_t_FieldName
							$_t_FieldName:=""
							$_l_Element:=$_l_FieldPosition
						End if 
					Until ($_l_CharacterPosition=0) | (Length:C16($_t_FieldNames)=0)
					//now check against any that are here
					ARRAY TEXT:C222($_at_FieldNames; $_l_Element)
					For ($_l_Index; 1; Size of array:C274($_at_FieldNames))
						$_l_FieldPosition:=Find in array:C230(BK_at_BKFieldName; $_at_FieldNames{$_l_Index})
						If ($_l_FieldPosition<0)
							//add to the arrays
							INSERT IN ARRAY:C227(BK_at_BKFieldName; Size of array:C274(BK_at_BKFieldName)+1; 1)
							INSERT IN ARRAY:C227(BK_al_MapRecID; Size of array:C274(BK_al_MapRecID)+1; 1)
							BK_at_BKFieldName{Size of array:C274(BK_at_BKFieldName)}:=$_at_FieldNames{$_l_Index}
							INSERT IN ARRAY:C227(BK_al_aDBTableNum; Size of array:C274(BK_al_aDBTableNum)+1; 1)
							INSERT IN ARRAY:C227(BK_al_ADBFIELDNUM; Size of array:C274(BK_al_ADBFIELDNUM)+1; 1)
							INSERT IN ARRAY:C227(BK_at_DBFieldName; Size of array:C274(BK_at_DBFieldName)+1; 1)
							BK_at_DBFieldName{Size of array:C274(BK_at_DBFieldName)}:="Unknown"
							INSERT IN ARRAY:C227(BK_al_PsuedoNumber; Size of array:C274(BK_al_PsuedoNumber)+1; 1)
							INSERT IN ARRAY:C227(BK_al_SortNumber; Size of array:C274(BK_al_SortNumber)+1; 1)
							BK_al_PsuedoNumber{Size of array:C274(BK_al_PsuedoNumber)}:=-(Size of array:C274(BK_al_PsuedoNumber))
							//if modified they will be plus 1000
							BK_al_SortNumber{$_l_Index}:=$_l_Index
						End if 
					End for 
					
					//and validate backwards to warn the user
					ARRAY LONGINT:C221($_al_BKClear; 0)
					ARRAY LONGINT:C221($_al_BKClear; Size of array:C274(BK_at_BKFieldName))
					$_l_Element:=0
					For ($_l_Index; 1; Size of array:C274(BK_at_BKFieldName))
						$_l_FieldPosition:=Find in array:C230($_at_FieldNames; BK_at_BKFieldName{$_l_Index})
						If ($_l_FieldPosition<0)
							Gen_Confirm("The field "+Char:C90(34)+BK_at_BKFieldName{$_l_Index}+Char:C90(34)+" is not defined in the business kit"+Char:C90(13)+". You will not be able to import with this model until "+"The model matches the business kit."+"To remove the field select remove"; "OK"; "Remove")
							If (OK=0)
								//remove
								$_l_Element:=$_l_Element+1
								$_al_BKClear{$_l_Element}:=$_l_Index
							End if 
						End if 
					End for 
					ARRAY LONGINT:C221($_al_BKClear; $_l_Element)
					For ($_l_Index; Size of array:C274($_al_BKClear); 1; -1)
						DELETE FROM ARRAY:C228(BK_at_BKFieldName; $_l_Index; 1)
						DELETE FROM ARRAY:C228(BK_al_aDBTableNum; $_l_Index; 1)
						DELETE FROM ARRAY:C228(BK_al_ADBFIELDNUM; $_l_Index; 1)
						DELETE FROM ARRAY:C228(BK_at_DBFieldName; $_l_Index; 1)
						DELETE FROM ARRAY:C228(BK_al_PsuedoNumber; $_l_Index; 1)
						DELETE FROM ARRAY:C228(BK_al_SortNumber; $_l_Index; 1)
						DELETE FROM ARRAY:C228(BK_al_MapRecID; $_l_Index; 1)
					End for 
					//re-sort here
					SORT ARRAY:C229(BK_al_SortNumber; BK_al_PsuedoNumber; BK_at_BKFieldName; BK_al_aDBTableNum; BK_al_ADBFIELDNUM; BK_at_DBFieldName)
				Else 
					Gen_Alert("The document has not been created")
					
				End if 
			Else 
				Gen_Alert("There is an error from the business kit, check your settings")
			End if 
		Else 
			Gen_Alert("You did not select a store")
			
			
		End if 
		
	Else 
		Gen_Alert("You must set up a store first!")
	End if 
	
	
	
End if 
ERR_MethodTrackerReturn("OBJ:BK_DataModel,bLookup"; $_t_oldMethodName)
