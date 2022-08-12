//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_Diary_CalM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 10:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD_D_CurrentviewDate; SD_d_DiaryViewDate; vDate)
	C_LONGINT:C283($_l_Number; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; SD3_l_CallActionNum; SD3_l_DiaryActionNum; SD3_l_DiaryRelatedRecordTable; vMod)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_ProcessName; $_t_SDProcName; $1; $2; $3; DB_t_CallOnCloseorSave; SD_t_DiaryDefaultUser; SD3_t_DiaryRelatedRecordCode; vCalPeriod)
	C_TEXT:C284(vUser2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_Diary_CalM")
//SD_Diary_CalM

Start_Process
If (Diary_File)  //NG modified June 2004
	If (Count parameters:C259>=2)
		vDate:=Date:C102($1)
		SD_D_CurrentviewDate:=Date:C102($1)
		vUser2:=$2
		vCalPeriod:=""
	Else 
		vDate:=!00-00-00!
		vUser2:=<>PER_t_CurrentUserInitials
	End if 
	
	vMod:=0
	SD_t_DiaryDefaultUser:=vUser2
	BRING TO FRONT:C326(Current process:C322)
	
	Diary_Cal
	If (vDate>!00-00-00!)
		SD_D_CurrentviewDate:=vDate
	End if 
	Process_End
	$_t_SDProcName:="Schedule"+"-"+SD_t_DiaryDefaultUser
	$_l_ProcessNumber:=Process number:C372($_t_SDProcName)
	PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
	If ($_l_ProcessState<0)
		$_l_ProcessNumber:=0
	End if 
	
	DB_t_CallOnCloseorSave:="File"
	If ($_l_ProcessNumber>0)
		If (Count parameters:C259>=3)
			$_l_Number:=Num:C11($3)
			If ($_l_Number>0)
				SD3_l_CallActionNum:=$_l_Number
			Else 
				SD3_l_CallActionNum:=2
			End if 
		Else 
			SD3_l_CallActionNum:=2
		End if 
		
		PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
		If ($_l_ProcessState>=0)  // 29/05/02
			SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD_d_DiaryViewDate; SD_D_CurrentviewDate)
			SET PROCESS VARIABLE:C370($_l_ProcessNumber; SD3_l_DiaryActionNum; SD3_l_CallActionNum)
			SHOW PROCESS:C325($_l_ProcessNumber)
			RESUME PROCESS:C320($_l_ProcessNumber)
			BRING TO FRONT:C326($_l_ProcessNumber)
			If (Application type:C494#4D Server:K5:6)
				POST OUTSIDE CALL:C329($_l_ProcessNumber)
			End if 
		End if 
		SD3_l_CallActionNum:=0
	Else 
		ZProc("Diary_Mod_SD"; DB_ProcessMemoryinit(6); $_t_SDProcName)
	End if 
	UNLOAD RECORD:C212([DIARY:12])
End if 
Process_End  //added NG June 2004
ERR_MethodTrackerReturn("SD_Diary_CalM"; $_t_oldMethodName)
