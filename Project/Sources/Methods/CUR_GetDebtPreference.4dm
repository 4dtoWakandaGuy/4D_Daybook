//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_GetDebtPreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(ACC_at_AccountCodes;0)
	//ARRAY TEXT(ACC_at_AccountNames;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305(Gen_bo_Create; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_AccountsIndex; $_l_CurrentWinRefOLD; $_l_ItemID; $_l_offset; $_l_RecordsinSelection; $_l_Retries; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; ACC_t_BadDebts; DB_t_WindowTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_GetDebtPreference")
// this method will find which account the difference should be written to
$_l_Retries:=0
While (Semaphore:C143("LoadingBadDebtPrefs"))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(10*(1+$_l_Retries))
End while 
$_l_ItemID:=PREF_GetPreferenceID("Bad Debt Preference")
//this is a single preference!

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	
	VARIABLE TO BLOB:C532(ACC_t_BadDebts; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
Else 
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ACC_t_BadDebts; $_l_offset)
End if 
CLEAR SEMAPHORE:C144("LoadingBadDebtPrefs")

If (ACC_t_BadDebts="")
	//it is not set up!
	ALL RECORDS:C47([ACCOUNTS:32])
	$_l_RecordsinSelection:=Records in selection:C76([ACCOUNTS:32])
	SELECTION TO ARRAY:C260([ACCOUNTS:32]Account_Code:2; ACC_at_AccountCodes; [ACCOUNTS:32]Account_Name:3; ACC_at_AccountNames)
	SORT ARRAY:C229(ACC_at_AccountNames; ACC_at_AccountCodes)
	Gen_Alert("if you choose to write off outstanding amounts"+" on accounts"+Char:C90(13)+"the system will need to know what account to post the payment from or to.")
	
	If ($_l_RecordsinSelection<255)
		ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(ACC_at_AccountCodes))
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(ACC_at_AccountCodes))
		For ($_l_AccountsIndex; 1; Size of array:C274(ACC_at_AccountCodes))
			GEN_at_DropDownMenu{$_l_AccountsIndex}:=ACC_at_AccountNames{$_l_AccountsIndex}
			GEN_al_DropDownMenuID{$_l_AccountsIndex}:=$_l_AccountsIndex
		End for 
		
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
		GEN_Bo_ShowCreate:=False:C215
		DB_t_WindowTitle:="Select Account"
		DIALOG:C40([USER:15]; "Gen_PopUpChoice")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (Gen_bo_Create)  //create a new account
			//currently not allowing this
		Else 
			If (GEN_at_DropDownMenu>0)
				READ WRITE:C146([PREFERENCES:116])
				LOAD RECORD:C52([PREFERENCES:116])
				
				ACC_t_BadDebts:=ACC_at_AccountCodes{GEN_at_DropDownMenu}
				$_l_offset:=0
				SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				
				VARIABLE TO BLOB:C532(ACC_t_BadDebts; [PREFERENCES:116]DataBlob:2; *)
				DB_SaveRecord(->[PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
				
				
			End if 
			
		End if 
		
	Else 
		//different strategy!
	End if 
	
End if 
ERR_MethodTrackerReturn("CUR_GetDebtPreference"; $_t_oldMethodName)