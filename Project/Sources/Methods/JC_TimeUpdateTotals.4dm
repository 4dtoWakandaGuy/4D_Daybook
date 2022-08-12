//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_TimeUpdateTotals
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
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_DiaryUID; $_l_Recordsindex; $_l_RecordsinSelection; $1)
	C_REAL:C285($_r_DiaryUnits; $_r_UnitsValue)
	C_TEXT:C284($_t_oldMethodName; $_t_RecordOperation; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_TimeUpdateTotals")

//I don't think this method is used any more -kmw



If (Count parameters:C259>=2)
	$_l_DiaryUID:=$1
	$_t_RecordOperation:=$2
	
	READ WRITE:C146([JOB PERSONNEL:48])
	
	If ([DIARY:12]x_ID:50#$_l_DiaryUID)
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_DiaryUID)
	End if 
	
	//If (Not((([DIARY]Done) & ([JOBS]Actual TR=False)) | (([DIARY]Done=False) & ([JOBS]Budget TR=False))))
	
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
	
	QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=[DIARY:12]Stage_Code:21)
	
	QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[DIARY:12]Job_Code:19)
	
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[DIARY:12]Stage_Code:21; *)
	QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=[DIARY:12]Stage_Code:21)
	
	QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[DIARY:12]Job_Code:19; *)
	QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[DIARY:12]Stage_Code:21; *)
	QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Person:3=[DIARY:12]Person:8)
	
	If (Records in selection:C76([JOB PERSONNEL:48])=0)
		CREATE RECORD:C68([JOB PERSONNEL:48])
		[JOB PERSONNEL:48]Person:3:=[DIARY:12]Person:8
		[JOB PERSONNEL:48]JT_Sales_Rate:7:=[DIARY:12]Charge_Rate:22
		[JOB PERSONNEL:48]JT_Cost_Rate:9:=[PERSONNEL:11]Cost_Rate:30
		[JOB PERSONNEL:48]Job_Code:1:=[DIARY:12]Job_Code:19
		[JOB PERSONNEL:48]Stage_Code:2:=[DIARY:12]Stage_Code:21
	End if 
	
	If (Check_Locked(->[JOB PERSONNEL:48]; 1))
		//find all Diary records that belong to this job personnel record (including any diary record that may have just been added or updated)
		QUERY:C277([DIARY:12]; [DIARY:12]Job_Code:19=[JOB PERSONNEL:48]Job_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Stage_Code:21=[JOB PERSONNEL:48]Job_Code:1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=[JOB PERSONNEL:48]Job_Code:1)
		[JOB PERSONNEL:48]JT_Actual_Units:5:=0
		[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=0
		[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=0
		[JOB PERSONNEL:48]JT_Budget_Units:4:=0
		[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=0
		[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=0
		$_l_RecordsinSelection:=Records in selection:C76([DIARY:12])
		FIRST RECORD:C50([DIARY:12])
		For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
			$_r_DiaryUnits:=[DIARY:12]Units:20
			$_r_UnitsValue:=[DIARY:12]Value:16
			If ([DIARY:12]Done:14)
				[JOB PERSONNEL:48]JT_Actual_Units:5:=[JOB PERSONNEL:48]JT_Actual_Units:5+$_r_DiaryUnits
				[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=[JOB PERSONNEL:48]JT_Act_Sales_Amount:6+$_r_UnitsValue
				[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)
			Else 
				[JOB PERSONNEL:48]JT_Budget_Units:4:=[JOB PERSONNEL:48]JT_Budget_Units:4+$_r_DiaryUnits
				[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8+$_r_UnitsValue
				[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11+($_r_DiaryUnits*[JOB PERSONNEL:48]JT_Cost_Rate:9)
			End if 
			NEXT RECORD:C51([DIARY:12])
		End for 
		[JOB PERSONNEL:48]JT_Actual_Units:5:=Round:C94(([JOB PERSONNEL:48]JT_Actual_Units:5); 2)
		[JOB PERSONNEL:48]JT_Act_Sales_Amount:6:=Round:C94(([JOB PERSONNEL:48]JT_Act_Sales_Amount:6); 2)
		[JOB PERSONNEL:48]JT_Actual_Cost_Amount:10:=Round:C94(([JOB PERSONNEL:48]JT_Actual_Cost_Amount:10); 2)
		[JOB PERSONNEL:48]JT_Budget_Units:4:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Units:4); 2)
		[JOB PERSONNEL:48]JT_Budget_Sales_Amount:8:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Sales_Amount:8); 2)
		[JOB PERSONNEL:48]JT_Budget_Cost_Amount:11:=Round:C94(([JOB PERSONNEL:48]JT_Budget_Cost_Amount:11); 2)
		DB_SaveRecord(->[JOB PERSONNEL:48])
		$0:=True:C214
	Else 
		$0:=False:C215
	End if 
	
	UNLOAD RECORD:C212([JOB PERSONNEL:48])
	UNLOAD RECORD:C212([PERSONNEL:11])
	UNLOAD RECORD:C212([STAGES:45])
	UNLOAD RECORD:C212([JOBS:26])
	UNLOAD RECORD:C212([JOB_STAGES:47])
	UNLOAD RECORD:C212([DIARY:12])
	
	READ ONLY:C145([JOB PERSONNEL:48])
	
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("JC_TimeUpdateTotals"; $_t_oldMethodName)