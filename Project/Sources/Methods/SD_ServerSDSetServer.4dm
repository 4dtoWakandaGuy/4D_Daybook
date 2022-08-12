//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_ServerSDSetServer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2010 21:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>SD_abo_setInitialized;0)
	//ARRAY DATE(<>SD_ad_LastRequest;0)
	//ARRAY LONGINT(<>SD_al_DiarySets;0)
	//ARRAY LONGINT(<>SD_al_LastRequestTime;0)
	//ARRAY LONGINT(<>SD_al_SetIDs;0)
	ARRAY LONGINT:C221($_al_EmptySet; 0)
	C_BLOB:C604(<>SD_Bl_SetLongintBlob; SD_Bl_SetLongintBlob)
	C_BOOLEAN:C305(<>SD_bo_ServerSettingsInitialized; <>SD_ServerSetServerInitialized; <>SYS_bo_QuitCalled; SD_bo_SetReady; SD_bo_SetReceived)
	C_LONGINT:C283(<>SD_l_MonitorProcess; <>SD_l_SetServerProcess; $_l_Count; $_l_GetSetID; $_l_SetRow; $_l_SizeofArray; SD_l_GetSetID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_ServerSDSetServer")
//This method run runs on the server and responds to user requests==THIS IS REPLACED NOW
SD_bo_SetReady:=False:C215
SET BLOB SIZE:C606(SD_Bl_SetLongintBlob; 0)
<>SD_ServerSetServerInitialized:=False:C215
<>SD_l_SetServerProcess:=Current process:C322
Repeat 
	SET BLOB SIZE:C606(SD_Bl_SetLongintBlob; 0)
	SD_bo_SetReady:=False:C215
	SD_bo_SetReceived:=False:C215
	If (SD_l_GetSetID>0)  // a request is made for a set
		While (Semaphore:C143("SD_CheckSets"))
			DelayTicks(2)
		End while 
		If (<>SD_l_MonitorProcess=0)
			CLEAR SEMAPHORE:C144("SD_CheckSets")
			<>SD_l_MonitorProcess:=New process:C317("SD_SetsMonitor"; 128000; "Monitor Diary records")
			
			While (Not:C34(<>SD_bo_ServerSettingsInitialized))
				DelayTicks
			End while 
			While (Semaphore:C143("SD_CheckSets"))
				DelayTicks
			End while 
		Else 
			CLEAR SEMAPHORE:C144("SD_CheckSets")
			While (Not:C34(<>SD_bo_ServerSettingsInitialized))
				DelayTicks
			End while 
			While (Semaphore:C143("SD_CheckSets"))
				DelayTicks(2)
			End while 
			
		End if 
		$_l_GetSetID:=SD_l_GetSetID
		SD_l_GetSetID:=0
		While (Test semaphore:C652("UpdateSet_"+String:C10($_l_GetSetID)))  //Dont set it but wait for it to be free
			//this just stops us getting the set for the moment when the set is being tested
			DelayTicks
			//CLEAR SEMAPHORE("SD_CheckSets")
		End while 
		$_l_SetRow:=Find in array:C230(<>SD_al_SetIDs; $_l_GetSetID)
		If ($_l_SetRow>0)
			If (Size of array:C274(<>SD_abo_setInitialized)<Size of array:C274(<>SD_al_SetIDs))
				ARRAY BOOLEAN:C223(<>SD_abo_setInitialized; Size of array:C274(<>SD_al_SetIDs))
			End if 
			If (<>SD_abo_setInitialized{$_l_SetRow}=False:C215)
				
				//Set is not initialized
				//NG Dec 2006 here we must make sure the process is running-just in case
				RESUME PROCESS:C320(<>SD_l_MonitorProcess)
				Repeat 
					DelayTicks(60)
				Until (<>SD_abo_setInitialized{$_l_SetRow})
				//the set is now built
			End if 
			
			$_l_SizeofArray:=Size of array:C274(<>SD_al_DiarySets{$_l_SetRow})
			//Here record inSD_ad_LastRequest the last request date)
			<>SD_ad_LastRequest{$_l_SetRow}:=Current date:C33(*)
			<>SD_al_LastRequestTime{$_l_SetRow}:=Current time:C178(*)*1
			VARIABLE TO BLOB:C532(<>SD_al_DiarySets{$_l_SetRow}; SD_Bl_SetLongintBlob; *)  //the set is put into a blob
			CLEAR SEMAPHORE:C144("SD_CheckSets")
		Else 
			//Create an empty set
			ARRAY LONGINT:C221($_al_EmptySet; 0)
			VARIABLE TO BLOB:C532($_al_EmptySet; SD_Bl_SetLongintBlob; *)  //an invalid call was made but give a valid answer of 0 records
			//Here record inSD_ad_LastRequest the last request date)
			CLEAR SEMAPHORE:C144("SD_CheckSets")
		End if 
		
	Else 
		//Create an empty set
		
		ARRAY LONGINT:C221($_al_EmptySet; 0)
		VARIABLE TO BLOB:C532($_al_EmptySet; <>SD_Bl_SetLongintBlob; *)
	End if 
	If (<>SD_ServerSetServerInitialized)
		SD_bo_SetReady:=True:C214
		CLEAR SEMAPHORE:C144("SD_CheckSets")
		$_l_Count:=0
		Repeat 
			DelayTicks(2)
			$_l_Count:=$_l_Count+1
		Until (SD_bo_SetReceived) | ($_l_Count>100)
	Else 
		<>SD_ServerSetServerInitialized:=True:C214
	End if 
	If (Not:C34(<>SYS_bo_QuitCalled))
		PAUSE PROCESS:C319(Current process:C322)
	End if 
Until (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("SD_ServerSDSetServer"; $_t_oldMethodName)
