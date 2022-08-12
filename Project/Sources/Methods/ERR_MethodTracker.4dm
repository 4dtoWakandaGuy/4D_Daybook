//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	// Creator: Nigel Greenlee
	//Date & time: 27/11/2009 17:15`Method: ERR_MethodTracker
	//Description
	
	//Parameters
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
C_BOOLEAN:C305(DB_Bo_DontReleaseUpderrtrackSem)
C_TEXT:C284(DB_t_TrackingMethodName)
C_LONGINT:C283(DB_l_TrackingEvent)
C_TEXT:C284(Document)
C_TEXT:C284($_t_MethodName; ERR_T_OldMethodName; DB_t_ErrorAlertMethodInfo)
C_BOOLEAN:C305(SYS_bo_NoTrack)
C_BOOLEAN:C305(DB_bo_ERR_TrackstackOnExit)
C_TEXT:C284(DB_t_ErrTrackingStack)  //"stack" var
C_BOOLEAN:C305(<>DB_Bo_ERRTrackerInited; DB_bo_ERRTrackerInited; <>DB_bo_ERRTrackerVarsInited)

C_BOOLEAN:C305(<>Err_bo_PrefShowChainInErrorMess; <>Err_bo_PrefShowChainInErrorEmai; <>DB_Bo_ERRTrackerInited)  //added 26/10/07 -kmw
C_LONGINT:C283(<>ERR_l_Applicationtype; <>Err_l_DebugLogStatus; <>DB_l_GenerateLogOnServer; <>DB_l_TrackPath; <>DB_l_LocalLog; <>DB_l_TrackingEvent; <>DB_l_TrackerEventElement)
C_TEXT:C284(<>DB_t_TrackingMethodName)
If (False:C215)
	If (Not:C34(<>DB_bo_ERRTrackerVarsInited))
		ARRAY LONGINT:C221(<>DB_al_TrackingEvent; 500)
		ARRAY LONGINT:C221(<>DB_al_TrackingProcessID; 500)
		ARRAY TEXT:C222(<>DB_at_TrackingData; 500)
		ARRAY TEXT:C222(<>DB_at_TrackMethodName; 500)
		ARRAY TEXT:C222(<>DB_at_TrackProcessName; 500)
		ARRAY TEXT:C222(<>DB_at_TrackProcessOrigin; 500)
		ARRAY LONGINT:C221(<>DB_al_TrackingProcessID; 500)
		ARRAY TEXT:C222(<>DB_at_TrackFormName; 500)
		ARRAY TEXT:C222(<>DB_at_TrackObjectName; 500)
		ARRAY TEXT:C222(<>DB_at_TrackTriggerName; 500)
		<>DB_l_TrackerEventElement:=0
		<>Err_l_ApplicationType:=Application type:C494
		C_LONGINT:C283($_l_Platform)
		//_O_PLATFORM PROPERTIES($_l_Platform;$_l_System;$_l_Machine)
		If (Position:C15("Get_PlatformProperty"; $_t_MethodName)=0)
			Get_PlatformProperty("Platform"; ->$_l_Platform)
		Else 
			<>ERR_bo_isMacintosh:=True:C214
			$_l_Platform:=0
		End if 
		<>ERR_bo_isMacintosh:=$_l_Platform#Windows:K25:3
		<>DB_bo_ERRTrackerVarsInited:=True:C214
	End if 
End if 
$_t_CurrentErrorMethod:=Method called on error:C704
If ($_t_CurrentErrorMethod#"")
	///bock  //this is to cause an error
End if 


//$0:="NUL"
If (False:C215)
	If (False:C215)  //in V18 this is replaces with the Call chain
	Else 
		
		If (error=0)
			TRACE:C157
			$0:=""
			$_col_CallChain:=Get call chain:C1662
			//so the above collection ALWAYS has ERR_methodTracker as the first line([0])
			//we want to take the first row away to get the chain
			$_col_CallChain.remove(0)
			$_t_MethodName:=$_col_CallChain[0].name
			If (Count parameters:C259>=2)
				$_l_FormEvent:=FORM Event:C1606
			End if 
			If (Not:C34(<>DB_bo_ERRTrackerVarsInited))
				ARRAY LONGINT:C221(<>DB_al_TrackingEvent; 500)
				ARRAY LONGINT:C221(<>DB_al_TrackingProcessID; 500)
				ARRAY TEXT:C222(<>DB_at_TrackingData; 500)
				ARRAY TEXT:C222(<>DB_at_TrackMethodName; 500)
				ARRAY TEXT:C222(<>DB_at_TrackProcessName; 500)
				ARRAY TEXT:C222(<>DB_at_TrackProcessOrigin; 500)
				ARRAY LONGINT:C221(<>DB_al_TrackingProcessID; 500)
				ARRAY TEXT:C222(<>DB_at_TrackFormName; 500)
				ARRAY TEXT:C222(<>DB_at_TrackObjectName; 500)
				ARRAY TEXT:C222(<>DB_at_TrackTriggerName; 500)
				<>DB_l_TrackerEventElement:=0
				<>Err_l_ApplicationType:=Application type:C494
				If (Position:C15("Get_PlatformProperty"; $_t_MethodName)=0)
					Get_PlatformProperty("Platform"; ->$_l_Platform)
				Else 
					<>ERR_bo_isMacintosh:=True:C214
					$_l_Platform:=0
				End if 
				<>ERR_bo_isMacintosh:=$_l_Platform#Windows:K25:3
				<>DB_bo_ERRTrackerVarsInited:=True:C214
			End if 
			If (Not:C34(DB_bo_ERRTrackerInited))
				DB_bo_ERRTrackerInited:=True:C214
			End if 
			//<>Err_bo_PrefShowChainInErrorMess:=False
			//<>Err_bo_PrefShowChainInErrorEmai:=False
			
			
			If ((<>Err_bo_PrefShowChainInErrorMess) | (<>Err_bo_PrefShowChainInErrorEmai)) & ($_l_CountParameters>0) & (Not:C34(SYS_bo_NoTrack))  //added call chain recording/reporting 18/10/07 -kmw
				Case of 
					: (Not:C34(DB_bo_ERR_TrackstackOnExit))
						Case of 
							: (DB_t_ErrTrackingStack#"")
								Case of 
									: ($_l_CountParameters>=2)
										$_t_EventNumberString:=String:C10($_l_EventNumber)
										DB_t_ErrTrackingStack:=DB_t_ErrTrackingStack+DB_t_ErrTrackingStack+" (Call to) "+$_t_MethodName+" (event) "+$_t_EventNumberString
									Else 
										DB_t_ErrTrackingStack:=DB_t_ErrTrackingStack+" (Call to) "+$_t_MethodName
								End case 
								
								
							Else 
								
								Case of 
									: ($_l_CountParameters>=2)
										$_t_EventNumberString:=String:C10($_l_EventNumber)
										DB_t_ErrTrackingStack:=DB_t_ErrTrackingStack+"(event)"+$_t_EventNumberString
									Else 
										DB_t_ErrTrackingStack:=$_t_MethodName
								End case 
						End case 
					Else 
						DB_t_ErrTrackingStack:=DB_t_ErrTrackingStack+"(Return to)"+$_t_MethodName
				End case 
				
				
				If (Length:C16(DB_t_ErrTrackingStack)>5000)
					DB_t_ErrTrackingStack:=Substring:C12(DB_t_ErrTrackingStack; (Length:C16(DB_t_ErrTrackingStack)-5000))
				End if 
			End if 
			$_l_RunTracker:=0
			Case of 
				: (Not:C34(SYS_bo_NoTrack))
					$_bo_NoErrorProc:=False:C215
					$_bo_NoTrack:=SYS_bo_NoTrack
					SYS_bo_NoTrack:=True:C214
					$_l_RunTracker:=0
					$_l_Applicationtype:=<>Err_l_ApplicationType  //optimize functions as this method is called from everywhere
					Case of 
						: ($_l_Applicationtype=4D Server:K5:6)
							$_l_RunTracker:=<>DB_l_GenerateLogOnServer
						Else 
							$_l_RunTracker:=<>DB_l_TrackPath
					End case 
					If (<>DB_l_TrackPath=1)
						$_l_RunTracker:=<>DB_l_TrackPath
					End if 
					$_bo_ValidApplication:=($_l_Applicationtype=0) | ($_l_Applicationtype=4)
					Case of 
						: ($_l_RunTracker=1) | (Not:C34(<>Err_l_DebugLogStatus<0))
							While (Semaphore:C143("$Hold"))
								DELAY PROCESS:C323(Current process:C322; 2)
							End while 
							$0:=DB_t_ErrorAlertMethodInfo
							If ($_l_CountParameters>=1) | (Not:C34(<>Err_l_DebugLogStatus<-10))
								$_t_LastDocument:=Document
								$_l_OK:=OK
								DB_t_ErrorAlertMethodInfo:=$_t_MethodName
								If (Not:C34(<>Err_l_DebugLogStatus<0))
									ErrorDebug_logview(DB_t_ErrorAlertMethodInfo)
								End if 
								
								//$_l_RunTracker:=Num((◊l_ErrorDebugLogStatus=1) | (◊DB_GenerateLogOnServer_L=1) | (◊DB_l_TrackPath=1))
								If (DB_t_ErrorAlertMethodInfo#"")
									If ($_l_RunTracker=1)
										PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_ProcessUID; $_l_ProcessOrigin)
										While (Semaphore:C143("$Upderrtrack"))
											DelayTicks(10)
										End while 
										DB_Bo_DontReleaseUpderrtrackSem:=True:C214
										If (Not:C34(<>DB_Bo_ERRTrackerInited))
											$_t_DocumentsPath:=DB_GetDocumentPath
											$_t_DocumentPath:=$_t_DocumentsPath+"Object_access_Log.txt"
											$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentPath; "TEXT")
											If ($_ti_DocumentRef#?00:00:00?)
												$_t_LogData:=""
												$_t_LogData:=$_t_LogData+"Time"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Date"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Method"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Form"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Trigger"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Object"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Event"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Data"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Process"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Process ID"+Char:C90(Tab:K15:37)
												$_t_LogData:=$_t_LogData+"Free Memory"+Char:C90(Tab:K15:37)
												If (<>ERR_bo_isMacintosh)
													$_t_LogData:=$_t_LogData+"Up Since"+Char:C90(Carriage return:K15:38)
												Else 
													$_t_LogData:=$_t_LogData+"Up Since"+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
												End if 
												SEND PACKET:C103($_ti_DocumentRef; $_t_LogData)
												CLOSE DOCUMENT:C267($_ti_DocumentRef)
												
												<>DB_Bo_ERRTrackerInited:=True:C214
											End if 
										End if 
										
										If ($_l_RunTracker=1)  //we are tracing events
											<>DB_l_TrackerEventElement:=<>DB_l_TrackerEventElement+1
											If (<>DB_l_TrackerEventElement>Size of array:C274(<>DB_al_TrackingEvent))  //501, 1001,1501
												$_t_CurrentSize:=Size of array:C274(<>DB_al_TrackingEvent)  //500, 1000,`1500
												If ($_t_CurrentSize>1000)
													DELETE FROM ARRAY:C228(<>DB_al_TrackingEvent; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_at_TrackingData; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_at_TrackMethodName; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_at_TrackFormName; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_at_TrackObjectName; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_at_TrackTriggerName; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_at_TrackProcessName; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_at_TrackProcessOrigin; 1; 500)
													DELETE FROM ARRAY:C228(<>DB_al_TrackingProcessID; 1; 500)
													$_t_CurrentSize:=Size of array:C274(<>DB_al_TrackingEvent)  //1000
													<>DB_l_TrackerEventElement:=1  // 1001
												End if 
												$_l_NewSize:=$_t_CurrentSize+500  // ,1000,  `1500
												ARRAY LONGINT:C221(<>DB_al_TrackingEvent; $_l_NewSize)
												ARRAY LONGINT:C221(<>DB_al_TrackingProcessID; $_l_NewSize)
												ARRAY TEXT:C222(<>DB_at_TrackingData; $_l_NewSize)
												ARRAY TEXT:C222(<>DB_at_TrackMethodName; $_l_NewSize)
												ARRAY TEXT:C222(<>DB_at_TrackProcessName; $_l_NewSize)
												ARRAY TEXT:C222(<>DB_at_TrackProcessOrigin; $_l_NewSize)
												ARRAY LONGINT:C221(<>DB_al_TrackingProcessID; $_l_NewSize)
												ARRAY TEXT:C222(<>DB_at_TrackFormName; $_l_NewSize)
												ARRAY TEXT:C222(<>DB_at_TrackObjectName; $_l_NewSize)
												ARRAY TEXT:C222(<>DB_at_TrackTriggerName; $_l_NewSize)  //1000, 1500
											End if 
											<>DB_at_TrackProcessName{<>DB_l_TrackerEventElement}:=$_t_ProcessName
											$_t_Origin:=""
											Case of 
												: ($_l_ProcessOrigin=-11)
													$_t_Origin:="Web Process with Context "
												: ($_l_ProcessOrigin=-10)
													$_t_Origin:="Other 4D Process"
												: ($_l_ProcessOrigin=-9)
													$_t_Origin:="External Task"
												: ($_l_ProcessOrigin=-8)
													$_t_Origin:="Event Manager"
												: ($_l_ProcessOrigin=-7)
													$_t_Origin:="Apple Event Manager"
												: ($_l_ProcessOrigin=-6)
													$_t_Origin:="Serial Port Manager"
												: ($_l_ProcessOrigin=-5)
													$_t_Origin:="Indexing Process Longint"
												: ($_l_ProcessOrigin=-4)
													$_t_Origin:="Cache Manager Longint"
												: ($_l_ProcessOrigin=-3)
													$_t_Origin:="Web Process with no Context "
												: ($_l_ProcessOrigin=-2)
													$_t_Origin:="Design Process Longint"
												: ($_l_ProcessOrigin=-1)
													$_t_Origin:="User or Custom Menus Process "
												: ($_l_ProcessOrigin=0)
													$_t_Origin:="None"
												: ($_l_ProcessOrigin=1)
													$_t_Origin:="Created from Programming"
												: ($_l_ProcessOrigin=2)
													$_t_Origin:="Created from Menu Command"
												: ($_l_ProcessOrigin=3)
													$_t_Origin:="Created from User_Mode"
												: ($_l_ProcessOrigin=4)
													$_t_Origin:="Other User Process"
												Else 
													$_t_Origin:="Unknown origin"
											End case 
											<>DB_at_TrackProcessOrigin{<>DB_l_TrackerEventElement}:=$_t_Origin
											<>DB_al_TrackingProcessID{<>DB_l_TrackerEventElement}:=$_l_ProcessUID
											Case of 
												: ($_l_CountParameters=1)  //this is a method
													<>DB_at_TrackMethodName{<>DB_l_TrackerEventElement}:=$_t_MethodName
													<>DB_at_TrackTriggerName{<>DB_l_TrackerEventElement}:=""
													<>DB_al_TrackingEvent{<>DB_l_TrackerEventElement}:=0
													<>DB_at_TrackObjectName{<>DB_l_TrackerEventElement}:=""
													<>DB_at_TrackFormName{<>DB_l_TrackerEventElement}:=""
												: ($_l_CountParameters=2)  //form method or object method
													<>DB_at_TrackMethodName{<>DB_l_TrackerEventElement}:=$_t_MethodName
													Case of 
														: ($_t_MethodName[[Length:C16($_t_MethodName)]]="]")
															<>DB_at_TrackFormName{<>DB_l_TrackerEventElement}:=""
															<>DB_at_TrackTriggerName{<>DB_l_TrackerEventElement}:=$_t_MethodName
															<>DB_al_TrackingEvent{<>DB_l_TrackerEventElement}:=$_l_EventNumber
															<>DB_at_TrackObjectName{<>DB_l_TrackerEventElement}:=""
															//this is a trigger
														: (Position:C15("."; $_t_MethodName)>0)
															$_t_TestName:=$_t_MethodName
															$_t_TestName:=Replace string:C233($_t_TestName; "."; "")
															If ((Length:C16($_t_TestName)+2)=Length:C16($_t_MethodName))  //this is an object
																$_t_ObjectName:=""
																For ($_l_index2; Length:C16($_t_MethodName); 1; -1)
																	If ($_t_MethodName[[$_l_index2]]=".")
																		$_t_ObjectName:=Substring:C12($_t_MethodName; $_l_index2+1; Length:C16($_t_MethodName))
																		$_l_index2:=0
																	End if 
																End for 
																<>DB_at_TrackFormName{<>DB_l_TrackerEventElement}:=""
																<>DB_at_TrackTriggerName{<>DB_l_TrackerEventElement}:=""
																<>DB_al_TrackingEvent{<>DB_l_TrackerEventElement}:=0
																<>DB_at_TrackObjectName{<>DB_l_TrackerEventElement}:=$_t_MethodName
																
															Else   // this is a form method
																<>DB_at_TrackFormName{<>DB_l_TrackerEventElement}:=$_t_MethodName
																<>DB_at_TrackTriggerName{<>DB_l_TrackerEventElement}:=""
																<>DB_at_TrackObjectName{<>DB_l_TrackerEventElement}:=""
																<>DB_al_TrackingEvent{<>DB_l_TrackerEventElement}:=$_l_EventNumber
															End if 
													End case 
											End case 
											
											If (<>DB_l_LocalLog=1) | ((<>DB_l_GenerateLogOnServer=1) & ($_l_Applicationtype=4D Server:K5:6))
												$_t_DocumentsPath:=DB_GetDocumentPath
												$_t_DocumentPath:=$_t_DocumentsPath+"Object_access_Log.txt"
												If (Test path name:C476($_t_DocumentPath)#Is a document:K24:1)
													$_ti_NewDocRef:=DB_CreateDocument($_t_DocumentPath)
													CLOSE DOCUMENT:C267($_ti_NewDocRef)
												End if 
												$_ti_DocumentRef:=Append document:C265($_t_DocumentPath; "TEXT")
												If ($_ti_DocumentRef#?00:00:00?)
													C_LONGINT:C283($totalMemory; $_r_PhyiscalMemory; $_r_FreeMemory; $_r_FreeStack)
													//AP AVAILABLE MEMORY ($totalMemory;$_r_PhyiscalMemory;$_r_FreeMemory;$_r_FreeStack)
													$_t_LogData:=""
													$_t_LogData:=$_t_LogData+String:C10(Current time:C178)+Char:C90(Tab:K15:37)+String:C10(Current date:C33)+Char:C90(Tab:K15:37)+<>DB_at_TrackMethodName{<>DB_l_TrackerEventElement}+Char:C90(Tab:K15:37)+<>DB_at_TrackFormName{<>DB_l_TrackerEventElement}+Char:C90(Tab:K15:37)+<>DB_at_TrackTriggerName{<>DB_l_TrackerEventElement}+Char:C90(Tab:K15:37)+<>DB_at_TrackObjectName{<>DB_l_TrackerEventElement}+Char:C90(Tab:K15:37)+String:C10(<>DB_al_TrackingEvent{<>DB_l_TrackerEventElement})+Char:C90(Tab:K15:37)+<>DB_at_TrackingData{<>DB_l_TrackerEventElement}+Char:C90(Tab:K15:37)+<>DB_at_TrackProcessName{<>DB_l_TrackerEventElement}+Char:C90(Tab:K15:37)+String:C10(<>DB_al_TrackingProcessID{<>DB_l_TrackerEventElement})+Char:C90(Tab:K15:37)+String:C10($_r_FreeMemory)+Char:C90(Tab:K15:37)
													If (<>ERR_bo_isMacintosh)
														$_t_LogData:=$_t_LogData+String:C10(((Current time:C178*1)*60))+Char:C90(Carriage return:K15:38)
													Else 
														$_t_LogData:=$_t_LogData+String:C10(((Current time:C178*1)*60))+Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
														
													End if 
													SEND PACKET:C103($_ti_DocumentRef; $_t_LogData)
													CLOSE DOCUMENT:C267($_ti_DocumentRef)
													
												End if 
												
											End if 
										End if 
										DB_Bo_DontReleaseUpderrtrackSem:=False:C215
										CLEAR SEMAPHORE:C144("$Upderrtrack")
									End if 
									
								End if 
								If ($_t_MethodName#"Err@") & ($_t_MethodName#"IWS_NTKErrorHandler")  //KMW v631b120p Added check for the NTK error handler - Probably unnessaary as it looks like this Check_Dates from a time when Error_Procs still called ERR_MethodTracker which I don't think they do anymore.
									$0:=DB_t_TrackingMethodName
									
									DB_t_TrackingMethodName:=$_t_MethodName
									If ($_l_CountParameters>1)
										DB_l_TrackingEvent:=$_l_EventNumber
									Else 
										DB_l_TrackingEvent:=0
									End if 
								Else 
									$0:=$_t_MethodName
									
								End if 
								OK:=$_l_OK
								Document:=$_t_LastDocument
								
							End if 
							CLEAR SEMAPHORE:C144("$Hold")
							
						Else 
							If ($_t_MethodName#"Err@") & ($_t_MethodName#"IWS_NTKErrorHandler")  //KMW v631b120p Added check for the NTK error handler - Probably unnessaary as it looks like this Check_Dates from a time when Error_Procs still called ERR_MethodTracker which I don't think they do anymore.
								$0:=DB_t_TrackingMethodName
								DB_t_TrackingMethodName:=$_t_MethodName
								If ($_l_CountParameters>=2)
									DB_l_TrackingEvent:=$_l_EventNumber
								Else 
									DB_l_TrackingEvent:=0
								End if 
							Else 
								$0:=$_t_MethodName
								
							End if 
					End case 
					
					If (($_bo_ValidApplication) & ($_bo_NoErrorProc))
						
					Else 
						//TRACE
						$_t_CurrentErrorMethod:=Method called on error:C704
						If ($_t_CurrentErrorMethod="")
							//ALERT("Method called on error "+Method called on error+"ERR_METHODTRACKER")
							
							
							ON ERR CALL:C155("Error_Proc")
						End if 
					End if 
					SYS_bo_NoTrack:=$_bo_NoTrack
				Else 
					$0:="NUL"
					If (Method called on error:C704="")
						ON ERR CALL:C155("Error_Proc")
					End if 
			End case 
			C_BOOLEAN:C305(DB_bo_TestingCalls)
			
			
			
		End if 
	End if 
	//CLEAR SEMAPHORE("$Hold")
End if 
If (Count parameters:C259>=2)
	If ($1#"LOG@")
		//LOG_SimpleLog($1; String($2))
	End if 
Else 
	If ($1#"LOG@")
		//LOG_SimpleLog($1; "StartMethod")
	End if 
End if 
