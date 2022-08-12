If (False:C215)
	//object Name: [SALES_PROJECTION]SalesProjectionEntry.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; $_bo_Create)
	C_LONGINT:C283(SD_l_CompanionMenuTable; SD3_l_CallActionNum)
	C_TEXT:C284($_t_DiaryCode; $_t_oldMethodName; SD3_t_DiaryRelatedRecord; SP_t_DiaryActionCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable4"; Form event code:C388)
If ([SALES_PROJECTION:113]RelatedDiaryID:27>0)
	READ ONLY:C145([DIARY:12])
	QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[SALES_PROJECTION:113]RelatedDiaryID:27)
	If (Records in selection:C76([DIARY:12])>0)
		SD3_t_DiaryRelatedRecord:=[DIARY:12]Diary_Code:3
		SD_l_CompanionMenuTable:=Table:C252(->[DIARY:12])
		SD3_l_CallActionNum:=1
		ZDiary_Mod
		SD3_l_CallActionNum:=0
		<>AutoFind:=False:C215
		<>DB_bo_AutoOut:=False:C215
		$_bo_Create:=False:C215
	Else 
		//enter to diary
		$_bo_Create:=True:C214
		
	End if 
	
Else 
	//enter to diary
	$_bo_Create:=True:C214
	
End if 
If ($_bo_Create)
	
	READ WRITE:C146([DIARY:12])
	CREATE RECORD:C68([DIARY:12])
	
	If ([SALES_PROJECTION:113]CompanyID:6>0)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=[SALES_PROJECTION:113]CompanyID:6)
		[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
	End if 
	If ([SALES_PROJECTION:113]ContactID:7>0)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[SALES_PROJECTION:113]ContactID:7)
		[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
	End if 
	DiarySetCode
	[DIARY:12]Date_Do_From:4:=[SALES_PROJECTION:113]Expected_date:16
	If ([DIARY:12]Date_Do_From:4=!00-00-00!)
		[DIARY:12]Date_Do_From:4:=Current date:C33(*)
	End if 
	
	[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
	//[DIARY]Time Do From
	//[DIARY]Time Done From
	If ([SALES_PROJECTION:113]PersonnelOwnerID:4>0)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[SALES_PROJECTION:113]PersonnelOwnerID:4)
		[DIARY:12]Person:8:=[PERSONNEL:11]Initials:1
	End if 
	
	[DIARY:12]Action_Code:9:=SP_t_DiaryActionCode
	
	[DIARY:12]Action_Details:10:="Sales Projection:"+"  Order expected date"
	//  [DIARY]Result Code
	// [DIARY]Result Desc
	// [DIARY]Product Code
	// [DIARY]Done
	// [DIARY]Document Code
	// [DIARY]Value
	// [DIARY]Priority
	Case of 
			
		: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[ORDERS:24]))
			QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[SALES_PROJECTION:113]RelatedSaleRecordID:9)
			[DIARY:12]Order_Code:26:=[ORDERS:24]Order_Code:3
			[DIARY:12]Action_Details:10:="Sales Projection:"+"  Order expected date"
			[DIARY:12]Data_Source_Table:49:=Table:C252(->[ORDERS:24])
			
			
			If ([ORDERS:24]State:15="")
				States_Start(->[ORDERS:24]State:15)
			End if 
			If ([TABLE_RECORD_STATES:90]State_Reference:4#[ORDERS:24]State:15)
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[ORDERS:24]State:15)
			End if 
			If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
				Case of 
					: ([TABLE_RECORD_STATES:90]xStateClass:8=2)
						[DIARY:12]Result_Code:11:="OK"
						[DIARY:12]Done:14:=True:C214
					: ([TABLE_RECORD_STATES:90]xStateClass:8=-1)
						[DIARY:12]Result_Code:11:="Cancelled"
						[DIARY:12]Done:14:=True:C214
					Else 
						If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
							[DIARY:12]Result_Code:11:="OK"
							[DIARY:12]Done:14:=True:C214
						End if 
				End case 
			Else 
				If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
					[DIARY:12]Result_Code:11:="OK"
					[DIARY:12]Done:14:=True:C214
				End if 
			End if 
		: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[PROJECTS:89]))
			QUERY:C277([PROJECTS:89]; [PROJECTS:89]X_ID:11=[SALES_PROJECTION:113]RelatedSaleRecordID:9)
			
			If ([PROJECTS:89]State:9="")
				States_Start(->[PROJECTS:89]State:9)
			End if 
			If ([TABLE_RECORD_STATES:90]State_Reference:4#[PROJECTS:89]State:9)
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[PROJECTS:89]State:9)
			End if 
			
			If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
				Case of 
					: ([TABLE_RECORD_STATES:90]xStateClass:8=2)
						[DIARY:12]Result_Code:11:="OK"
						[DIARY:12]Done:14:=True:C214
					: ([TABLE_RECORD_STATES:90]xStateClass:8=-1)
						[DIARY:12]Result_Code:11:="Cancelled"
						[DIARY:12]Done:14:=True:C214
					Else 
						If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
							[DIARY:12]Result_Code:11:="OK"
							[DIARY:12]Done:14:=True:C214
						End if 
				End case 
			Else 
				If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
					[DIARY:12]Result_Code:11:="OK"
					[DIARY:12]Done:14:=True:C214
				End if 
			End if 
			
			
			
		: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[JOBS:26]))
			QUERY:C277([JOBS:26]; [JOBS:26]x_ID:49=[SALES_PROJECTION:113]RelatedSaleRecordID:9)
			[DIARY:12]Job_Code:19:=[JOBS:26]Job_Code:1
			[DIARY:12]Data_Source_Table:49:=Field:C253(->[JOBS:26]Job_Code:1)
			[DIARY:12]Action_Details:10:="Sales Projection:"+"  Job expected date"
			
			
			
			
			If ([JOBS:26]State:9="")
				States_Start(->[JOBS:26]State:9)
			End if 
			If ([TABLE_RECORD_STATES:90]State_Reference:4#[JOBS:26]State:9)
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4=[JOBS:26]State:9)
			End if 
			
			If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
				Case of 
					: ([TABLE_RECORD_STATES:90]xStateClass:8=2)
						[DIARY:12]Result_Code:11:="OK"
						[DIARY:12]Done:14:=True:C214
					: ([TABLE_RECORD_STATES:90]xStateClass:8=-1)
						[DIARY:12]Result_Code:11:="Cancelled"
						[DIARY:12]Done:14:=True:C214
					Else 
						If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
							[DIARY:12]Result_Code:11:="OK"
							[DIARY:12]Done:14:=True:C214
						End if 
				End case 
			Else 
				If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
					[DIARY:12]Result_Code:11:="OK"
					[DIARY:12]Done:14:=True:C214
				End if 
			End if 
			
	End case 
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	[SALES_PROJECTION:113]RelatedDiaryID:27:=[DIARY:12]x_ID:50
	$_t_DiaryCode:=[DIARY:12]Diary_Code:3
	DB_SaveRecord(->[SALES_PROJECTION:113])
	AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
	UNLOAD RECORD:C212([DIARY:12])
	READ ONLY:C145([DIARY:12])
	SD3_t_DiaryRelatedRecord:=$_t_DiaryCode
	SD_l_CompanionMenuTable:=Table:C252(->[DIARY:12])
	SD3_l_CallActionNum:=1
	ZDiary_Mod
	<>AutoFind:=False:C215
	<>DB_bo_AutoOut:=False:C215
	
End if 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].SalesProjectionEntry.Variable4"; $_t_oldMethodName)
