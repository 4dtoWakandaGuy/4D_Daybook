//%attributes = {}

If (False:C215)
	//Project Method Name:      SD_SendtoWorflow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RelatedRecordIDS; 0)
	ARRAY LONGINT:C221($_al_RelatedTables; 0)
	ARRAY TEXT:C222($_at_RelatedRecordCodes; 0)
	C_LONGINT:C283($_l_MultiPerson; $_l_RecordsinSelection)
	C_OBJECT:C1216($_obj_CallerObject; $_obj_DiaryRecord; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD_SendtoWorflow")
If ([DIARY:12]Diary_Code:3#"")
	QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=[DIARY:12]Diary_Code:3)
	//and the relaion types
	If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0)
		$_l_RecordsinSelection:=Records in selection:C76([DIARY_ITEMOWNERS:106])
		
	Else 
		$_l_RecordsinSelection:=1
	End if 
	For ($_l_MultiPerson; 1; $_l_RecordsinSelection)
		
		
		
		OB SET:C1220($_obj_DiaryRecord; "RecordCode"; [DIARY:12]Diary_Code:3)
		OB SET:C1220($_obj_DiaryRecord; "ThreadID"; [DIARY:12]ThreadID:64)
		
		OB SET:C1220($_obj_DiaryRecord; "EmailID"; [DIARY:12]Email_ID:41)
		
		OB SET:C1220($_obj_DiaryRecord; "Originator"; [DIARY:12]Originator:23)
		If (Records in selection:C76([DIARY_ITEMOWNERS:106])=0)
			OB SET:C1220($_obj_DiaryRecord; "Person"; [DIARY:12]Person:8)
		Else 
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2)
			OB SET:C1220($_obj_DiaryRecord; "Person"; [PERSONNEL:11]Person_Identity:13)
		End if 
		
		
		OB SET:C1220($_obj_DiaryRecord; "CampaignUUID"; [DIARY:12]CampaignUUID:80)
		OB SET:C1220($_obj_DiaryRecord; "DocumentHeading"; [DIARY:12]Document_Heading:32)
		
		OB SET:C1220($_obj_DiaryRecord; "ActionCode"; [DIARY:12]Action_Code:9)
		OB SET:C1220($_obj_DiaryRecord; "ActionDetails"; [DIARY:12]Action_Details:10)
		OB SET:C1220($_obj_DiaryRecord; "DisplayDetails"; [DIARY:12]Display_Description:55)
		
		OB SET:C1220($_obj_DiaryRecord; "ResultCode"; [DIARY:12]Result_Code:11)
		OB SET:C1220($_obj_DiaryRecord; "ResultDetails"; [DIARY:12]Result_Description:12)
		
		
		OB SET:C1220($_obj_DiaryRecord; "Deleted"; [DIARY:12]Deleted:43)
		OB SET:C1220($_obj_DiaryRecord; "Done"; [DIARY:12]Done:14)
		OB SET:C1220($_obj_DiaryRecord; "Status"; [DIARY:12]Status:30)
		
		OB SET:C1220($_obj_DiaryRecord; "EmailFrom"; [DIARY:12]Email_From:38)
		OB SET:C1220($_obj_DiaryRecord; "EmailPerson"; [DIARY:12]Email_Person:39)
		OB SET:C1220($_obj_DiaryRecord; "EmailSubject"; [DIARY:12]Email_Subject:40)
		OB SET:C1220($_obj_DiaryRecord; "EmailText"; [DIARY:12]Email_Text:42)
		
		
		OB SET:C1220($_obj_DiaryRecord; "AlarmTimeFrame"; [DIARY:12]Alarm_Timeframe:48)
		OB SET:C1220($_obj_DiaryRecord; "PriorityPersonal"; [DIARY:12]Personal_Priority:31)
		OB SET:C1220($_obj_DiaryRecord; "Priority"; [DIARY:12]Priority:17)
		OB SET:C1220($_obj_DiaryRecord; "Public"; [DIARY:12]Public:44)
		
		
		OB SET:C1220($_obj_DiaryRecord; "CompanyCode"; [DIARY:12]Company_Code:1)
		OB SET:C1220($_obj_DiaryRecord; "ContactCode"; [DIARY:12]Contact_Code:2)
		OB SET:C1220($_obj_DiaryRecord; "DocumentCode"; [DIARY:12]Document_Code:15)
		OB SET:C1220($_obj_DiaryRecord; "OrderCode"; [DIARY:12]Order_Code:26)
		OB SET:C1220($_obj_DiaryRecord; "ProductCode"; [DIARY:12]Product_Code:13)
		OB SET:C1220($_obj_DiaryRecord; "ScriptCode"; [DIARY:12]Script_Code:29)
		OB SET:C1220($_obj_DiaryRecord; "StageCode"; [DIARY:12]Stage_Code:21)
		
		OB SET:C1220($_obj_DiaryRecord; "BookingCode"; [DIARY:12]Booking_Code:27)
		OB SET:C1220($_obj_DiaryRecord; "EventCode"; [DIARY:12]Event_Code:18)
		OB SET:C1220($_obj_DiaryRecord; "JobCode"; [DIARY:12]Job_Code:19)
		
		OB SET:C1220($_obj_DiaryRecord; "CallCode"; [DIARY:12]Call_Code:25)
		
		OB SET:C1220($_obj_DiaryRecord; "DataSourceTable"; [DIARY:12]Data_Source_Table:49)
		QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]XRecord_Code:5=[DIARY:12]Diary_Code:3)
		SELECTION TO ARRAY:C260([xDiaryRelations:137]xTableNUM:3; $_al_RelatedTables; [xDiaryRelations:137]xRecordID:4; $_al_RelatedRecordIDS; [xDiaryRelations:137]XRecord_Code:5; $_at_RelatedRecordCodes)
		OB SET ARRAY:C1227($_obj_DiaryRecord; "RelationsTables"; $_al_RelatedTables)
		OB SET ARRAY:C1227($_obj_DiaryRecord; "RelationsRecordIDS"; $_al_RelatedRecordIDS)
		OB SET ARRAY:C1227($_obj_DiaryRecord; "RelationsRecordCodes"; $_at_RelatedRecordCodes)
		
		
		OB SET:C1220($_obj_DiaryRecord; "BudgetUnits"; [DIARY:12]Budget_Units:70)
		OB SET:C1220($_obj_DiaryRecord; "ChargeRate"; [DIARY:12]Charge_Rate:22)
		OB SET:C1220($_obj_DiaryRecord; "CostRate"; [DIARY:12]Cost_Rate:74)
		OB SET:C1220($_obj_DiaryRecord; "CostValue"; [DIARY:12]Cost_Value:75)
		OB SET:C1220($_obj_DiaryRecord; "TimeChecked"; [DIARY:12]Time_Checked:28)
		OB SET:C1220($_obj_DiaryRecord; "Units"; [DIARY:12]Units:20)
		OB SET:C1220($_obj_DiaryRecord; "Value"; [DIARY:12]Value:16)
		
		
		OB SET:C1220($_obj_DiaryRecord; "DateDoFrom"; [DIARY:12]Date_Do_From:4)  //note that dates are stored as strings 
		OB SET:C1220($_obj_DiaryRecord; "DateDoTo"; [DIARY:12]Date_Do_To:33)  //note that dates are stored as strings 
		OB SET:C1220($_obj_DiaryRecord; "DateDoneFrom"; [DIARY:12]Date_Done_From:5)  //note that dates are stored as strings 
		OB SET:C1220($_obj_DiaryRecord; "DateDoneTo"; [DIARY:12]Date_Done_To:34)  //note that dates are stored as strings 
		OB SET:C1220($_obj_DiaryRecord; "DateDisplayFrom"; [DIARY:12]Display_Date_From:51)  //note that dates are stored as strings 
		OB SET:C1220($_obj_DiaryRecord; "DateDisplayTo"; [DIARY:12]Display_Date_To:52)  //note that dates are stored as strings 
		OB SET:C1220($_obj_DiaryRecord; "DateStamp"; [DIARY:12]Date_Stamp:46)
		
		OB SET:C1220($_obj_DiaryRecord; "TimeDoFrom"; [DIARY:12]Time_Do_From:6)  //note that times are stored as milliseconds 
		OB SET:C1220($_obj_DiaryRecord; "TimeDoTo"; [DIARY:12]Time_Do_To:35)  //note that times are stored as milliseconds 
		OB SET:C1220($_obj_DiaryRecord; "TimeDoneFrom"; [DIARY:12]Time_Done_From:7)  //note that times are stored as milliseconds 
		OB SET:C1220($_obj_DiaryRecord; "TimeDoneTo"; [DIARY:12]Time_Done_To:36)  //note that times are stored as milliseconds 
		OB SET:C1220($_obj_DiaryRecord; "TimeDateStamp"; [DIARY:12]Date_Time_Stamp:45)
		OB SET:C1220($_obj_DiaryRecord; "TimeDateStampOriginal"; [DIARY:12]Original_Date_Time_Stamp:47)
		OB SET:C1220($_obj_DiaryRecord; "TimeDisplayFrom"; [DIARY:12]Display_Time_From:53)  //note that times are stored as milliseconds 
		OB SET:C1220($_obj_DiaryRecord; "TimeDisplayTo"; [DIARY:12]Display_Time_To:54)  //note that times are stored as milliseconds 
		
		OB SET:C1220($_obj_DiaryRecord; "AllDayEvent"; [DIARY:12]DoAllDay:83)
		OB SET:C1220($_obj_DiaryRecord; "DoneAllDay"; [DIARY:12]DoneAllDay:84)
		OB SET:C1220($_obj_DiaryRecord; "DiaryAttributes"; [DIARY:12]Attributes:79)
		//we may have to get data from the attributes as well.
		//other fields do not affect where this appears in the 
		NEXT RECORD:C51([DIARY_ITEMOWNERS:106])
		//Now push that to the worker.
	End for 
	If (Count parameters:C259<3)
		OB SET:C1220($_obj_CallerObject; "action"; "Include"; "DataObject"; $_obj_DiaryRecord)
		CALL WORKER:C1389("DiaryManager"; "SD3_ServerSideDiaryManager"; $_obj_CallerObject)
	Else 
		//this is being called from within the worker so return the object
		$0:=$_obj_DiaryRecord
	End if 
End if 
ERR_MethodTrackerReturn("SD_SendtoWorflow"; $_t_oldMethodName)
