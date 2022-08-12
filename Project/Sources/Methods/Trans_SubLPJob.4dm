//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_SubLPJob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_SubLPJob")
//Trans_SubLPJob
Check_SecTrB(->[TRANSACTION_BATCH_ITEMS:155]Job_Code:23)
$0:=True:C214
If (OK=1)
	If (Count parameters:C259=0)
		If (((DB_GetModuleSettingByNUM(Module_JobCosting))<2))
			Gen_Alert("You do not have access to Jobs"; "Cancel")
			[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=""
		Else 
			Check_MinorNC(->[TRANSACTION_BATCH_ITEMS:155]Job_Code:23; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
			If (([TRANSACTION_BATCH_ITEMS:155]Job_Code:23#"") & ([TRANSACTION_BATCH_ITEMS:155]Company_Code:13=""))
				[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[JOBS:26]Company_Code:3
			End if 
		End if 
	Else 
		If (Count parameters:C259>=2)
			If (((DB_GetModuleSettingByNUM(Module_JobCosting))<2))
				
				Gen_Alert("You do not have access to Jobs"; "Cancel")
				$1->:=""
				$0:=False:C215
			Else 
				Check_MinorNC($1; ""; ->[JOBS:26]; ->[JOBS:26]Job_Code:1; ->[JOBS:26]Job_Name:2; "Job")
				If (($1->#"") & ($2->=""))
					$2->:=[JOBS:26]Company_Code:3
					$0:=True:C214
				End if 
			End if 
		End if 
	End if 
	
Else 
	If (Count parameters:C259>0)
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("Trans_SubLPJob"; $_t_oldMethodName)