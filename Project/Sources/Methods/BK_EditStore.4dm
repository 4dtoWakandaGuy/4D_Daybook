//%attributes = {}
If (False:C215)
	//Project Method Name:      BK_EditStore
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
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Delay; $_l_ItemID; $_l_Repeats; $_l_Retries; $_l_WindowReference; $1; $2; DM_l_BKOK; DM_l_BKServerID; DM_l_BKStoreID)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($0; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_PreferenceName; DM_t_BKServerName; DM_t_BKStoreName; DM_t_BKStorePassword)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BK_EditStore")
If (Count parameters:C259>=2)
End if 
$0:=DM_l_BKStoreID
If (Count parameters:C259>=1)
	DM_l_BKServerID:=$1
	DM_l_BKStoreID:=$2
	$0:=DM_l_BKStoreID
	HIDE WINDOW:C436
	If (Count parameters:C259>=4)
		$_l_WindowReference:=Open window:C153($3; $4; $3; $4; 1)
	Else 
		$_l_WindowReference:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 4)
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=$_l_WindowReference
	DIALOG:C40([USER:15]; "BK_StoreSetup")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	SHOW WINDOW:C435
	
	If (DM_l_BKOK>0)
		//record valid
		If (DM_l_BKOK=2)
			//DB_SaveRecord
			$_l_Retries:=0
			While (Semaphore:C143("LoadingStorerPrefs"))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End while 
			READ WRITE:C146([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			If (DM_l_BKStoreID=0)
				$_l_ItemID:=PREF_GetPreferenceID("Server "+DM_t_BKServerName)
				
				
			Else 
				$_t_PreferenceName:=PREF_GetPreferenceName(DM_l_BKStoreID)
				
				If ($_t_PreferenceName#"")
					If ($_t_PreferenceName#"Store "+DM_t_BKStoreName)
						//store name has been changed
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=DM_l_BKStoreID)
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
						
						[LIST_ITEMS:95]List_Entry:2:=DM_t_BKStoreName
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						UNLOAD RECORD:C212([LIST_ITEMS:95])
						READ ONLY:C145([LIST_ITEMS:95])
					End if 
					
				End if 
			End if 
			
			READ WRITE:C146([PREFERENCES:116])
			If (DM_l_BKStoreID=0)
				//new record
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
				[PREFERENCES:116]Pref_OwnerID:4:=-(DM_l_BKServerID)
				DM_l_BKStoreID:=[PREFERENCES:116]IDNumber:1
			Else 
				//update existing
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BKStoreID)
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
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
			VARIABLE TO BLOB:C532(DM_t_BKStoreName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DM_t_BKStorePassword; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			CLEAR SEMAPHORE:C144("LoadingStorerPrefs")
			
			
		End if 
		$0:=DM_l_BKStoreID
	Else 
		$0:=0
	End if 
	
End if 
ERR_MethodTrackerReturn("BK_EditStore"; $_t_oldMethodName)
