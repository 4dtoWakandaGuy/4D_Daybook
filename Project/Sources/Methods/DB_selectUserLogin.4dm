//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_selectUserLogin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/11/2009 20:31`Method: DB_selectUserLogin
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_4DUserNumbers; 0)
	//ARRAY LONGINT(DM_al_DataOwnerIDS;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_4DUserNames; 0)
	//ARRAY TEXT(DM_at_DataOwnerNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>DB_bo_ModuleSettingsinited; <>SYS_bo_inStartup; <>SYS_bo_PWActive; <>SYS_bo_PWActiveOLD; <>SYS_bo_QuitCalled; $_bo_Exit; $_bo_NoGroups; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; <>PER_l_CurrentUserID; <>PER_l_CurrentUserSepDiaryWindow; $_l_4DUserRow; $_l_CoreInfoID; $_l_DBOffset; $_l_Index; $_l_SizeofArray; $_l_UserID; $_l_WindowReferenceRow; DB_l_currentuserID)
	C_LONGINT:C283(DB_l_UserIdentWindow; DM_l_DataOwnerID; i; WIN_l_CurrentWinRef)
	C_REAL:C285($1)
	C_TEXT:C284(<>DB_t_DefaultUser; <>DB_t_Password; <>PER_t_CurrentUserInitials; $_t_oldMethodName; DB_t_CurrentFormUsage; DM_t_Org)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_selectUserLogin")
$_l_CoreInfoID:=PREF_GetPreferenceID("Data Owners"; True:C214; -1)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_CoreInfoID)  //There will be one record per data owner
If (Records in selection:C76([PREFERENCES:116])=0)
	//if there are no records we will create one
	ALL RECORDS:C47([USER:15])
	ARRAY LONGINT:C221(DM_al_DataOwnerIDS; 0)
	ARRAY TEXT:C222(DM_at_DataOwnerNames; 0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_CoreInfoID
	[PREFERENCES:116]Preference_DataID:7:=-1
	DM_t_Org:=[USER:15]Organisation:1
	If ([USER:15]XdataOwnerID:251>0)
		DM_l_DataOwnerID:=[USER:15]XdataOwnerID:251
	Else 
		DM_l_DataOwnerID:=AA_GetNextID(->DM_l_DataOwnerID)
	End if 
	APPEND TO ARRAY:C911(DM_al_DataOwnerIDS; DM_l_DataOwnerID)
	APPEND TO ARRAY:C911(DM_at_DataOwnerNames; DM_t_Org)
	VARIABLE TO BLOB:C532(DM_al_DataOwnerIDS; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(DM_at_DataOwnerNames; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
Else 
	$_l_DBOffset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DataOwnerIDS; $_l_DBOffset)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_DataOwnerNames; $_l_DBOffset)
End if 


If (Size of array:C274(DM_al_DataOwnerIDS)>0)
	//
	If (Records in table:C83([PERSONNEL:11])=0)  //this can only happen on setup of the first user
		//No User
		CD_Setup("PERSONNEL")
		
		
	End if 
	If (Records in table:C83([PERSONNEL:11])>0)
		If (Size of array:C274(DM_al_DataOwnerIDS)<2)
			If (Application type:C494=4D Remote mode:K5:5)
				GET PROCESS VARIABLE:C371(-1; <>DB_t_DefaultUser; <>DB_t_DefaultUser)
				GET PROCESS VARIABLE:C371(-1; <>SYS_bo_PWActive; <>SYS_bo_PWActive)
				
				
			Else 
				READ ONLY:C145([USER:15])
				ALL RECORDS:C47([USER:15])
				<>DB_t_DefaultUser:=[USER:15]Default User:76
				<>SYS_bo_PWActive:=[USER:15]SinglePWsystem:235
			End if 
			If (<>DB_t_DefaultUser#"")
				<>PER_t_CurrentUserInitials:=<>DB_t_DefaultUser
				<>PER_l_CurrentUserSepDiaryWindow:=1
				<>PER_l_CurrentUserID:=-1
			Else 
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1#"")
			End if 
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Startup_List:15=True:C214; *)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
			If (Records in selection:C76([PERSONNEL:11])=0)
				If (Records in selection:C76([PERSONNEL_GROUPS:92])=0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1#"")  //find all Persoonnel
				End if 
				DB_t_CurrentFormUsage:="NSL"  //None in Startup list
			Else 
				DB_t_CurrentFormUsage:=""
			End if 
		Else 
			REDUCE SELECTION:C351([PERSONNEL:11]; 0)
			DB_t_CurrentFormUsage:="EnterUser"
		End if 
		//Else
		//end if
		<>PER_t_CurrentUserInitials:=""
		<>DB_t_Password:=""
		i:=1
		If (Not:C34(<>DB_t_DefaultUser#"")) & (<>PER_t_CurrentUserInitials=<>DB_t_DefaultUser)  //This is a multi system setup-dont show the users and groups-
			If (DB_t_CurrentFormUsage="EnterUser")
				Open_Any_Window(185; 360)
				DIALOG:C40("Ask_Person_2")
				ON EVENT CALL:C190("")
				CLOSE WINDOW:C154
				ON EVENT CALL:C190("")
				CLOSE WINDOW:C154
				If (OK=0)
					QUIT 4D:C291
					$_bo_Exit:=True:C214
					<>SYS_bo_QuitCalled:=True:C214
				End if 
			Else 
				If ((Records in selection:C76([PERSONNEL_GROUPS:92])=0) | (<>DB_t_DefaultUser#""))
					$_bo_NoGroups:=True:C214
					Array_LCx(Records in selection:C76([PERSONNEL:11]))
					SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; GEN_at_RecordCode; [PERSONNEL:11]Name:2; GEN_at_Name; [PERSONNEL:11]Person_Identity:13; GEN_at_Identity)
					SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Name; GEN_at_Identity; >)
				Else 
					$_bo_NoGroups:=False:C215
					Array_LCx(Records in selection:C76([PERSONNEL_GROUPS:92]))
					SELECTION TO ARRAY:C260([PERSONNEL_GROUPS:92]Group_Code:1; GEN_at_RecordCode; [PERSONNEL_GROUPS:92]Group_Name:2; GEN_at_Name)
					If (DB_t_CurrentFormUsage="NSL")
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28="")  //find out if a No Group need be added
					Else 
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=""; *)
						QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
						QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
						
					End if 
					
					If (Records in selection:C76([PERSONNEL:11])=0)
						$_l_SizeofArray:=Size of array:C274(GEN_at_RecordCode)
					Else 
						$_l_SizeofArray:=Size of array:C274(GEN_at_RecordCode)+1
						INSERT IN ARRAY:C227(GEN_at_RecordCode; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(GEN_at_Name; $_l_SizeofArray; 1)
						INSERT IN ARRAY:C227(GEN_at_Identity; $_l_SizeofArray; 1)
						GEN_at_RecordCode{$_l_SizeofArray}:="ZZ99"
						GEN_at_Name{$_l_SizeofArray}:="No Group"
					End if 
					For ($_l_Index; 1; $_l_SizeofArray)
						GEN_at_Identity{$_l_Index}:="^G"
					End for 
				End if 
				SORT ARRAY:C229(GEN_at_RecordCode; GEN_at_Name; GEN_at_Identity; >)
				If (<>PER_t_CurrentUserInitials="") & (Size of array:C274(GEN_at_RecordCode)>0)
					<>PER_t_CurrentUserInitials:=GEN_at_RecordCode{1}
				End if 
				$_bo_Exit:=False:C215
				Open_Any_Window(494; 370)
				DIALOG:C40([PERSONNEL:11]; "Ask_Person")
				<>DB_bo_ModuleSettingsinited:=False:C215
				
				ON EVENT CALL:C190("")
				CLOSE WINDOW:C154
				If (OK=0)
					QUIT 4D:C291
					$_bo_Exit:=True:C214
					<>SYS_bo_QuitCalled:=True:C214
				End if 
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
			End if 
		End if 
		
		If (Not:C34(<>SYS_bo_QuitCalled))
			<>PER_l_CurLoggedinDataOwnerID:=[PERSONNEL:11]DataOwnerID:54
			$_l_UserID:=[PERSONNEL:11]Personnel_ID:48
			
			ARRAY LONGINT:C221($_al_4DUserNumbers; 0)
			ARRAY TEXT:C222($_at_4DUserNames; 0)
			If (Shift down:C543)
				
				CHANGE CURRENT USER:C289
			Else 
				If (Is compiled mode:C492)
					If (<>SYS_bo_PWActive)
						ON ERR CALL:C155("DB_PasswordValidation")
						
						//if this compiled now log that user in..if they are registered
						//if not show the 4D login and quit if they don't log in properly
						GET USER LIST:C609($_at_4DUserNames; $_al_4DUserNumbers)
						//ALERT("SIZE OF ARRAY($AUSERNAME)="+String(Size of array($_at_4DUserNames))+"Looking for user "+[PERSONNEL]Name)
						$_l_4DUserRow:=Find in array:C230($_at_4DUserNames; [PERSONNEL:11]Name:2)
						If ($_l_4DUserRow<0)
							//ALERT("USER NOT FOUND")
							//at this point this would not be loaded
							//TRACE
							If (Application type:C494#4D Remote mode:K5:5)
								PW_CHECKUSERS(True:C214)
							End if 
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_UserID)
							
							GET USER LIST:C609($_at_4DUserNames; $_al_4DUserNumbers)
							$_l_4DUserRow:=Find in array:C230($_at_4DUserNames; [PERSONNEL:11]Name:2)
							//ALERT("SIZE OF ARRAY($AUSERNAME)="+String(Size of array($_at_4DUserNames))+"Looking for user "+[PERSONNEL]Name)
							If ($_l_4DUserRow>0)
								//ALERT("USER NOW FOUND")
							End if 
						End if 
						
						If ($_l_4DUserRow>0)
							If (Not:C34(Is user deleted:C616($_al_4DUserNumbers{$_l_4DUserRow})))
								//ALERT("Logging in a "+String($_al_4DUserNumbers{$_l_4DUserRow}))
								CHANGE CURRENT USER:C289($_al_4DUserNumbers{$_l_4DUserRow}; [PERSONNEL:11]Person_Identity:13)
							Else 
								//ALERT("Logging in a user")
								CHANGE CURRENT USER:C289("User"; "U1")
								//CHANGE CURRENT USER
								
							End if 
						Else 
							//ALERT("Logging in a user")
							CHANGE CURRENT USER:C289("User"; "U1")
						End if 
						ON ERR CALL:C155("")
					Else 
						CHANGE CURRENT USER:C289
					End if 
				Else 
					If (Current user:C182="defaultuser")
						CHANGE CURRENT USER:C289
						If (Current user:C182="defaultuser")
							QUIT 4D:C291
							
						End if 
					End if 
				End if 
			End if 
			SET PROCESS VARIABLE:C370($1; DB_l_currentuserID; [PERSONNEL:11]Personnel_ID:48)
			SET PROCESS VARIABLE:C370($1; DB_l_UserIdentWindow; 0)
			
		End if 
		//at this point we either have a valid user or not
	Else 
		QUIT 4D:C291
	End if 
Else 
	QUIT 4D:C291
	
End if 

SET PROCESS VARIABLE:C370($1; DB_l_UserIdentWindow; 0)
ERR_MethodTrackerReturn("DB_selectUserLogin"; $_t_oldMethodName)