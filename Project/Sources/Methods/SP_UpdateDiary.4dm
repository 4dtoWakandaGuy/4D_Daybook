//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_UpdateDiary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2; CB_SP_Diary)
	C_TEXT:C284($_t_oldMethodName; $_t_State; SP_t_DiaryActionCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_UpdateDiary")
SP_LoadGenPrefs
If (CB_SP_Diary=1) & (SP_t_DiaryActionCode#"")
	//we do create diary items relating to the SP
	READ ONLY:C145([SALES_PROJECTION:113])
	READ ONLY:C145([COMPANIES:2])
	READ ONLY:C145([CONTACTS:1])
	READ ONLY:C145([PERSONNEL:11])
	READ ONLY:C145([ORDERS:24])
	If ([SALES_PROJECTION:113]x_ID:1#$1)
		QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=$1)
	End if 
	READ WRITE:C146([DIARY:12])
	QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$2)
	If (Records in selection:C76([DIARY:12])>0)
		//update (Check) the date   and the status
		//if the order is completed then so is the diary
		If ([SALES_PROJECTION:113]CompanyID:6>0)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=[SALES_PROJECTION:113]CompanyID:6)
			[DIARY:12]Company_Code:1:=[COMPANIES:2]Company_Code:1
		End if 
		If ([SALES_PROJECTION:113]ContactID:7>0)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=[SALES_PROJECTION:113]ContactID:7)
			[DIARY:12]Contact_Code:2:=[CONTACTS:1]Contact_Code:2
		End if 
		[DIARY:12]Date_Do_From:4:=[SALES_PROJECTION:113]Expected_date:16
		If ([DIARY:12]Date_Do_From:4=!00-00-00!)
			[DIARY:12]Date_Do_From:4:=Current date:C33(*)
		End if 
		
		[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
		
		
		Case of 
				
			: ([SALES_PROJECTION:113]RelatedSaleTableID:8=Table:C252(->[ORDERS:24]))
				QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[SALES_PROJECTION:113]RelatedSaleRecordID:9)
				[DIARY:12]Order_Code:26:=[ORDERS:24]Order_Code:3
				
				[DIARY:12]Data_Source_Table:49:=Field:C253(->[ORDERS:24]Order_Code:3)
				
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
		
		
		
	Else 
		//Create the diary item
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
				[DIARY:12]Data_Source_Table:49:=Field:C253(->[ORDERS:24]Order_Code:3)
				
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
		READ WRITE:C146([SALES_PROJECTION:113])
		QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=$1)
		[SALES_PROJECTION:113]RelatedDiaryID:27:=[DIARY:12]x_ID:50
		DB_SaveRecord(->[SALES_PROJECTION:113])
		AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
		UNLOAD RECORD:C212([SALES_PROJECTION:113])
		UNLOAD RECORD:C212([DIARY:12])
		READ ONLY:C145([DIARY:12])
		READ ONLY:C145([SALES_PROJECTION:113])
		
	End if 
	
Else 
	If ($2>0)
		READ WRITE:C146([DIARY:12])
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$2)
		If (Records in selection:C76([DIARY:12])>0)
			//update (Check) the date   and the status
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SP_UpdateDiary"; $_t_oldMethodName)
