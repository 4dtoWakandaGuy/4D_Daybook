If (False:C215)
	//Table Form Method Name: [USER]BK_ImportSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_BKAssModel1IDS;0)
	//ARRAY LONGINT(DM_al_BKAssModel2IDS;0)
	//ARRAY LONGINT(DM_al_BKModelIDS;0)
	//ARRAY LONGINT(DM_al_BKOptions;0)
	//ARRAY LONGINT(DM_al_BKStoreIDs;0)
	//ARRAY LONGINT(DM_al_BusinessKitServerID;0)
	//ARRAY TEXT(BK_at_Postaction;0)
	//ARRAY TEXT(DM_at_BKFrequencyOptions;0)
	//ARRAY TEXT(DM_at_BKModelNames;0)
	//ARRAY TEXT(DM_at_BKoptions;0)
	//ARRAY TEXT(DM_at_BKRetreiveOptions;0)
	//ARRAY TEXT(DM_at_BKStoreName;0)
	//ARRAY TEXT(DM_at_BusinessKitServer;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DM_bo_CModified)
	C_DATE:C307(DM_D_BkLastUpdateDate)
	C_LONGINT:C283($_l_ArraySize; $_l_event; $_l_Index; $_l_ItemID; $_l_ModelPosition; $_l_offset; $_l_Retries; DB_l_BKRecordNumber; DB_l_BKSettingsID; DM_CB_BkActive; DM_l_BkActive)
	C_LONGINT:C283(DM_l_BKDataModelID; DM_l_BkFrequency; DM_l_BKLastTimeStamp; DM_l_BkLastUpdateTime; DM_l_BkMaxTime; DM_l_BKOptions; DM_l_BKPostAction; DM_l_BkRetrieveType; DM_l_BkserverID; DM_l_BkserverIDOLD; DM_l_BkstoreID)
	C_LONGINT:C283(DM_l_BkTimeOut; DM_l_ConnectionContext; DM_l_RecordCount)
	C_TEXT:C284($_t_oldMethodName; $_t_OptionsName; BK_t_BKpostAction; DM_t_BkConnectionName; DM_t_BKFileName; DM_t_BKFREQUENCYTYPE; DM_t_BKModelName; DM_t_BKOPTIONS; DM_t_BKOptionsName; DM_t_BKPOSTACTION; DM_t_BkRetrieveType)
	C_TEXT:C284(DM_t_BKStoreName; DM_t_BusinessKitServer; DM_T_CustomQuery; DM_t_FilePath; DM_t_ServerIP; DM_t_ServerPort)
	C_TIME:C306(DM_ti_BkLastUpdateTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].BK_ImportSetup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))  //1
		OpenHelp(Table:C252(->[USER:15]); "BK_ImportSetup")
		
		DM_bo_CModified:=False:C215
		
		DM_l_ConnectionContext:=0
		DM_t_BkFrequencyType:=""
		DM_l_BKDataModelID:=0
		DM_l_BkserverID:=0
		DM_l_BkstoreID:=0
		DM_t_BKStoreName:=""
		DM_t_BKModelName:=""
		DM_t_BusinessKitServer:=""
		DM_t_BkConnectionName:=""
		WS_AutoscreenSize(3; 373; 491)
		//First get the settings for this record
		DM_t_BkRetrieveType:=""
		ARRAY TEXT:C222(DM_at_BKRetreiveOptions; 5)
		DM_at_BKRetreiveOptions{1}:="All records"
		DM_at_BKRetreiveOptions{2}:="All records since last connection"
		DM_at_BKRetreiveOptions{3}:="Next Records"
		DM_at_BKRetreiveOptions{4}:="All records before last connection"
		DM_at_BKRetreiveOptions{5}:="Custom Query"
		OBJECT SET VISIBLE:C603(*; "DM_o_CustomLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_o_RecordsLabel"; False:C215)
		OBJECT SET VISIBLE:C603(DM_l_RecordCount; False:C215)
		ARRAY TEXT:C222(DM_at_BKFrequencyOptions; 3)
		DM_at_BKFrequencyOptions{1}:="Minutes"
		DM_at_BKFrequencyOptions{2}:="Hours"
		DM_at_BKFrequencyOptions{3}:="Days"
		ARRAY LONGINT:C221(DM_al_BKOptions; 0)
		ARRAY TEXT:C222(DM_at_BKoptions; 0)
		BK_t_BKpostAction:=""
		ARRAY TEXT:C222(BK_at_Postaction; 3)
		BK_at_Postaction{1}:="No Action"
		BK_at_Postaction{2}:="Delete Records"
		
		DM_l_BkFrequency:=0
		
		DM_t_BusinessKitServer:=""
		DM_l_BKOptions:=0
		DM_CB_BkActive:=0
		If (DB_l_BKRecordNumber>0)  //2
			GOTO RECORD:C242([PREFERENCES:116]; DB_l_BKRecordNumber)
			$_l_offset:=0
			DM_BKConnectionBLobtovariables
		End if   //2
		
		ARRAY TEXT:C222(DM_at_BusinessKitServer; 0)
		ARRAY LONGINT:C221(DM_al_BusinessKitServerID; 0)
		If (DM_l_BkserverID=0)  //3
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-1)
			//these
			SELECTION TO ARRAY:C260([PREFERENCES:116]IDNumber:1; DM_al_BusinessKitServerID)
			ARRAY TEXT:C222(DM_at_BusinessKitServer; Size of array:C274(DM_al_BusinessKitServerID))
			FIRST RECORD:C50([PREFERENCES:116])
			For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))  //4
				$_l_offset:=0
				DM_BKServerBlobtoVars
				DM_at_BusinessKitServer{$_l_Index}:=DM_t_BusinessKitServer
				NEXT RECORD:C51([PREFERENCES:116])
			End for   //4
			
			If (Size of array:C274(DM_at_BusinessKitServer)=1)  //5
				DM_t_BusinessKitServer:=DM_at_BusinessKitServer{1}
				DM_l_BKServerID:=DM_al_BusinessKitServerID{1}
			End if   //5
			INSERT IN ARRAY:C227(DM_at_BusinessKitServer; Size of array:C274(DM_at_BusinessKitServer)+1; 2)
			INSERT IN ARRAY:C227(DM_al_BusinessKitServerID; Size of array:C274(DM_al_BusinessKitServerID)+1; 2)
			DM_at_BusinessKitServer{Size of array:C274(DM_at_BusinessKitServer)}:="Add Business Kit"
			DM_at_BusinessKitServer{Size of array:C274(DM_at_BusinessKitServer)-1}:="-"
			
		Else 
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BkserverID)
			$_l_offset:=0
			DM_BKServerBlobtoVars
			
			OBJECT SET VISIBLE:C603(DM_at_BusinessKitServer; False:C215)
			OBJECT SET VISIBLE:C603(*; "DM_Pi_BKServerPop"; False:C215)
		End if   //3
		If (DM_l_BkstoreID=0)  //6
			ARRAY TEXT:C222(DM_at_BKStoreName; 0)
			ARRAY LONGINT:C221(DM_al_BKStoreIDs; 0)
			If (DM_l_BkserverID>0)  //7
				//can only identify within a server
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
				QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=-(DM_l_BkserverID))
				SELECTION TO ARRAY:C260([PREFERENCES:116]IDNumber:1; DM_al_BKStoreIDs)
				ARRAY TEXT:C222(DM_at_BKStoreName; Size of array:C274(DM_al_BKStoreIDs))
				FIRST RECORD:C50([PREFERENCES:116])
				For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))  //8
					$_l_offset:=0
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_BKStoreName{$_l_Index}; $_l_offset)
					NEXT RECORD:C51([PREFERENCES:116])
				End for   //8
				INSERT IN ARRAY:C227(DM_at_BKStoreName; Size of array:C274(DM_at_BKStoreName)+1; 2)
				INSERT IN ARRAY:C227(DM_al_BKStoreIDs; Size of array:C274(DM_al_BKStoreIDs)+1; 2)
				DM_at_BKStoreName{Size of array:C274(DM_at_BKStoreName)}:="Add Store"
				DM_at_BKStoreName{Size of array:C274(DM_at_BKStoreName)-1}:="-"
			Else   //7
				
			End if   //7
			If (Size of array:C274(DM_at_BKStoreName)=0)  //9
				OBJECT SET VISIBLE:C603(DM_at_BKStoreName; False:C215)
				OBJECT SET VISIBLE:C603(*; "DM_Pi_BKStorePop"; False:C215)
			End if   //9
		Else   //6
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=DM_l_BkstoreID)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_t_BKStoreName; $_l_offset)
			OBJECT SET VISIBLE:C603(DM_at_BKStoreName; False:C215)
			OBJECT SET VISIBLE:C603(*; "DM_Pi_BKStorePop"; False:C215)
		End if   //6
		
		DM_l_BkserverIDOLD:=DM_l_BkserverID  //so we can reset stores if it changes
		ARRAY TEXT:C222(DM_at_BKModelNames; 0)
		ARRAY LONGINT:C221(DM_al_BKModelIDS; 0)
		ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; 0)
		ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; 0)
		$_l_Retries:=0
		While (Semaphore:C143("LoadingDataModelPrefs"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		READ ONLY:C145([PREFERENCES:116])
		$_l_ItemID:=PREF_GetPreferenceID("Data Model Names")
		If ($_l_ItemID>0)
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			//here use a Check_Locked
			
			If (Records in selection:C76([PREFERENCES:116])=0)  //11
				//add the the preferences list here
				READ WRITE:C146([PREFERENCES:116])
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[EW_BK_FieldMap:121])
				[PREFERENCES:116]Pref_OwnerID:4:=-2
				DB_SaveRecord(->[PREFERENCES:116])
			Else 
			End if   //this will be ONE record`11
			DM_BKDataModelBlobtoVariables
			$_l_ArraySize:=Size of array:C274(DM_at_BKModelNames)
			ARRAY TEXT:C222(DM_at_BKModelNames; $_l_ArraySize)
			ARRAY LONGINT:C221(DM_al_BKModelIDS; $_l_ArraySize)
			ARRAY LONGINT:C221(DM_al_BKAssModel1IDS; $_l_ArraySize)
			ARRAY LONGINT:C221(DM_al_BKAssModel2IDS; $_l_ArraySize)
			CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
			
			If (DM_l_BKDataModelID=0)  //12
				OBJECT SET VISIBLE:C603(DM_al_BKModelIDS; True:C214)
				INSERT IN ARRAY:C227(DM_at_BKModelNames; Size of array:C274(DM_at_BKModelNames)+1; 2)
				INSERT IN ARRAY:C227(DM_al_BKModelIDS; Size of array:C274(DM_al_BKModelIDS)+1; 2)
				INSERT IN ARRAY:C227(DM_al_BKAssModel1IDS; Size of array:C274(DM_al_BKAssModel1IDS)+1; 2)
				INSERT IN ARRAY:C227(DM_al_BKAssModel2IDS; Size of array:C274(DM_al_BKAssModel2IDS)+1; 2)
				
				DM_at_BKModelNames{Size of array:C274(DM_at_BKModelNames)}:="New Data Model"
				DM_at_BKModelNames{Size of array:C274(DM_at_BKModelNames)-1}:="-"
				DM_l_BKDataModelID:=0
				DM_t_BKModelName:=""
			Else   //12
				OBJECT SET VISIBLE:C603(DM_al_BKModelIDS; False:C215)
				$_l_ModelPosition:=Find in array:C230(DM_al_BKModelIDS; DM_l_BKDataModelID)
				If ($_l_ModelPosition<0)  //13
					DM_l_BKDataModelID:=0
					DM_t_BKModelName:=""
				Else   //13
					DM_t_BKModelName:=DM_at_BKModelNames{$_l_ModelPosition}
					DM_l_ConnectionContext:=DM_GetModelContext(DM_l_BKDataModelID)
				End if   //13
			End if   //12
			DM_ti_BkLastUpdateTime:=Time:C179(Time string:C180(DM_l_BkLastUpdateTime))
			OBJECT SET FORMAT:C236(DM_ti_BkLastUpdateTime; "HH:MM")
			If (DM_t_BkFrequencyType#"")  //14
				Case of   //15
					: (DM_t_BkFrequencyType="M")
						DM_t_BKFREQUENCYTYPE:="Minutes"
					: (DM_t_BkFrequencyType="H")
						DM_t_BKFREQUENCYTYPE:="Hours"
					: (DM_t_BkFrequencyType="D")
						DM_t_BKFREQUENCYTYPE:="Days"
				End case   //15
				
			Else   //14
				DM_t_BKFREQUENCYTYPE:="Not Set"
			End if   //14
			If (DM_l_ConnectionContext>0)  //16
				$_l_Retries:=0
				While (Semaphore:C143("LoadingDataModelPrefs"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*$_l_Retries)
				End while 
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
				QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=(DM_l_ConnectionContext))
				ARRAY LONGINT:C221(DM_al_BKOptions; Records in selection:C76([PREFERENCES:116]))
				ARRAY TEXT:C222(DM_at_BKoptions; Records in selection:C76([PREFERENCES:116]))
				FIRST RECORD:C50([PREFERENCES:116])
				$_t_OptionsName:=""
				For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))  //17
					$_l_offset:=0
					DM_al_BKOptions{$_l_Index}:=[PREFERENCES:116]IDNumber:1
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)  //18
						
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_OptionsName; $_l_offset)
						DM_at_BKoptions{$_l_Index}:=$_t_OptionsName
						NEXT RECORD:C51([PREFERENCES:116])
					End if   //18
				End for   //17
				CLEAR SEMAPHORE:C144("LoadingDataModelPrefs")
				
				
				If (DM_l_BKOptions>0)  //19
					// DM_t_BKOptionsName
					OBJECT SET VISIBLE:C603(DM_at_BKoptions; False:C215)
					$_l_ModelPosition:=Find in array:C230(DM_al_BKOptions; DM_l_BKOptions)
					If ($_l_ModelPosition>0)  //20
						//DM_t_BKOPTIONS
						DM_t_BKOPTIONS:=DM_at_BKoptions{$_l_ModelPosition}
					End if   //20
					
				Else   //19
					If (DM_l_ConnectionContext>0)  //22
						INSERT IN ARRAY:C227(DM_at_BKoptions; Size of array:C274(DM_at_BKoptions)+1; 2)
						INSERT IN ARRAY:C227(DM_al_BKOptions; Size of array:C274(DM_al_BKOptions)+1; 2)
						
						DM_at_BKoptions{Size of array:C274(DM_at_BKoptions)}:="New Data Options"
						DM_at_BKoptions{Size of array:C274(DM_at_BKoptions)-1}:="-"
						DM_t_BKOPTIONS:=""
						DM_l_BKOptions:=0
					End if   //22
					
				End if   //19
			Else   //16
				DM_t_BKOPTIONS:=""
				DM_l_BKOptions:=0
				
			End if   //16
			If (DM_l_BkRetrieveType>0)  //23
				If (DM_l_BkRetrieveType<5)
					DM_t_BkRetrieveType:=DM_at_BKRetreiveOptions{DM_l_BkRetrieveType}
				Else   //23
					DM_t_BkRetrieveType:=DM_at_BKRetreiveOptions{DM_l_BkRetrieveType-1}
				End if   //23
				If (DM_l_BkRetrieveType=3)  //24
					OBJECT SET VISIBLE:C603(*; "DM_o_RecordsLabel"; True:C214)
					OBJECT SET VISIBLE:C603(DM_l_RecordCount; True:C214)
				End if   //24
				If (DM_l_BKRetrieveType=6)  //25
					OBJECT SET VISIBLE:C603(*; "DM_o_CustomLabel"; True:C214)
					OBJECT SET VISIBLE:C603(DM_T_CustomQuery; True:C214)
					
				End if   //25
				If (DM_l_BKPostAction>0)  //26
					DM_t_BKPOSTACTION:=BK_at_Postaction{DM_l_BKPostAction}
				End if   //26
				If (DM_l_BkFrequency>0)  //27 `
					Case of 
						: (DM_t_BkFrequencyType="M")
							DM_t_BKFREQUENCYTYPE:="Minutes"
						: (DM_t_BkFrequencyType="H")
							DM_t_BKFREQUENCYTYPE:="Hours"
						: (DM_t_BkFrequencyType="D")
							DM_t_BKFREQUENCYTYPE:="Days"
					End case 
					
				End if   //27
				
			End if 
		End if 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:BK_ImportSetup"; $_t_oldMethodName)
