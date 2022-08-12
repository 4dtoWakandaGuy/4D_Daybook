//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_FindEmailOwner
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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
	C_LONGINT:C283($_l_ArraySize; $_l_atPosition; $_l_BlobVarOffset; $_l_EmailRow; $_l_ItemID; $_l_OK; $_l_OwnerID; $_l_PreferenceIndex; PER_l_UserModifiable)
	C_POINTER:C301($3)
	C_TEXT:C284($_t_EmailAfter; $_t_EmailBefore; $_t_oldMethodName; $_t_SalesPerson; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_FindEmailOwner")

//This method will determine who the incoming email should be directed to.
//initiall we are pasing the from name and email address and will use those. However it could be that pass additional data parsed from the email subject /text or additional headers...
If (Count parameters:C259>=2)
	//First we will check in the distribution list...
	//First we will check in the personnel
	REDUCE SELECTION:C351([PERSONNEL:11]; 0)
	If ($1#"")
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$1)
	End if 
	If (Records in selection:C76([PERSONNEL:11])=0)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Email_Address:36=$2)
	End if 
	If (Records in selection:C76([PERSONNEL:11])=0)
		//Email address is no known on the personnel records..it may be stored as an additional address against a person
		
		While (Semaphore:C143("LoadingPrefsEmail"))
			DelayTicks(2)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("email Names")
		CLEAR SEMAPHORE:C144("LoadingPrefsEmail")
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
		FIRST RECORD:C50([PREFERENCES:116])
		$_l_OK:=0
		$_l_OwnerID:=0
		For ($_l_PreferenceIndex; 1; Records in selection:C76([PREFERENCES:116]))
			$_l_BlobVarOffset:=0
			$_l_BlobVarOffset:=0
			
			$_l_ArraySize:=0
			ARRAY TEXT:C222(PER_at_EmailNames; $_l_ArraySize)
			ARRAY TEXT:C222(PER_at_EmailAddresses; $_l_ArraySize)
			ARRAY TEXT:C222(PER_at_DefaultHostAddresses; $_l_ArraySize)
			ARRAY TEXT:C222(PER_at_DefaultSignatures; $_l_ArraySize)
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
			$_l_ArraySize:=Size of array:C274(PER_at_EmailNames)
			ARRAY TEXT:C222(PER_at_EmailNames; $_l_ArraySize)
			ARRAY TEXT:C222(PER_at_EmailAddresses; $_l_ArraySize)
			ARRAY TEXT:C222(PER_at_DefaultHostAddresses; $_l_ArraySize)
			ARRAY TEXT:C222(PER_at_DefaultSignatures; $_l_ArraySize)
			
			$_l_EmailRow:=Find in array:C230(PER_at_EmailNames; $1)
			If ($_l_EmailRow<0)
				$_l_EmailRow:=Find in array:C230(PER_at_EmailAddresses; $2)
				If ($_l_EmailRow>0)
					$_l_OK:=1
				End if 
			Else 
				$_l_OK:=1
			End if 
			If ($_l_OK=1)
				$_l_PreferenceIndex:=999999
				$_l_OwnerID:=[PREFERENCES:116]Pref_OwnerID:4
			Else 
				NEXT RECORD:C51([PREFERENCES:116])
			End if 
		End for 
		If ($_l_OwnerID>0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_OwnerID)
		End if 
	End if 
	If (Records in selection:C76([PERSONNEL:11])=0)
		//Not found anywhere in personnel
		//Lets try contacts!!!.
		$_l_atPosition:=Position:C15(Char:C90(64); $2)  //If not it is not valid!!!
		$_t_EmailBefore:=""
		$_t_EmailAfter:=""
		If ($_l_atPosition>0)
			$_t_EmailBefore:=Substring:C12($2; 1; $_l_atPosition-1)
			$_t_EmailAfter:=Substring:C12($2; $_l_atPosition+1)
		End if 
		If ($_t_EmailAfter#"") & ($_t_EmailAfter#"")
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Email_Before_At:30=$_t_EmailBefore; *)
			QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24=$_t_EmailAfter)
			If (Records in selection:C76([CONTACTS:1])>0)
				$_t_SalesPerson:=[CONTACTS:1]Sales_Person:25
				If ($_t_SalesPerson#"")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_SalesPerson)
				End if 
			End if 
			
		End if 
	End if 
	If (Records in selection:C76([PERSONNEL:11])=0)  //So no contact with that email address...what about a company
		//Lets try contacts!!!.
		$_l_atPosition:=Position:C15(Char:C90(64); $2)  //If not it is not valid!!!
		$_t_EmailBefore:=""
		$_t_EmailAfter:=""
		If ($_l_atPosition>0)
			$_t_EmailBefore:=Substring:C12($2; 1; $_l_atPosition-1)
			$_t_EmailAfter:=Substring:C12($2; $_l_atPosition+1)
		End if 
		If ($_t_EmailAfter#"") & ($_t_EmailAfter#"")
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Email_Before_At:58=$_t_EmailBefore; *)
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]EMail_After_At:55=$_t_EmailAfter)
			If (Records in selection:C76([COMPANIES:2])>0)
				$_t_SalesPerson:=[COMPANIES:2]Sales_Person:29
				If ($_t_SalesPerson#"")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_SalesPerson)
				End if 
			End if 
			
		End if 
		
	End if 
	If (Records in selection:C76([PERSONNEL:11])=0)  //So no contact no company ..give up and set to default
	End if 
	
Else 
	//Send to the email administrator(a default person that will handle emails for unknowns...this will mean that this person should have the ability to redirect the mail to someone else
End if 
// so here we will have one or more personnel records
If (Count parameters:C259>=3)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $3->)
End if 
ERR_MethodTrackerReturn("SD2_FindEmailOwner"; $_t_oldMethodName)