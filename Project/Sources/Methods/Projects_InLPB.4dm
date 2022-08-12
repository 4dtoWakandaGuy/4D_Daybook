//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/02/2012 20:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY LONGINT(AL_al_ModeJob;0)
	//ARRAY POINTER(PTR_aptr_LbSetup;0)
	//ARRAY TEXT(PRJ_at_ModeJob;0)
	C_BOOLEAN:C305(<>ForceCred; <>SYS_bo_DefaultEntry; vFromIn; vMod2)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vNo2; vStPos)
	C_PICTURE:C286(<>LB_pic_ModePicture; JOB_pic_LBMode)
	C_REAL:C285(vTot; vTot2)
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_oldMethodName; DB_t_CallOnCloseorSave; PRJ_t_ProjectManagerName; vButtDisSC; VSELPREV; vSolCode; vType_)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_InLPB")
//Projects_InLPB
If ((<>CompCode#"") & ([PROJECTS:89]Company_Code:3="") & (<>SYS_bo_DefaultEntry) & (<>ForceCred=False:C215))
	[PROJECTS:89]Company_Code:3:=<>CompCode
	RELATE ONE:C42([PROJECTS:89]Company_Code:3)
	[PROJECTS:89]Person:8:=[COMPANIES:2]Sales_Person:29
	If (<>ContCode="")
		Check_ContDef(->[PROJECTS:89]Company_Code:3; ->[PROJECTS:89]Contact_Code:4)
	End if 
End if 
If ((<>ContCode#"") & ([PROJECTS:89]Contact_Code:4="") & (<>SYS_bo_DefaultEntry) & (<>ForceCred=False:C215))
	[PROJECTS:89]Contact_Code:4:=<>ContCode
	RELATE ONE:C42([PROJECTS:89]Contact_Code:4)
	If ((<>CompCode="") & (Not:C34(Check_ContCorr(->[PROJECTS:89]Company_Code:3; ->[PROJECTS:89]Contact_Code:4))))
		[PROJECTS:89]Company_Code:3:=[CONTACTS:1]Company_Code:1
		RELATE ONE:C42([PROJECTS:89]Company_Code:3)
		[PROJECTS:89]Person:8:=[COMPANIES:2]Sales_Person:29
	End if 
End if 
If ([PROJECTS:89]Project_Code:1="")
	// Projects Code
	
	JC_SetProjectCode  //added 23/03/07 -kmw
	
End if 


//RELATE ONE([PROJECTS]Company Code)
//vCompName:=[COMPANIES]Company Name
//vTel:=[COMPANIES]Telephone
//RELATE ONE([PROJECTS]Contact Code)
//vContName:=Cont NameJT
JC_ProjectsCompRel  //added 23/03/07 -kmw (replaces above commented out code - also used when company or contact codes are altered)

If ([PROJECTS:89]Person:8#"")  //added 23/03/07 -kmw
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[PROJECTS:89]Person:8)  //added 23/03/07 -kmw
	PRJ_t_ProjectManagerName:=[PERSONNEL:11]Name:2  //added 23/03/07 -kmw
Else   //added 23/03/07 -kmw
	PRJ_t_ProjectManagerName:=""  //added 23/03/07 -kmw
End if   //added 23/03/07 -kmw

If ([PROJECTS:89]Project_Type:7#"")
	RELATE ONE:C42([PROJECTS:89]Project_Type:7)
	vType_:=[JOB_TYPES:65]Type_Name:2
Else 
	vType_:=""
End if 

vNo2:=0
vSolCode:=[JOBS:26]Job_Code:1
If ([PROJECTS:89]Start_Date:5=!00-00-00!)
	[PROJECTS:89]Start_Date:5:=<>DB_d_CurrentDate
	//[ProjectS]End Date:=◊CDate
End if 
vTot:=0
vTot2:=0
If ([TABLE_RECORD_STATES:90]State_Reference:4#[PROJECTS:89]State:9)
	RELATE ONE:C42([PROJECTS:89]State:9)
End if 
If ([PROJECTS:89]Project_Code:1#"")
	GOTO OBJECT:C206([PROJECTS:89]Project_Name:2)
End if 

States_CUArr(->[PROJECTS:89]State:9)
If (vSelPrev="&Dis")
	Projects_InLPBE
End if 
If (vStPos>0)
	If (((<>SYS_al_RecStateRestriction{89}{vStPos}\2)%2)=1)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]Project_Code:1; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]Project_Name:2; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]Company_Code:3; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]Contact_Code:4; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]Start_Date:5; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]End_Date:6; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]Project_Type:7; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]Person:8; False:C215)
		OBJECT SET ENTERABLE:C238([PROJECTS:89]State:9; False:C215)
		vSelPrev:="&Dis"
	End if 
End if 
vButtDisSC:="IP   O   SS R AD "
Input_Buttons(->[PROJECTS:89]; ->vButtDisSC; "Project"; "Job")
vFromIn:=False:C215
//NG MAy 2004 code replaced here to get jobs
PROJ_LoadJobs
RELATE ONE:C42([PROJECTS:89]State:9)  //added -kmw, 07/12/06 reload current file state so it's description displays correctly (Automatic relations and selection to array in PROJ_LoadJobs -> LBi_LoadSetup -> LBi_LoadArrays causes current file state be unloaded)

PRJ_at_ModeJob:=1
AL_al_ModeJob:=1

LBi_EditListLay(->PTR_aptr_LbSetup; ->PRJ_at_ModeJob; ->JOB_pic_LBMode; ->AL_al_ModeJob)

JOB_pic_LBMode:=<>LB_pic_ModePicture




vMod2:=False:C215
DB_t_CallOnCloseorSave:="P:Projects_InLPA:D:Projects_InCan"
Macro_AccType("Load "+String:C10(Table:C252(->[PROJECTS:89])))
ERR_MethodTrackerReturn("Projects_InLPB"; $_t_oldMethodName)