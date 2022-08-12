//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_DiaryDateTimeStamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UPD_DiaryDateTimeStamp")

If (Count parameters:C259=0)
	ALL RECORDS:C47([DIARY:12])
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 60; 100; 120; -1984)
	Repeat 
		//IDLE
		QUERY:C277([DIARY:12]; [DIARY:12]Date_Time_Stamp:45=0)
		If (Records in selection:C76([DIARY:12])>1000)
			REDUCE SELECTION:C351([DIARY:12]; 1000)
		End if 
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; Trigger_setDiaryTimeStamp)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		Else 
			
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				Trigger_setDiaryTimeStamp
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				NEXT RECORD:C51([DIARY:12])
			End for 
			
			
		End if 
		
		DelayTicks(10)
	Until (Records in selection:C76([DIARY:12])=0)
	Repeat 
		//IDLE
		QUERY:C277([DIARY:12]; [DIARY:12]Date_Stamp:46=0)
		If (Records in selection:C76([DIARY:12])>1000)
			REDUCE SELECTION:C351([DIARY:12]; 1000)
		End if 
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; Trigger_setDiaryTimeStamp)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		Else 
			
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				Trigger_setDiaryTimeStamp
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				NEXT RECORD:C51([DIARY:12])
			End for 
			
			
		End if 
		
		DelayTicks(10)
	Until (Records in selection:C76([DIARY:12])=0)
	Repeat 
		DelayTicks(10)
		QUERY:C277([DIARY:12]; [DIARY:12]Original_Date_Time_Stamp:47=0)
		If (Records in selection:C76([DIARY:12])>1000)
			REDUCE SELECTION:C351([DIARY:12]; 1000)
		End if 
		If (Not:C34(In transaction:C397))
			DB_lockFile(->[DIARY:12])
			APPLY TO SELECTION:C70([DIARY:12]; Trigger_setDiaryTimeStamp)
			
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
		Else 
			FIRST RECORD:C50([DIARY:12])
			For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
				Trigger_setDiaryTimeStamp
				DB_SaveRecord(->[DIARY:12])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
				NEXT RECORD:C51([DIARY:12])
			End for 
		End if 
		
	Until (Records in selection:C76([DIARY:12])=0)
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	//ALERT("Update finished.")
Else 
	//ALERT("Just about to update diary")
	Gen_Alert("Just about to update diary")
	READ WRITE:C146([DIARY:12])
	ALL RECORDS:C47([DIARY:12])
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[DIARY:12])
		APPLY TO SELECTION:C70([DIARY:12]; Trigger_setDiaryTimeStamp)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
	Else 
		
		FIRST RECORD:C50([DIARY:12])
		For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
			Trigger_setDiaryTimeStamp
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
			NEXT RECORD:C51([DIARY:12])
		End for 
		
		
	End if 
	
	// ALERT("Completed")
	Gen_Alert("Completed")
End if 
ERR_MethodTrackerReturn("UPD_DiaryDateTimeStamp"; $_t_oldMethodName)
