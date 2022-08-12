//%attributes = {}
If (False:C215)
	//Project Method Name:      PER_EditEmails
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PER_at_DefaultHostAddresses;0)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_BlobOffset; $_l_BlobVarOffset; $_l_CurrentWinRefOLD; $_l_Delay; $_l_ItemID; $_l_Repeats; $_l_SizeofArray; BSave; PER_l_UserModifiable; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285($2; $3; $4; $5)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PER_EditEmails")
//Modified December 2007 to accomdate the DEFAULT  HOST for the email address...
If (Count parameters:C259>=2)
	If ($1#"")
		While (Semaphore:C143("$LoadingPrefsEmail"))
			DelayTicks(2)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("email Names")
		CLEAR SEMAPHORE:C144("$LoadingPrefsEmail")
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$2)
		If (Records in selection:C76([PREFERENCES:116])=0)
			READ WRITE:C146([PREFERENCES:116])
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			[PREFERENCES:116]Pref_OwnerID:4:=$2
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		End if 
		//this blob contains 2 arrays
		//the array of email names and the array of email addresses
		$_l_BlobVarOffset:=0
		ARRAY TEXT:C222(PER_at_EmailNames; 0)
		ARRAY TEXT:C222(PER_at_EmailAddresses; 0)
		ARRAY TEXT:C222(PER_at_DefaultHostAddresses; 0)
		ARRAY TEXT:C222(PER_at_DefaultSignatures; 0)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_EmailNames; $_l_BlobVarOffset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_EmailAddresses; $_l_BlobVarOffset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_l_UserModifiable; $_l_BlobVarOffset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_DefaultHostAddresses; $_l_BlobVarOffset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_DefaultSignatures; $_l_BlobVarOffset)
					End if 
				End if 
			End if 
		End if 
		//Make sure everything is the same size
		$_l_SizeofArray:=Size of array:C274(PER_at_EmailNames)
		ARRAY TEXT:C222(PER_at_EmailNames; $_l_SizeofArray)
		ARRAY TEXT:C222(PER_at_EmailAddresses; $_l_SizeofArray)
		ARRAY TEXT:C222(PER_at_DefaultHostAddresses; $_l_SizeofArray)
		ARRAY TEXT:C222(PER_at_DefaultSignatures; $_l_SizeofArray)
		//```````
		BSave:=0
		
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153($3; $4; $5; $5; 1)
		DIALOG:C40([USER:15]; "PER_EmailAddresses")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (BSave=1)
			$_l_ItemID:=PREF_GetPreferenceID("email Names")
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$2)
			If (Records in selection:C76([PREFERENCES:116])=0)
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerID:4:=$2
			Else 
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
					If (Not:C34($_bo_OK))
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				Until ($_bo_OK=True:C214)
				
			End if 
			
			$_l_BlobOffset:=0
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(PER_at_EmailNames; [PREFERENCES:116]DataBlob:2)
			VARIABLE TO BLOB:C532(PER_at_EmailAddresses; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PER_l_UserModifiable; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PER_at_DefaultHostAddresses; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PER_at_DefaultSignatures; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
	Else 
		Gen_Alert("You must enter a user name first")
	End if 
	
End if 
ERR_MethodTrackerReturn("PER_EditEmails"; $_t_oldMethodName)
