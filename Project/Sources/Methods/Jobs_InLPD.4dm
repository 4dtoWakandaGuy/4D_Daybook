//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AL_l_ModeStage;0)
	//ARRAY LONGINT(JOB_al_AgencyDivisions;0)
	//ARRAY LONGINT(JOB_al_EmployeeRange;0)
	//ARRAY POINTER(JOB_aptr_LBStageSettings;0)
	//ARRAY TEXT(JOB_at_AgencyDivisions;0)
	//ARRAY TEXT(JOB_at_EmployeeRange;0)
	//ARRAY TEXT(JOB_at_ModeStage;0)
	C_BOOLEAN:C305(<>ForceCred; DB_bo_RecordModified)
	C_LONGINT:C283($_l_EmployeesRow; $_l_isUnique; $_l_JobCodeNumber; JOB_l_AgencyListID)
	C_PICTURE:C286(JOB_pic_StageEditMode)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; $_t_JobCode; $_t_JobCompanyCode; $_t_oldMethodName; COM_t_TelephoneNumberFormat; JOB_t_Employees; JOB_t_JobDivision; vAnalysisCodeDesc; vCompName; vCompNameAndTel)
	C_TEXT:C284(VContNameJT; vCurrencyName; vJobCode; vLayerCodeDesc; vName; vTel; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPD")
//Jobs_InLPD
Case of 
	: (Modified:C32([JOBS:26]Your_Order_Number:5))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Your_Order_Number:5)
	: (Modified:C32([JOBS:26]Comments:15))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Comments:15)
	: (Modified:C32([JOBS:26]Contact_Code:4))
		$_t_JobCompanyCode:=[JOBS:26]Company_Code:3
		Check_Contact(->[JOBS:26]Contact_Code:4; ->[JOBS:26]Company_Code:3; ->[JOBS:26])
		VContNameJT:=[CONTACTS:1]Job_Title:6
		
		If (($_t_JobCompanyCode#[JOBS:26]Company_Code:3) & ([JOBS:26]Company_Code:3#""))
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
	: (Modified:C32([JOBS:26]Company_Code:3))
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
		If ([JOBS:26]JOB_xCompanyEmployees:66=0)
			[JOBS:26]JOB_xCompanyEmployees:66:=[COMPANIES:2]x_Employees:73
/*
If ([JOBS]JOB_xCompanyEmployees>0)
$_l_EmployeesRow:=Find in array(JOB_al_EmployeeRange;[JOBS]JOB_xCompanyEmployees)
If ($_l_EmployeesRow>0)
JOB_t_Employees:=JOB_at_EmployeeRange{$_l_EmployeesRow}
Else
[JOBS]JOB_xCompanyEmployees:=0
End if
			
End if
*/
		End if 
		vCompNameAndTel:=vCompName+"   "+vTel  //added 16/01/07 - kmw
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
	: (Modified:C32([JOBS:26]Job_Code:1))
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
	: (Modified:C32([JOBS:26]Job_Name:2))
		[JOBS:26]Job_Name:2:=Uppers2([JOBS:26]Job_Name:2)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Job_Name:2)
	: (Modified:C32([JOBS:26]Person:19))
		Check_MinorNC(->[JOBS:26]Person:19; "Name"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")
		vName:=[PERSONNEL:11]Name:2  //added 22/03/07 -kmw
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Person:19)
	: (Modified:C32([JOBS:26]Job_Type:21))
		//Check_MinorNC (->[JOBS]Job_Type;"Type";->[JOB_TYPES];->[JOB_TYPES]Type_Code;->[JOB_TYPES]Type_Name;"Job Type";"3";True;[JOBS]x_RecordClass)  // pass the job class in $9(here a 1-it should be a field on the jobs table)
		If ([JOBS:26]Job_Code:1="•TMP@")
			[JOBS:26]Job_Code:1:=Replace string:C233([JOBS:26]Job_Code:1; "•TMP"; [JOBS:26]Job_Type:21)
			$_t_JobCode:=[JOBS:26]Job_Code:1
			//Check it does not clash
			Repeat 
				SET QUERY DESTINATION:C396(3; $_l_isUnique)
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JobCode)
				SET QUERY DESTINATION:C396(0)
				If ($_l_isUnique>0)
					$_l_JobCodeNumber:=Gen_Code(17)  //from the same pot
					$_t_JobCode:=[JOBS:26]Job_Type:21+String:C10($_l_JobCodeNumber)
					SET QUERY DESTINATION:C396(3; $_l_isUnique)
					QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_JobCode)
					SET QUERY DESTINATION:C396(0)
				End if 
			Until ($_l_isUnique=0)
			[JOBS:26]Job_Code:1:=$_t_JobCode
			
			//```
		Else 
			
		End if 
		vType:=[JOB_TYPES:65]Type_Name:2  //added 22/03/07 -kmw
		If ([JOBS:26]x_RecordClass:50=0) | ([JOBS:26]x_RecordClass:50=2)
			If ([JOBS:26]Job_Type:21#[JOB_TYPES:65]Type_Code:1)
				QUERY:C277([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1=[JOBS:26]Job_Type:21)
			End if 
			[JOBS:26]x_JobDivision:61:=[JOB_TYPES:65]xAgencyDivision:13
			If ([JOBS:26]x_JobDivision:61>0)
				ARRAY TEXT:C222(JOB_at_AgencyDivisions; 0)
				ARRAY LONGINT:C221(JOB_al_AgencyDivisions; 0)
				JOB_l_AgencyListID:=AA_LoadListByName("Agency Divisions"; ->JOB_at_AgencyDivisions; ->JOB_al_AgencyDivisions; False:C215)
				$_l_EmployeesRow:=Find in array:C230(JOB_al_AgencyDivisions; [JOBS:26]x_JobDivision:61)
				If ($_l_EmployeesRow>0)
					JOB_t_JobDivision:=JOB_at_AgencyDivisions{$_l_EmployeesRow}
				Else 
					JOB_t_JobDivision:=""
				End if 
			End if 
		End if 
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
	: (Modified:C32([JOBS:26]Start_Date:6))
		If (([JOBS:26]End_Date:7<[JOBS:26]Start_Date:6) & ([JOBS:26]End_Date:7>!00-00-00!))
			[JOBS:26]End_Date:7:=[JOBS:26]Start_Date:6
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Start_Date:6)
	: (Modified:C32([JOBS:26]End_Date:7))
		If (([JOBS:26]End_Date:7<[JOBS:26]Start_Date:6) & ([JOBS:26]Start_Date:6>!00-00-00!))
			[JOBS:26]Start_Date:6:=[JOBS:26]End_Date:7
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]End_Date:7)
	: (Modified:C32([JOBS:26]Analysis_Code:24))
		Check_Analysis(->[JOBS:26]Analysis_Code:24; "AnalysisCodeDesc")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Analysis_Code:24)
		
	: (Modified:C32([JOBS:26]Currency_Code:25))
		Check_MinorNC(->[JOBS:26]Currency_Code:25; "Currency"; ->[CURRENCIES:71]; ->[CURRENCIES:71]Currency_Code:1; ->[CURRENCIES:71]Currency_Name:2)
		If ([JOBS:26]Currency_Code:25="")
			[JOBS:26]Currency_Code:25:=<>SYS_t_BaseCurrency
		End if 
		vCurrencyName:=[CURRENCIES:71]Currency_Name:2  //added 23/03/07 -kmw
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Currency_Code:25)
		
	: (Modified:C32([JOBS:26]Layer_Code:26))
		Check_MinorNC(->[JOBS:26]Layer_Code:26; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")
		Layer_Fill(->[JOBS:26]Layer_Code:26)
		QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=[JOBS:26]Layer_Code:26)  //added 23/03/07 -kmw, if left blank "Layer_Fill" may set layer code to something so need to do this additiional query in order to also ensure a description
		vLayerCodeDesc:=[LAYERS:76]Layer_Name:2  //added 23/03/07 -kmw
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Layer_Code:26)
		
	: (Modified:C32([JOBS:26]Project_Code:27))
		//Check_MinorNC (->[JOBS]Project Code;"";->[PROJECTS];->[PROJECTS]Project Code;->[PROJECTS]Project Name;"Project")
		Check_Minor(->[JOBS:26]Project_Code:27; ""; ->[PROJECTS:89]; ->[PROJECTS:89]Project_Code:1; ->[PROJECTS:89]Project_Name:2; "Project")  //changed to allow add 22/03/07 -kmw (It has presumably always been the case that this screen didn't allow a project add from the lookup but Steve saw this inability to add project from here as a bug)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Project_Code:27)
		
	: (Modified:C32([JOBS:26]State:9))
		States_Relate(->[JOBS:26]State:9)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]State:9)
		
	: (Modified:C32([JOBS:26]Use_WIP:47))
		If (([JOBS:26]Use_WIP:47=False:C215) & (([JOBS:26]JS_WIP_Cost_Amount:45#0) | ([JOBS:26]JS_WIP_Sales_Amount:54#0)))  //added check for WIP sales amount also -14/03/07, kmw
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
		
	: (Modified:C32([JOBS:26]Actual_TR:29))
		If (([JOBS:26]Use_WIP:47) & ([JOBS:26]Actual_TR:29=False:C215))
			Gen_Alert("This box must be checked while WIP Posting is checked"; "Cancel")
			[JOBS:26]Actual_TR:29:=True:C214
		Else   //added else (changed so that only runs the below code if the above condition doesn't happen) - 14/03/07, kmw
			//********************* added 19/02/07 -kmw *************************
			If ([ORDER_ITEMS:25]Job_Code:34#"")
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End if 
			If ([JOB_STAGES:47]Job_Code:1#"")
				DB_SaveRecord(->[JOB_STAGES:47])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB_STAGES:47]))
			End if 
			LBi_EditListLay(->JOB_aptr_LBStageSettings; ->JOB_at_ModeStage; ->JOB_pic_StageEditMode; ->AL_l_ModeStage)
			
			If (OK=1)
			End if 
			JC_JobSetTimePostEnterability
			If ([JOBS:26]Actual_TR:29=False:C215)
				//Gen_Alert ("You can now enter Actual Time values directly against this Job's Job Sta"+"ges. "+Char(13)+Char(13)+"WARNING: Modifications, additions or deletions to Time records belonging to this "+"Job or any of its Job Stages will no longer automatically update the Job and Job "+"Stage Actual Totals. In other words, the system will no longer force Act"+"ual Time totals of this Job or its Job Stages"+" to reflect the collated Actual"+" values found on associated Time records.";"OK")
				//message changed to the below as per steve's instructions 22/03/07 -kmw
				Gen_Alert("Unselecting this means that Actual Time Recording values can be entered "+"direct"+"ly to this Job's Job Stages."+Char:C90(13)+Char:C90(13)+"Job and Job Stage Actual Time Recording totals are no longer updated"+" automatically."+Char:C90(13)+Char:C90(13); "OK")
			Else 
				//Gen_Alert ("You can no longer enter Actual Time values directly against this Job's Job Sta"+"ges. "+Char(13)+Char(13)+"NOTE: Job and Job Stage Actual Totals are now updated"+" automatically when modifica"+"tions, "+"additions or deletions are made to the appropriate Time records."+Char(13)+Char(13);"OK")
				//message changed to the below as per steve's instructions 22/03/07 -kmw
				Gen_Alert("Selecting this means that Actual Time Recording values must be entered v"+"ia the"+" 'Enter Time' or 'Enter Time & Costs' screens."+Char:C90(13)+Char:C90(13)+"Job and Job Stage Actual Time Recording totals are now updated"+" automatically."+Char:C90(13)+Char:C90(13); "OK")
			End if 
			//**************************************************************
		End if 
		DB_bo_RecordModified:=True:C214
		
		Macro_AccTypePt(->[JOBS:26]Actual_TR:29)
		
		
	: (Modified:C32([JOBS:26]Budget_TR:28))
		DB_bo_RecordModified:=True:C214
		//********************* added 19/02/07 -kmw *************************
		If ([ORDER_ITEMS:25]Job_Code:34#"")
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		End if 
		If ([JOB_STAGES:47]Job_Code:1#"")
			DB_SaveRecord(->[JOB_STAGES:47])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB_STAGES:47]))
		End if 
		LBi_EditListLay(->JOB_aptr_LBStageSettings; ->JOB_at_ModeStage; ->JOB_pic_StageEditMode)
		If (OK=1)
		End if 
		JC_JobSetTimePostEnterability
		If ([JOBS:26]Budget_TR:28=False:C215)
			//Gen_Alert ("You can now enter Budget Time values directly against this Job's Job Sta"+"ges. "+Char(13)+Char(13)+"WARNING: Modifications, additions or deletions to Time records belonging to this "+"Job or any of its Job Stages will no longer automatically update the Job and Job "+"Stage Budget Totals. In other words, the system will no longer force Bud"+"get Time totals of this Job or its Job Stages"+" to reflect the collated Budget"+" values found on associated Time records.";"OK")
			//message changed to the below as per steve's instructions 22/03/07 -kmw
			Gen_Alert("Unselecting this means that Budget Time Recording values can be entered "+"direct"+"ly to this Job's Job Stages."+Char:C90(13)+Char:C90(13)+"Job and Job Stage Budget Time Recording totals are no longer updated"+" automatically."+Char:C90(13)+Char:C90(13); "OK")
		Else 
			//Gen_Alert ("You can no longer enter Budget Time values directly against this Job's Job Sta"+"ges. "+Char(13)+Char(13)+"NOTE: Job and Job Stage Budget Totals are now updated"+" automatically when modifica"+"tions, "+"additions or deletions are made to the appropriate Time records."+Char(13)+Char(13);"OK")
			//message changed to the below as per steve's instructions 22/03/07 -kmw
			Gen_Alert("Selecting this means that Budget Time Recording values must be entered v"+"ia the"+" 'Enter Time' or 'Enter Time & Costs' screens."+Char:C90(13)+Char:C90(13)+"Job and Job Stage Budget Time Recording totals are now updated"+" automatically."+Char:C90(13)+Char:C90(13); "OK")
		End if 
		//**************************************************************
		
		
		Macro_AccTypePt(->[JOBS:26]Budget_TR:28)
	: (Modified:C32([JOBS:26]Terms:14))
		Check_Lists(->[JOBS:26]Terms:14; "Terms")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[JOBS:26]Terms:14)
		//
		//****************************** added 14/03/07 -kmw ******************************
	: (Modified:C32([JOBS:26]JT_Bud_Sales_Amount:23))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JT_Budget_Cost_Amount:30))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]J_ Actual_Sales_Amount:17))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JT_Actual_Cost_Amount:31))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JT_WIP_Sales_Amount:52))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JT_WIP_Cost_Amount:43))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JC_Budget_Sales_ Amount:33))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JC_Budget_Cost_Amount:34))
		
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JC_Actual_Sales_Amount:32))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]AC_Actual_Cost_Amount:10))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JC_WIP_Sales_Amount:53))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JC_WIP_Cost_Amount:44))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]AS_Quoted_Amount:11))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Budget_Sales_Amount:37))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Budget_Cost_Amount:38))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Budget_Margin:41))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Bud_Margin_PC:42))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Actual_Sales_Amount:35))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Actual_Cost_Amount:36))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Actual_Margin:39))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_Actual_Margin_PC:40))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_WIP_Sales_Amount:54))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_WIP_Cost_Amount:45))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_WIP_Margin:55))
		JC_JobTotalArraysLoadValues
	: (Modified:C32([JOBS:26]JS_WIP_MarginPC:56))
		JC_JobTotalArraysLoadValues
		//******************************************************************************
End case 
ERR_MethodTrackerReturn("Jobs_InLPD"; $_t_oldMethodName)