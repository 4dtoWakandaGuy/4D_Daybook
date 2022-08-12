//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InRecalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:44
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_LockedJobPersonnel; $_bo_LockedJobStage; vDirectEdit)
	C_LONGINT:C283($_l_Recordsindex; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InRecalc")
//Jobs_InRecalc
Menu_Record("Jobs_InRecalc"; "Recalculate all Totals")

If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
If (Modified record:C314([JOB_STAGES:47]))
	DB_SaveRecord(->[JOB_STAGES:47])
End if 


Gen_Confirm("Based on Time and Cost records, this function will update the totals on this Job "+"as well as the totals all of it's Job Stage and Job Stage Personnel records. Plea"+"se confirm."; "Confirm"; "Cancel")

If (OK=1)
	
	StartTransaction
	
	//*************************** update all job personnel records connected to job ***************************
	//should work so long as none are missing their job code and only connected to jobs via their job stages which shouldn't happen
	READ WRITE:C146([JOB PERSONNEL:48])
	QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOBS:26]Job_Code:1)
	FIRST RECORD:C50([JOB PERSONNEL:48])
	$_l_RecordsinSelection:=Records in selection:C76([JOB PERSONNEL:48])
	$_bo_LockedJobPersonnel:=False:C215
	For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
		If (Check_Locked(->[JOB PERSONNEL:48]; 1))
			vDirectEdit:=True:C214
			JC_UpdateJSPAllTotals
			//
			DB_SaveRecord(->[JOB PERSONNEL:48])
		Else 
			$_bo_LockedJobPersonnel:=True:C214
			$_l_Recordsindex:=$_l_RecordsinSelection  //break out of for loop
		End if 
		NEXT RECORD:C51([JOB PERSONNEL:48])
	End for 
	//***************************************************************************************
	//
	If ($_bo_LockedJobPersonnel=False:C215)
		//**************************** update all job stage records connected to job ******************************
		READ WRITE:C146([JOB_STAGES:47])
		QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
		FIRST RECORD:C50([JOB_STAGES:47])
		$_l_RecordsinSelection:=Records in selection:C76([JOB_STAGES:47])
		$_bo_LockedJobStage:=False:C215
		For ($_l_Recordsindex; 1; $_l_RecordsinSelection)
			If (Check_Locked(->[JOB_STAGES:47]; 1))
				vDirectEdit:=True:C214
				JC_UpdateJSAllTotals
				//
				DB_SaveRecord(->[JOB_STAGES:47])
			Else 
				$_bo_LockedJobStage:=True:C214
				$_l_Recordsindex:=$_l_RecordsinSelection  //break out of for loop
			End if 
			NEXT RECORD:C51([JOB_STAGES:47])
		End for 
		
		If ($_bo_LockedJobStage=False:C215)
			//**************************** update actual job, validate transaction and inform user ***********************
			vDirectEdit:=True:C214
			JC_UpdateJobAllTotals
			//
			DB_SaveRecord(->[JOBS:26])
			//VALIDATE TRANSACTION
			Transact_End(True:C214)
			Jobs_InLPPB  //lazy way to get it to update all of the listbox values
			
			Gen_Alert("Update completed successfully.")
			//***************************************************************************************
		Else 
			//CANCEL TRANSACTION
			Transact_End(False:C215)
			Gen_Alert("Sorry. At least one Job Stage record belonging to this Job is locked. Update canc"+"elled.")
		End if 
		//***************************************************************************************
	Else 
		//CANCEL TRANSACTION
		Transact_End(False:C215)
		Gen_Alert("Sorry. At least one Job Stage Personnel record belonging to this Job is locked. U"+"pdate cancelled.")
	End if 
	
End if 



DB_SaveRecord(->[JOBS:26])
AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
ERR_MethodTrackerReturn("Jobs_InRecalc"; $_t_oldMethodName)