//%attributes = {}
If (False:C215)
	//Project Method Name:      INT_LoadFormSizes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/04/2010 13:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>INT_al_FormHeight;0)
	//ARRAY LONGINT(<>INT_al_FormWidth;0)
	//ARRAY TEXT(<>INT_at_FormNames;0)
	C_BOOLEAN:C305(<>INT_FormSIzesInited; $_bo_CheckSIze; $_bo_OK; $_bo_Update; $3)
	C_LONGINT:C283($_l_Delay; $_l_FormNamePosition; $_l_ItemID; $_l_Offset; $_l_Repeats; $_l_Retries; $_l_SaveFormSizes; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INT_LoadFormSizes")
//NG May 2004
//this method load the form size preferences for this user
//C_LONGINT($1)
If (Count parameters:C259>=1)
	If ($1#0)
		$_l_Retries:=0
		While (Semaphore:C143("$WriteFormPref"))
			DelayTicks(2)
			$_l_Retries:=$_l_Retries+1
			If ($_l_Retries>99)
				ALERT:C41("Stopped at IN_LoadFormSizes 1")
			End if 
		End while 
		SPLASH_UPDATE("Loading Personal Form settings ...")
		$_l_Retries:=0
		While (Semaphore:C143("$LoadingPrefsFormSize"))
			DelayTicks(2)
			$_l_Retries:=$_l_Retries+1
			If ($_l_Retries>99)
				ALERT:C41("Stopped at IN_LoadFormSizes 2")
			End if 
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("Personal Form settings")
		CLEAR SEMAPHORE:C144("$LoadingPrefsFormSize")
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$1)
		//here use a Check_Locked
		If (Records in selection:C76([PREFERENCES:116])>0)
			If (False:C215)
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				$_l_Retries:=0
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 0)
					If (Not:C34($_bo_OK))
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
						If ($_l_Repeats>99)
							ALERT:C41("Stopped at IN_LoadFormSizes 3")
						End if 
					End if 
				Until ($_bo_OK=True:C214)
			End if 
		End if 
		
		If (Records in selection:C76([PREFERENCES:116])=0)
			$_l_Retries:=0
			While (Semaphore:C143("$LoadingPrefsFormSize"))
				DelayTicks(2)
				$_l_Retries:=$_l_Retries+1
				If ($_l_Retries>99)
					ALERT:C41("Stopped at IN_LoadFormSizes 3")
				End if 
			End while 
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$1)
			If (Records in selection:C76([PREFERENCES:116])=0)
				//add the the preferences list here
				READ WRITE:C146([PREFERENCES:116])
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerID:4:=$1
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
			CLEAR SEMAPHORE:C144("$LoadingPrefsFormSize")
		End if   //this will be ONE record
		$_l_Offset:=0
		If (Count parameters:C259=1)
			$_l_Retries:=0
			While (Semaphore:C143("$INT_FormNameInsert"))
				DelayTicks(2)
				$_l_Retries:=$_l_Retries+1
				If ($_l_Retries>99)
					ALERT:C41("Stopped at IN_LoadFormSizes 4")
				End if 
			End while 
			ARRAY TEXT:C222(<>INT_at_FormNames; 0)
			ARRAY LONGINT:C221(<>INT_al_FormHeight; 0)
			ARRAY LONGINT:C221(<>INT_al_FormWidth; 0)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>INT_at_FormNames; $_l_Offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>INT_al_FormHeight; $_l_Offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>INT_al_FormWidth; $_l_Offset)
						
					End if 
				End if 
			End if 
			CLEAR SEMAPHORE:C144("$INT_FormNameInsert")
			$_l_Offset:=0
		Else 
			//Update
			If (Count parameters:C259>=3)
				$_bo_CheckSIze:=$3
				$_bo_Update:=True:C214
			Else 
				$_bo_CheckSIze:=True:C214
			End if 
			If ($_bo_CheckSIze)
				$_bo_Update:=False:C215
				$_l_FormNamePosition:=Find in array:C230(<>INT_at_FormNames; $2)
				If ($_l_FormNamePosition<0)
					$_l_Retries:=0
					While (Semaphore:C143("$INT_FormNameInsert"))
						DelayTicks(2)
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>99)
							ALERT:C41("Stopped at IN_LoadFormSizes 4")
						End if 
					End while 
					INSERT IN ARRAY:C227(<>INT_at_FormNames; Size of array:C274(<>INT_at_FormNames)+1; 1)
					INSERT IN ARRAY:C227(<>INT_al_FormHeight; Size of array:C274(<>INT_al_FormHeight)+1; 1)
					INSERT IN ARRAY:C227(<>INT_al_FormWidth; Size of array:C274(<>INT_al_FormWidth)+1; 1)
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					<>INT_at_FormNames{Size of array:C274(<>INT_at_FormNames)}:=$2
					<>INT_al_FormHeight{Size of array:C274(<>INT_al_FormHeight)}:=$_l_WindowBottom-$_l_WindowTop
					<>INT_al_FormWidth{Size of array:C274(<>INT_al_FormWidth)}:=$_l_WindowRight-$_l_WindowLeft
					CLEAR SEMAPHORE:C144("$INT_FormNameInsert")
					$_bo_Update:=True:C214
				Else 
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					If (<>INT_al_FormHeight{$_l_FormNamePosition}#($_l_WindowBottom-$_l_WindowTop)) | (<>INT_al_FormWidth{$_l_FormNamePosition}#($_l_WindowRight-$_l_WindowLeft))
						$_l_Retries:=0
						While (Semaphore:C143("$INT_FormNameInsert"))
							DelayTicks(2)
							$_l_Retries:=$_l_Retries+1
							If ($_l_Retries>99)
								ALERT:C41("Stopped at IN_LoadFormSizes 5")
							End if 
						End while 
						
						<>INT_al_FormHeight{$_l_FormNamePosition}:=$_l_WindowBottom-$_l_WindowTop
						<>INT_al_FormWidth{$_l_FormNamePosition}:=$_l_WindowRight-$_l_WindowLeft
						
						$_bo_Update:=True:C214
						
						CLEAR SEMAPHORE:C144("$INT_FormNameInsert")
						
					End if 
				End if 
			End if 
			If ($_bo_Update)
				If (In transaction:C397)
					CLEAR SEMAPHORE:C144("$WriteFormPref")
					$_l_SaveFormSizes:=New process:C317("INT_LoadFormSIzes"; 128000; "Save Form Sizes"; $1; $2; False:C215)
				Else 
					$_l_Retries:=0
					While (Semaphore:C143("$LoadingPrefsFormSize"))
						DelayTicks(2)
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>99)
							ALERT:C41("Stopped at IN_LoadFormSizes 5")
						End if 
					End while 
					$_l_Retries:=0
					While (Semaphore:C143("$INT_FormNameInsert"))
						DelayTicks(2)
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>99)
							ALERT:C41("Stopped at IN_LoadFormSizes 6")
						End if 
						
					End while 
					If (Records in selection:C76([PREFERENCES:116])>0)
						$_bo_OK:=False:C215
						$_l_Repeats:=0
						$_l_Delay:=1
						READ WRITE:C146([PREFERENCES:116])
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 0)
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
								End if 
								DelayTicks(2*$_l_Delay)
								If ($_l_Repeats>99)
									ALERT:C41("Stopped at IN_LoadFormSizes 7")
								End if 
								
							End if 
						Until ($_bo_OK=True:C214) | ($_l_Repeats>20)
						
						
						//
						//LOAD RECORD([Preferences])
						SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
						VARIABLE TO BLOB:C532(<>INT_at_FormNames; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(<>INT_al_FormHeight; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(<>INT_al_FormWidth; [PREFERENCES:116]DataBlob:2; *)
						SAVE RECORD:C53([PREFERENCES:116])
						UNLOAD RECORD:C212([PREFERENCES:116])
						READ ONLY:C145([PREFERENCES:116])
						CLEAR SEMAPHORE:C144("$INT_FormNameInsert")
						CLEAR SEMAPHORE:C144("$LoadingPrefsFormSize")
					End if 
				End if 
			End if 
		End if 
		CLEAR SEMAPHORE:C144("$WriteFormPref")
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
CLEAR SEMAPHORE:C144("$WriteFormPref")
<>INT_FormSIzesInited:=True:C214
ERR_MethodTrackerReturn("INT_LoadFormSizes"; $_t_oldMethodName)