//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Projects_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/10/2010 14:14
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ForceCred; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_CompanyCode; $_t_oldMethodName; $_t_PalletButtonName; COM_t_TelephoneNumberFormat; PAL_BUTTON; vCompName; vCompNameAndTel; vName; vSolCode; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_InLPD")
//Projects_InLPD
Case of 
	: (Modified:C32([PROJECTS:89]Comments:10))
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PROJECTS:89]Comments:10)
	: (Modified:C32([PROJECTS:89]Contact_Code:4))
		$_t_CompanyCode:=[PROJECTS:89]Company_Code:3
		Check_Contact(->[PROJECTS:89]Contact_Code:4; ->[PROJECTS:89]Company_Code:3; ->[PROJECTS:89])
		
		If (($_t_CompanyCode#[PROJECTS:89]Company_Code:3) & ([PROJECTS:89]Company_Code:3#""))
			Gen_CreditCheck
			If ((vSNo>0) & (<>ForceCred))
				[PROJECTS:89]Company_Code:3:=""
				[PROJECTS:89]Contact_Code:4:=""
				Comp_vClear
			Else 
				
			End if 
		End if 
		JC_ProjectsCompRel
		DB_bo_RecordModified:=True:C214
		Gen_FindVars
		Macro_AccTypePt(->[PROJECTS:89]Contact_Code:4)
	: (Modified:C32([PROJECTS:89]Company_Code:3))
		Check_Company(->[PROJECTS:89]Company_Code:3; ->[PROJECTS:89]Contact_Code:4; ->[PROJECTS:89])
		
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
		vCompNameAndTel:=vCompName+"   "+vTel  //added 16/01/07 - kmw
		If ([PROJECTS:89]Company_Code:3#"")
			Gen_CreditCheck
			If ((vSNo>0) & (<>ForceCred))
				[PROJECTS:89]Company_Code:3:=""
				[PROJECTS:89]Contact_Code:4:=""
				Comp_vClear
			Else 
				Check_ContDef(->[PROJECTS:89]Company_Code:3; ->[PROJECTS:89]Contact_Code:4)
				If ([PROJECTS:89]Person:8="")
					[PROJECTS:89]Person:8:=[COMPANIES:2]Sales_Person:29
					RELATE ONE:C42([PROJECTS:89]Person:8)
					vName:=[PERSONNEL:11]Name:2
				End if 
			End if 
		End if 
		JC_ProjectsCompRel
		DB_bo_RecordModified:=True:C214
		Gen_FindVars
		Macro_AccTypePt(->[PROJECTS:89]Company_Code:3)
	: (Modified:C32([PROJECTS:89]Project_Code:1))
		If ((Records in selection:C76([JOBS:26])>0) & (vSolCode#""))
			Gen_Alert("You cannot change the code unless you delete the included Jobs"; "Cancel")
			[PROJECTS:89]Project_Code:1:=vSolCode
		Else 
			RemoveLeadTr(Uppercase:C13([PROJECTS:89]Project_Code:1); ->[PROJECTS:89]Project_Code:1)
		End if 
		Gen_FindVars
		Macro_AccTypePt(->[PROJECTS:89]Project_Code:1)
	: (Modified:C32([PROJECTS:89]Project_Name:2))
		[PROJECTS:89]Project_Name:2:=Uppers2([PROJECTS:89]Project_Name:2)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PROJECTS:89]Project_Name:2)
	: (Modified:C32([PROJECTS:89]Person:8))
		Check_MinorNC(->[PROJECTS:89]Person:8; "ProjectManagerName"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PROJECTS:89]Person:8)
	: (Modified:C32([PROJECTS:89]Project_Type:7))
		Check_MinorNC(->[PROJECTS:89]Project_Type:7; "Type_"; ->[JOB_TYPES:65]; ->[JOB_TYPES:65]Type_Code:1; ->[JOB_TYPES:65]Type_Name:2; "Project Type"; "2")
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PROJECTS:89]Project_Type:7)
	: (Modified:C32([PROJECTS:89]Start_Date:5))
		If (([PROJECTS:89]End_Date:6<[PROJECTS:89]Start_Date:5) & ([PROJECTS:89]End_Date:6>!00-00-00!))
			[PROJECTS:89]End_Date:6:=[PROJECTS:89]Start_Date:5
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PROJECTS:89]Start_Date:5)
	: (Modified:C32([PROJECTS:89]End_Date:6))
		If (([PROJECTS:89]End_Date:6<[PROJECTS:89]Start_Date:5) & ([PROJECTS:89]Start_Date:5>!00-00-00!))
			[PROJECTS:89]Start_Date:5:=[PROJECTS:89]End_Date:6
		End if 
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[PROJECTS:89]End_Date:6)
	: (Modified:C32([PROJECTS:89]State:9))
		States_Relate(->[PROJECTS:89]State:9)
		Macro_AccTypePt(->[PROJECTS:89]State:9)
	: (vTot=1)
		vTot:=0
		Projects_InLPTo
		DB_bo_RecordModified:=True:C214
	: (PAL_BUTTON#"")
		$_t_PalletButtonName:=PAL_BUTTON
		PAL_BUTTON:=""
		DB_HandleInputFormButtons($_t_PalletButtonName)
		PAL_bo_ButtonSubFunction:=False:C215
		
End case 
ERR_MethodTrackerReturn("Projects_InLPD"; $_t_oldMethodName)
