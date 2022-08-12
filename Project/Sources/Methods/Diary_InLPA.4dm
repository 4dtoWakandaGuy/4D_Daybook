//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $_bo_Sequence; $2)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_DiaryResultCode; $_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; SD_t_DiaryResultCodeOLD)
	C_TIME:C306(<>SYS_ti_DefaultDiaryTimeCheck)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InLPA")
//Diary_InLPA
$_bo_OK:=True:C214
$_bo_Sequence:=False:C215
If (Count parameters:C259>=1)
	$_t_DiaryResultCode:=$1
	If (Count parameters:C259>=2)
		$_bo_Sequence:=$2
	End if 
Else 
	$_t_DiaryResultCode:=SD_t_DiaryResultCodeOLD
End if 
Diary_PersPrior
OK:=0
If (DB_t_CurrentFormUsage="AS")
	OK:=1  // ACCEPT
Else 
	If (<>SYS_ti_DefaultDiaryTimeCheck#?00:00:00?)
		If ([DIARY:12]Time_Checked:28=False:C215)
			Diary_TimeCheck("LPA")
			If ([DIARY:12]Time_Checked:28=False:C215)
				$_bo_OK:=False:C215
			End if 
		End if 
	End if 
	//If ($_bo_OK)
	//  OK:=1  `ACCEPT
	// End if
	If ($_t_DiaryResultCode="") & ([DIARY:12]Done:14) | ([DIARY:12]Result_Description:12#"") | ([DIARY:12]Date_Done_From:5#!00-00-00!) | ([DIARY:12]Date_Done_To:34#!00-00-00!)
		//set result code via a dialogue
		
	End if 
	
	If ((DB_GetModuleSettingByNUM(Module_Sequences)>1) & ($_bo_OK))
		If (([DIARY:12]Action_Code:9#"") & ([DIARY:12]Result_Code:11#"") & ($_t_DiaryResultCode#[DIARY:12]Result_Code:11) & (Records in table:C83([WORKFLOW_CONTROL:51])>0))
			DB_SaveRecord(->[DIARY:12])
			If (Count parameters:C259>=2)
				
				Diary_InLPASeq("LPA"; $_bo_Sequence)
				
			Else 
				Diary_InLPASeq("LPA")
			End if 
		End if 
	End if 
	If ((DB_t_CurrentFormUsage2="Next") & ($_bo_OK))
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
		ADD TO SET:C119([DIARY:12]; "DMaster")
		USE SET:C118("DMaster")
		vNo:=Records in selection:C76([DIARY:12])
		DB_t_CurrentFormUsage2:=""
	End if 
	If ($_bo_OK)
		OK:=1  //ACCEPT
	Else 
		OK:=0
	End if 
End if 
ERR_MethodTrackerReturn("Diary_InLPA"; $_t_oldMethodName)