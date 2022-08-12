//%attributes = {}

If (False:C215)
	//Project Method Name:      ASTERISX_TESTREPORTS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/03/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(qstats)
	ARRAY LONGINT:C221($_al_ACLIDS; 0)
	ARRAY LONGINT:C221($_al_Active; 0)
	ARRAY LONGINT:C221($_al_AgentIDS; 0)
	ARRAY LONGINT:C221($_al_amaflags; 0)
	ARRAY LONGINT:C221($_al_billsec; 0)
	ARRAY LONGINT:C221($_al_CDRamaflags; 0)
	ARRAY LONGINT:C221($_al_CDRbillsec; 0)
	ARRAY LONGINT:C221($_al_CDRduration; 0)
	ARRAY LONGINT:C221($_al_CELamaflags; 0)
	ARRAY LONGINT:C221($_al_CELID; 0)
	ARRAY LONGINT:C221($_al_DesignerIDS; 0)
	ARRAY LONGINT:C221($_al_duration; 0)
	ARRAY LONGINT:C221($_al_EventIDS; 0)
	ARRAY LONGINT:C221($_al_GroupIDS; 0)
	ARRAY LONGINT:C221($_al_GroupNameIDS; 0)
	ARRAY LONGINT:C221($_al_ID; 0)
	ARRAY LONGINT:C221($_al_LastDats; 0)
	ARRAY LONGINT:C221($_al_level; 0)
	ARRAY LONGINT:C221($_al_MVstatsID; 0)
	ARRAY LONGINT:C221($_al_Overflow; 0)
	ARRAY LONGINT:C221($_al_Position; 0)
	ARRAY LONGINT:C221($_al_ProcessedCELID; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_Qagent; 0)
	ARRAY LONGINT:C221($_al_Qevent; 0)
	ARRAY LONGINT:C221($_al_Qname; 0)
	ARRAY LONGINT:C221($_al_QStatFieldTypes; 0; 0)
	ARRAY LONGINT:C221($_al_QStatsagent; 0)
	ARRAY LONGINT:C221($_al_QStatsevent; 0)
	ARRAY LONGINT:C221($_al_QStatsname; 0)
	ARRAY LONGINT:C221($_al_QueueAgentIDS; 0)
	ARRAY LONGINT:C221($_al_QueueEventIDS; 0)
	ARRAY LONGINT:C221($_al_QueueIDS; 0)
	ARRAY LONGINT:C221($_al_QueueRecordID; 0)
	ARRAY LONGINT:C221($_al_SetupiD; 0)
	ARRAY LONGINT:C221($_al_Shid; 0)
	ARRAY LONGINT:C221($_al_statsID; 0)
	ARRAY LONGINT:C221($_al_StatsMVID; 0)
	ARRAY LONGINT:C221($_al_StatsMVOverFlow; 0)
	ARRAY LONGINT:C221($_al_StatsMVPosition; 0)
	ARRAY LONGINT:C221($_al_StatsOverFlow; 0)
	ARRAY LONGINT:C221($_al_StatsPosition; 0)
	ARRAY LONGINT:C221($_al_User; 0)
	ARRAY TEXT:C222($_at_accountcode; 0)
	ARRAY TEXT:C222($_at_Agent; 0)
	ARRAY TEXT:C222($_at_ani; 0)
	ARRAY TEXT:C222($_at_appdata; 0)
	ARRAY TEXT:C222($_at_appname; 0)
	ARRAY TEXT:C222($_at_CallDate; 0)
	ARRAY TEXT:C222($_at_CDR_cnUm; 0)
	ARRAY TEXT:C222($_at_CDRaccountcode; 0)
	ARRAY TEXT:C222($_at_CDRCallDate; 0)
	ARRAY TEXT:C222($_at_CDRchannel; 0)
	ARRAY TEXT:C222($_at_CDRClid; 0)
	ARRAY TEXT:C222($_at_CDRcnam; 0)
	ARRAY TEXT:C222($_at_CDRcnum; 0)
	ARRAY TEXT:C222($_at_CDRdcontext; 0)
	ARRAY TEXT:C222($_at_CDRdid; 0)
	ARRAY TEXT:C222($_at_CDRdisposition; 0)
	ARRAY TEXT:C222($_at_CDRDst; 0)
	ARRAY TEXT:C222($_at_CDRdstchannel; 0)
	ARRAY TEXT:C222($_at_CDRdstcnam; 0)
	ARRAY TEXT:C222($_at_CDRlastapp; 0)
	ARRAY TEXT:C222($_at_CDRlastdata; 0)
	ARRAY TEXT:C222($_at_CDRNum; 0)
	ARRAY TEXT:C222($_at_CDRoutboundCNam; 0)
	ARRAY TEXT:C222($_at_CDRoutboundcNum; 0)
	ARRAY TEXT:C222($_at_CDRrecordingfile; 0)
	ARRAY TEXT:C222($_at_CDRSrc; 0)
	ARRAY TEXT:C222($_at_CDRuniqueid; 0)
	ARRAY TEXT:C222($_at_CDRuserfield; 0)
	ARRAY TEXT:C222($_at_CELaccountcode; 0)
	ARRAY TEXT:C222($_at_CELani; 0)
	ARRAY TEXT:C222($_at_CELappdata; 0)
	ARRAY TEXT:C222($_at_CELappname; 0)
	ARRAY TEXT:C222($_at_CELchanname; 0)
	ARRAY TEXT:C222($_at_CELCidName; 0)
	ARRAY TEXT:C222($_at_CELcontext; 0)
	ARRAY TEXT:C222($_at_CELdnid; 0)
	ARRAY TEXT:C222($_at_CELEventTime; 0)
	ARRAY TEXT:C222($_at_CELEventtype; 0)
	ARRAY TEXT:C222($_at_CELexten; 0)
	ARRAY TEXT:C222($_at_CELextra; 0)
	ARRAY TEXT:C222($_at_CELlinkedid; 0)
	ARRAY TEXT:C222($_at_CELNum; 0)
	ARRAY TEXT:C222($_at_CELpeer; 0)
	ARRAY TEXT:C222($_at_CELrdnis; 0)
	ARRAY TEXT:C222($_at_CELuniqueid; 0)
	ARRAY TEXT:C222($_at_CELuserdeftype; 0)
	ARRAY TEXT:C222($_at_channame; 0)
	ARRAY TEXT:C222($_at_channel; 0)
	ARRAY TEXT:C222($_at_CidName; 0)
	ARRAY TEXT:C222($_at_CLID; 0)
	ARRAY TEXT:C222($_at_cnam; 0)
	ARRAY TEXT:C222($_at_cnum; 0)
	ARRAY TEXT:C222($_at_context; 0)
	ARRAY TEXT:C222($_at_CRDdid; 0)
	ARRAY TEXT:C222($_at_CRDuniqueid; 0)
	ARRAY TEXT:C222($_at_CronDayMonth; 0)
	ARRAY TEXT:C222($_at_CronDayWeek; 0)
	ARRAY TEXT:C222($_at_CronHour; 0)
	ARRAY TEXT:C222($_at_CronMinute; 0)
	ARRAY TEXT:C222($_at_data; 0)
	ARRAY TEXT:C222($_at_DataFieldLabels; 0)
	ARRAY TEXT:C222($_at_DataFieldLabels2; 0)
	ARRAY TEXT:C222($_at_DataFieldValues; 0)
	ARRAY TEXT:C222($_at_DateTime; 0)
	ARRAY TEXT:C222($_at_DateTimeConnect; 0)
	ARRAY TEXT:C222($_at_DateTimeEnd; 0)
	ARRAY TEXT:C222($_at_dcontext; 0)
	ARRAY TEXT:C222($_at_Dest; 0)
	ARRAY TEXT:C222($_at_Detail; 0)
	ARRAY TEXT:C222($_at_did; 0)
	ARRAY TEXT:C222($_at_disposition; 0)
	ARRAY TEXT:C222($_at_dnid; 0)
	ARRAY TEXT:C222($_at_Document; 0)
	ARRAY TEXT:C222($_at_Dst; 0)
	ARRAY TEXT:C222($_at_dstchannel; 0)
	ARRAY TEXT:C222($_at_dstcnam; 0)
	ARRAY TEXT:C222($_at_Event; 0)
	ARRAY TEXT:C222($_at_EventTime; 0)
	ARRAY TEXT:C222($_at_Eventtype; 0)
	ARRAY TEXT:C222($_at_Exceed; 0)
	ARRAY TEXT:C222($_at_exten; 0)
	ARRAY TEXT:C222($_at_extra; 0)
	ARRAY TEXT:C222($_at_Field; 0)
	ARRAY TEXT:C222($_at_Fields; 0)
	ARRAY TEXT:C222($_at_GroupNameIDS; 0)
	ARRAY TEXT:C222($_at_GroupNames; 0)
	ARRAY TEXT:C222($_at_ID; 0)
	ARRAY TEXT:C222($_at_Info1; 0)
	ARRAY TEXT:C222($_at_Info2; 0)
	ARRAY TEXT:C222($_at_Info3; 0)
	ARRAY TEXT:C222($_at_Info4; 0)
	ARRAY TEXT:C222($_at_Info5; 0)
	ARRAY TEXT:C222($_at_Keyword; 0)
	ARRAY TEXT:C222($_at_lastapp; 0)
	ARRAY TEXT:C222($_at_lastdata; 0)
	ARRAY TEXT:C222($_at_LastRun; 0)
	ARRAY TEXT:C222($_at_Lastupdate; 0)
	ARRAY TEXT:C222($_at_LearnedUnknown; 0)
	ARRAY TEXT:C222($_at_Level; 0)
	ARRAY TEXT:C222($_at_linkedid; 0)
	ARRAY TEXT:C222($_at_Login; 0)
	ARRAY TEXT:C222($_at_Name; 0)
	ARRAY TEXT:C222($_at_Num; 0)
	ARRAY TEXT:C222($_at_outboundCNam; 0)
	ARRAY TEXT:C222($_at_outboundcNum; 0)
	ARRAY TEXT:C222($_at_Param; 0)
	ARRAY TEXT:C222($_at_Parameter; 0)
	ARRAY TEXT:C222($_at_Password; 0)
	ARRAY TEXT:C222($_at_peer; 0)
	ARRAY TEXT:C222($_at_ProcessedCELID; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	ARRAY TEXT:C222($_at_Qagent; 0)
	ARRAY TEXT:C222($_at_Qevent; 0)
	ARRAY TEXT:C222($_at_Qname; 0)
	ARRAY TEXT:C222($_at_QStatesAgentName; 0)
	ARRAY TEXT:C222($_at_QStatesEventName; 0)
	ARRAY TEXT:C222($_at_QStatesQueueName; 0)
	ARRAY TEXT:C222($_at_QStatsAgentName; 0)
	ARRAY TEXT:C222($_at_QStatsEventName; 0)
	ARRAY TEXT:C222($_at_QStatsField; 0; 0)
	ARRAY TEXT:C222($_at_QStatsQueueName; 0)
	ARRAY TEXT:C222($_at_QStatsQueueResolvedName; 0)
	ARRAY TEXT:C222($_at_QstatsTables; 0)
	ARRAY TEXT:C222($_at_queue; 0)
	ARRAY TEXT:C222($_at_QueueAgent; 0)
	ARRAY TEXT:C222($_at_QueueEvent; 0)
	ARRAY TEXT:C222($_at_queueNames; 0)
	ARRAY TEXT:C222($_at_Queues; 0)
	ARRAY TEXT:C222($_At_QueuesJoined; 0)
	ARRAY TEXT:C222($_at_QueuesLeft; 0)
	ARRAY TEXT:C222($_at_QueueStatsDateTime; 0)
	ARRAY TEXT:C222($_at_QueueUUID; 0)
	ARRAY TEXT:C222($_at_rdnis; 0)
	ARRAY TEXT:C222($_at_recordingfile; 0)
	ARRAY TEXT:C222($_at_Reports; 0)
	ARRAY TEXT:C222($_at_Resource; 0)
	ARRAY TEXT:C222($_at_SetupKeyword; 0)
	ARRAY TEXT:C222($_at_SetupParameter; 0)
	ARRAY TEXT:C222($_at_SetupValue; 0)
	ARRAY TEXT:C222($_at_Src; 0)
	ARRAY TEXT:C222($_at_Statsagent; 0)
	ARRAY TEXT:C222($_at_StatsCLID; 0)
	ARRAY TEXT:C222($_at_statsDateTime; 0)
	ARRAY TEXT:C222($_at_statsDateTimeConnect; 0)
	ARRAY TEXT:C222($_at_statsDateTimeEnd; 0)
	ARRAY TEXT:C222($_at_Statsevent; 0)
	ARRAY TEXT:C222($_at_StatsInfo1; 0)
	ARRAY TEXT:C222($_at_StatsInfo2; 0)
	ARRAY TEXT:C222($_at_StatsMVagent; 0)
	ARRAY TEXT:C222($_at_StatsMVCLID; 0)
	ARRAY TEXT:C222($_at_StatsMVDateTime; 0)
	ARRAY TEXT:C222($_at_StatsMVDateTimeConnect; 0)
	ARRAY TEXT:C222($_at_StatsMVDateTimeEnd; 0)
	ARRAY TEXT:C222($_at_StatsMVevent; 0)
	ARRAY TEXT:C222($_at_StatsMVInfo1; 0)
	ARRAY TEXT:C222($_at_statsMVInfo2; 0)
	ARRAY TEXT:C222($_at_StatsMVQname; 0)
	ARRAY TEXT:C222($_at_StatsMVURL; 0)
	ARRAY TEXT:C222($_at_StatsQname; 0)
	ARRAY TEXT:C222($_at_StatsURL; 0)
	ARRAY TEXT:C222($_at_TimeStamp; 0)
	ARRAY TEXT:C222($_at_UID; 0)
	ARRAY TEXT:C222($_at_UIDS; 0)
	ARRAY TEXT:C222($_at_uniqueid; 0)
	ARRAY TEXT:C222($_at_url; 0)
	ARRAY TEXT:C222($_at_user; 0)
	ARRAY TEXT:C222($_at_userdeftype; 0)
	ARRAY TEXT:C222($_at_userfield; 0)
	ARRAY TEXT:C222($_at_UUID; 0)
	ARRAY TEXT:C222($_at_Value; 0)
	C_BOOLEAN:C305($_bo_CallRecordFound; $_bo_Continue; $_bo_CreateCallRecord; $_bo_FromAgentPhone; $_bo_OutboundCall; $_bo_Reset; $_bo_Save; $_bo_ToAgentPhone; $3)
	C_DATE:C307($_d_CallEndDate; $_d_CallStartDate; $_d_Date; $_d_EventEndDate; $_d_EventStartDate; $_d_LastDate; $_d_Time; $_d_ToDate)
	C_LONGINT:C283($_l_; $_l_AgentIDRow; $_l_Already; $_l_AsteriskPreferences; $_l_Build; $_l_Build2; $_l_Build3; $_l_CallerID; $_l_CallLength; $_l_CallLEngth1; $_l_CallLEngth2)
	C_LONGINT:C283($_l_CallLength3; $_l_CallRecordFound; $_l_Date; $_l_DateTo; $_l_Days; $_l_DialEndTime; $_l_DialStartTIme; $_l_Duration; $_l_EventIDRow; $_l_FindCDR; $_l_FindQname2)
	C_LONGINT:C283($_l_FindQnameStats; $_l_GetActionTimes; $_l_HangUpEndTime; $_l_HangUpStartTIme; $_l_Index; $_l_Month; $_l_MonthTo; $_l_NumberofRecords; $_l_numberofTables; $_l_OldBUild; $_l_Parse)
	C_LONGINT:C283($_l_PasswordRow; $_l_PickUpEndTime; $_l_PickUpStartTIme; $_l_Position; $_l_PreferenceID; $_l_PropertyRow; $_l_QueueIDRow; $_l_RecordSequence; $_l_ResolvedNameRow; $_l_RingTime; $_l_SourceIdent)
	C_LONGINT:C283($_l_StartRow; $_l_StatisticsRow; $_l_TableRow; $_l_TalkTime; $_l_TotalCallLength; $_l_UnknownRow; $_l_UserNameRow; $_l_Year; $_l_YearTo)
	C_OBJECT:C1216($_obj_Data; DB_obj_Interface)
	C_POINTER:C301($_ptr_FieldLabels; $_Ptr_FIeldValues; $1; $2)
	C_TEXT:C284($_t_agentName; $_t_BaseNumber; $_t_BaseNumberNoCode; $_T_BridgeJSON; $_t_CallEndDateTime; $_t_CallerID; $_t_CallSource; $_t_CallStartDateTime; $_t_Cid; $_t_DateString; $_t_DateString2)
	C_TEXT:C284($_t_DateStringDoc; $_t_DateToString; $_t_Destination; $_t_DocumentPath; $_t_EventDateTime; $_t_EventEndDateTime; $_t_EventStartDateTime; $_t_extractedID; $_T_MasterRecord; $_t_MasterTelUUID; $_t_Month)
	C_TEXT:C284($_t_oldMethodName; $_t_ParentSysID; $_t_Person; $_t_QueueEvent; $_t_QueueID; $_t_QueueName; $_t_RecordUUID; $_t_Save; $_t_Source; $_t_SqlInterface; $_t_SQLPassword)
	C_TEXT:C284($_t_SQLSource; $_t_SQLStatement; $_T_SQLTEXT; $_t_SQLUserName; $_t_SystemExtension; $_t_TelTimingsRecordUUID; $_t_ThisCelUniqueID; $_t_timestring; $_T_transferJSON; $_t_Year)
	C_TIME:C306($_ti_CallEndDateTime; $_ti_CallEndTime; $_ti_CallStartDateTime; $_ti_CallStartTime; $_ti_DialEndTime; $_ti_DialStartTIme; $_ti_Doc; $_ti_Document; $_ti_EventEndTime; $_ti_EventStartTime; $_ti_HangUpEndTime)
	C_TIME:C306($_ti_HangUpStartTIme; $_ti_lastTime; $_ti_LeaveJoinTime; $_ti_LeaveQueueTime; $_ti_PickUpEndTime; $_ti_PickUpStartTIme; $_ti_Time)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ASTERISX_TESTREPORTS")
$_t_SqlInterface:=qstats
ARRAY TEXT:C222($_at_QstatsTables; 0)
ARRAY TEXT:C222($_at_QStatsField; 0; 0)
ARRAY LONGINT:C221($_al_QStatFieldTypes; 0; 0)

APPEND TO ARRAY:C911($_at_QstatsTables; "acl")
APPEND TO ARRAY:C911($_at_QstatsTables; "designer")
APPEND TO ARRAY:C911($_at_QstatsTables; "gqname")
APPEND TO ARRAY:C911($_at_QstatsTables; "gqnamename")
APPEND TO ARRAY:C911($_at_QstatsTables; "language")
APPEND TO ARRAY:C911($_at_QstatsTables; "qagent")
APPEND TO ARRAY:C911($_at_QstatsTables; "qevent")
APPEND TO ARRAY:C911($_at_QstatsTables; "qname")
APPEND TO ARRAY:C911($_at_QstatsTables; "gueue_stats")
APPEND TO ARRAY:C911($_at_QstatsTables; "queue_stats_mv")
APPEND TO ARRAY:C911($_at_QstatsTables; "recordings")
APPEND TO ARRAY:C911($_at_QstatsTables; "sched")
APPEND TO ARRAY:C911($_at_QstatsTables; "secure_level")
APPEND TO ARRAY:C911($_at_QstatsTables; "setup")
APPEND TO ARRAY:C911($_at_QstatsTables; "sqlrealtime")
APPEND TO ARRAY:C911($_at_QstatsTables; "user_filter")
APPEND TO ARRAY:C911($_at_QstatsTables; "userqagent")
APPEND TO ARRAY:C911($_at_QstatsTables; "userqname")
APPEND TO ARRAY:C911($_at_QstatsTables; "users")
$_l_numberofTables:=Size of array:C274($_at_QstatsTables)
ARRAY TEXT:C222($_at_QStatsField; $_l_numberofTables; 0)
ARRAY LONGINT:C221($_al_QStatFieldTypes; $_l_numberofTables; 0)
$_l_TableRow:=Find in array:C230($_at_QstatsTables; "acl")
//APPEND TO ARRAY($_at_QStatsField{$_l_TableRow}

//ARRAY TEXT($_at_DataFieldLabels;0)
//ARRAY TEXT($_at_DataFieldValues;0)
//$0:="NUL"
//CRM_ASTERISKPREFERENCES (->$_at_DataFieldLabels;->$_at_DataFieldValues)
//$_t_SQLSource:=""
//$_t_SQLUserName:=""
//$_t_SQLPassword:=""
//$_l_StatisticsRow:=Find in array($_at_DataFieldLabels;"SQL Source ODBC Name")
If (False:C215)  //temp
	If (False:C215)
		If ($_l_StatisticsRow>0)
			$_t_SQLSource:=$_at_DataFieldValues{$_l_StatisticsRow}
			$_l_UserNameRow:=Find in array:C230($_at_DataFieldLabels; "Statistics User Name")
			If ($_l_UserNameRow>0)
				$_t_SQLUserName:=$_at_DataFieldValues{$_l_UserNameRow}
				$_l_PasswordRow:=Find in array:C230($_at_DataFieldLabels; "Statistics Password")
				If ($_l_PasswordRow<0)
					$_bo_Continue:=False:C215
					$_bo_Reset:=True:C214
				Else 
					$_t_SQLPassword:=$_at_DataFieldValues{$_l_PasswordRow}
					
					If ($_at_DataFieldValues{$_l_StatisticsRow}="") | ($_at_DataFieldValues{$_l_UserNameRow}="") | ($_at_DataFieldValues{$_l_PasswordRow}="")
						$_bo_Reset:=True:C214
						$_bo_Continue:=False:C215
						
					Else 
						$_bo_Continue:=True:C214
					End if 
				End if 
			Else 
				$_bo_Reset:=True:C214
				$_bo_Continue:=False:C215
			End if 
		Else 
			$_bo_Reset:=True:C214
			$_bo_Continue:=False:C215
		End if 
		If ($_bo_Reset) | (Gen_Option)
			//'we need to set up the connection
			ARRAY TEXT:C222($_at_DataFieldLabels2; 0)
			ARRAY TEXT:C222($_at_DataFieldValues; 0)
			APPEND TO ARRAY:C911($_at_DataFieldLabels2; "ODBC Name")
			APPEND TO ARRAY:C911($_at_DataFieldLabels2; "User Name")
			APPEND TO ARRAY:C911($_at_DataFieldLabels2; "Password Name")
			APPEND TO ARRAY:C911($_at_DataFieldValues; $_t_SQLSource)
			APPEND TO ARRAY:C911($_at_DataFieldValues; $_t_SQLUserName)
			APPEND TO ARRAY:C911($_at_DataFieldValues; $_t_SQLPassword)
			OB SET:C1220(DB_obj_Interface; "WindowTitle"; "Statistics Source")
			DIALOG:C40("PREFERENCE_SETOBJECTS")
			$_t_Save:=OB Get:C1224(DB_obj_Interface; "Exit")
			
		End if 
		
		If ($_bo_Continue)
			
			If (Count parameters:C259>=2)
				$_ptr_FieldLabels:=$1
				$_Ptr_FIeldValues:=$2
				READ ONLY:C145([PREFERENCES:116])
				$_l_PreferenceID:=PREF_GetPreferenceID("Asterisk Monitor Preference")
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
				If (Records in selection:C76([PREFERENCES:116])=0)
					READ WRITE:C146([PREFERENCES:116])
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
					ARRAY TEXT:C222($_at_DataFieldLabels; 0)
					APPEND TO ARRAY:C911($_at_DataFieldLabels; "Outbound Call Handler")
					APPEND TO ARRAY:C911($_at_DataFieldLabels; "Statistics Database")
					APPEND TO ARRAY:C911($_at_DataFieldLabels; "FOP2 base URL")
					OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "Labels"; $_at_DataFieldLabels)
					OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "Labels"; $_at_DataFieldLabels)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
				End if 
				If (Count parameters:C259>=3)
					$_bo_Save:=$3
				End if 
				If ($_bo_Save)
					READ WRITE:C146([PREFERENCES:116])
					LOAD RECORD:C52([PREFERENCES:116])
					COPY ARRAY:C226($_ptr_FieldLabels->; $_at_DataFieldLabels)
					COPY ARRAY:C226($_ptr_FieldValues->; $_at_DataFieldValues)
					OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "Labels"; $_at_DataFieldLabels)
					OB SET ARRAY:C1227([PREFERENCES:116]DataObject:8; "Values"; $_at_DataFieldValues)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					
					
				Else 
					ARRAY TEXT:C222($_at_DataFieldLabels; 0)
					ARRAY TEXT:C222($_at_DataFieldValues; 0)
					OB GET PROPERTY NAMES:C1232([PREFERENCES:116]DataObject:8; $_at_PropertyNames; $_al_PropertyTypes)
					$_l_PropertyRow:=Find in array:C230($_at_PropertyNames; "Labels")
					If ($_l_PropertyRow>0)
						OB GET ARRAY:C1229([PREFERENCES:116]DataObject:8; "Labels"; $_at_DataFieldLabels)
					End if 
					$_l_PropertyRow:=Find in array:C230($_at_PropertyNames; "Values")
					If ($_l_PropertyRow>0)
						OB GET ARRAY:C1229([PREFERENCES:116]DataObject:8; "Values"; $_at_DataFieldValues)
						
					End if 
					
				End if 
				ARRAY TEXT:C222($_at_DataFieldValues; Size of array:C274($_at_DataFieldLabels))
				
				COPY ARRAY:C226($_at_DataFieldLabels; $_ptr_FieldLabels->)
				COPY ARRAY:C226($_at_DataFieldValues; $_ptr_FieldValues->)
			End if 
		End if 
	End if 
	//SQL SET OPTION(SQL connection timeout;12)
	//SQL SET OPTION(SQL query timeout;12)
	If (True:C214)
		
		If (False:C215)
			//
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			$_T_SQLTEXT:="select id, resource, level from acl;"
			ARRAY LONGINT:C221($_al_ACLIDS; 0)
			ARRAY TEXT:C222($_at_Resource; 0)
			ARRAY TEXT:C222($_at_Level; 0)
			SQL EXECUTE:C820($_T_SQLTEXT; $_al_ACLIDS; $_at_Resource; $_at_Level)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			SQL LOGOUT:C872
			$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
			$_ti_Document:=Create document:C266($_t_DocumentPath+"acl.txt"; "TEXT")
			For ($_l_Index; 1; Size of array:C274($_al_ACLIDS))
				SEND PACKET:C103($_ti_Document; (String:C10($_al_ACLIDS{$_l_index}))+Char:C90(9)+$_at_Resource{$_l_index}+Char:C90(9)+$_at_Level{$_l_index})
				SEND PACKET:C103($_ti_Document; Char:C90(13))
			End for 
			CLOSE DOCUMENT:C267($_ti_Document)
		End if   //we don't need these-these are the names of phps available
		//////
		
		If (False:C215)
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			$_T_SQLTEXT:="select id, keyword, parameter, value from designer;"
			ARRAY LONGINT:C221($_al_DesignerIDS; 0)
			ARRAY TEXT:C222($_at_Keyword; 0)
			ARRAY TEXT:C222($_at_Parameter; 0)
			ARRAY TEXT:C222($_at_Value; 0)
			SQL EXECUTE:C820($_T_SQLTEXT; $_al_DesignerIDS; $_at_Keyword; $_at_Parameter; $_at_Value)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			SQL LOGOUT:C872
			$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
			$_ti_Document:=Create document:C266($_t_DocumentPath+"designer.txt"; "TEXT")
			
			For ($_l_Index; 1; Size of array:C274($_al_DesignerIDS))
				SEND PACKET:C103($_ti_Document; (String:C10($_al_DesignerIDS{$_l_index}))+Char:C90(9)+$_at_Keyword{$_l_index}+Char:C90(9)+$_at_Parameter{$_l_index}+Char:C90(9)+$_at_Value{$_l_index})
				SEND PACKET:C103($_ti_Document; Char:C90(13))
			End for 
			CLOSE DOCUMENT:C267($_ti_Document)
		End if   //we don;t need these-they describe the reports column calculations
		////
		//we want these-this gives us the names of the top line queues-trend just has -we just collect them at init(or maybe some way to re-get them
		//1Trend Queues
		//2trend
		
		
		SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
		$_T_SQLTEXT:="select groupname_id, groupname from gqname;"
		ARRAY LONGINT:C221($_al_GroupNameIDS; 0)
		ARRAY TEXT:C222($_at_GroupNames; 0)
		SQL EXECUTE:C820($_T_SQLTEXT; $_al_GroupNameIDS; $_at_GroupNames)
		SQL LOAD RECORD:C822(SQL all records:K49:10)
		SQL LOGOUT:C872
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"gqname.txt"; "TEXT")
		
		For ($_l_Index; 1; Size of array:C274($_al_GroupNameIDS))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_GroupNameIDS{$_l_index}))+Char:C90(9)+$_at_GroupNames{$_l_index})
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		
		
		//we want these-these linke the quuue ids to the above queues (see that trend has all as group 1)
		//1 11
		//1 9
		//1 6
		//1 5
		//1 10
		///1 8
		//1 7
		//1 4
		//1 3
		//1 2
		
		SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
		$_T_SQLTEXT:="select gqname_groupname_id, qname_queue_id from gqnameqname;"
		ARRAY LONGINT:C221($_al_GroupIDS; 0)
		ARRAY LONGINT:C221($_al_QueueIDS; 0)
		SQL EXECUTE:C820($_T_SQLTEXT; $_al_GroupIDS; $_al_QueueIDS)
		SQL LOAD RECORD:C822(SQL all records:K49:10)
		SQL LOGOUT:C872
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"gqnameqname.txt"; "TEXT")
		For ($_l_Index; 1; Size of array:C274($_al_GroupIDS))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_GroupIDS{$_l_index}))+Char:C90(9)+String:C10($_al_QueueIDS{$_l_index}))
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		
		//we want this-agent ids and agent names-note this does not link them to an extension number.
		//(sample)
		//-1ALL
		//1NONE
		//2Dave Morris
		//3Cheryl Blake
		//4Kevin Lewis
		//5Gary Chaperlin
		//we would get this at start and then if we need to
		
		$_T_SQLTEXT:="select agent_id, agent from qagent;"
		ARRAY LONGINT:C221($_al_QueueAgentIDS; 0)
		ARRAY TEXT:C222($_at_QueueAgent; 0)
		SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
		SQL EXECUTE:C820($_T_SQLTEXT; $_al_QueueAgentIDS; $_at_QueueAgent)
		SQL LOAD RECORD:C822(SQL all records:K49:10)
		SQL LOGOUT:C872
		If (False:C215)
			$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
			$_ti_Document:=Create document:C266($_t_DocumentPath+"qagent.txt"; "TEXT")
			For ($_l_Index; 1; Size of array:C274($_al_QueueAgentIDS))
				SEND PACKET:C103($_ti_Document; (String:C10($_al_QueueAgentIDS{$_l_index}))+Char:C90(9)+($_at_QueueAgent{$_l_index}))
				SEND PACKET:C103($_ti_Document; Char:C90(13))
			End for 
			CLOSE DOCUMENT:C267($_ti_Document)
		End if 
		
		//the queue even names only apply to the data in the qstats
		//1ABANDON
		//2ADDMEMBER
		//3AGENTCALLBACKLOGIN
		//4AGENTCALLBACKLOGOFF
		//5AGENTDUMP
		//6AGENTLOGIN
		
		
		
		
		
		//1 NONE
		//2 461
		//3 462
		//4 463
		//5 467
		//6 468
		//7 464
		//8 465
		//9 469
		//10 466
		//11 470
		//12 outboundops
		//these look like the call queues groups to me.
		
		///
		
		
		$_T_SQLTEXT:="select uniqueid, filename from recordings;"  /////we might need to get this updated every time-it gives the path the wav file
		ARRAY TEXT:C222($_at_UIDS; 0)
		ARRAY TEXT:C222($_at_Document; 0)
		//ARRAY TEXT($_at_GroupNames;0)
		SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
		SQL EXECUTE:C820($_T_SQLTEXT; $_at_UIDS; $_at_Document)
		SQL LOAD RECORD:C822(SQL all records:K49:10)
		SQL LOGOUT:C872
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"recordings.txt"; "TEXT")
		For ($_l_Index; 1; Size of array:C274($_at_UIDS))
			SEND PACKET:C103($_ti_Document; (($_at_UIDS{$_l_index}))+Char:C90(9)+($_at_Document{$_l_index}))
			SEND PACKET:C103($_ti_Document; Char:C90(13))
			
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		
		
		
		
		
		$_T_SQLTEXT:="select schid, dest, reports, lastdays, field, exceed, crondaymonth, crondayweek, cronhour, cronminute, cast(lastrun as char), active, queues from sched;"
		//TRACE
		///
		ARRAY LONGINT:C221($_al_Shid; 0)
		ARRAY TEXT:C222($_at_Dest; 0)
		ARRAY TEXT:C222($_at_Reports; 0)
		ARRAY LONGINT:C221($_al_LastDats; 0)
		ARRAY TEXT:C222($_at_Field; 0)
		ARRAY TEXT:C222($_at_Exceed; 0)
		ARRAY TEXT:C222($_at_CronDayMonth; 0)
		ARRAY TEXT:C222($_at_CronDayWeek; 0)
		ARRAY TEXT:C222($_at_CronHour; 0)
		ARRAY TEXT:C222($_at_CronMinute; 0)
		ARRAY TEXT:C222($_at_LastRun; 0)
		ARRAY LONGINT:C221($_al_Active; 0)
		ARRAY TEXT:C222($_at_Queues; 0)
		//ARRAY TEXT($_at_GroupNames;0)
		SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
		
		SQL EXECUTE:C820($_T_SQLTEXT; $_al_Shid; $_at_Dest; $_at_Reports; $_al_LastDats; $_at_Field; $_at_Exceed; $_at_CronDayMonth; $_at_CronDayWeek; $_at_CronHour; $_at_CronMinute; $_at_LastRun; $_al_Active; $_at_Queues)
		SQL LOAD RECORD:C822(SQL all records:K49:10)
		
		
		SQL LOGOUT:C872
		
		
		
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"sched.txt"; "TEXT")
		
		For ($_l_Index; 1; Size of array:C274($_al_Shid))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_Shid{$_l_index}))+Char:C90(9)+($_at_Dest{$_l_index})+Char:C90(9))
			SEND PACKET:C103($_ti_Document; ($_at_Reports{$_l_index})+Char:C90(9)+(String:C10($_al_LastDats{$_l_index}))+Char:C90(9))
			SEND PACKET:C103($_ti_Document; ($_at_Field{$_l_index})+Char:C90(9)+($_at_Exceed{$_l_index})+Char:C90(9)+($_at_CronDayMonth{$_l_index}))
			
			SEND PACKET:C103($_ti_Document; ($_at_CronDayWeek{$_l_index})+Char:C90(9)+($_at_CronHour{$_l_index})+Char:C90(9)+($_at_CronMinute{$_l_index})+Char:C90(9)+($_at_LastRun{$_l_index})+Char:C90(9)+String:C10($_al_Active{$_l_index})+Char:C90(9)+$_at_Queues{$_l_index})
			
			
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		
		
		
		If (False:C215)  //we dont need this
			$_T_SQLTEXT:="select level, detail from secure_level;"
			
			ARRAY LONGINT:C221($_al_level; 0)
			ARRAY TEXT:C222($_at_Detail; 0)
			
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			
			SQL EXECUTE:C820($_T_SQLTEXT; $_al_level; $_at_Detail)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			
			
			SQL LOGOUT:C872
			$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
			$_ti_Document:=Create document:C266($_t_DocumentPath+"secure_level.txt"; "TEXT")
			
			For ($_l_Index; 1; Size of array:C274($_al_level))
				SEND PACKET:C103($_ti_Document; (String:C10($_al_level{$_l_index}))+Char:C90(9)+($_at_Detail{$_l_index})+Char:C90(9))
				SEND PACKET:C103($_ti_Document; Char:C90(13))
			End for 
			
			CLOSE DOCUMENT:C267($_ti_Document)
		End if 
		//we might needs this-but not everything looks of interest we might only want dict_queue
		
		
		If (False:C215)  //this is just totals so i dont think we want it
			$_T_SQLTEXT:="select cast(lastupdate as char), data, user from sqlrealtime;"
			ARRAY TEXT:C222($_at_Lastupdate; 0)
			ARRAY TEXT:C222($_at_data; 0)
			ARRAY TEXT:C222($_at_user; 0)
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			SQL EXECUTE:C820($_T_SQLTEXT; $_at_Lastupdate; $_at_data; $_at_user)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			SQL LOGOUT:C872
			$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
			$_ti_Document:=Create document:C266($_t_DocumentPath+"sqlrealtime.txt"; "TEXT")
			For ($_l_Index; 1; Size of array:C274($_at_Lastupdate))
				SEND PACKET:C103($_ti_Document; (($_at_Lastupdate{$_l_index}))+Char:C90(9)+($_at_data{$_l_index})+Char:C90(9)+($_at_user{$_l_index}))
				SEND PACKET:C103($_ti_Document; Char:C90(13))
			End for 
			CLOSE DOCUMENT:C267($_ti_Document)
		End if 
		///
		If (False:C215)  //dont think we. need this
			$_T_SQLTEXT:="select user, param, value from user_filter;"
			ARRAY TEXT:C222($_at_User; 0)
			ARRAY TEXT:C222($_at_Param; 0)
			ARRAY TEXT:C222($_at_Value; 0)
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			SQL EXECUTE:C820($_T_SQLTEXT; $_at_User; $_at_Param; $_at_Value)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			SQL LOGOUT:C872
			$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
			$_ti_Document:=Create document:C266($_t_DocumentPath+"user_filter.txt"; "TEXT")
			For ($_l_Index; 1; Size of array:C274($_at_User))
				SEND PACKET:C103($_ti_Document; (($_at_User{$_l_index}))+Char:C90(9)+($_at_Param{$_l_index})+Char:C90(9)+($_at_Value{$_l_index}))
				SEND PACKET:C103($_ti_Document; Char:C90(13))
			End for 
			CLOSE DOCUMENT:C267($_ti_Document)
		End if 
		///
		//TRACE
		$_T_SQLTEXT:="select users_id, qagent_agent_id from userqagent;"
		ARRAY LONGINT:C221($_al_User; 0)
		ARRAY LONGINT:C221($_al_ID; 0)
		
		SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
		SQL EXECUTE:C820($_T_SQLTEXT; $_al_User; $_al_ID)
		SQL LOAD RECORD:C822(SQL all records:K49:10)
		SQL LOGOUT:C872
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"userqagent.txt"; "TEXT")
		For ($_l_Index; 1; Size of array:C274($_al_User))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_User{$_l_index}))+Char:C90(9)+String:C10($_al_ID{$_l_index}))
			
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		
		////
		
		//TRACE
		$_T_SQLTEXT:="select users_id, qname_queue_id from userqname;"
		ARRAY LONGINT:C221($_al_User; 0)
		ARRAY LONGINT:C221($_al_ID; 0)
		
		SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
		SQL EXECUTE:C820($_T_SQLTEXT; $_al_User; $_al_ID)
		SQL LOAD RECORD:C822(SQL all records:K49:10)
		SQL LOGOUT:C872
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"userqname.txt"; "TEXT")
		For ($_l_Index; 1; Size of array:C274($_al_User))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_User{$_l_index}))+Char:C90(9)+String:C10($_al_ID{$_l_index}))
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		
		////
		
		If (False:C215)  //we dont need this one
			$_T_SQLTEXT:="select id, login, password, name, level from users;"
			ARRAY TEXT:C222($_at_ID; 0)
			ARRAY TEXT:C222($_at_Login; 0)
			ARRAY TEXT:C222($_at_Password; 0)
			ARRAY TEXT:C222($_at_Name; 0)
			ARRAY TEXT:C222($_at_Level; 0)
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			SQL EXECUTE:C820($_T_SQLTEXT; $_at_ID; $_at_Login; $_at_Password; $_at_Name; $_at_Level)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			SQL LOGOUT:C872
			$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
			$_ti_Document:=Create document:C266($_t_DocumentPath+"users.txt"; "TEXT")
			For ($_l_Index; 1; Size of array:C274($_at_ID))
				SEND PACKET:C103($_ti_Document; (($_at_ID{$_l_index}))+Char:C90(9)+($_at_Login{$_l_index})+Char:C90(9)+($_at_Password{$_l_index})+Char:C90(9)+($_at_Name{$_l_index})+Char:C90(9)+($_at_Level{$_l_index}))
				
				SEND PACKET:C103($_ti_Document; Char:C90(13))
			End for 
			CLOSE DOCUMENT:C267($_ti_Document)
		End if 
	End if 
End if 
//TRACE
//$_t_SystemExtension
$_d_ToDate:=!00-00-00!
$_d_LastDate:=!2020-03-01!
$_ti_lastTime:=?00:00:00?
$_ti_Doc:=Create document:C266(""; "TEXT")
Repeat 
	
	If ($_d_LastDate=!00-00-00!)
		$_l_Year:=Year of:C25(Current date:C33)
		$_l_Month:=Month of:C24(Current date:C33)
		$_l_Date:=Day of:C23(Current date:C33)
	Else 
		$_l_Year:=Year of:C25($_d_LastDate)
		$_l_Month:=Month of:C24($_d_LastDate)
		$_l_Date:=Day of:C23($_d_LastDate)
	End if 
	$_t_timestring:=Time string:C180($_ti_lastTime)
	$_t_DateString:=String:C10($_l_Year)+"-"+String:C10($_l_Month)+"-"+String:C10($_l_date)+" "+$_t_timestring
	MESSAGE:C88($_t_DateString)
	
	
	$_T_SQLTEXT:="select queue_stats_id, uniqueid, cast(datetime as char), qname, qagent, qevent, info1, info2, info3, info4, info5 from queue_stats"
	
	If ($_d_LastDate<(Current date:C33-1))
		$_d_ToDate:=$_d_LastDate+1
		$_d_LastDate:=$_d_ToDate
		$_l_YearTo:=Year of:C25($_d_ToDate)
		$_l_MonthTo:=Month of:C24($_d_ToDate)
		$_l_DateTo:=Day of:C23($_d_ToDate)
		$_t_DateToString:=String:C10($_l_YearTO)+"-"+String:C10($_l_MonthTO)+"-"+String:C10($_l_dateTO)+" "+$_t_timestring
		$_T_SQLTEXT:=$_T_SQLTEXT+" where datetime >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)+""
		$_T_SQLTEXT:=$_T_SQLTEXT+" and datetime <"+Char:C90(Quote:K15:44)+$_t_DateToString+Char:C90(Quote:K15:44)+";"
		
	Else 
		$_d_LastDate:=Current date:C33
		$_T_SQLTEXT:=$_T_SQLTEXT+" where datetime >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)+";"
		$_d_ToDate:=!00-00-00!
		$_ti_lastTime:=Current time:C178
	End if 
	
	$_t_DateStringDoc:=Replace string:C233($_t_DateString; ":"; "")
	$_t_DateStringDoc:=Replace string:C233($_t_DateStringDoc; "-"; "")
	$_t_DateStringDoc:=Replace string:C233($_t_DateStringDoc; "/"; "")
	
	///
	ARRAY LONGINT:C221($_al_QueueRecordID; 0)
	ARRAY TEXT:C222($_at_QueueUUID; 0)
	ARRAY TEXT:C222($_at_QueueStatsDateTime; 0)
	ARRAY LONGINT:C221($_al_QStatsname; 0)
	ARRAY LONGINT:C221($_al_QStatsagent; 0)
	ARRAY LONGINT:C221($_al_QStatsevent; 0)
	
	ARRAY TEXT:C222($_at_Info1; 0)
	ARRAY TEXT:C222($_at_Info2; 0)
	ARRAY TEXT:C222($_at_Info3; 0)
	ARRAY TEXT:C222($_at_Info4; 0)
	ARRAY TEXT:C222($_at_Info5; 0)
	
	//ARRAY TEXT($_at_GroupNames;0)
	SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
	SQL EXECUTE:C820($_T_SQLTEXT; $_al_QueueRecordID; $_at_QueueUUID; $_at_QueueStatsDateTime; $_al_QStatsname; $_al_QStatsagent; $_al_QStatsevent; $_at_Info1; $_at_Info2; $_at_Info3; $_at_Info4; $_at_Info5)
	SQL LOAD RECORD:C822(SQL all records:K49:10)
	SQL LOGOUT:C872
	ARRAY TEXT:C222($_at_QStatsQueueName; Size of array:C274($_al_QueueRecordID))
	ARRAY TEXT:C222($_at_QStatsQueueResolvedName; Size of array:C274($_al_QueueRecordID))
	
	ARRAY TEXT:C222($_at_QStatsAgentName; Size of array:C274($_al_QueueRecordID))
	ARRAY TEXT:C222($_at_QStatsEventName; Size of array:C274($_al_QueueRecordID))
	ARRAY TEXT:C222($_at_LearnedUnknown; 0)
	For ($_l_index; 1; Size of array:C274($_al_QueueRecordID))
		$_l_EventIDRow:=Find in array:C230($_al_QueueEventIDS; $_al_QStatsevent{$_l_Index})
		If ($_l_EventIDRow<0)
			$_T_SQLTEXT:="select event_id, event from qevent;"
			ARRAY LONGINT:C221($_al_QueueEventIDS; 0)
			ARRAY TEXT:C222($_at_QueueEvent; 0)
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			SQL EXECUTE:C820($_T_SQLTEXT; $_al_QueueEventIDS; $_at_QueueEvent)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			SQL LOGOUT:C872
			$_l_EventIDRow:=Find in array:C230($_al_QueueEventIDS; $_al_QStatsevent{$_l_Index})
		End if 
		If ($_l_EventIDRow>0)  //it should be !!!
			$_at_QStatsEventName{$_l_index}:=$_at_QueueEvent{$_l_EventIDRow}
		Else 
			//TRACE
		End if 
		If ($_at_QStatsEventName{$_l_index}#"CONFIGRELOAD")
			
			$_l_QueueIDRow:=Find in array:C230($_al_QueueIDS; $_al_QStatsname{$_l_index})
			If ($_l_QueueIDRow<0)  //we have not loaded the queue IDs OR they have been changed
				$_T_SQLTEXT:="select queue_id, queue from qname;"
				SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
				SQL EXECUTE:C820($_T_SQLTEXT; $_al_QueueIDS; $_at_queueNames)
				SQL LOAD RECORD:C822(SQL all records:K49:10)
				SQL LOGOUT:C872
				$_l_QueueIDRow:=Find in array:C230($_al_QueueIDS; $_al_QStatsname{$_l_index})
				
			End if 
			If ($_l_QueueIDRow>0)  //it should be !!!
				$_at_QStatsQueueName{$_l_index}:=$_at_queueNames{$_l_QueueIDRow}
				$_l_ResolvedNameRow:=Find in array:C230($_at_SetupParameter; $_at_QStatsQueueName{$_l_index})
				If ($_l_ResolvedNameRow<0)
					$_l_UnknownRow:=Find in array:C230($_at_LearnedUnknown; $_at_QStatsQueueName{$_l_index})
					If ($_l_UnknownRow<0)
						$_T_SQLTEXT:="select id, keyword, parameter, value from setup"
						$_T_SQLTEXT:=$_T_SQLTEXT+" where keyword="+Char:C90(Quote:K15:44)+"dict_queue"+Char:C90(Quote:K15:44)+";"
						
						ARRAY LONGINT:C221($_al_SetupiD; 0)
						ARRAY TEXT:C222($_at_SetupKeyword; 0)
						ARRAY TEXT:C222($_at_SetupParameter; 0)
						ARRAY TEXT:C222($_at_SetupValue; 0)
						SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
						SQL EXECUTE:C820($_T_SQLTEXT; $_al_SetupiD; $_at_SetupKeyword; $_at_SetupParameter; $_at_SetupValue)
						SQL LOAD RECORD:C822(SQL all records:K49:10)
						SQL LOGOUT:C872
					End if 
					$_l_ResolvedNameRow:=Find in array:C230($_at_SetupParameter; $_at_QStatsQueueName{$_l_index})
				End if 
				If ($_l_ResolvedNameRow>0)
					$_at_QStatsQueueResolvedName{$_l_index}:=$_at_SetupValue{$_l_ResolvedNameRow}
				Else 
					APPEND TO ARRAY:C911($_at_LearnedUnknown; $_at_QStatsQueueName{$_l_index})
				End if 
				
			Else 
				//TRACE
			End if 
		Else 
			$_at_QStatsQueueName{$_l_index}:="System"
			
		End if 
		$_l_AgentIDRow:=Find in array:C230($_al_QueueAgentIDS; $_al_QStatsagent{$_l_Index})
		If ($_l_AgentIDRow<0)
			$_T_SQLTEXT:="select agent_id, agent from qagent;"
			ARRAY LONGINT:C221($_al_QueueAgentIDS; 0)
			ARRAY TEXT:C222($_at_QueueAgent; 0)
			SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
			SQL EXECUTE:C820($_T_SQLTEXT; $_al_QueueAgentIDS; $_at_QueueAgent)
			SQL LOAD RECORD:C822(SQL all records:K49:10)
			SQL LOGOUT:C872
			$_l_AgentIDRow:=Find in array:C230($_al_QueueAgentIDS; $_al_QStatsagent{$_l_Index})
		End if 
		If ($_l_AgentIDRow>0)  //it should be !!!
			$_at_QStatsAgentName{$_l_index}:=$_at_QueueAgent{$_l_AgentIDRow}
		Else 
			//TRACE
		End if 
		
	End for 
	If (False:C215)
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"queue_stats2"+$_t_DateStringDoc+".txt"; "TEXT")
		
		For ($_l_Index; 1; Size of array:C274($_al_QueueRecordID))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_QueueRecordID{$_l_index}))+Char:C90(9)+($_at_QueueUUID{$_l_index})+Char:C90(9)+(($_at_QueueStatsDateTime{$_l_index}))+Char:C90(9)+(String:C10($_al_QStatsname{$_l_index}))+Char:C90(9)+$_at_QStatsQueueName{$_l_index}+Char:C90(9)+$_at_QStatsQueueResolvedName{$_l_index}+Char:C90(9)+(String:C10($_al_QStatsagent{$_l_index}))+Char:C90(9)+$_at_QStatsAgentName{$_l_index}+Char:C90(9))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_QStatsevent{$_l_index}))+Char:C90(9)+$_at_QStatsEventName{$_l_index}+Char:C90(9)+($_at_Info1{$_l_index})+Char:C90(9)+($_at_Info2{$_l_index})+Char:C90(9))
			SEND PACKET:C103($_ti_Document; ($_at_Info3{$_l_index})+Char:C90(9)+(String:C10($_at_Info4{$_l_index}))+Char:C90(9)+($_at_Info5{$_l_index}))
			
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		//TRACE
	End if 
	
	
	
	//above info 1 is a number or a -
	
	//ARRAY TEXT($_at_GroupNames;0)
	///////
	$_T_SQLTEXT:="select id, cast(datetime as char), cast(datetimeconnect as char), cast(datetimeend as char), queue, agent, event, uniqueid, clid, url, position, info1, info2, overflow from queue_stats_mv"
	If ($_d_ToDate#!00-00-00!)
		$_T_SQLTEXT:=$_T_SQLTEXT+" where datetime >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)+""
		$_T_SQLTEXT:=$_T_SQLTEXT+" and datetime <"+Char:C90(Quote:K15:44)+$_t_DateToString+Char:C90(Quote:K15:44)+";"
	Else 
		$_T_SQLTEXT:=$_T_SQLTEXT+" where datetime >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)+";"
	End if 
	///
	ARRAY LONGINT:C221($_al_StatsMVID; 0)
	ARRAY TEXT:C222($_at_StatsMVDateTime; 0)
	ARRAY TEXT:C222($_at_StatsMVDateTimeConnect; 0)
	ARRAY TEXT:C222($_at_StatsMVDateTimeEnd; 0)
	ARRAY TEXT:C222($_at_StatsMVQname; 0)
	ARRAY TEXT:C222($_at_StatsMVagent; 0)
	ARRAY TEXT:C222($_at_StatsMVevent; 0)
	ARRAY TEXT:C222($_at_StatsMVCLID; 0)
	ARRAY TEXT:C222($_at_StatsMVURL; 0)
	ARRAY LONGINT:C221($_al_StatsMVPosition; 0)
	
	ARRAY TEXT:C222($_at_StatsMVInfo1; 0)
	ARRAY TEXT:C222($_at_statsMVInfo2; 0)
	ARRAY LONGINT:C221($_al_StatsOverFlow; 0)
	
	
	//ARRAY TEXT($_at_GroupNames;0)
	SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
	SQL EXECUTE:C820($_T_SQLTEXT; $_al_MVstatsID; $_at_statsMVDateTime; $_at_statsMVDateTimeConnect; $_at_statsMVDateTimeEnd; $_at_StatsMVQname; $_at_StatsMVagent; $_at_StatsMVevent; $_at_StatsMVCLID; $_at_StatsMVURL; $_al_StatsMVPosition; $_at_StatsMVInfo1; $_at_StatsMVInfo2; $_al_StatsMVOverFlow)
	SQL LOAD RECORD:C822(SQL all records:K49:10)
	
	SQL LOGOUT:C872
	If (False:C215)
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"queue_stats_mv"+$_t_DateStringDoc+".txt"; "TEXT")
		
		For ($_l_Index; 1; Size of array:C274($_al_MVstatsID))
			SEND PACKET:C103($_ti_Document; (String:C10($_al_MVstatsID{$_l_index}))+Char:C90(9)+($_at_statsMVDateTime{$_l_index})+Char:C90(9)+(($_at_statsMVDateTimeConnect{$_l_index}))+Char:C90(9)+(($_at_statsMVDateTimeEnd{$_l_index}))+Char:C90(9)+($_at_StatsMVQname{$_l_index})+Char:C90(9))
			SEND PACKET:C103($_ti_Document; ($_at_StatsMVagent{$_l_index})+Char:C90(9)+($_at_StatsMVevent{$_l_index})+Char:C90(9)+($_at_StatsMVCLID{$_l_index})+Char:C90(9))
			SEND PACKET:C103($_ti_Document; ($_at_StatsMVURL{$_l_index})+Char:C90(9)+(String:C10($_al_StatsMVPosition{$_l_index}))+Char:C90(9)+($_at_StatsMVInfo1{$_l_index})+Char:C90(9)+($_at_StatsMVInfo2{$_l_index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+String:C10($_al_StatsMVOverFlow{$_l_index}))
			
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
	End if 
	
	//TRACE
	
	
	
	
	$_T_SQLTEXT:="select Cast(calldate as char), clid, src, dst, dcontext, channel, dstchannel, lastapp, lastdata, duration, billsec, disposition, amaflags, accountcode, uniqueid, userfield, did, recordingfile, cnum, cnam, outbound_cnum, outbound_cnam, dst_cnam from cd"+"r"
	//$_ti_lastTime:=Current time
	//$_T_SQLTEXT:=$_T_SQLTEXT+" where calldate >"+Char(Quote)+$_t_DateString+Char(Quote)+";"
	If ($_d_ToDate#!00-00-00!)
		$_T_SQLTEXT:=$_T_SQLTEXT+" where calldate >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)
		$_T_SQLTEXT:=$_T_SQLTEXT+" and calldate <"+Char:C90(Quote:K15:44)+$_t_DateToString+Char:C90(Quote:K15:44)+";"
	Else 
		$_T_SQLTEXT:=$_T_SQLTEXT+" where calldate >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)+";"
	End if 
	ARRAY TEXT:C222($_at_CDRCallDate; 0)
	ARRAY TEXT:C222($_at_CDRClid; 0)
	ARRAY TEXT:C222($_at_CDRSrc; 0)
	ARRAY TEXT:C222($_at_CDRDst; 0)
	ARRAY TEXT:C222($_at_CDRdcontext; 0)
	ARRAY TEXT:C222($_at_CDRchannel; 0)
	ARRAY TEXT:C222($_at_CDRdstchannel; 0)
	ARRAY TEXT:C222($_at_CDRlastapp; 0)
	ARRAY TEXT:C222($_at_CDRlastdata; 0)
	ARRAY LONGINT:C221($_al_CDRduration; 0)
	ARRAY LONGINT:C221($_al_CDRbillsec; 0)
	ARRAY TEXT:C222($_at_CDRdisposition; 0)
	ARRAY LONGINT:C221($_al_CDRamaflags; 0)
	ARRAY TEXT:C222($_at_CDRaccountcode; 0)
	ARRAY TEXT:C222($_at_CDRuniqueid; 0)
	ARRAY TEXT:C222($_at_CDRuserfield; 0)
	ARRAY TEXT:C222($_at_CDRdid; 0)
	ARRAY TEXT:C222($_at_CDRrecordingfile; 0)
	ARRAY TEXT:C222($_at_CDRcnum; 0)
	ARRAY TEXT:C222($_at_CDRcnam; 0)
	ARRAY TEXT:C222($_at_CDRoutboundcNum; 0)
	ARRAY TEXT:C222($_at_CDRoutboundCNam; 0)
	ARRAY TEXT:C222($_at_CDRdstcnam; 0)
	SQL LOGIN:C817("asteriskcdrdb"; "trendaccess"; "Y0urD8t8b8s3Access")
	SQL EXECUTE:C820($_T_SQLTEXT; $_at_CDRCallDate; $_at_CDRClid; $_at_CDRSrc; $_at_CDRDst; $_at_CDRdcontext; $_at_CDRchannel; $_at_CDRdstchannel; $_at_CDRlastapp; $_at_CDRlastdata; $_al_CDRduration; $_al_CDRbillsec; $_at_CDRdisposition; $_al_CDRamaflags; $_at_CDRaccountcode; $_at_CDRuniqueid; $_at_CDRuserfield; $_at_CDRdid; $_at_CDRrecordingfile; $_at_CDRcnum; $_at_CDRcnam; $_at_CDRoutboundcNum; $_at_CDRoutboundCNam; $_at_CDRdstcnam)
	
	
	SQL LOAD RECORD:C822(SQL all records:K49:10)
	
	SQL LOGOUT:C872
	If (False:C215)
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"cdr"+$_t_DateStringDoc+".txt"; "TEXT")
		For ($_l_Index; 1; Size of array:C274($_at_CDRCallDate))
			SEND PACKET:C103($_ti_Document; ($_at_CDRCallDate{$_l_Index})+Char:C90(9)+($_at_CDRClid{$_l_Index})+Char:C90(9)+($_at_CDRSrc{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+($_at_CDRDst{$_l_Index})+Char:C90(9)+($_at_CDRdcontext{$_l_Index})+Char:C90(9)+($_at_CDRchannel{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+($_at_CDRdstchannel{$_l_Index})+Char:C90(9)+($_at_CDRlastapp{$_l_Index})+Char:C90(9)+($_at_CDRlastdata{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+String:C10($_al_CDRduration{$_l_Index})+Char:C90(9)+String:C10($_al_CDRbillsec{$_l_Index})+Char:C90(9)+($_at_CDRdisposition{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+String:C10($_al_CDRamaflags{$_l_Index})+Char:C90(9)+($_at_CDRaccountcode{$_l_Index})+Char:C90(9)+($_at_CDRuniqueid{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+($_at_CDRuserfield{$_l_Index})+Char:C90(9)+($_at_CDRdid{$_l_Index})+Char:C90(9)+($_at_CDRrecordingfile{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+($_at_CDRcnum{$_l_Index})+Char:C90(9)+($_at_CDRcnam{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(9)+($_at_CDRoutboundcNum{$_l_Index})+Char:C90(9)+($_at_CDRoutboundCNam{$_l_Index})+Char:C90(9)+($_at_CDRdstcnam{$_l_Index}))
			
			
			
			SEND PACKET:C103($_ti_Document; Char:C90(13))
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
	End if 
	
	//$_l_Year:=Year of(Current date)
	//$_l_Month:=Month of(Current date)
	//$_l_Date:=Day of(Current date)
	//$_t_timestring:=Time string($_ti_lastTime)
	//$_t_DateString:=String($_l_Year)+"-"+String($_l_Month)+"-"+String($_l_date)+" "+$_t_timestring
	$_T_SQLTEXT:="select id, eventtype, cast(eventtime as char) , cid_name, cid_num, cid_ani, cid_rdnis, cid_dnid, exten, context, channame, appname, appdata, amaflags, accountcode, uniqueid, linkedid, peer, userdeftype, extra from cel"
	//$_ti_lastTime:=Current time
	//$_T_SQLTEXT:=$_T_SQLTEXT+" where eventtime >"+Char(Quote)+$_t_DateString+Char(Quote)+";"
	If ($_d_ToDate#!00-00-00!)
		$_T_SQLTEXT:=$_T_SQLTEXT+" where eventtime >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)
		$_T_SQLTEXT:=$_T_SQLTEXT+" and eventtime <"+Char:C90(Quote:K15:44)+$_t_DateToString+Char:C90(Quote:K15:44)+";"
	Else 
		$_T_SQLTEXT:=$_T_SQLTEXT+" where eventtime >"+Char:C90(Quote:K15:44)+$_t_DateString+Char:C90(Quote:K15:44)+";"
	End if 
	ARRAY LONGINT:C221($_al_CELID; 0)
	ARRAY TEXT:C222($_at_CELEventtype; 0)
	ARRAY TEXT:C222($_at_CELEventTime; 0)
	ARRAY TEXT:C222($_at_CELCidName; 0)
	ARRAY TEXT:C222($_at_CELNum; 0)
	ARRAY TEXT:C222($_at_CELani; 0)
	ARRAY TEXT:C222($_at_CELrdnis; 0)
	ARRAY TEXT:C222($_at_CELdnid; 0)
	ARRAY TEXT:C222($_at_CELexten; 0)
	ARRAY TEXT:C222($_at_CELcontext; 0)
	ARRAY TEXT:C222($_at_CELchanname; 0)
	ARRAY TEXT:C222($_at_CELappname; 0)
	ARRAY TEXT:C222($_at_CELappdata; 0)
	ARRAY LONGINT:C221($_al_CELamaflags; 0)
	ARRAY TEXT:C222($_at_CELaccountcode; 0)
	ARRAY TEXT:C222($_at_CELuniqueid; 0)
	ARRAY TEXT:C222($_at_CELlinkedid; 0)
	ARRAY TEXT:C222($_at_CELpeer; 0)
	ARRAY TEXT:C222($_at_CELuserdeftype; 0)
	ARRAY TEXT:C222($_at_CELextra; 0)
	
	SQL LOGIN:C817("asteriskcdrdb"; "trendaccess"; "Y0urD8t8b8s3Access")
	SQL EXECUTE:C820($_T_SQLTEXT; $_al_CELID; $_at_CELEventtype; $_at_CELEventTime; $_at_CELCidName; $_at_CELNum; $_at_CELani; $_at_CELrdnis; $_at_CELdnid; $_at_CELexten; $_at_CELcontext; $_at_CELchanname; $_at_CELappname; $_at_CELappdata; $_al_CELamaflags; $_at_CELaccountcode; $_at_CELuniqueid; $_at_CELlinkedid; $_at_CELpeer; $_at_CELuserdeftype; $_at_CELextra)
	
	
	
	SQL LOAD RECORD:C822(SQL all records:K49:10)
	SQL LOGOUT:C872
	If (False:C215)
		$_t_DocumentPath:=System folder:C487(Documents folder:K41:18)
		$_ti_Document:=Create document:C266($_t_DocumentPath+"cel"+$_t_DateStringDoc+".txt"; "TEXT")
		For ($_l_Index; 1; Size of array:C274($_al_ID))
			//SEND PACKET($_ti_Document;($_at_CDRCallDate{$_l_Index})+Char(9)+($_at_CDRClid{$_l_Index})+Char(9)+($_at_CDRSrc{$_l_Index})+Char(9)+($_at_CDRDst{$_l_Index})+Char(9)+($_at_CDRdcontext{$_l_Index})+Char(9)+($_at_CDRchannel{$_l_Index})+Char(9)+($_at_CDRdstchannel{$_l_Index})+Char(9)+($_at_CDRlastapp{$_l_Index})+Char(9)+($_at_CDRlastdata{$_l_Index})+Char(9)+String($_al_CDRduration{$_l_Index})+Char(9)+String($_al_CDRbillsec{$_l_Index})+Char(9)+($_at_CDRdisposition{$_l_Index})+Char(9)+String($_al_CDRamaflags{$_l_Index})+Char(9)+($_at_CDRaccountcode{$_l_Index})+Char(9)+($_at_CDRuniqueid{$_l_Index})+Char(9)+($_at_CDRuserfield{$_l_Index})+Char(9)+($_at_CDRdid{$_l_Index})+Char(9)+($_at_CDRrecordingfile{$_l_Index})+Char(9)+($_at_CDRcnum{$_l_Index})+Char(9)+($_at_CDRcnam{$_l_Index})+Char(9)+($_at_CDRoutboundcNum{$_l_Index})+Char(9)+($_at_CDRoutboundCNam{$_l_Index})+Char(9)+($_at_CDRdstcnam{$_l_Index}))
			SEND PACKET:C103($_ti_Document; Char:C90(13))
			
		End for 
		CLOSE DOCUMENT:C267($_ti_Document)
		//TRACE
	End if 
	
	//Stand-Alone Records
	//These records convey a channel event on the channel that does not involve channels or bridges other than the Primary.
	//Interaction Records
	//These records convey the Primary's interactions with other channels or bridges.
	//Meta-Records
	//These records convey additional context relating to surrounding CEL records
	//ARRAY TEXT($_at_InternalSources;0)
	//ARRAY TEXT($_at_InternalSourceNames;0)
	$_t_BaseNumber:="01923249911"
	$_t_BaseNumberNoCode:="249911"
	ARRAY LONGINT:C221($_al_ProcessedCELID; 0)
	
	For ($_l_Build; 1; Size of array:C274($_al_CELID))
		$_t_ThisCelUniqueID:=$_at_CELuniqueid{$_l_Build}
		$_l_Already:=Find in array:C230($_al_ProcessedCELID; $_al_CELID{$_l_Build})
		If ($_l_Already<0)
			APPEND TO ARRAY:C911($_al_ProcessedCELID; $_al_CELID{$_l_Build})
			$_l_NumberofRecords:=Count in array:C907($_at_CELuniqueid; $_at_CELuniqueid{$_l_Build})
			$_l_StartRow:=$_l_Build
			For ($_l_Build2; $_l_StartRow; $_l_NumberofRecords)
				
				$_l_Position:=Position:C15("."; $_at_CELuniqueid{$_l_Build})
				If ($_l_Position>0)
					
					$_t_extractedID:=Substring:C12($_at_CELuniqueid{$_l_Build}; 1; $_l_Position-1)
					QUERY:C277([TELEPHONE_EVENTSLOG:215]; [TELEPHONE_EVENTSLOG:215]TelCELRecordID:28=$_al_CELID{$_l_Build})
					If (Records in selection:C76([TELEPHONE_EVENTSLOG:215])=0)
						CREATE RECORD:C68([TELEPHONE_EVENTSLOG:215])
						[TELEPHONE_EVENTSLOG:215]TelExtractedGroupingUUID:4:=$_t_extractedID
						[TELEPHONE_EVENTSLOG:215]TelCELRecordID:28:=$_al_CELID{$_l_Build}
					End if 
					$_l_Position:=Position:C15(" "; $_at_CELEventTime{$_l_Build})
					If ($_l_Position>0)
						$_t_DateString2:=Substring:C12($_at_CELEventTime{$_l_Build}; 1; $_l_Position-1)
						$_t_TimeString:=Substring:C12($_at_CELEventTime{$_l_Build}; $_l_Position+1)
						$_l_Position:=Position:C15("-"; $_t_DateString2)
						If ($_l_Position>0)
							$_t_Year:=Substring:C12($_t_DateString2; 1; $_l_Position-1)
							$_t_DateString2:=Substring:C12($_t_DateString2; $_l_Position+1)
							$_l_Position:=Position:C15("-"; $_t_DateString2)
							If ($_l_Position>0)
								$_t_Month:=Substring:C12($_t_DateString2; 1; $_l_Position-1)
								$_t_DateString2:=Substring:C12($_t_DateString2; $_l_Position+1)
							End if 
						End if 
						$_d_Date:=Date:C102($_t_DateString2+"/"+$_t_Month+"/"+$_t_Year)
						$_ti_Time:=Time:C179($_t_TimeString)
						
						[TELEPHONE_EVENTSLOG:215]Tel_EventDate:5:=$_d_Date
						[TELEPHONE_EVENTSLOG:215]Tel_EventTime:6:=$_ti_Time
						[TELEPHONE_EVENTSLOG:215]Tel_EventTimeStamp:7:=DATA_CreateTimeStamp($_d_Date; $_ti_Time)
						[TELEPHONE_EVENTSLOG:215]TelEventType:8:=$_at_CELEventtype{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelSysUUID:2:=$_at_CELuniqueid{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelSysLinkedUUID:3:=$_at_CELlinkedid{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelActionContext:19:=$_at_CELcontext{$_l_Build}  // for example from-internal
						//SQL EXECUTE($_T_SQLTEXT;$_al_ID;;;;;;;;;;;;;;;;$_at_peer;$_at_userdeftype;$_at_extra)
						[TELEPHONE_EVENTSLOG:215]TelAccountCode:20:=$_at_CELaccountcode{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelCallerName:9:=$_at_CELCidName{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelCallerNumber:10:=$_at_CELNum{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelCallerIDANI:15:=$_at_CELani{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelCallerIDRDNIS:16:=$_at_CELrdnis{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelCallerIDDNID:17:=$_at_CELdnid{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelExecutingChannel:18:=$_at_CELchanname{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelExecutingExtension:22:=$_at_CELexten{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelExecutingApplication:23:=$_at_CELappname{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelApplicationData:24:=$_at_CELappdata{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelAMAFlags:21:=$_al_Celamaflags{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelAccountCode:20:=$_at_Celaccountcode{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelPeer:25:=$_at_CELpeer{$_l_Build}
						[TELEPHONE_EVENTSLOG:215]TelUserDefined:26:=$_at_CELuserdeftype{$_l_Build}
						If ([TELEPHONE_EVENTSLOG:215]TelSysUUID:2="1583137839.15120")
							TRACE:C157
						End if 
						
						If ($_at_CELextra{$_l_Build}#"")
							$_obj_Data:=JSON Parse:C1218($_at_CELextra{$_l_Build})
							[TELEPHONE_EVENTSLOG:215]TelEtxta:27:=$_obj_Data
						End if 
						///
						If (False:C215)
							$_l_AgentIDRow:=Find in array:C230($_al_QueueAgentIDS; $_al_QStatsagent{$_l_Build})
							If ($_l_AgentIDRow<0)
								$_T_SQLTEXT:="select agent_id, agent from qagent;"
								ARRAY LONGINT:C221($_al_QueueAgentIDS; 0)
								ARRAY TEXT:C222($_at_QueueAgent; 0)
								SQL LOGIN:C817("qstats"; "trendaccess"; "Y0urD8t8b8s3Access")
								SQL EXECUTE:C820($_T_SQLTEXT; $_al_QueueAgentIDS; $_at_QueueAgent)
								SQL LOAD RECORD:C822(SQL all records:K49:10)
								SQL LOGOUT:C872
								$_l_AgentIDRow:=Find in array:C230($_al_QueueAgentIDS; $_al_QStatsagent{$_l_Build})
							End if 
							If ($_l_AgentIDRow>0)  //it should be !!!
								$_at_QStatsAgentName{$_l_Build}:=$_at_QueueAgent{$_l_AgentIDRow}
							Else 
								//TRACE
							End if 
							///
						End if 
						SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
						
						//TRACE
						
						$_l_FindCDR:=Find in array:C230($_at_CDRuniqueid; $_at_CELuniqueid{$_l_Build})
						$_bo_FromAgentPhone:=False:C215
						$_bo_ToAgentPhone:=False:C215
						
						If ($_l_FindCDR>0)
							$_l_Duration:=$_al_CDRduration{$_l_FindCDR}
							$_t_CallerID:=$_at_CDRClid{$_l_FindCDR}
							$_t_Source:=$_at_CDRsrc{$_l_FindCDR}
							If ($_t_Source#"")
								
								If ($_t_BaseNumber=$_t_Source)
									$_t_Source:=$_at_CDRcNum{$_l_FindCDR}
									$_bo_OutboundCall:=True:C214
								Else 
									
									Case of 
										: ($_at_CDRdid{$_l_FindCDR}="249911") | ($_at_CDRdid{$_l_FindCDR}="699396") | ($_at_CDRdid{$_l_FindCDR}="699364")
											
											
											
										: ($_at_CDRdid{$_l_FindCDR}="")
											
										Else 
											//TRACE
											
									End case 
								End if 
								
							End if 
						End if 
						//SQL EXECUTE($_T_SQLTEXT;$_al_statsID;$_at_statsDateTime;$_at_statsDateTimeConnect;$_at_statsDateTimeEnd;$_at_StatsQname;$_at_Statsagent;$_at_Statsevent;$_at_StatsCLID;$_at_StatsURL;$_al_StatsPosition;$_at_StatsInfo1;$_at_StatsInfo2;$_al_StatsOverFlow)
						//SQL EXECUTE($_T_SQLTEXT;$_al_MVstatsID;$_at_statsMVDateTime;$_at_statsMVDateTimeConnect;$_at_statsMVDateTimeEnd;$_at_StatsMVQname;$_at_StatsMVagent;$_at_StatsMVevent;$_at_StatsMVCLID;$_at_StatsMVURL;$_al_StatsMVPosition;$_at_StatsMVInfo1;$_at_StatsMVInfo2;$_al_StatsMVOverFlow)
						//SQL EXECUTE($_T_SQLTEXT;$_al_QueueRecordID;$_at_QueueUUID;$_at_QueueStatsDateTime;$_al_QStatsname;$_al_QStatsagent;$_al_QStatsevent;$_at_Info1;$_at_Info2;$_at_Info3;$_at_Info4;$_at_Info5)
						
						$_bo_CallRecordFound:=False:C215
						$_l_FindQnameStats:=Find in array:C230($_at_StatsMVCLID; $_at_CELuniqueid{$_l_Build})
						If ($_l_FindQnameStats>0)
							//TRACE
							$_t_EventStartDateTime:=$_at_statsMVDateTime{$_l_FindQnameStats}
							$_bo_CallRecordFound:=True:C214
						End if 
						$_l_CallLength:=0
						$_l_FindQname2:=Find in array:C230($_at_QueueUUID; $_at_CELuniqueid{$_l_Build})
						$_t_CallStartDateTime:=""
						$_t_CallEndDateTime:=""
						$_ti_HangUpEndTime:=?00:00:00?
						$_ti_DialStartTIme:=?00:00:00?
						$_ti_PickUpStartTIme:=?00:00:00?
						$_l_CallLEngth1:=0
						$_l_CallLEngth2:=0
						$_l_CallLength3:=0
						$_l_TotalCallLength:=0
						$_l_RingTime:=0
						$_l_TalkTime:=0
						$_t_QueueEvent:=""
						$_t_QueueID:=""
						$_t_QueueName:=""
						If ($_l_FindQname2>0)
							//TRACE
							$_t_QueueID:=$_at_QStatsQueueName{$_l_FIndQName2}
							$_t_QueueName:=$_at_QStatsQueueResolvedName{$_l_FindQName2}
							If ($_at_QStatsEventName{$_l_FindQname2}#"RemoveMember") & ($_at_QStatsEventName{$_l_FindQname2}#"AddMember")
								$_l_NumberofRecords:=Count in array:C907($_at_QueueUUID; $_at_CELuniqueid{$_l_Build})  // -> Function result
								$_t_CallStartDateTime:=$_at_statsMVDateTimeConnect{$_l_FindQnameStats}
								$_t_CallEndDateTime:=$_at_statsMVDateTimeEnd{$_l_FindQnameStats}
								Util_DateTimeSplit($_t_CallStartDateTime; ->$_d_CallStartDate; ->$_ti_CallStartTime)
								Util_DateTimeSplit($_t_CallEndDateTime; ->$_d_CallEndDate; ->$_ti_CallEndTime)
								//this is the start and end time of the event
								For ($_l_GetActionTimes; 1; $_l_NumberofRecords)  //we are at the first record
									//CompleteAgent=End call?
									//EnterQueue-start dialling?
									//Connect-Pickup
									
									$_t_EventDateTime:=$_at_QueueStatsDateTime{$_l_FindQname2}
									Util_DateTimeSplit($_t_EventDateTime; ->$_d_EventStartDate; ->$_ti_EventStartTime)
									Case of 
										: ($_at_QStatsEventName{$_l_FindQname2}="CompleteAgent")
											$_ti_HangUpEndTime:=$_ti_EventStartTime
										: ($_at_QStatsEventName{$_l_FindQname2}="EnterQueue")
											$_ti_DialStartTIme:=$_ti_EventStartTime
										: ($_at_QStatsEventName{$_l_FindQname2}="Connect")
											$_ti_PickUpStartTIme:=$_ti_EventStartTime
									End case 
									$_l_FindQname2:=Find in array:C230($_at_QueueUUID; $_at_CELuniqueid{$_l_Build}; $_l_FindQname2+1)
								End for 
								//TRACE
								If ($_d_CallStartDate=$_d_CallEndDate)  //it would be odd but it is possible for a call to go from before midnight to after midnight
									$_l_TotalCallLength:=$_ti_CallEndTime-$_ti_CallStartTime
								Else 
									$_l_CallLEngth1:=?24:00:00?-$_ti_CallStartTime
									$_l_CallLEngth2:=$_ti_CallEndTime-?00:00:00?
									///and it could be more than a day
									$_l_CallLength3:=0
									If (($_d_CallEndDate-1)>$_d_CallStartDate)
										$_l_Days:=($_d_CallEndDate-$_d_CallStartDate)-1
										//so its only the days between
										$_l_CallLength3:=(?24:00:00?-?00:00:00?)*$_l_Days
									End if 
									$_l_TotalCallLength:=$_l_CallLEngth1+$_l_CallLEngth2+$_l_CallLength3
								End if 
								$_l_RingTime:=$_ti_PickUpStartTIme-$_ti_DialStartTIme
								$_l_TalkTime:=$_l_TotalCallLength  //-$_l_RingTime
							Else 
								//TRACE
								$_bo_CallRecordFound:=True:C214
								$_ti_LeaveJoinTime:=?00:00:00?
								$_ti_LeaveQueueTime:=?00:00:00?
								ARRAY TEXT:C222($_At_QueuesJoined; 0)
								ARRAY TEXT:C222($_at_QueuesLeft; 0)
								$_l_NumberofRecords:=Count in array:C907($_at_QueueUUID; $_at_CELuniqueid{$_l_Build})  // -> Function result
								$_t_EventDateTime:=$_at_QueueStatsDateTime{$_l_FindQname2}
								Util_DateTimeSplit($_t_EventDateTime; ->$_d_EventStartDate; ->$_ti_EventStartTime)
								
								For ($_l_GetActionTimes; 1; $_l_NumberofRecords)  //we are at the first record
									
									Case of 
										: ($_at_QStatsEventName{$_l_FindQname2}="RemoveMember")
											$_t_QueueEvent:="Log out of Queue"
											$_ti_LeaveQueueTime:=$_ti_EventStartTime
											//$_t_QueueID:=
											APPEND TO ARRAY:C911($_at_QueuesLeft; $_at_QStatsQueueName{$_l_FIndQName2})
											
											
										: ($_at_QStatsEventName{$_l_FindQname2}="Add Memember")
											$_t_QueueEvent:="Log In to Queue"
											$_ti_LeaveJoinTime:=$_ti_EventStartTime
											APPEND TO ARRAY:C911($_At_QueuesJoined; $_at_QStatsQueueName{$_l_FIndQName2})
											
									End case 
									$_l_FindQname2:=Find in array:C230($_at_QueueUUID; $_at_CELuniqueid{$_l_Build}; $_l_FindQname2+1)
								End for 
							End if 
						End if 
						If ($_bo_CallRecordFound)
							SEND PACKET:C103($_ti_Doc; [TELEPHONE_EVENTSLOG:215]TelActionContext:19+Char:C90(9)+[TELEPHONE_EVENTSLOG:215]TelEventType:8+Char:C90(13))
							
							Case of 
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="from-internal")
									If ([TELEPHONE_EVENTSLOG:215]TelEventType:8="Answer")
										TRACE:C157
									End if 
									
									[TELEPHONE_EVENTSLOG:215]QueueNumber:36:=$_t_QueueID
									[TELEPHONE_EVENTSLOG:215]QueueName:37:=$_t_QueueName
									///
									If ($_t_QueueEvent#"")
										[TELEPHONE_EVENTSLOG:215]ChannelDirection:29:=$_t_QueueEvent
										[TELEPHONE_EVENTSLOG:215]InternalExtensionNumber:34:=[TELEPHONE_EVENTSLOG:215]TelCallerNumber:10
										////:=[TELEPHONE_EVENTSLOG]TelCallerNumber
										
									Else 
										[TELEPHONE_EVENTSLOG:215]InternalExtensionNumber:34:=[TELEPHONE_EVENTSLOG:215]TelCallerNumber:10
										If (Length:C16([TELEPHONE_EVENTSLOG:215]InternalExtensionNumber:34)#3)
											//TRACE
										End if 
										[TELEPHONE_EVENTSLOG:215]ChannelDirection:29:="Outbound"
										[TELEPHONE_EVENTSLOG:215]ConnectedDurationTime:32:=$_l_TalkTime
										[TELEPHONE_EVENTSLOG:215]WaitingDurationTime:31:=$_l_RingTime
										//[TELEPHONE_EVENTSLOG]Tel_EventDate:=$_d_CallStartDate  //always the call start date
										[TELEPHONE_EVENTSLOG:215]DialedTime:30:=$_ti_CallStartTime
										[TELEPHONE_EVENTSLOG:215]ExternalNumber:35:=[TELEPHONE_EVENTSLOG:215]TelExecutingExtension:22
										
										$_T_MasterRecord:=[TELEPHONE_EVENTSLOG:215]Internal_Record_UUID:1
										$_t_MasterTelUUID:=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2
										$_l_RecordSequence:=1
										[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
										$_l_RecordSequence:=$_l_RecordSequence+1
										SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
									End if 
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="sub-record-check")
									//TRACE
									Case of 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="APP_START")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="APP_END")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											
										Else 
											TRACE:C157
											
									End case 
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="qlog-queuedial")
									//TRACE
									Case of 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="Answer")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											//This should have a 'from internal' in which we have recorded the times-so on this record we should not record the times.
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="Bridge_Enter")
											//TRACE
											//This should have a 'from internal' in which we have recorded the times-so on this record we should not record the times.
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="Bridge_Exit")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											//This should have a 'from internal' in which we have recorded the times-so on this record we should not record the times.
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="HANGUP")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											//This should have a 'from internal' in which we have recorded the times-so on this record we should not record the times.
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="APP_End")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											//This should have a 'from internal' in which we have recorded the times-so on this record we should not record the times.
											
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="CHAN_END")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="LINKEDID_END")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
										Else 
											TRACE:C157
									End case 
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="from-trunk")
									TRACE:C157
									//these are all CHAN_START
									
									[TELEPHONE_EVENTSLOG:215]ChannelDirection:29:="Inbound"
									[TELEPHONE_EVENTSLOG:215]ConnectedDurationTime:32:=$_l_TalkTime
									[TELEPHONE_EVENTSLOG:215]WaitingDurationTime:31:=$_l_RingTime
									//[TELEPHONE_EVENTSLOG]Tel_EventDate:=$_d_CallStartDate  //always the call start date
									[TELEPHONE_EVENTSLOG:215]DialedTime:30:=$_ti_CallStartTime
									If ($_t_BaseNumberNoCode#[TELEPHONE_EVENTSLOG:215]TelExecutingExtension:22) & ([TELEPHONE_EVENTSLOG:215]TelExecutingExtension:22#$_t_BaseNumber)
										[TELEPHONE_EVENTSLOG:215]InternalExtensionNumber:34:=[TELEPHONE_EVENTSLOG:215]TelExecutingExtension:22
									End if 
									[TELEPHONE_EVENTSLOG:215]QueueNumber:36:=$_t_QueueID
									[TELEPHONE_EVENTSLOG:215]QueueName:37:=$_t_QueueName
									[TELEPHONE_EVENTSLOG:215]ExternalNumber:35:=[TELEPHONE_EVENTSLOG:215]TelCallerNumber:10
									$_T_MasterRecord:=[TELEPHONE_EVENTSLOG:215]Internal_Record_UUID:1
									$_t_MasterTelUUID:=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2
									$_l_RecordSequence:=1
									[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
									$_l_RecordSequence:=$_l_RecordSequence+1
									SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
									
									
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="ivr-2")
									//TRACE
									//these are all ANSWER
									
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="ext-queues")
									
									Case of 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="APP_Start")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="Bridge_Enter")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="Bridge_Exit")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="APP_End")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="CHAN_END")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											
											
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="LINKEDID_END")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
											
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="HANGUP")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
									End case 
									
									//incoming call
									//[TELEPHONE_EVENTSLOG]ChannelDirection:="Inbound"
									//[TELEPHONE_EVENTSLOG]QueueNumber:=$_t_QueueID
									//[TELEPHONE_EVENTSLOG]QueueName:=$_t_QueueName
									//[TELEPHONE_EVENTSLOG]InternalExtensionNumber:=//this is to the queue
									//[TELEPHONE_EVENTSLOG]ExternalNumber:=[TELEPHONE_EVENTSLOG]TelCallerIDANI
									//SAVE RECORD([TELEPHONE_EVENTSLOG])
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="sub-record-check")
									TRACE:C157
									Case of 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="App_start")
											TRACE:C157
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="App_end")
											TRACE:C157
											
									End case 
									[TELEPHONE_EVENTSLOG:215]ChannelDirection:29:=$_t_QueueEvent
									[TELEPHONE_EVENTSLOG:215]InternalExtensionNumber:34:=[TELEPHONE_EVENTSLOG:215]TelCallerNumber:10
									[TELEPHONE_EVENTSLOG:215]QueueNumber:36:=$_t_QueueID
									[TELEPHONE_EVENTSLOG:215]QueueName:37:=$_t_QueueName
									[TELEPHONE_EVENTSLOG:215]DialedTime:30:=$_ti_CallStartTime
									SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
								: ([TELEPHONE_EVENTSLOG:215]TelActionContext:19="app_all-queue-toggle")
									Case of 
										: ([TELEPHONE_EVENTSLOG:215]TelEventType:8="ANSWER")
											If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
												
												[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
												[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
												$_l_RecordSequence:=$_l_RecordSequence+1
												SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
											Else 
												TRACE:C157
											End if 
										Else 
											TRACE:C157
											
									End case 
									
								Else 
									//TRACE
							End case 
						Else 
							If ($_t_MasterTelUUID=[TELEPHONE_EVENTSLOG:215]TelSysUUID:2)
								[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_T_MasterRecord
								[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
								$_l_RecordSequence:=$_l_RecordSequence+1
								SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
							Else 
								TRACE:C157
								$_t_RecordUUID:=[TELEPHONE_EVENTSLOG:215]Internal_Record_UUID:1
								If ([TELEPHONE_EVENTSLOG:215]TelSysUUID:2#[TELEPHONE_EVENTSLOG:215]TelSysLinkedUUID:3)
									$_t_ParentSysID:=[TELEPHONE_EVENTSLOG:215]TelSysLinkedUUID:3
									QUERY:C277([TELEPHONE_EVENTSLOG:215]; [TELEPHONE_EVENTSLOG:215]TelSysUUID:2=$_t_ParentSysID)
									$_l_RecordSequence:=Records in selection:C76([TELEPHONE_EVENTSLOG:215])+1
									QUERY SELECTION BY FORMULA:C207([TELEPHONE_EVENTSLOG:215]; UTIL_isUUIDNil([TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38))
									QUERY:C277([TELEPHONE_EVENTSLOG:215]; [TELEPHONE_EVENTSLOG:215]TelSysLinkedUUID:3=$_t_ParentSysID; *)
									QUERY:C277([TELEPHONE_EVENTSLOG:215];  & ; [TELEPHONE_EVENTSLOG:215]TelSysUUID:2#$_t_ParentSysID; *)
									QUERY:C277([TELEPHONE_EVENTSLOG:215];  & ; [TELEPHONE_EVENTSLOG:215]TelRecordSequence:39#0)
									$_l_RecordSequence:=$_l_RecordSequence+Records in selection:C76([TELEPHONE_EVENTSLOG:215])
									$_t_TelTimingsRecordUUID:=[TELEPHONE_EVENTSLOG:215]Internal_Record_UUID:1
									QUERY:C277([TELEPHONE_EVENTSLOG:215]; [TELEPHONE_EVENTSLOG:215]Internal_Record_UUID:1=$_t_RecordUUID)
									[TELEPHONE_EVENTSLOG:215]TelRecordSequence:39:=$_l_RecordSequence
									[TELEPHONE_EVENTSLOG:215]TelTimingsRecordUUID:38:=$_t_TelTimingsRecordUUID
									$_l_RecordSequence:=$_l_RecordSequence+1
									SAVE RECORD:C53([TELEPHONE_EVENTSLOG:215])
								End if 
							End if 
							
						End if 
						
					End if 
					
				End if 
				$_l_Build:=Find in array:C230($_at_CELuniqueid; $_t_ThisCelUniqueID; $_l_Build+1)
			End for 
			$_l_OldBUild:=$_l_Build
			
			If ($_l_Build<0)
				
			End if 
		End if 
	End for 
	$_t_MasterTelUUID:=""
	$_T_MasterRecord:=""
	$_l_RecordSequence:=0
	
	
	If ($_bo_CreateCallRecord)
		
	End if 
	
	//Note: Older(Pre v12) versions of asterisk generated
	//AST_CEL_BRIDGE_START
	//AST_CEL_BRIDGE_END
	//AST_CEL_CONF_START
	//AST_CEL_CONF_END
	//AST_CEL_CONF_ENTER
	//AST_CEL_CONF_EXIT
	//AST_CEL_HOOKFLASH
	//AST_CEL_3WAY_START
	//AST_CEL_3WAY_END
	//AST_CEL_BRIDGE_UPDATE
	//AST_CEL_TRANSFER
	//which are now not used-just in case you ever go to old data
	
	//an explanation of the fields in the CEL is as follows
	//CallerID Name NG added note: for an inbound call this is usually just the number the same as caller number, until it is transferred to a group where it shows like this Sales:07985241432 so preceeded by the group the number can also show as 'anonymous'
	//The name identifying the caller for this channel.
	
	//CallerID Number//for outbound or internal calls this is the extension number
	//The number identifying the caller for this channel.
	
	//CallerID ANI note that for most events this is the same as caller ID
	//Automatic Number Identification caller information provided for this channel.
	
	//CallerID RDNIS note that currently i have not information on the data
	//Redirecting information for this channel.
	
	//CallerID DNID for calls coming from outside this is the number they went to-this is often a longer number than an extension it is a  static number for handset events you see a *(event number)*(extension number) for an internal transfer you will see an extension number in here
	
	//Dialed Number Identification for this channel.
	
	//Extension
	//The extension in which this channel is currently executing. this is the extension handset in use
	
	//Context
	//The context in which this channel is currently executing.
	//Channel Name
	//The name of this channel.
	//Application Name
	//The name of the application that this channel is currently executing.
	///Application Data
	//The data provided to the application being executed.
	//Account Code
	//The account code used for billing.
	//Peer Account Code
	//The peer channel's account code.
	//Unique ID
	//This channel's instance unique identifier.
	//Linked ID
	//This channel's current linked ID which is affected by bridging operations.This identifier starts as the channel's unique ID.
	//AMA Flags
	//This channel's Automated Message Accounting flags.
	//Record Type Specific Fields
	//These fields vary or may be blank depending on the CEL record type.
	//User Defined Name
	//This field is only used for AST_CEL_USER_DEFINED and conveys the user-specified event type.
	//Extra
	//This field contains a JSON blob describing additional record-type-specific information.
	
Until (OK=0)
CLOSE DOCUMENT:C267($_ti_Doc)
ERR_MethodTrackerReturn("ASTERISX_TESTREPORTS"; $_t_oldMethodName)