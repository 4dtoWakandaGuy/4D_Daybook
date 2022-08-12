//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Confirm3_withHideOption
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:17
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Gen_abo_ConfirmPreference;0)
	//ARRAY LONGINT(Gen_al_ConfirmOption;0)
	//ARRAY TEXT(GEN_at_ConfirmIdent;0)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; $_bo_Change; $_bo_OK; DB_bo_AlertReply; DB_bo_AlertTimeOut; GEN_bo_ConfirmOption; GEN_bo_ShowOption; SYS_bo_NoTrack)
	C_LONGINT:C283($_l_ArraySize; $_l_BlobOffset; $_l_CurrentWinRefOLD; $_l_Delay; $_l_IdentRow; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_Result; $_l_ScreenCentreVertical; B_CheckHideWarning)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xCancel; xNext; xOK)
	C_REAL:C285($0; $1)
	C_TEXT:C284(<>ButtCanc; <>ButtNext; <>ButtOK; <>PER_t_CurrentUserInitials; $_t_oldMethodName; $2; $3; $4; $5; vConfirm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Confirm3_WithHideOption")
//Gen_Confirm
//This method is the same as the OLD Gen_Confirm
//except that you pass a confirm message ID in $1
//we load the prefs for this to an array -they come from a [DATA_AUDITS] blob
//NG modifying to use Preferences table

READ ONLY:C145([PERSONNEL:11])
ARRAY TEXT:C222(GEN_at_ConfirmIdent; 0)
ARRAY BOOLEAN:C223(Gen_abo_ConfirmPreference; 0)
ARRAY LONGINT:C221(Gen_al_ConfirmOption; 0)
READ ONLY:C145([PREFERENCES:116])

While (Semaphore:C143("ConfirmPrefs"))
	DelayTicks(20)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Confirm Preferences")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
$_l_offset:=0
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	VARIABLE TO BLOB:C532(GEN_at_ConfirmIdent; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Gen_abo_ConfirmPreference; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(Gen_al_ConfirmOption; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; GEN_at_ConfirmIdent; $_l_offset)
	If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Gen_abo_ConfirmPreference; $_l_offset)
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Gen_al_ConfirmOption; $_l_offset)
			
		End if 
	End if 
	$_l_ArraySize:=Size of array:C274(GEN_at_ConfirmIdent)
	ARRAY BOOLEAN:C223(Gen_abo_ConfirmPreference; $_l_ArraySize)
	ARRAY LONGINT:C221(Gen_al_ConfirmOption; $_l_ArraySize)
	
	UNLOAD RECORD:C212([PREFERENCES:116])
	
End if 
CLEAR SEMAPHORE:C144("ConfirmPrefs")

$_l_ArraySize:=Size of array:C274(GEN_at_ConfirmIdent)
ARRAY BOOLEAN:C223(Gen_abo_ConfirmPreference; $_l_ArraySize)  //Just a precaution
//``````


//now we check the array for this confirm
$_l_IdentRow:=Find in array:C230(GEN_at_ConfirmIdent; <>PER_t_CurrentUserInitials+"_"+String:C10($1))
//ARRAY STRING(255;GEN_at_ConfirmIdent;0) bsw 1/07/04
//ARRAY BOOLEAN(Gen_abo_ConfirmPreference;0) bsw 1/07/04
$_l_Result:=0
If ($_l_IdentRow>0)
	GEN_bo_ConfirmOption:=Gen_abo_ConfirmPreference{$_l_IdentRow}
	$_l_Result:=Gen_al_ConfirmOption{$_l_IdentRow}
Else 
	APPEND TO ARRAY:C911(GEN_at_ConfirmIdent; <>PER_t_CurrentUserInitials+"_"+String:C10($1))
	APPEND TO ARRAY:C911(Gen_abo_ConfirmPreference; False:C215)
	APPEND TO ARRAY:C911(Gen_al_ConfirmOption; 0)
	GEN_bo_ConfirmOption:=False:C215
	
End if 


If (GEN_bo_ConfirmOption=False:C215) | (Macintosh option down:C545) | (Windows Alt down:C563)
	
	//show the dialog
	<>SYS_bo_CurrentWindowModal:=True:C214
	vConfirm:=$2
	$_l_ScreenCentreVertical:=Screen width:C187/2
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-156; 110; $_l_ScreenCentreVertical+156; 252; 1)
	If (Count parameters:C259>1)
		<>ButtOK:=$3
		If (Count parameters:C259>3)
			<>ButtCanc:=$4
		Else 
			<>ButtCanc:=""
		End if 
		If (Count parameters:C259>4)
			<>ButtNext:=$5
		Else 
			<>ButtNext:=""
		End if 
		
	Else 
		<>ButtOK:=""
		<>ButtCanc:=""
		<>ButtNext:=""
	End if 
	GEN_bo_ShowOption:=True:C214
	DIALOG:C40([COMPANIES:2]; "dConfirm3")
	GEN_bo_ShowOption:=False:C215
	If (xCancel=1)
		$0:=0
		$_l_Result:=0
	Else 
		Case of 
			: (xOK=1)
				$0:=1
				$_l_Result:=1
			: (xNext=1)
				$0:=2
				$_l_Result:=2
			Else 
				$_l_Result:=0
		End case 
	End if 
	
	$_l_IdentRow:=Find in array:C230(GEN_at_ConfirmIdent; <>PER_t_CurrentUserInitials+"_"+String:C10($1))
	$_bo_Change:=False:C215
	If ($_l_IdentRow>0)
		If (Gen_abo_ConfirmPreference{$_l_IdentRow}#(B_CheckHideWarning=1)) | ($_l_Result#Gen_al_ConfirmOption{$_l_IdentRow})
			Gen_abo_ConfirmPreference{$_l_IdentRow}:=(B_CheckHideWarning=1)
			Gen_al_ConfirmOption{$_l_IdentRow}:=$_l_Result
			$_bo_Change:=True:C214
		End if 
	Else 
		APPEND TO ARRAY:C911(GEN_at_ConfirmIdent; <>PER_t_CurrentUserInitials+"_"+String:C10($1))
		APPEND TO ARRAY:C911(Gen_abo_ConfirmPreference; (B_CheckHideWarning=1))
		APPEND TO ARRAY:C911(Gen_al_ConfirmOption; $_l_Result)  //Not relevant on a two button confirm
		$_bo_Change:=True:C214
	End if 
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	<>SYS_bo_CurrentWindowModal:=False:C215
	If ($_bo_Change)
		//now write back to blob and save
		$_l_BlobOffset:=0
		READ WRITE:C146([PREFERENCES:116])
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		If (Records in selection:C76([PREFERENCES:116])>0)
			$_bo_OK:=False:C215
			$_l_Repeats:=0
			$_l_Delay:=1
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
				If (Not:C34($_bo_OK))
					If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
						//only increase every 10 tries
						$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
					End if 
					DelayTicks(2*$_l_Delay)
				End if 
			Until ($_bo_OK=True:C214)
		End if 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		
		VARIABLE TO BLOB:C532(GEN_at_ConfirmIdent; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(Gen_abo_ConfirmPreference; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(Gen_al_ConfirmOption; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[PREFERENCES:116]))
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	End if 
	
Else 
	//we  want to skip the dialog
	OK:=1
	$0:=$_l_Result
	
	UNLOAD RECORD:C212([DATA_AUDITS:102])
	
End if 
READ ONLY:C145([DATA_AUDITS:102])
//``
ERR_MethodTrackerReturn("Gen_Confirm_WithHideOption"; $_t_oldMethodName)