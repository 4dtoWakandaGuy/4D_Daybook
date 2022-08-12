//%attributes = {}
If (False:C215)
	//Project Method Name:      ProductDeletionPreferences
	//------------------ Method Notes ------------------
	//Loads the current preference setting for product Deletion Preferences
	//------------------ Revision Control ----------------
	//Date Created: 20/06/2010 13:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_CanAsk; $_bo_OK; $1)
	C_LONGINT:C283($_l_Filter; $_l_ItemID; $_l_offset; xnext)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProductDeletionPreferences")
While (Semaphore:C143("LoadingProdDeletionPrefs"))
	DelayTicks(2)
End while 
READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Product Filtering Settings")
$_l_offset:=0
If (Count parameters:C259>=1)
	$_bo_CanAsk:=$1
Else 
	$_bo_CanAsk:=True:C214
End if 
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0) | (Gen_Option)
	If ($_bo_CanAsk)
		If (Current user:C182="Designer") | (User in group:C338(Current user:C182; "Administrator"))
			Gen_Confirm3("There is an option to mark products as no longer available. You may choose to have products marked this way to be automatically filtered from product views"; "Auto Filter"; "No Filter"; "Do not set")
			$_bo_OK:=(OK=1)
			If (xnext=0)
				If ($_bo_OK)
					$_l_Filter:=1
				Else 
					$_l_Filter:=0
				End if 
			Else 
				$_l_Filter:=-1
			End if 
			If ($_l_Filter>=0)
				READ WRITE:C146([PREFERENCES:116])
				If (Records in selection:C76([PREFERENCES:116])=0)
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				Else 
					LOAD RECORD:C52([PREFERENCES:116])
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				End if 
				
				
				
				VARIABLE TO BLOB:C532($_l_Filter; [PREFERENCES:116]DataBlob:2; *)
				DB_SaveRecord(->[PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			End if 
		End if 
	End if 
End if 
$_l_offset:=0
If (Records in selection:C76([PREFERENCES:116])=0)
	$0:=0
Else 
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_l_Filter; $_l_offset)
	$0:=$_l_Filter
End if 
CLEAR SEMAPHORE:C144("LoadingProdDeletionPrefs")
ERR_MethodTrackerReturn("ProductDeletionPreferences"; $_t_oldMethodName)
