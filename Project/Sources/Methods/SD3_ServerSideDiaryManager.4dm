//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_ServerSideDiaryManager
	//------------------ Method Notes ------------------
	//This method is to implement the 'passive diary concept'
	//this is a worker method
	//this worker is called when a diary record is modified-via the trigger through a service process
	//the service process 'packs' the record into an object and passes the object to the worker.
	//the worker adds it to a stack of unprocessed object then calls itself
	
	
	
	
	
	
	// Method: SD3_ServerSideDiaryManager
	// ----------------------------------------------------
	// Based on Code f John Baughmanxxx   
	// ----------------------------------------------------
	// // Description
	//...This single mehod handles all the monitoring duties
	//...It serves as both the Worker Method itself and as a conduit to call the worker.
	//...It manages the Workers location, Server or Standalone, and all calls to the worker except those from the Table Triggers.
	//...Drop this method into any database to have a table update monitoring system.
	//...Look at the TableMonitor project form for examples of how to call this method.
	//...Look at the [Patient Record] table trigger to see how to setup your triggers.
	//------------------ Revision Control ----------------
	//Date Created:  23/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_RecordTypes; 0)
	ARRAY LONGINT:C221($_al_Tables; 0)
	ARRAY LONGINT:C221($_al_ThreadIDS; 0)
	ARRAY LONGINT:C221($_al_UpdateDiaryIDS; 0)
	//ARRAY LONGINT(IP_al_CallBackWindowID;0)
	//ARRAY LONGINT(IP_al_LastCallStamp;0)
	//ARRAY LONGINT(IP_al_MonitorTableNumber;0)
	//ARRAY LONGINT(IP_at_DiaryRecordCode;0)
	ARRAY OBJECT:C1221($_aobj_DiaryRecords; 0)
	//ARRAY OBJECT(IP_aOBJ_Attributes;0)
	//ARRAY OBJECT(IP_aobj_ClientIncAttributes;0)
	//ARRAY OBJECT(IP_aObj_DiaryRecords;0)
	//ARRAY OBJECT(IP_aObj_MatchAttributes;0)
	ARRAY REAL:C219($_ar_Range; 0)
	ARRAY REAL:C219($_ar_Rates; 0)
	ARRAY REAL:C219($_ar_Units; 0)
	ARRAY REAL:C219($_ar_Values; 0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_CampaignUUIDS; 0)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_DiaryItemOwners; 0)
	ARRAY TEXT:C222($_at_DocumentCodes; 0)
	ARRAY TEXT:C222($_at_EmailAddresses; 0)
	ARRAY TEXT:C222($_at_EmailHeadings; 0)
	ARRAY TEXT:C222($_at_EmailSContents; 0)
	ARRAY TEXT:C222($_at_EmailStates; 0)
	ARRAY TEXT:C222($_at_EmailSubjects; 0)
	ARRAY TEXT:C222($_at_ObjectAttributes; 0)
	ARRAY TEXT:C222($_at_OwnedDiaryRecords; 0)
	ARRAY TEXT:C222($_at_Priorities; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_RecordFields; 0)
	ARRAY TEXT:C222($_at_RelatedCodes; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_Units; 0)
	ARRAY TEXT:C222($_at_UpdateDiaryCodes; 0)
	//ARRAY TEXT(IP_at_AttributesID;0)
	//ARRAY TEXT(IP_at_CallBackMethod;0)
	//ARRAY TEXT(IP_at_ClientID;0)
	//ARRAY TEXT(IP_at_ClientSubscriptionID;0)
	//ARRAY TEXT(IP_at_DiaryRecords;0;0)
	//ARRAY TEXT(IP_at_MatchAttributesID;0)
	C_BOOLEAN:C305($_bo_MatchProperties; $_bo_ObjectMatch; IP_bo_ClientArrayDeclared; IP_bo_DiaryArrayDeclared; IP_bo_MatchArrayDeclared)
	C_LONGINT:C283($_bo_ProcessVisible; $_l_ArrrayRow; $_l_BuildData; $_l_CheckRecords; $_l_ClientSubsPosition; $_l_Column; $_l_CurrentTimeStamp; $_l_DiaryCache; $_l_FindID; $_l_ProcessOrigin; $_l_ProcessState)
	C_LONGINT:C283($_l_ProcessTime; $_l_RecordRef; $_l_ref; $_l_Ref2; $_l_TableNumber; $_l_UniqueProcessID; $_l_Update; $_l_WindowID; $_l_WorkerProcess)
	C_OBJECT:C1216($_obj_Attributes; $_obj_CallerObject; $_obj_DiaryRecord; $_obj_IncludeAttributes; $_obj_RecordAttributes; $1)
	C_TEXT:C284(<>IP_t_CurrentRegisteredUser; $_t_ClientID; $_t_ClientSubscriptionID; $_t_DiaryCode; $_t_Method; $_t_oldMethodName; $_t_ProcessName; $_t_WindowMethod)
End if 

//Code Starts Here
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_ServerSideDiaryManager")





PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)

If (Count parameters:C259=0)
	OB SET:C1220($_obj_CallerObject; "action"; "Startup")  //the method run on server will start the worker if no paramaters are passed
	
Else 
	$_obj_CallerObject:=$1
End if 
READ ONLY:C145(*)

ARRAY TEXT:C222($_at_ObjectAttributes; 0)
OB GET PROPERTY NAMES:C1232($_obj_CallerObject; $_at_ObjectAttributes)

$_l_ref:=Find in array:C230($_at_ObjectAttributes; "action")
If ($_l_ref>0)
	Case of 
		: (OB Get:C1224($_obj_CallerObject; "action")="Startup") & (Application type:C494=4D Remote mode:K5:5)  //On a client. Need to Execute on server.                                                                        
			If (Process number:C372("DiaryMonitor"; *)=0)
				$_l_WorkerProcess:=Execute on server:C373("SD3_ServerSideDiaryManager"; 0; "startupOnServer"; $_obj_CallerObject)
				
			End if 
			
		: (OB Get:C1224($_obj_CallerObject; "action")="Startup") & (Process number:C372("DiaryMonitor"; *)=0)  //On  server or standalone. Need to execute CALL WORKER to initialize itself.
			CALL WORKER:C1389("DiaryMonitor"; "SD3_ServerSideDiaryManager"; $_obj_CallerObject)
			
		: (OB Get:C1224($_obj_CallerObject; "action")="Startup") & ($_l_ProcessOrigin=Worker process:K36:32)  //**Worker has been called to initialize itself**
			
			ARRAY TEXT:C222(IP_at_ClientID; 0)  //this is the connected client 'id'
			ARRAY TEXT:C222(IP_at_CallBackMethod; 0)  //this is the callbackmethod name
			ARRAY LONGINT:C221(IP_al_CallBackWindowID; 0)  //this is the callbackwindowID
			ARRAY LONGINT:C221(IP_al_MonitorTableNumber; 0)  //this is the table number
			ARRAY TEXT:C222(IP_at_ClientSubscriptionID; 0)  //this is the subscription ID
			ARRAY OBJECT:C1221(IP_aobj_ClientIncAttributes; 0)  //this is the current attributes for that window
			ARRAY TEXT:C222(IP_at_AttributesID; 0)
			IP_bo_ClientArrayDeclared:=True:C214
			///
			ARRAY TEXT:C222(IP_at_MatchAttributesID; 0)  //The is a list of the monitored attributes IDS(we just assign an iD) ARRAY OBJECT(IP_aOBJ_Attributes;0)  //This is is list of the attributes that make that list ARRAY OBJECT(IP_al_LastCallStamp;0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them ARRAY TEXT(IP_at_DiaryRecords;0;0)  //this is the list of diary records that match the attributes. ;0)  //The is a list of the monitored attributes IDS(we just assign an iD)
			ARRAY OBJECT:C1221(IP_aOBJ_Attributes; 0)  //This is is list of the attributes that make that list
			ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them
			ARRAY TEXT:C222(IP_at_DiaryRecords; 0; 0)  //this is the list of diary records that match the attributes.
			IP_bo_MatchArrayDeclared:=True:C214
			
			ARRAY OBJECT:C1221(IP_aObj_DiaryRecords; 0)  //This is an array of the diary record data as an object
			ARRAY TEXT:C222(IP_at_DiaryRecordCode; 0)
			ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)
			IP_bo_DiaryArrayDeclared:=True:C214
			
		: (OB Get:C1224($_obj_CallerObject; "action")="Subscribe") & (Application type:C494=4D Remote mode:K5:5)  //On a client. Need to REGISTER CLIENT if not Registered and Execute the subscription on the server
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "client_id")
			If ($_l_ref>0)
				Case of 
					: (OB Get:C1224($_obj_CallerObject; "client_id")="") & (<>IP_t_CurrentRegisteredUser="")
						//The first subscriber on this computer will establish the client registration name
						//I know you hate globals, but what else can I use here to make the Client Registration name used for the subscription available to all the monitoring windows on this computer.
						<>IP_t_CurrentRegisteredUser:=Current user:C182+"_"+Current machine:C483
						UNREGISTER CLIENT:C649
						REGISTER CLIENT:C648(<>IP_t_CurrentRegisteredUser)
						OB SET:C1220($_obj_CallerObject; "client_id"; <>IP_t_CurrentRegisteredUser)
					: (OB Get:C1224($_obj_CallerObject; "client_id")="")
						OB SET:C1220($_obj_CallerObject; "client_id"; <>IP_t_CurrentRegisteredUser)
						
						
				End case 
				
				$_l_WorkerProcess:=Execute on server:C373("SD3_ServerSideDiaryManager"; 0; "Subscribe"; $_obj_CallerObject)
			End if 
		: (OB Get:C1224($_obj_CallerObject; "action")="Subscribe") & ($_l_ProcessOrigin#Worker process:K36:32)  //On stadalone. A window has asked to be Subscribed so call the workder.
			CALL WORKER:C1389("DiaryMonitor"; ""; $_obj_CallerObject)
			
		: (OB Get:C1224($_obj_CallerObject; "action")="Subscribe")  //**Worker subscribes the window** 
			//BEEP
			If (Not:C34(IP_bo_DiaryArrayDeclared))
				ARRAY TEXT:C222(IP_at_DiaryRecordCode; 0)
				ARRAY OBJECT:C1221(IP_aObj_DiaryRecords; 0)
				ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)
				IP_bo_DiaryArrayDeclared:=True:C214
				
			End if 
			If (Not:C34(IP_bo_ClientArrayDeclared))
				ARRAY TEXT:C222(IP_at_ClientID; 0)  //this is the connected client 'id'
				ARRAY TEXT:C222(IP_at_CallBackMethod; 0)  //this is the callbackmethod name
				ARRAY LONGINT:C221(IP_al_CallBackWindowID; 0)  //this is the callbackwindowID
				ARRAY LONGINT:C221(IP_al_MonitorTableNumber; 0)  //this is the table number
				ARRAY TEXT:C222(IP_at_ClientSubscriptionID; 0)  //this is the subscription ID
				ARRAY OBJECT:C1221(IP_aobj_ClientIncAttributes; 0)  //this is the current attributes for that window
				ARRAY TEXT:C222(IP_at_AttributesID; 0)
				IP_bo_ClientArrayDeclared:=True:C214
				
			End if 
			If (Not:C34(IP_bo_MatchArrayDeclared))
				ARRAY TEXT:C222(IP_at_MatchAttributesID; 0)  //The is a list of the monitored attributes IDS(we just assign an iD) ARRAY OBJECT(IP_aOBJ_Attributes;0)  //This is is list of the attributes that make that list ARRAY OBJECT(IP_al_LastCallStamp;0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them ARRAY TEXT(IP_at_DiaryRecords;0;0)  //this is the list of diary records that match the attributes. ;0)  //The is a list of the monitored attributes IDS(we just assign an iD)
				ARRAY OBJECT:C1221(IP_aOBJ_Attributes; 0)  //This is is list of the attributes that make that list
				ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them
				ARRAY TEXT:C222(IP_at_DiaryRecords; 0; 0)  //this is the list of diary records that match the attributes.
				IP_bo_MatchArrayDeclared:=True:C214
			End if 
			
			
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "client_id")
			If ($_l_ref>0)
				$_t_ClientID:=OB Get:C1224($_obj_CallerObject; "client_id")
				$_l_ref:=Find in array:C230($_at_ObjectAttributes; "window_id")
				If ($_l_ref>0)
					$_l_WindowID:=OB Get:C1224($_obj_CallerObject; "window_id"; Is longint:K8:6)  //note that shcedule/history etc all are different window IDS
					$_l_ref:=Find in array:C230($_at_ObjectAttributes; "table_num")
					If ($_l_ref>0)
						$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
						$_l_ref:=Find in array:C230($_at_ObjectAttributes; "Include_Properties")
						If ($_l_ref>0)
							$_obj_IncludeAttributes:=OB Get:C1224($_obj_CallerObject; "Include_Properties"; Is object:K8:27)
							
							$_t_ClientSubscriptionID:=$_t_ClientID+":"+String:C10($_l_WindowID)+":"+String:C10($_l_TableNumber)
							//Using this compound ID, a window can monitor more than 1 table by Subscribing for each table. Necessary for Unsubscribing in order to unsubscribe the correct subscription.
							If (Count in array:C907(IP_at_ClientSubscriptionID; $_t_ClientSubscriptionID)=0)
								//BEEP  //let me know that the subscription worked
								
								If (Application type:C494=4D Local mode:K5:1)  //have to force standalone in case a client name was passed inadvertantly
									APPEND TO ARRAY:C911(IP_at_ClientID; "")
								Else 
									$_t_ClientID:=OB Get:C1224($_obj_CallerObject; "client_id")
									APPEND TO ARRAY:C911(IP_at_ClientID; $_t_ClientID)
								End if 
								$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
								$_t_Method:=OB Get:C1224($_obj_CallerObject; "method")
								$_l_WindowID:=OB Get:C1224($_obj_CallerObject; "window_id"; Is longint:K8:6)
								$_obj_IncludeAttributes:=OB Get:C1224($_obj_CallerObject; "Include_Properties"; Is object:K8:27)
								
								APPEND TO ARRAY:C911(IP_at_CallBackMethod; $_t_Method)
								APPEND TO ARRAY:C911(IP_al_CallBackWindowID; $_l_WindowID)
								APPEND TO ARRAY:C911(IP_al_MonitorTableNumber; $_l_TableNumber)
								APPEND TO ARRAY:C911(IP_at_ClientSubscriptionID; $_t_ClientSubscriptionID)
								APPEND TO ARRAY:C911(IP_aobj_ClientIncAttributes; $_obj_IncludeAttributes)
								APPEND TO ARRAY:C911(IP_at_AttributesID; "")
								For ($_l_FindID; 1; Size of array:C274(IP_aOBJ_Attributes))
									//so here we have to compare the $_obj_IncludeAttributes with IP_aOBJ_Attributes
									$_bo_ObjectMatch:=SD3_CompareObjects(IP_aOBJ_Attributes{$_l_FindID}; $_obj_IncludeAttributes)
									If ($_bo_ObjectMatch)
										IP_at_AttributesID{Size of array:C274(IP_at_AttributesID)}:=IP_at_MatchAttributesID{$_l_FindID}
										$_l_FindID:=Size of array:C274(IP_aOBJ_Attributes)  //skip out
									End if 
								End for 
								If (UTIL_isUUIDNil(IP_at_AttributesID{Size of array:C274(IP_at_AttributesID)}))
									
									//we are not already monitoring this.
									APPEND TO ARRAY:C911(IP_at_MatchAttributesID; Generate UUID:C1066)
									APPEND TO ARRAY:C911(IP_aOBJ_Attributes; $_obj_IncludeAttributes)
									APPEND TO ARRAY:C911(IP_al_LastCallStamp; 0)
									INSERT IN ARRAY:C227(IP_at_DiaryRecords; Size of array:C274(IP_at_DiaryRecords)+1; 1)
									IP_at_AttributesID{Size of array:C274(IP_at_AttributesID)}:=IP_at_MatchAttributesID{Size of array:C274(IP_at_MatchAttributesID)}
								End if 
								$_l_Update:=Find in array:C230(IP_at_MatchAttributesID; IP_at_AttributesID{Size of array:C274(IP_at_AttributesID)})
								If ($_l_Update>0)  //it should be!!
									//we only need to 'reply' to the calling ID-we dont need to send this to any others.
									$_obj_Attributes:=IP_aOBJ_Attributes{$_l_Update}
									If (Size of array:C274(IP_at_DiaryRecords{$_l_Update})=0)  //we dont know what records match the attributes so we will find them
										//note that the attributes are conjuctive as in whose diary & dates match & time matches and Relations Match etc. there is no concept of Date OR... except where there is a list of people/dates/relations etc
										SD3_FindDiaryRecordsByAttribute(->$_obj_Attributes)
										SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; IP_at_DiaryRecords{$_l_Update})
										//now this is built we can despatch to to the subscribed windows.
										//here we need this to then call itself to distribute the correct object to the client
										
									End if 
									ARRAY OBJECT:C1221($_aobj_DiaryRecords; 0)
									For ($_l_BuildData; 1; Size of array:C274(IP_at_DiaryRecords{$_l_Update}))
										If (IP_at_DiaryRecords{$_l_Update}{$_l_BuildData}#"")
											
											$_l_DiaryCache:=Find in array:C230(IP_at_DiaryRecordCode; IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
											If ($_l_DiaryCache<0)
												//this would happen when the selection is inited on first update.
												QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
												If (Records in selection:C76([DIARY:12])>0)
													$_obj_DiaryRecord:=SD_SendtoWorflow([DIARY:12]Diary_Code:3; [DIARY:12]Person:8; False:C215)
													APPEND TO ARRAY:C911(IP_at_DiaryRecordCode; [DIARY:12]Diary_Code:3)
													APPEND TO ARRAY:C911(IP_aObj_DiaryRecords; $_obj_DiaryRecord)
													$_l_DiaryCache:=Find in array:C230(IP_at_DiaryRecordCode; IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
												End if 
												If ($_l_DiaryCache>0)
													APPEND TO ARRAY:C911($_aobj_DiaryRecords; IP_aObj_DiaryRecords{$_l_DiaryCache})
													
												End if 
												
											End if 
										End if 
									End for 
									
									
									OB SET:C1220($_obj_CallerObject; "action"; "CallForm")
									OB SET:C1220($_obj_CallerObject; "method"; $_t_Method)
									OB SET:C1220($_obj_CallerObject; "window_id"; $_l_WindowID)
									If ($_t_ClientID#"")
										EXECUTE ON CLIENT:C651($_t_ClientID; "SD3_ServerSideDiaryManager"; $_obj_CallerObject)
									Else 
										SD3_ServerSideDiaryManager($_obj_CallerObject)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		: (OB Get:C1224($_obj_CallerObject; "action")="ChangeAttributes")  //**Worker changes the viewed attributes the window** 
			If (Not:C34(IP_bo_DiaryArrayDeclared))
				ARRAY TEXT:C222(IP_at_DiaryRecordCode; 0)
				ARRAY OBJECT:C1221(IP_aObj_DiaryRecords; 0)
				ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)
				IP_bo_DiaryArrayDeclared:=True:C214
			End if 
			If (Not:C34(IP_bo_ClientArrayDeclared))
				ARRAY TEXT:C222(IP_at_ClientID; 0)  //this is the connected client 'id'
				ARRAY TEXT:C222(IP_at_CallBackMethod; 0)  //this is the callbackmethod name
				ARRAY LONGINT:C221(IP_al_CallBackWindowID; 0)  //this is the callbackwindowID
				ARRAY LONGINT:C221(IP_al_MonitorTableNumber; 0)  //this is the table number
				ARRAY TEXT:C222(IP_at_ClientSubscriptionID; 0)  //this is the subscription ID
				ARRAY OBJECT:C1221(IP_aobj_ClientIncAttributes; 0)  //this is the current attributes for that window
				ARRAY TEXT:C222(IP_at_AttributesID; 0)
				IP_bo_ClientArrayDeclared:=True:C214
				
			End if 
			If (Not:C34(IP_bo_MatchArrayDeclared))
				ARRAY TEXT:C222(IP_at_MatchAttributesID; 0)  //The is a list of the monitored attributes IDS(we just assign an iD) ARRAY OBJECT(IP_aOBJ_Attributes;0)  //This is is list of the attributes that make that list ARRAY OBJECT(IP_al_LastCallStamp;0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them ARRAY TEXT(IP_at_DiaryRecords;0;0)  //this is the list of diary records that match the attributes. ;0)  //The is a list of the monitored attributes IDS(we just assign an iD)
				ARRAY OBJECT:C1221(IP_aOBJ_Attributes; 0)  //This is is list of the attributes that make that list
				ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them
				ARRAY TEXT:C222(IP_at_DiaryRecords; 0; 0)  //this is the list of diary records that match the attributes.
				IP_bo_MatchArrayDeclared:=True:C214
			End if 
			
			//the attributes are changing
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "client_id")
			If ($_l_ref>0)
				$_t_ClientID:=OB Get:C1224($_obj_CallerObject; "client_id")
				$_l_ref:=Find in array:C230($_at_ObjectAttributes; "window_id")
				If ($_l_ref>0)
					$_l_WindowID:=OB Get:C1224($_obj_CallerObject; "window_id"; Is longint:K8:6)  //note that shcedule/history etc all are different window IDS
					$_l_ref:=Find in array:C230($_at_ObjectAttributes; "table_num")
					If ($_l_ref>0)
						$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
						$_l_ref:=Find in array:C230($_at_ObjectAttributes; "Include_Properties")
						If ($_l_ref>0)
							$_obj_IncludeAttributes:=OB Get:C1224($_obj_CallerObject; "Include_Properties"; Is object:K8:27)
							
							$_t_ClientSubscriptionID:=$_t_ClientID+":"+String:C10($_l_WindowID)+":"+String:C10($_l_TableNumber)
							//Using this compound ID, a window can monitor more than 1 table by Subscribing for each table. Necessary for Unsubscribing in order to unsubscribe the correct subscription.
							$_l_ArrrayRow:=Find in array:C230(IP_at_ClientSubscriptionID; $_t_ClientSubscriptionID)
							If ($_l_ArrrayRow>0)
								$_obj_IncludeAttributes:=OB Get:C1224($_obj_CallerObject; "Include_Properties"; Is object:K8:27)
								IP_aobj_ClientIncAttributes{$_l_ArrrayRow}:=$_obj_IncludeAttributes
								//this will also mean the client attributes ID changes
								IP_at_AttributesID{$_l_ArrrayRow}:=""
								For ($_l_FindID; 1; Size of array:C274(IP_aOBJ_Attributes))
									//so here we have to compare the $_obj_IncludeAttributes with IP_aOBJ_Attributes
									$_bo_ObjectMatch:=SD3_CompareObjects(IP_aOBJ_Attributes{$_l_FindID}; $_obj_IncludeAttributes)
									If ($_bo_ObjectMatch)
										IP_at_AttributesID{$_l_ArrrayRow}:=IP_at_MatchAttributesID{$_l_FindID}
										$_l_FindID:=Size of array:C274(IP_aOBJ_Attributes)  //skip out
									End if 
								End for 
								If (UTIL_isUUIDNil(IP_at_AttributesID{$_l_ArrrayRow}))
									//we are not already monitoring this.
									APPEND TO ARRAY:C911(IP_at_MatchAttributesID; Generate UUID:C1066)
									APPEND TO ARRAY:C911(IP_aOBJ_Attributes; $_obj_IncludeAttributes)
									APPEND TO ARRAY:C911(IP_al_LastCallStamp; 0)
									INSERT IN ARRAY:C227(IP_at_DiaryRecords; Size of array:C274(IP_at_DiaryRecords)+1; 1)
									IP_at_AttributesID{Size of array:C274(IP_at_AttributesID)}:=IP_at_MatchAttributesID{Size of array:C274(IP_at_MatchAttributesID)}
								End if 
								$_l_Update:=Find in array:C230(IP_at_MatchAttributesID; IP_at_AttributesID{Size of array:C274(IP_at_AttributesID)})
								If ($_l_Update>0)  //it should be!!
									//we only need to 'reply' to the calling ID-we dont need to send this to any others.
									$_obj_Attributes:=IP_aOBJ_Attributes{$_l_Update}
									If (Size of array:C274(IP_at_DiaryRecords{$_l_Update})=0)  //we dont know what records match the attributes so we will find them
										//note that the attributes are conjuctive as in whose diary & dates match & time matches and Relations Match etc. there is no concept of Date OR... except where there is a list of people/dates/relations etc
										SD3_FindDiaryRecordsByAttribute(->$_obj_Attributes)
										SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; IP_at_DiaryRecords{$_l_Update})
										//now this is built we can despatch to to the subscribed windows.
										//here we need this to then call itself to distribute the correct object to the client
										
									End if 
									ARRAY OBJECT:C1221($_aobj_DiaryRecords; 0)
									For ($_l_BuildData; 1; Size of array:C274(IP_at_DiaryRecords{$_l_Update}))
										If (IP_at_DiaryRecords{$_l_Update}{$_l_BuildData}#"")
											
											$_l_DiaryCache:=Find in array:C230(IP_at_DiaryRecordCode; IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
											If ($_l_DiaryCache<0)
												//this would happen when the selection is inited on first update.
												QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
												If (Records in selection:C76([DIARY:12])>0)
													$_obj_DiaryRecord:=SD_SendtoWorflow([DIARY:12]Diary_Code:3; [DIARY:12]Person:8; False:C215)
													APPEND TO ARRAY:C911(IP_at_DiaryRecordCode; [DIARY:12]Diary_Code:3)
													APPEND TO ARRAY:C911(IP_aObj_DiaryRecords; $_obj_DiaryRecord)
													$_l_DiaryCache:=Find in array:C230(IP_at_DiaryRecordCode; IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
												End if 
												If ($_l_DiaryCache>0)
													APPEND TO ARRAY:C911($_aobj_DiaryRecords; IP_aObj_DiaryRecords{$_l_DiaryCache})
													
												End if 
												
											End if 
										End if 
									End for 
									OB SET:C1220($_obj_CallerObject; "action"; "CallForm")
									OB SET:C1220($_obj_CallerObject; "method"; $_t_Method)
									OB SET:C1220($_obj_CallerObject; "window_id"; $_l_WindowID)
									If ($_t_ClientID#"")
										EXECUTE ON CLIENT:C651($_t_ClientID; "SD3_ServerSideDiaryManager"; $_obj_CallerObject)
									Else 
										SD3_ServerSideDiaryManager($_obj_CallerObject)
									End if 
								End if 
								
								
								//here we need this to then call itself to distribute the correct object to the client
							End if 
						End if 
					End if 
				End if 
			End if 
			
			
		: (OB Get:C1224($_obj_CallerObject; "action")="Unsubscribe") & (Application type:C494=4D Remote mode:K5:5)  //On client. Need to execute on server
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "client_id")
			If ($_l_ref>0)
				$_t_ClientID:=OB Get:C1224($_obj_CallerObject; "client_id"; Is text:K8:3)
				If ($_t_ClientID="")
					OB SET:C1220($_obj_CallerObject; "client_id"; <>IP_t_CurrentRegisteredUser)
					
				End if 
				$_l_WorkerProcess:=Execute on server:C373("SD3_ServerSideDiaryManager"; 0; "Unsubscribe"; $_obj_CallerObject)
			End if 
		: (OB Get:C1224($_obj_CallerObject; "action")="Unsubscribe") & ($_l_ProcessOrigin#Worker process:K36:32)  //On standalone. A window is asking to be unsubscribed
			CALL WORKER:C1389("DiaryMonitor"; ""; $_obj_CallerObject)
			
		: (OB Get:C1224($_obj_CallerObject; "action")="Unsubscribe")  //**Worker unsubscribes the client**
			If (Not:C34(IP_bo_ClientArrayDeclared))
				ARRAY TEXT:C222(IP_at_ClientID; 0)  //this is the connected client 'id'
				ARRAY TEXT:C222(IP_at_CallBackMethod; 0)  //this is the callbackmethod name
				ARRAY LONGINT:C221(IP_al_CallBackWindowID; 0)  //this is the callbackwindowID
				ARRAY LONGINT:C221(IP_al_MonitorTableNumber; 0)  //this is the table number
				ARRAY TEXT:C222(IP_at_ClientSubscriptionID; 0)  //this is the subscription ID
				ARRAY OBJECT:C1221(IP_aobj_ClientIncAttributes; 0)  //this is the current attributes for that window
				ARRAY TEXT:C222(IP_at_AttributesID; 0)
				IP_bo_ClientArrayDeclared:=True:C214
				
			End if 
			
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "client_id")
			If ($_l_ref>0)
				$_t_ClientID:=OB Get:C1224($_obj_CallerObject; "client_id")
				$_l_ref:=Find in array:C230($_at_ObjectAttributes; "window_id")
				If ($_l_ref>0)
					$_l_WindowID:=OB Get:C1224($_obj_CallerObject; "window_id"; Is longint:K8:6)
					$_l_ref:=Find in array:C230($_at_ObjectAttributes; "table_num")
					If ($_l_ref>0)
						$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
						$_t_ClientSubscriptionID:=$_t_ClientID+":"+String:C10($_l_WindowID)+":"+String:C10($_l_TableNumber)
						$_l_ClientSubsPosition:=Find in array:C230(IP_at_ClientSubscriptionID; $_t_ClientSubscriptionID)
						If ($_l_ClientSubsPosition>0)
							DELETE FROM ARRAY:C228(IP_at_ClientID; $_l_ClientSubsPosition)
							DELETE FROM ARRAY:C228(IP_at_CallBackMethod; $_l_ClientSubsPosition)
							DELETE FROM ARRAY:C228(IP_al_CallBackWindowID; $_l_ClientSubsPosition)
							DELETE FROM ARRAY:C228(IP_al_MonitorTableNumber; $_l_ClientSubsPosition)
							DELETE FROM ARRAY:C228(IP_at_ClientSubscriptionID; $_l_ClientSubsPosition)
							DELETE FROM ARRAY:C228(IP_aobj_ClientIncAttributes; $_l_ClientSubsPosition)
							DELETE FROM ARRAY:C228(IP_at_AttributesID; $_l_ClientSubsPosition)
							
						End if 
					End if 
				End if 
			End if 
		: (OB Get:C1224($_obj_CallerObject; "action")="Trigger") & (Application type:C494=4D Remote mode:K5:5)  //**This is a worker call from a table trigger**
			//this is not a real trigger-it is code fired by an action on the client
			OB SET:C1220($_obj_CallerObject; "action"; "Pseudotrigger")
			$_l_WorkerProcess:=Execute on server:C373("SD3_ServerSideDiaryManager"; 0; "Pseudotrigger"; $_obj_CallerObject)
		: (OB Get:C1224($_obj_CallerObject; "action")="Trigger_PRINT") & (Application type:C494=4D Remote mode:K5:5)  //**This is a worker call from a table trigger**
			//this is not a real trigger-it is code fired by an action on the client
			OB SET:C1220($_obj_CallerObject; "action"; "Pseudotrigger_PRINT")
			$_l_WorkerProcess:=Execute on server:C373("SD3_ServerSideDiaryManager"; 0; "Pseudotrigger_PRINT"; $_obj_CallerObject)
			//TRACE
		: (OB Get:C1224($_obj_CallerObject; "action")="Pseudotrigger")
			
			OB SET:C1220($_obj_CallerObject; "action"; "Trigger")
			OB SET:C1220($_obj_CallerObject; "Event"; On Saving Existing Record Event:K3:2)
			CALL WORKER:C1389("DiaryMonitor"; ""; $_obj_CallerObject)
		: (OB Get:C1224($_obj_CallerObject; "action")="Pseudotrigger_PRINT")
			
			OB SET:C1220($_obj_CallerObject; "action"; "Trigger_PRINT")
			OB SET:C1220($_obj_CallerObject; "Event"; On Saving Existing Record Event:K3:2)
			CALL WORKER:C1389("DiaryMonitor"; ""; $_obj_CallerObject)
			
			
			
			
		: (OB Get:C1224($_obj_CallerObject; "action")="Trigger") | (OB Get:C1224($_obj_CallerObject; "action")="Trigger_print")  //**This is a worker call from a table trigger**
			If (Not:C34(IP_bo_ClientArrayDeclared))
				ARRAY TEXT:C222(IP_at_ClientID; 0)  //this is the connected client 'id'
				ARRAY TEXT:C222(IP_at_CallBackMethod; 0)  //this is the callbackmethod name
				ARRAY LONGINT:C221(IP_al_CallBackWindowID; 0)  //this is the callbackwindowID
				ARRAY LONGINT:C221(IP_al_MonitorTableNumber; 0)  //this is the table number
				ARRAY TEXT:C222(IP_at_ClientSubscriptionID; 0)  //this is the subscription ID
				ARRAY OBJECT:C1221(IP_aobj_ClientIncAttributes; 0)  //this is the current attributes for that window
				ARRAY TEXT:C222(IP_at_AttributesID; 0)
				IP_bo_ClientArrayDeclared:=True:C214
				
			End if 
			//If (Not(IP_bo_ArraysInited))
			//trace
			//SD3_ServerSideDiaryManager 
			//NG December 2020. So here on Daybook this has to do some extra work. 
			
			//no need to worry about client/server or standalone as trigger always executes in the same application as the workder
			//or from another action which is triggerring of the change-in this case the list of orders arrays is updated.
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "table_num")
			If ($_l_ref>0)
				$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
				
				$_l_ClientSubsPosition:=Find in array:C230(IP_al_MonitorTableNumber; $_l_TableNumber)
				
				While ($_l_ClientSubsPosition>0)  //notify all the monitors of this table
					
					If (IP_at_ClientID{$_l_ClientSubsPosition}="")  //must be running standalone so call the form direclly
						CALL FORM:C1391(IP_al_CallBackWindowID{$_l_ClientSubsPosition}; IP_at_CallBackMethod{$_l_ClientSubsPosition}; $_obj_CallerObject)
						
					Else   //must be on the serveer so need to EXECUTE ON CLIENT
						
						OB SET:C1220($_obj_CallerObject; "action"; "CallForm")
						OB SET:C1220($_obj_CallerObject; "method"; IP_at_CallBackMethod{$_l_ClientSubsPosition})
						OB SET:C1220($_obj_CallerObject; "window_id"; IP_al_CallBackWindowID{$_l_ClientSubsPosition})
						//Ob Set($_obj_CallerObject;"Data";$_obj_IncomingData)
						If (IP_at_ClientID{$_l_ClientSubsPosition}#"")
							EXECUTE ON CLIENT:C651(IP_at_ClientID{$_l_ClientSubsPosition}; "SD3_ServerSideDiaryManager"; $_obj_CallerObject)
						Else 
							SD3_ServerSideDiaryManager($_obj_CallerObject)
						End if 
					End if 
					$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
					$_l_ClientSubsPosition:=Find in array:C230(IP_al_MonitorTableNumber; $_l_TableNumber; $_l_ClientSubsPosition+1)
					
				End while 
			End if 
		: (OB Get:C1224($_obj_CallerObject; "action")="Include") & (Application type:C494#4D Remote mode:K5:5)  // a diary record (or several) have been modified
			$_l_CurrentTimeStamp:=GEN_TimeDateStamp
			//
			//This is called directly from the process mananger-it is one diary record
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "DataObject")
			If ($_l_ref>0)
				$_obj_DiaryRecord:=OB Get:C1224($_obj_CallerObject; "DataObject")
				
				OB GET PROPERTY NAMES:C1232($_obj_DiaryRecord; $_at_RecordFields; $_al_RecordTypes)
				$_l_Ref2:=Find in array:C230($_at_RecordFields; "RecordCode")
				If ($_l_Ref2>0)
					$_t_DiaryCode:=OB Get:C1224($_obj_DiaryRecord; "RecordCode")
					If (Not:C34(IP_bo_DiaryArrayDeclared))
						ARRAY TEXT:C222(IP_at_DiaryRecordCode; 0)
						ARRAY OBJECT:C1221(IP_aObj_DiaryRecords; 0)
						ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)
						IP_bo_DiaryArrayDeclared:=True:C214
					End if 
					If (Not:C34(IP_bo_ClientArrayDeclared))
						ARRAY TEXT:C222(IP_at_ClientID; 0)  //this is the connected client 'id'
						ARRAY TEXT:C222(IP_at_CallBackMethod; 0)  //this is the callbackmethod name
						ARRAY LONGINT:C221(IP_al_CallBackWindowID; 0)  //this is the callbackwindowID
						ARRAY LONGINT:C221(IP_al_MonitorTableNumber; 0)  //this is the table number
						ARRAY TEXT:C222(IP_at_ClientSubscriptionID; 0)  //this is the subscription ID
						ARRAY OBJECT:C1221(IP_aobj_ClientIncAttributes; 0)  //this is the current attributes for that window
						ARRAY TEXT:C222(IP_at_AttributesID; 0)
						IP_bo_ClientArrayDeclared:=True:C214
						
					End if 
					If (Not:C34(IP_bo_MatchArrayDeclared))
						ARRAY TEXT:C222(IP_at_MatchAttributesID; 0)  //The is a list of the monitored attributes IDS(we just assign an iD) ARRAY OBJECT(IP_aOBJ_Attributes;0)  //This is is list of the attributes that make that list ARRAY OBJECT(IP_al_LastCallStamp;0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them ARRAY TEXT(IP_at_DiaryRecords;0;0)  //this is the list of diary records that match the attributes. ;0)  //The is a list of the monitored attributes IDS(we just assign an iD)
						ARRAY OBJECT:C1221(IP_aOBJ_Attributes; 0)  //This is is list of the attributes that make that list
						ARRAY LONGINT:C221(IP_al_LastCallStamp; 0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them
						ARRAY TEXT:C222(IP_at_DiaryRecords; 0; 0)  //this is the list of diary records that match the attributes.
						IP_bo_MatchArrayDeclared:=True:C214
					End if 
					//ARRAY OBJECT(IP_aObj_DiaryRecords;0)  //This is an array of the diary record data as an object
					//ARRAY LONGINT(IP_at_DiaryRecordCode;0)
					$_l_RecordRef:=Find in array:C230(IP_at_DiaryRecordCode; $_t_DiaryCode)
					If ($_l_RecordRef<0)
						APPEND TO ARRAY:C911(IP_at_DiaryRecordCode; $_t_DiaryCode)
						APPEND TO ARRAY:C911(IP_aObj_DiaryRecords; $_obj_DiaryRecord)
						APPEND TO ARRAY:C911(IP_al_LastCallStamp; $_l_CurrentTimeStamp)
					Else 
						IP_aObj_DiaryRecords{$_l_RecordRef}:=$_obj_DiaryRecord
						IP_al_LastCallStamp{$_l_RecordRef}:=$_l_CurrentTimeStamp
					End if 
					For ($_l_Update; 1; Size of array:C274(IP_at_MatchAttributesID))
						$_obj_Attributes:=IP_aOBJ_Attributes{$_l_Update}
						
						If (Size of array:C274(IP_at_DiaryRecords{$_l_Update})=0)  //we dont know what records match the attributes so we will find them
							//note that the attributes are conjuctive as in whose diary & dates match & time matches and Relations Match etc. there is no concept of Date OR... except where there is a list of people/dates/relations etc
							SD3_FindDiaryRecordsByAttribute(->$_obj_Attributes)
							SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; IP_at_DiaryRecords{$_l_Update})
							//now this is built we can despatch to to the subscribed windows.
							
						Else 
							//the array is already build so is this record in the array
							$_obj_RecordAttributes:=IP_aObj_DiaryRecords{$_l_RecordRef}
							$_bo_MatchProperties:=SD3_MatchDiaryProperties(->$_obj_Attributes; $_at_UpdateDiaryCodes{$_l_CheckRecords}; ->$_obj_RecordAttributes)
							$_l_Column:=Find in array:C230(IP_at_DiaryRecords{$_l_Update}; $_at_UpdateDiaryCodes{$_l_CheckRecords})
							If ($_l_Column>0)
								//this record is in the selection..does if still belong here
								If (Not:C34($_bo_MatchProperties))
									DELETE FROM ARRAY:C228(IP_at_DiaryRecords{$_l_Update}; $_l_Column)
								End if 
							Else 
								If (($_bo_MatchProperties))  //if it is not there do we need to add it
									APPEND TO ARRAY:C911(IP_at_DiaryRecords{$_l_Update}; $_at_UpdateDiaryCodes{$_l_CheckRecords})
								End if 
							End if 
							
							
						End if 
						ARRAY OBJECT:C1221($_aobj_DiaryRecords; 0)
						
						For ($_l_BuildData; 1; Size of array:C274(IP_at_DiaryRecords{$_l_Update}))
							If (IP_at_DiaryRecords{$_l_Update}{$_l_BuildData}#"")
								
								$_l_DiaryCache:=Find in array:C230(IP_at_DiaryRecordCode; IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
								If ($_l_DiaryCache<0)
									//this would happen when the selection is inited on first update.
									QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
									If (Records in selection:C76([DIARY:12])>0)
										$_obj_DiaryRecord:=SD_SendtoWorflow([DIARY:12]Diary_Code:3; [DIARY:12]Person:8; False:C215)
										APPEND TO ARRAY:C911(IP_at_DiaryRecordCode; [DIARY:12]Diary_Code:3)
										APPEND TO ARRAY:C911(IP_aObj_DiaryRecords; $_obj_DiaryRecord)
										$_l_DiaryCache:=Find in array:C230(IP_at_DiaryRecordCode; IP_at_DiaryRecords{$_l_Update}{$_l_BuildData})
									End if 
									If ($_l_DiaryCache>0)
										APPEND TO ARRAY:C911($_aobj_DiaryRecords; IP_aObj_DiaryRecords{$_l_DiaryCache})
										
									End if 
									
								End if 
							End if 
							
							
						End for 
						///so now $_aobj_DiaryRecords is an array of objects and we will send that to all the clients waiting for this 'set'
						
						$_l_ref:=Find in array:C230($_at_ObjectAttributes; "table_num")
						If ($_l_ref>0)
							$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
							
							$_l_ClientSubsPosition:=Find in array:C230(IP_al_MonitorTableNumber; $_l_TableNumber)
							
							While ($_l_ClientSubsPosition>0)  //notify all the monitors of this table
								
								If (IP_at_ClientID{$_l_ClientSubsPosition}="")  //must be running standalone so call the form direclly
									CALL FORM:C1391(IP_al_CallBackWindowID{$_l_ClientSubsPosition}; IP_at_CallBackMethod{$_l_ClientSubsPosition}; $_obj_CallerObject)
									
								Else   //must be on the serveer so need to EXECUTE ON CLIENT
									
									OB SET:C1220($_obj_CallerObject; "action"; "CallForm")
									OB SET:C1220($_obj_CallerObject; "method"; IP_at_CallBackMethod{$_l_ClientSubsPosition})
									OB SET:C1220($_obj_CallerObject; "window_id"; IP_al_CallBackWindowID{$_l_ClientSubsPosition})
									OB SET:C1220($_obj_CallerObject; "Data"; $_aobj_DiaryRecords)
									//EXECUTE ON CLIENT(IP_at_ClientID{$_l_ClientSubsPosition};"SD3_ServerSideDiaryManager";$_obj_CallerObject)
									If (IP_at_ClientID{$_l_ClientSubsPosition}#"")
										EXECUTE ON CLIENT:C651(IP_at_ClientID{$_l_ClientSubsPosition}; "SD3_ServerSideDiaryManager"; $_obj_CallerObject)
									Else 
										SD3_ServerSideDiaryManager($_obj_CallerObject)
									End if 
								End if 
								$_l_TableNumber:=OB Get:C1224($_obj_CallerObject; "table_num"; Is longint:K8:6)
								$_l_ClientSubsPosition:=Find in array:C230(IP_al_MonitorTableNumber; $_l_TableNumber; $_l_ClientSubsPosition+1)
								
							End while 
						End if 
						
					End for 
				End if 
			End if 
			
			//[DIARY]Email_ID
			//[DIARY]Email_Person
			//[DIARY]Originator
			//[DIARY]Script_Code  //we do not search for these
			//[DIARY]WPDataEntry
			//[DIARY]x_Close_Options
			//[DIARY]x_Is_Thread
			//[DIARY]xDiaryClass
			//[DIARY]xDiaryForm
			//[DIARY]xDiaryLocations
			//[DIARY]XShowRelatedTable
			//[DIARY]xDiaryClass
			//[DIARY]X_REOCCOURANCE
			//[DIARY]x_Place_of_Action
			
			
			
			
			//ARRAY TEXT(IP_at_MatchAttributesID;0)  //The is a list of the monitored attributes IDS(we just assign an iD) ARRAY OBJECT(IP_aOBJ_Attributes;0)  //This is is list of the attributes that make that list ARRAY OBJECT(IP_al_LastCallStamp;0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them ARRAY TEXT(IP_at_DiaryRecords;0;0)  //this is the list of diary records that match the attributes. ;0)  //The is a list of the monitored attributes IDS(we just assign an iD
			//ARRAY OBJECT(IP_aOBJ_Attributes;0)  //This is is list of the attributes that make that list
			//ARRAY LONGINT(IP_al_LastCallStamp;0)  //everytime the list is 'pushed' out to clients they will 'call back' with a time stamp this is so we can age the lists and kill them
			//ARRAY TEXT(IP_at_DiaryRecords;0;0)  //this is the list of diary records that match the attributes.
			
			
			//ARRAY OBJECT(IP_aObj_DiaryRecords;0)  //This is an array of the diary record data as an object
			//ARRAY LONGINT(IP_at_DiaryRecordCode;0)
			
		: (OB Get:C1224($_obj_CallerObject; "action")="CallForm")  //On a client. Calling a form on the client from the server
			$_l_ref:=Find in array:C230($_at_ObjectAttributes; "window_id")
			If ($_l_ref>0)
				$_l_WindowID:=OB Get:C1224($_obj_CallerObject; "window_id")
				$_l_ref:=Find in array:C230($_at_ObjectAttributes; "method")
				If ($_l_ref>0)
					$_t_WindowMethod:=OB Get:C1224($_obj_CallerObject; "method")
					
					
					
					CALL FORM:C1391($_l_WindowID; $_t_WindowMethod; $_obj_CallerObject)
					
					
					
				End if 
			End if 
		: (OB Get:C1224($_obj_CallerObject; "action")="Kill") & (Application type:C494=4D Remote mode:K5:5)  //On a client. Need to exetute on server
			If (Process number:C372("DiaryMonitor"; *)#0)
				OB SET:C1220($_obj_CallerObject; "action"; "Kill")
				$_l_WorkerProcess:=Execute on server:C373("SD3_ServerSideDiaryManager"; 0; "kill"; $_obj_CallerObject)  //the method run on server will start the worker if no paramaters are passed
			End if 
			
		: (OB Get:C1224($_obj_CallerObject; "action")="kill") & (Process number:C372("DiaryMonitor")#0)  //kill the worker. Server or standalone
			KILL WORKER:C1390("DiaryMonitor")
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("SD3_ServerSideDiaryManager"; $_t_oldMethodName)