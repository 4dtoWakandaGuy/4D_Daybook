//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_LiveProfitPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2014 22:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_PeriodIDS;0)
	//ARRAY TEXT(ACC_at_PeriodCodes;0)
	C_BOOLEAN:C305($_bo_CanAsk; $_bo_Temp; $1)
	C_DATE:C307($_d_FromDate)
	C_LONGINT:C283($_l_Index; $_l_ItemID; $_l_offset; $_l_SelectedItem)
	C_TEXT:C284($_t_LiveFromPeriod; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_LiveProfitPreferences")


While (Semaphore:C143("LoadingLiveProfitPrefs"))
	DelayTicks(2)
End while 
READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Live Profit Preferences")
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
			If (Records in selection:C76([PREFERENCES:116])>0)
				$_l_offset:=0
				$_t_LiveFromPeriod:=""
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_LiveFromPeriod; $_l_offset)
				If ($_t_LiveFromPeriod#"")
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_LiveFromPeriod)
					$_d_FromDate:=[PERIODS:33]From_Date:3
				Else 
					$_d_FromDate:=Current date:C33-30
				End if 
				
			Else 
				$_d_FromDate:=Current date:C33-30
			End if 
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=$_d_FromDate)
			
			
			SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_PeriodCodes; [PERIODS:33]x_ID:10; ACC_al_PeriodIDS)
			INSERT IN ARRAY:C227(ACC_at_PeriodCodes; 1; 1)
			INSERT IN ARRAY:C227(ACC_al_PeriodIDS; 1; 1)
			
			ACC_at_PeriodCodes{1}:="No Live Profit Calculation"
			ACC_al_PeriodIDS{1}:=-99999
			
			For ($_l_Index; 1; Size of array:C274(ACC_al_PeriodIDS))
				If (ACC_al_PeriodIDS{$_l_Index}=0)
					ACC_al_PeriodIDS{$_l_Index}:=$_l_Index+Size of array:C274(ACC_al_PeriodIDS)+1000
				End if 
			End for 
			$_bo_Temp:=False:C215
			$_l_SelectedItem:=GEN_RequestViaPopUp(->ACC_at_PeriodCodes; ->ACC_al_PeriodIDS; "Select Period"; False:C215; ->$_bo_Temp; "Cancel"; "Save")
			If ($_l_SelectedItem>0)
				
				
				
				
				
				
				If ($_l_SelectedItem>=0)
					$_t_LiveFromPeriod:=ACC_at_PeriodCodes{$_l_SelectedItem}
					If ($_t_LiveFromPeriod="No Live Profit Calculation")
						$_t_LiveFromPeriod:=""
					End if 
					
				Else 
					$_t_LiveFromPeriod:=""
				End if 
				
				
				READ WRITE:C146([PREFERENCES:116])
				If (Records in selection:C76([PREFERENCES:116])=0)
					CREATE RECORD:C68([PREFERENCES:116])
					[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				Else 
					LOAD RECORD:C52([PREFERENCES:116])
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				End if 
				VARIABLE TO BLOB:C532($_t_LiveFromPeriod; [PREFERENCES:116]DataBlob:2; *)
				
				
				
				
				DB_SaveRecord(->[PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			End if 
			
		End if 
	End if 
End if 
$_t_LiveFromPeriod:=""

$_l_offset:=0
If (Records in selection:C76([PREFERENCES:116])=0)
	$0:=""
	
Else 
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_t_LiveFromPeriod; $_l_offset)
	$0:=$_t_LiveFromPeriod
	
	
End if 
CLEAR SEMAPHORE:C144("LoadingLiveProfitPrefs")
ERR_MethodTrackerReturn("ACC_LiveProfitPreferences"; $_t_oldMethodName)