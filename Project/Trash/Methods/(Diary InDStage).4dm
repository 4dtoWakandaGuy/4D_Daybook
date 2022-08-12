//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_InDStage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InDStage")
If ([DIARY:12]Stage_Code:21#"")
	//because the stage code now IS a job stage code this does not apply
	
	// SEARCH([JOB STAGES];[JOB STAGES]Job Code=[DIARY]Job Code;*)
	// SEARCH([JOB STAGES]; & ;[JOB STAGES]Stage Code=[DIARY]Stage Code)
	//  OK:=1
	//  If (Records in selection([JOB STAGES])=0)
	// Gen_Confirm ("Stage "+[DIARY]Stage Code+" has not been allocated to Job "
	//+[DIARY]Job Code+".  Add it?";"Yes";"No")
	//  If (OK=1)
	//  READ WRITE([JOB STAGES])
	//  CREATE RECORD([JOB STAGES])
	//  [JOB STAGES]Job Code:=[DIARY]Job Code
	// [JOB STAGES]Stage Code:=[DIARY]Stage Code
	// [JOB STAGES]Stage Name:=[STAGES]Stage Name
	//  DB_SaveRecord(->[JOB STAGES])
	//  UNLOAD RECORD([JOB STAGES])
	//  READ ONLY([JOB STAGES])
	//  End if
	//  End if
	// If (OK=1)
	//   If ([JOBS]Job Code#[DIARY]Job Code)
	//    RELATE ONE([DIARY]Job Code)
	//    End if
	// If ([DIARY]Stage Code#[JOBS]Stage Code)
	// Gen_Confirm ("Job "+[DIARY]Job Code+" is currently on Stage "+[JOBS]Stage Code+
	//".  Change it to Stage "+[DIARY]Stage Code+"?";"Yes";"No")
	//   If (OK=1)
	//   READ WRITE([JOBS])
	//    LOAD RECORD([JOBS])
	//   If (Check_LockMess (»[JOBS];"Job"))
	//    [JOBS]Stage Code:=[DIARY]Stage Code
	//    DB_SaveRecord(->[JOBS])
	AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
	//  End if
	//   UNLOAD RECORD([JOBS])
	//    READ ONLY([JOBS])
	//  End if
	//   End if
	//  End if
	Check_JobPers
End if 
ERR_MethodTrackerReturn("Diary_InDStage"; $_t_oldMethodName)