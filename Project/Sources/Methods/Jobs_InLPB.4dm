//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/02/2012 12:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	C_BOOLEAN:C305(<>ForceCred; <>PersAnOver; <>SYS_bo_DefaultEntry; $0; JC_bo_PostActualTime; JC_bo_PostBudgetTime; JC_bo_PostWIP; vFromIn)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vJB; vNo2)
	C_REAL:C285(vTot; vTot2; vTot3)
	C_TEXT:C284(<>CompCode; <>ContCode; <>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; <>WIP_t_CIPTRANS; <>WIP_t_TRPTrans; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SD_t_CallingCompanyCode)
	C_TEXT:C284(SD_t_CallingContactCode; vButtDisJob; vJobCode; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPB")
//Jobs_InLPB
$0:=True:C214  // NG May 2004
If (SD_t_CallingCompanyCode#"") & ([JOBS:26]Company_Code:3="")
	[JOBS:26]Company_Code:3:=SD_t_CallingCompanyCode
	SD_t_CallingCompanyCode:=""
End if 
If ([JOBS:26]Contact_Code:4="") & (SD_t_CallingContactCode#"")
	[JOBS:26]Contact_Code:4:=SD_t_CallingContactCode
	SD_t_CallingContactCode:=""
End if 
If ((<>CompCode#"") & ([JOBS:26]Company_Code:3="") & (<>SYS_bo_DefaultEntry) & (<>ForceCred=False:C215))
	[JOBS:26]Company_Code:3:=<>CompCode
	RELATE ONE:C42([JOBS:26]Company_Code:3)
	[JOBS:26]Person:19:=[COMPANIES:2]Sales_Person:29
	If (<>ContCode="")
		Check_ContDef(->[JOBS:26]Company_Code:3; ->[JOBS:26]Contact_Code:4)
	End if 
End if 
If ((<>ContCode#"") & ([JOBS:26]Contact_Code:4="") & (<>SYS_bo_DefaultEntry) & (<>ForceCred=False:C215))
	[JOBS:26]Contact_Code:4:=<>ContCode
	RELATE ONE:C42([JOBS:26]Contact_Code:4)
	If ((<>CompCode="") & (Not:C34(Check_ContCorr(->[JOBS:26]Company_Code:3; ->[JOBS:26]Contact_Code:4))))
		[JOBS:26]Company_Code:3:=[CONTACTS:1]Company_Code:1
		RELATE ONE:C42([JOBS:26]Company_Code:3)
		[JOBS:26]Person:19:=[COMPANIES:2]Sales_Person:29
	End if 
End if 
If ([JOBS:26]Job_Code:1="")
	Jobs_Code
	If (<>PersAnOver)
		[JOBS:26]Analysis_Code:24:=<>Per_t_CurrentDefaultAnalCode
	End if 
	If ([JOBS:26]Currency_Code:25="")
		[JOBS:26]Currency_Code:25:=<>SYS_t_BaseCurrency
	End if 
	If (False:C215)  //added 23/02/07 -kmw,  uses new job costing posting prefs instead
		[JOBS:26]Actual_TR:29:=True:C214  //always set - for Silver & Gold
		If ((DB_GetModuleSettingByNUM(1))#5)  //don't use WIP if Silver
			If ((<>WIP_t_TRPTrans#"") & (<>WIP_t_CIPTRANS#""))
				[JOBS:26]Use_WIP:47:=True:C214
			End if 
		End if 
	End if 
	
	//below section moved to here from actual form method 23/02/07 -kmw
	//******************************************added 15/02/07 -kmw ********************************************
	//If ([JOBS]Job Code="")`commented out 23/02/07 -kmw
	
	If ([JOBS:26]x_RecordClass:50=1)  //1 = "Job Costing" (see JOB_loadJobTypeClasses) - used to control which "Job" Types (other tables use "Job" Types as well) are available and also in the case of Jobs table to differentiate Job Costing Jobs from Agency Manger Jobs
		JC_LoadPrefs  //added 23/02/07 -kmw
		[JOBS:26]Budget_TR:28:=JC_bo_PostBudgetTime  //added 23/02/07 -kmw
		[JOBS:26]Actual_TR:29:=JC_bo_PostActualTime  //added 23/02/07 -kmw
		[JOBS:26]Use_WIP:47:=JC_bo_PostWIP  //added 23/02/07 -kmw
		//End if `commented out 23/02/07 -kmw
		//******************************************************************************************************
	End if 
	Layer_Fill(->[JOBS:26]Layer_Code:26)
End if 
Jobs_InLPRel


vNo2:=0
vJobCode:=[JOBS:26]Job_Code:1
If ([JOBS:26]Start_Date:6=!00-00-00!)
	[JOBS:26]Start_Date:6:=<>DB_d_CurrentDate
	//[JOBS]End Date:=◊CDate
End if 
vJB:=1
vTot:=0
vTot2:=0
vTot3:=0
DB_t_CurrentFormUsage:="Job"
If ([JOBS:26]x_RecordClass:50=1)
	If ((<>WIP_t_TRPTrans="") | (<>WIP_t_CIPTRANS=""))
		[JOBS:26]Use_WIP:47:=False:C215  //added 05/03/07 -kmw
		OBJECT SET ENTERABLE:C238([JOBS:26]Use_WIP:47; False:C215)
	End if 
End if 
If ([JOBS:26]Job_Code:1#"")
	GOTO OBJECT:C206([JOBS:26]Job_Name:2)
End if 

vButtDisJob:="IJ   O   SS R AD "


States_CUArr(->[JOBS:26]State:9)


If (((<>SYS_al_RecStateRestriction{26}{vStPos}\2)%2)=1)
	Jobs_InLPBDis
Else 
	If (vSelPrev="&Dis")
		Jobs_InLPBEn
	End if 
End if 
Case of 
	: (FORM Get current page:C276=1)
		Input_Buttons(->[JOBS:26]; ->vButtDisJob; "Job"; "Job Stage")
	: (FORM Get current page:C276=3)
		Input_Buttons(->[JOBS:26]; ->vButtDisJob; "Job"; "Cost Item")
End case 
vFromIn:=False:C215
ERR_MethodTrackerReturn("Jobs_InLPB"; $_t_oldMethodName)