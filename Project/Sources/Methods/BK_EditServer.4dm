//%attributes = {}
If (False:C215)
	//Project Method Name:      BK_EditServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Delay; $_l_ItemID; $_l_ListID; $_l_NewID; $_l_Repeats; $_l_Retries; $_l_WIndowReference; DM_l_BKOK; DM_l_BKServerID; DM_l_BkserverPort)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($0; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_PreferenceName; DM_t_BKFilePath; DM_t_BKServerIP; DM_t_BKServerName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BK_EditServer")
//if($1=0) it means add a new one
$0:=DM_l_BKServerID
If (Count parameters:C259>=1)
	DM_l_BKServerID:=$1
	$0:=DM_l_BKServerID
	HIDE WINDOW:C436
	
	If (Count parameters:C259>=3)
		$_l_WIndowReference:=Open window:C153($2; $3; $2; $3; 1)
	Else 
		$_l_WIndowReference:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 4)
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=$_l_WIndowReference
	DIALOG:C40([USER:15]; "BK_ServerSetup")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	SHOW WINDOW:C435
	If (DM_l_BKOK>0)
		
		
		//record valid
		If (DM_l_BKOK=2)
			//DB_SaveRecord
			$_l_Retries:=0
			While (Semaphore:C143("LoadingDataServerPrefs"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End while 
			READ ONLY:C145([PREFERENCES:116])
			
			If (DM_l_BKServerID=0)
				$_l_ItemID:=PREF_GetPreferenceID("Server "+DM_t_BKServerName; False:C215)
				If ($_l_ItemID=0)
					$_l_Retries:=0
					While (Semaphore:C143("LoadingPrefs"))
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*(1+$_l_Retries))
					End while 
					$_l_ListID:=AA_GetListID(0; 0; "Preferences")
					$_l_ItemID:=AA_ListAddItembyID($_l_ListID; "Server "+DM_t_BKServerName)
					If ($_l_ItemID<100)
						//because we use this number in the item owner id, i need space to allow for hard
						//-1 is connections
						
						//so we are leaving numbers up to 100 for anything else
						
						$_l_NewID:=101
						Repeat 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_NewID)
							If (Records in selection:C76([LIST_ITEMS:95])>0)
								$_l_NewID:=$_l_NewID+1
							End if 
						Until (Records in selection:C76([LIST_ITEMS:95])=0)
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_l_ItemID)
						$_bo_OK:=False:C215
						$_l_Repeats:=0
						$_l_Delay:=1
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[LIST_ITEMS:95]; 0)
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
						
						
						[LIST_ITEMS:95]X_ID:3:=$_l_NewID
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
						
						$_l_ItemID:=$_l_NewID
					End if 
					CLEAR SEMAPHORE:C144("LoadingPrefs")
				Else 
					
				End if 
			Else 
				$_t_PreferenceName:=PREF_GetPreferenceName(DM_l_BKServerID)
				
				If ($_t_PreferenceName#"")  //>0)
					If ($_t_PreferenceName#("Server "+DM_t_BKServerName))
						//name has changed
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=DM_l_BKServerID)
						$_bo_OK:=False:C215
						$_l_Repeats:=0
						$_l_Delay:=1
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[LIST_ITEMS:95]; 0)
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
						
						[LIST_ITEMS:95]List_Entry:2:="Server "+DM_t_BKServerName
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
						
					End if 
				Else 
					$_l_ListID:=AA_GetListID(0; 0; "Preferences")
					DM_l_BKServerID:=AA_ListAddItembyID($_l_ListID; "Server "+DM_t_BKServerName)
				End if 
				
			End if 
			
			READ WRITE:C146([PREFERENCES:116])
			If (DM_l_BKServerID=0)
				//new record
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
				[PREFERENCES:116]Pref_OwnerID:4:=-1
				DM_l_BKServerID:=[PREFERENCES:116]IDNumber:1
			Else 
				//update existing
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BKServerID)
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 0)
					If (Not:C34($_bo_OK))
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				Until ($_bo_OK=True:C214)
			End if 
			//variables to blob here
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DM_t_BKServerIP; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_l_BkserverPort; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_BKFilePath; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_BKServerName; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			CLEAR SEMAPHORE:C144("LoadingDataServerPrefs")
			
		End if 
		$0:=DM_l_BKServerID
	Else 
		$0:=0
	End if 
	
End if 
ERR_MethodTrackerReturn("BK_EditServer"; $_t_oldMethodName)
