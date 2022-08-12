//%attributes = {}
If (False:C215)
	//Project Method Name:      BK_EditConnection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 22:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(DM_D_BkLastUpdateDate)
	C_LONGINT:C283(<>DM_l_RetrieveManagerProcessID; $_l_CurrentWinRefOLD; $_l_DataRetreiveManager; $_l_ItemID; $_l_RecordNumber; DB_l_BKRecordNumber; DB_l_BKSettingsID; DM_CB_BkActive; DM_l_BKDataModelID; DM_l_BkFrequency; DM_l_BKLastTimeStamp)
	C_LONGINT:C283(DM_l_BkLastUpdateTime; DM_l_BkMaxTime; DM_l_BKOptions; DM_l_BKPostAction; DM_l_BkRetrieveType; DM_l_BkserverID; DM_l_BkstoreID; DM_l_BkTimeOut; DM_l_ConnectionID; DM_l_CSave; DM_l_LastRecord)
	C_LONGINT:C283(DM_l_RecordCount; DM_l_ResetModuleID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_oldMethodName; DM_t_BkConnectionName; DM_t_BKFileName; DM_t_BkFrequencyType; DM_T_CustomQuery)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BK_EditConnection")

If (Count parameters:C259>=1)
	If ($1>0)
		DB_l_BKSettingsID:=$1
		DB_l_BKRecordNumber:=$2
	Else 
		//new connection
		DB_l_BKSettingsID:=$1
		DB_l_BKRecordNumber:=-1
	End if 
	DM_l_CSave:=0
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 4)
	DIALOG:C40([USER:15]; "BK_ImportSetup")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (DM_l_CSave=1)
		If (DB_l_BKSettingsID>0)
			READ WRITE:C146([PREFERENCES:116])
			GOTO RECORD:C242([PREFERENCES:116]; DB_l_BKrecordNumber)
		Else 
			$_l_ItemID:=PREF_GetPreferenceID("Business Kit Connections")
			If ($_l_ItemID>0)
				//new record
				
				READ WRITE:C146([PREFERENCES:116])
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
				[PREFERENCES:116]Pref_OwnerID:4:=0
			End if 
		End if 
		If (DB_l_BKSettingsID=0)
			DB_l_BKSettingsID:=AA_GetNextIDinMethod(->DM_l_ConnectionID)
		End if 
		
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(DB_l_BKSettingsID; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_t_BkConnectionName; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_l_BkserverID; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_l_BkstoreID; [PREFERENCES:116]DataBlob:2; *)  //²
		If (DM_l_BkTimeOut=0)  //
			DM_l_BkTimeOut:=30  //defaults
		End if 
		If (DM_l_BkMaxTime=0)
			DM_l_BkMaxTime:=300  //defaults
		End if 
		VARIABLE TO BLOB:C532(DM_l_BkTimeOut; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_l_BkMaxTime; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_l_BkFrequency; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_l_BkRetrieveType; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_t_BKFileName; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_l_BKDataModelID; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_l_BKPostAction; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_l_BKOptions; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_CB_BkActive; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_D_BkLastUpdateDate; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_l_BkLastUpdateTime; [PREFERENCES:116]DataBlob:2; *)  //²
		VARIABLE TO BLOB:C532(DM_l_BKLastTimeStamp; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_t_BkFrequencyType; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_l_RecordCount; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_l_LastRecord; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(DM_T_CustomQuery; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116])
		$_l_DataRetreiveManager:=0
		If (ApplicationType_isSingleUser)
			$_l_DataRetreiveManager:=<>DM_l_RetrieveManagerProcessID
		Else 
			GET PROCESS VARIABLE:C371(-1; <>DM_l_RetrieveManagerProcessID; $_l_DataRetreiveManager)
		End if 
		If ($_l_DataRetreiveManager>0)
			//datamanager is running
			$_l_RecordNumber:=Record number:C243([PREFERENCES:116])
			SET PROCESS VARIABLE:C370($_l_DataRetreiveManager; DM_l_ResetModuleID; $_l_RecordNumber)
			
		Else 
			If (DM_CB_BkActive=1)
				If (Application type:C494=4D Local mode:K5:1) | (Application type:C494=4D Volume desktop:K5:2)
					$_l_DataRetreiveManager:=New process:C317("DM_DataRetreiveManager"; 256000; "Data RetreiveManager")
				Else 
					$_l_DataRetreiveManager:=Execute on server:C373("DM_DataRetreiveManager"; 256000; "Data RetreiveManager")
				End if 
			End if 
		End if 
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		
	End if 
	BK_LoadSettings
	
End if 
ERR_MethodTrackerReturn("BK_EditConnection"; $_t_oldMethodName)
