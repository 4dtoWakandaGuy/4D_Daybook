//%attributes = {"invisible":true}

If (False:C215)
	//Project Method Name:      Jobs_InLPX
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ForceCred; DB_bo_RecordModified)
	C_POINTER:C301($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; $_t_CompanyCode; $_t_oldMethodName; COM_t_TelephoneNumberFormat; vCompName; vJobCode; vName; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPX")

//NG May 2004
//this method to handle the modification of Jobs_In an area list area on the Projects form
//it is based entirely on Jobs_InLPD which is the current method called.
$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPX")
//Jobs_InLPD
Case of 
	: ($1=(->[JOBS:26]Your_Order_Number:5))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Your_Order_Number:5)
	: ($1=(->[JOBS:26]Comments:15))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Comments:15)
	: ($1=(->[JOBS:26]Contact_Code:4))
		$_t_CompanyCode:=[JOBS:26]Company_Code:3
		Check_Contact(->[JOBS:26]Contact_Code:4; ->[JOBS:26]Company_Code:3; ->[JOBS:26])
		
		If (($_t_CompanyCode#[JOBS:26]Company_Code:3) & ([JOBS:26]Company_Code:3#""))
			Gen_CreditCheck
			If ((vSNo>0) & (<>ForceCred))
				[JOBS:26]Company_Code:3:=""
				[JOBS:26]Contact_Code:4:=""
				Comp_vClear
			Else 
				Jobs_InLPTerm
			End if 
		End if 
		DB_bo_RecordModified:=True:C214
		Gen_FindVars
		Macro_AccTypePt(->[JOBS:26]Contact_Code:4)
	: ($1=(->[JOBS:26]Company_Code:3))
		Check_Company(->[JOBS:26]Company_Code:3; ->[JOBS:26]Contact_Code:4; ->[JOBS:26])
		
		vCompName:=[COMPANIES:2]Company_Name:2
		vTel:=[COMPANIES:2]Telephone:9
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		Else 
			COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
			
		End if 
		If ([JOBS:26]Company_Code:3#"")
			Gen_CreditCheck
			If ((vSNo>0) & (<>ForceCred))
				[JOBS:26]Company_Code:3:=""
				[JOBS:26]Contact_Code:4:=""
				Comp_vClear
			Else 
				Check_ContDef(->[JOBS:26]Company_Code:3; ->[JOBS:26]Contact_Code:4)
				If ([JOBS:26]Person:19="")
					[JOBS:26]Person:19:=[COMPANIES:2]Sales_Person:29
					RELATE ONE:C42([JOBS:26]Person:19)
					vName:=[PERSONNEL:11]Name:2
				End if 
				Jobs_InLPTerm
				
			End if 
		End if 
		DB_bo_RecordModified:=True:C214
		Gen_FindVars
		Macro_AccTypePt(->[JOBS:26]Company_Code:3)
	: ($1=(->[JOBS:26]Job_Code:1))
		If (((Records in selection:C76([ORDER_ITEMS:25])>0) | (Records in selection:C76([JOB_STAGES:47])>0)))
			
			Gen_Alert("You cannot change the code unless you delete the included lists"; "Cancel")
			Case of 
				: (Records in selection:C76([JOB_STAGES:47])>0)
					FIRST RECORD:C50([JOB_STAGES:47])
					[JOBS:26]Job_Code:1:=[JOB_STAGES:47]Job_Code:1
				: (Records in selection:C76([ORDER_ITEMS:25])>0)
					FIRST RECORD:C50([ORDER_ITEMS:25])
					[JOBS:26]Job_Code:1:=[ORDER_ITEMS:25]Job_Code:34
			End case 
		Else 
			RemoveLeadTr(Uppercase:C13([JOBS:26]Job_Code:1); ->[JOBS:26]Job_Code:1)
		End if 
		If ([JOBS:26]Job_Code:1="")
			[JOBS:26]Job_Code:1:=vJobCode
		End if 
		Gen_FindVars
		Macro_AccTypePt(->[JOBS:26]Job_Code:1)
	: ($1=(->[JOBS:26]Job_Name:2))
		[JOBS:26]Job_Name:2:=Uppers2([JOBS:26]Job_Name:2)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Job_Name:2)
	: ($1=(->[JOBS:26]Person:19))
		Check_MinorNC(->[JOBS:26]Person:19; "Name"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Person:19)
	: ($1=(->[JOBS:26]Job_Type:21))
		Check_MinorNC(->[JOBS:26]Job_Type:21; "Type"; ->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Name:2; "Job Type"; "3")
		DB_bo_RecordModified:=True:C214
		If ([JOBS:26]Terms:14="")
			[JOBS:26]Terms:14:=[JOB_TYPES:65]Terms:6
		Else 
			If ([JOB_TYPES:65]Terms:6#"")
				Gen_Confirm("The Job Type's Terms are "+[JOB_TYPES:65]Terms:6+".  Change to these Terms?"; "Yes"; "No")
				If (OK=1)
					[JOBS:26]Terms:14:=[JOB_TYPES:65]Terms:6
				End if 
			End if 
		End if 
		Macro_AccTypePt(->[JOBS:26]Job_Type:21)
	: ($1=(->[JOBS:26]Start_Date:6))
		If (([JOBS:26]End_Date:7<[JOBS:26]Start_Date:6) & ([JOBS:26]End_Date:7>!00-00-00!))
			[JOBS:26]End_Date:7:=[JOBS:26]Start_Date:6
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Start_Date:6)
	: ($1=(->[JOBS:26]End_Date:7))
		If (([JOBS:26]End_Date:7<[JOBS:26]Start_Date:6) & ([JOBS:26]Start_Date:6>!00-00-00!))
			[JOBS:26]Start_Date:6:=[JOBS:26]End_Date:7
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]End_Date:7)
	: ($1=(->[JOBS:26]Analysis_Code:24))
		Check_Analysis(->[JOBS:26]Analysis_Code:24; "Analysis")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Analysis_Code:24)
		
	: ($1=(->[JOBS:26]Currency_Code:25))
		Check_MinorNC(->[JOBS:26]Currency_Code:25; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
		If ([JOBS:26]Currency_Code:25="")
			[JOBS:26]Currency_Code:25:=<>SYS_t_BaseCurrency
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Currency_Code:25)
		
	: ($1=(->[JOBS:26]Layer_Code:26))
		Check_MinorNC(->[JOBS:26]Layer_Code:26; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
		Layer_Fill(->[JOBS:26]Layer_Code:26)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Layer_Code:26)
		
	: ($1=(->[JOBS:26]Project_Code:27))
		Check_MinorNC(->[JOBS:26]Project_Code:27; ""; ->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; ->[PROJECTS:89]Project_Name:2; "Project")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Project_Code:27)
		
	: ($1=(->[JOBS:26]State:9))
		States_Relate(->[JOBS:26]State:9)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]State:9)
		
	: ($1=(->[JOBS:26]Use_WIP:47))
		If (([JOBS:26]Use_WIP:47=False:C215) & ([JOBS:26]JS_WIP_Cost_Amount:45#0))
			Gen_Alert("You cannot turn this off while WIP Amounts exist"; "Cancel")
			[JOBS:26]Use_WIP:47:=True:C214
		Else 
			If (([JOBS:26]Use_WIP:47) & ([JOBS:26]Actual_TR:29=False:C215))
				Gen_Alert("You cannot check this box unless the Actual Time Recording option is checked"; "Cancel")
				[JOBS:26]Use_WIP:47:=False:C215
			End if 
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Use_WIP:47)
		
	: ($1=(->[JOBS:26]Actual_TR:29))
		If (([JOBS:26]Use_WIP:47) & ([JOBS:26]Actual_TR:29=False:C215))
			Gen_Alert("This box must be checked while WIP Posting is checked"; "Cancel")
			[JOBS:26]Actual_TR:29:=True:C214
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Actual_TR:29)
	: ($1=(->[JOBS:26]Budget_TR:28))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Budget_TR:28)
	: ($1=(->[JOBS:26]Terms:14))
		Check_Lists(->[JOBS:26]Terms:14; "Terms")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Terms:14)
End case 
ERR_MethodTrackerReturn("Jobs_InLPX"; $_t_oldMethodName)
