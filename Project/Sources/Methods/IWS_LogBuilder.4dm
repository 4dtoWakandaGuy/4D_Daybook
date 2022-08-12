//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_LogBuilder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 13:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>IWS_al_Bytes;0)
	//ARRAY LONGINT(<>IWS_al_LogIP;0)
	//ARRAY LONGINT(<>IWS_al_Ms;0)
	//ARRAY LONGINT(<>IWS_al_MsPageBuild;0)
	//ARRAY TEXT(<>IWS_at_GetOrPost;0)
	//ARRAY TEXT(<>IWS_at_LogPage;0)
	//ARRAY TEXT(<>IWS_at_LogTime;0)
	//ARRAY TEXT(<>IWS_at_PageType;0)
	C_BOOLEAN:C305(<>IWS_bo_HighlightLast; <>IWS_bo_HitLogging; <>IWS_bo_Shutdown; $bContinue)
	C_LONGINT:C283(<>IWS_l_AveBuildTime; <>IWS_l_AveDynamic; <>IWS_l_AveStatic; <>IWS_l_AveTotalTime; <>IWS_l_CountDynamic; <>IWS_l_CountGET; <>IWS_l_CountPOST; <>IWS_l_CountStatic; <>IWS_l_LogChannel; <>IWS_l_LogRefresh; <>IWS_l_LogStartTime)
	C_LONGINT:C283(<>IWS_l_ShowHits; <>IWS_l_ShowProcessesInLog; <>IWS_l_TotalBuildTime; <>IWS_l_TotalDynamicTime; <>IWS_l_TotalStaticTime; $_l_CurrentTime; $_l_Hours; $_l_Index; $_l_LogArraySize; $_l_MessageCount; $_l_Minutes)
	C_LONGINT:C283($_l_NewSIze; $_l_NextCall; $_l_RunningTime; $_l_Seconds; $Tickcount)
	C_TEXT:C284(<>IWS_t_LogProcess; <>IWS_t_RunningTime; <>STR_t_CR; <>STR_t_LF; $_t_Message; $_t_oldMethodName)
	C_TIME:C306(<>IWS_ti_HitLog)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_LogBuilder")

//******************************************************************************
//
//Method: IWS_LogBuilder
//
//Written by  John Moore on 11/3/98
//
//Purpose: Routine to build the log and periodically
//pass the information to the log window, depending
//on setting
//
//$1 - type -purpose
//
// b24 Rollo 19990706 - Replaced method (new declaration at top & new
//     - section in the middle to write the new Hit log
//******************************************************************************
//ProcessDeclare
Start_Process





IPC_ClearMessageQueue(<>IWS_l_LogChannel)  //clear any messages in queue
IWS_StartLogCounts
$_l_NextCall:=Tickcount:C458+<>IWS_l_LogRefresh

While (Not:C34(<>IWS_bo_Shutdown))
	
	$_l_MessageCount:=IPC_MessagesInQueue(<>IWS_l_LogChannel)
	If ($_l_MessageCount>0)
		
		$_l_CurrentTime:=UTI_DateTimeToNum(Current date:C33; Current time:C178)
		$_l_RunningTime:=$_l_CurrentTime-<>IWS_l_LogStartTime
		
		$_l_LogArraySize:=Size of array:C274(<>IWS_at_LogTime)+1
		$_l_NewSIze:=$_l_LogArraySize-1+$_l_MessageCount
		UTI_ArrayInsertElements($_l_LogArraySize; $_l_MessageCount; -><>IWS_al_LogIP; -><>IWS_al_Bytes; -><>IWS_al_Ms; -><>IWS_al_MsPageBuild)
		UTI_ArrayInsertElements($_l_LogArraySize; $_l_MessageCount; -><>IWS_at_LogTime; -><>IWS_at_LogPage; -><>IWS_at_PageType; -><>IWS_at_GetOrPost)
		
		For ($_l_Index; $_l_LogArraySize; $_l_NewSIze)
			$_t_Message:=IPC_RcvMessage(<>IWS_l_LogChannel)
			If ($_t_Message#"ERROR@")
				<>IWS_al_LogIP{$_l_Index}:=Num:C11(STR_Param($_t_Message; 1))
				<>IWS_al_Bytes{$_l_Index}:=Num:C11(STR_Param($_t_Message; 2))
				<>IWS_al_Ms{$_l_Index}:=Num:C11(STR_Param($_t_Message; 3))
				<>IWS_al_MsPageBuild{$_l_Index}:=Num:C11(STR_Param($_t_Message; 4))
				<>IWS_at_LogTime{$_l_Index}:=STR_Param($_t_Message; 5)
				<>IWS_at_LogPage{$_l_Index}:=STR_Param($_t_Message; 6)
				<>IWS_at_PageType{$_l_Index}:=Substring:C12(STR_Param($_t_Message; 7); 1; 7)
				<>IWS_at_GetOrPost{$_l_Index}:=Substring:C12(STR_Param($_t_Message; 8); 1; 4)
				If (<>IWS_at_GetOrPost{$_l_Index}="POST")
					<>IWS_l_CountPOST:=<>IWS_l_CountPOST+1
				Else 
					<>IWS_l_CountGET:=<>IWS_l_CountGET+1
				End if 
				
				If (<>IWS_at_PageType{$_l_Index}="Dynamic")
					<>IWS_l_TotalDynamicTime:=<>IWS_l_TotalDynamicTime+<>IWS_al_Ms{$_l_Index}
					<>IWS_l_TotalBuildTime:=<>IWS_l_TotalBuildTime+<>IWS_al_MsPageBuild{$_l_Index}
					<>IWS_l_CountDynamic:=<>IWS_l_CountDynamic+1
				Else 
					<>IWS_l_TotalStaticTime:=<>IWS_l_TotalStaticTime+<>IWS_al_Ms{$_l_Index}
					<>IWS_l_CountStatic:=<>IWS_l_CountStatic+1
				End if 
			Else 
				<>IWS_at_LogTime{$_l_Index}:=$_t_Message  //added by John 4/21/99, to help track blank log message problem
			End if 
		End for 
		<>IWS_l_AveBuildTime:=<>IWS_l_TotalBuildTime/<>IWS_l_CountDynamic
		<>IWS_l_AveTotalTime:=(<>IWS_l_TotalDynamicTime+<>IWS_l_TotalStaticTime)/(<>IWS_l_CountDynamic+<>IWS_l_CountStatic)
		
		<>IWS_l_AveStatic:=3600*(<>IWS_l_CountStatic/$_l_RunningTime)
		<>IWS_l_AveDynamic:=3600*(<>IWS_l_CountDynamic/$_l_RunningTime)
		
		$_l_Hours:=$_l_RunningTime\3600
		$_l_Minutes:=($_l_RunningTime-($_l_Hours*3600))\60
		$_l_Seconds:=$_l_RunningTime-(($_l_Hours*3600)+($_l_Minutes*60))
		<>IWS_t_RunningTime:=String:C10($_l_Hours)+":"+String:C10($_l_Minutes; "00")+":"+String:C10($_l_Seconds; "00")
		//now set counts and averages
		
		IWS_HitInfo($_l_NewSIze)
		
		If (Size of array:C274(<>IWS_at_LogTime)>250)
			UTI_ArrayDeleteElements(1; 50; -><>IWS_al_LogIP; -><>IWS_al_Bytes; -><>IWS_al_Ms; -><>IWS_al_MsPageBuild)
			UTI_ArrayDeleteElements(1; 50; -><>IWS_at_LogTime; -><>IWS_at_LogPage; -><>IWS_at_PageType; -><>IWS_at_GetOrPost)
			
		End if   // If (Size of array(<>IWS_at_LogTime)>250)
		
		<>IWS_at_LogTime:=Size of array:C274(<>IWS_at_LogTime)
		<>IWS_at_LogPage:=Size of array:C274(<>IWS_at_LogPage)
		
		
		//Rollo 7/6/99 - **** this section from here
		If (<>IWS_bo_HitLogging)
			
			$bContinue:=True:C214
			
			If (<>IWS_ti_HitLog=?00:00:00?)  //Check to see if  the handle for the log is null
				$bContinue:=IWS_LOGOpen("HIT")
			End if   //Check for null document handle
			
			If ($bContinue)
				$_t_Message:=$_t_Message+<>STR_t_CR+<>STR_t_LF
				//could build text & then send later, but needs 'flush' mechanism
				//If (Length($tMsgCache)>5000)
				If (<>IWS_ti_HitLog#?00:00:00?)  //Final check for log existing and open
					SEND PACKET:C103(<>IWS_ti_HitLog; $_t_Message)
				End if 
				//End if
			End if 
			
		End if 
		//Rollo 7/6/99 - **** this section to here
		
		
	End if   // If ($_l_MessageCount>0)
	
	If (Tickcount:C458>$_l_NextCall) & (<>IWS_l_ShowHits=1)
		If ($_l_MessageCount>0)
			<>IWS_bo_HighlightLast:=True:C214
		Else 
			<>IWS_bo_HighlightLast:=False:C215
		End if 
		// BEEP
		IWS_GetTCPInfo
		If (<>IWS_l_ShowProcessesInLog=1)
			
			IWS_UpdateLogArrays
		End if 
		POST OUTSIDE CALL:C329(Process number:C372(<>IWS_t_LogProcess))  //update log window display
		//  CALL PROCESS(-1)
		$_l_NextCall:=Tickcount:C458+<>IWS_l_LogRefresh
	End if 
	
	DelayTicks(30)
	
End while   //While (Not(<>IWS_bo_Shutdown))
IPC_ClearMessageQueue(<>IWS_l_LogChannel)  //clear any messages in queue
ERR_MethodTrackerReturn("IWS_LogBuilder"; $_t_oldMethodName)