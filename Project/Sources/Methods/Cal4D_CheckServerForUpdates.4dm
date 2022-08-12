//%attributes = {}

If (False:C215)
	//Project Method Name:      Cal4D_CheckServerForUpdates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SD2_al_CalenderWIndows;0)
	ARRAY LONGINT:C221($_al_LastRequest; 0)
	ARRAY LONGINT:C221($_al_LastUpdate; 0)
	ARRAY TEXT:C222($_at_ContextUUIDS; 0)
	C_BOOLEAN:C305(<>SD2_bo_CalendardWindowsInited; <>SD2_l_CalendardWindowsInited)
	C_LONGINT:C283($_l_ContextRow; $_l_Index; $_l_ItemID; $_l_offset; $_l_Retries; SD_l_CurrentContextVersion)
	C_TEXT:C284($_t_oldMethodName; SD_T_CurrentContextDisplayed)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_CheckServerForUpdates")

$_l_Retries:=0
While (Semaphore:C143("$InitCalWindows"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*(1+$_l_Retries))
End while 
If (Not:C34(<>SD2_bo_CalendardWindowsInited))
	ARRAY LONGINT:C221(<>SD2_al_CalenderWIndows; 0)
	<>SD2_l_CalendardWindowsInited:=True:C214
End if 

CLEAR SEMAPHORE:C144("$InitCalWindows")


$_t_oldMethodName:=ERR_MethodTracker("Cal4D_CheckServerForUpdates")

If (Application type:C494=4D Remote mode:K5:5)
	//In Daybook we could have several calender windows open. Each may have a different context.
	For ($_l_Index; 1; Size of array:C274(<>SD2_al_CalenderWIndows))  //this is actually an array of calendar processes
		If (Process state:C330(<>SD2_al_CalenderWIndows{$_l_Index})>=0)
			
			GET PROCESS VARIABLE:C371(<>SD2_al_CalenderWIndows{$_l_Index}; SD_T_CurrentContextDisplayed; SD_T_CurrentContextDisplayed)
			GET PROCESS VARIABLE:C371(<>SD2_al_CalenderWIndows{$_l_Index}; SD_l_CurrentContextVersion; SD_l_CurrentContextVersion)
			
			//instead of using the method that was here we store the state of each context in a single record
			$_l_Retries:=0
			While (Semaphore:C143("SD2_ContextPreference"))
				
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End while 
			$_l_ItemID:=PREF_GetPreferenceID("DiaryContextsStates")
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
			ARRAY TEXT:C222($_at_ContextUUIDS; 0)
			ARRAY LONGINT:C221($_al_LastRequest; 0)
			ARRAY LONGINT:C221($_al_LastUpdate; 0)
			$_l_offset:=0
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_ContextUUIDS; $_l_offset)
				If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_ContextUUIDS; $_l_offset)
					If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_LastUpdate; $_l_offset)
					End if 
				End if 
			End if 
			UNLOAD RECORD:C212([PREFERENCES:116])
			CLEAR SEMAPHORE:C144("SD2_ContextPreference")
			
			$_l_ContextRow:=Find in array:C230($_at_ContextUUIDS; SD_T_CurrentContextDisplayed)
			//it should be there but even if it is not it just means it has not been built yet
			If ($_l_ContextRow>0)
				If ($_al_LastUpdate{$_l_ContextRow}>SD_l_CurrentContextVersion)
					//it has been updated since the window was drawn
					//call the process with a message to get it to update. This differs from this method because  this means that instead of this method doing a redraw it will tell the window to redraw
					//because the window uses records with the context reference on it just needs to get those records for its update which is a single line query
					//Note also that several users or window could be using the same context so after a redraw in a single context we cannot set a flag to false
					//instead the
					//QUERY(◊Cal4D_UserTable_ptr->;◊Cal4D_UserIDFld_ptr->=◊Cal4D_SharedUserID_i)
					
					// It's harmless if the record doesn't exist yet.
					//If (◊Cal4D_LastClientUpdateTime_i<◊Cal4D_UserDefaultGroupIDFld_ptr->)  ` Yes, this is the right field. We hijacked it for this purpose.
					Cal4D_Cal_Redraw(<>SD2_al_CalenderWIndows{$_l_Index})  // This updates the ◊Cal4D_LastClientUpdateTime_i value.
					//End if
				End if 
			End if 
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("Cal4D_CheckServerForUpdates"; $_t_oldMethodName)