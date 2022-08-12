//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs CostPost
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs CostPost")
//Jobs CostPost
READ WRITE:C146([JOBS:26])
READ WRITE:C146([JOB_STAGES:47])
FIRST RECORD:C50([ORDER_ITEMS:25])
While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (OK=1))
	
	RELATE ONE:C42([ORDER_ITEMS:25]Job_Code:34)
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[ORDER_ITEMS:25]Job_Code:34; *)
	QUERY:C277([JOB_STAGES:47];  & ; [JOB_STAGES:47]Stage_Code:2=[ORDER_ITEMS:25]Job_Stage:35)
	
	If ((Check_LockMess(->[JOBS:26]; "Job")) & (Check_LockMess(->[JOB_STAGES:47]; "Job Stage")))
		
		MESSAGE:C88("   "+[ORDER_ITEMS:25]Job_Code:34+"   "+[ORDER_ITEMS:25]Job_Stage:35+"   "+String:C10([ORDER_ITEMS:25]Sales_Amount:7; "|Accounts")+Char:C90(13))
		
		If ([ORDER_ITEMS:25]State:46="B")
			[JOBS:26]JC_Budget_Sales_ Amount:33:=[JOBS:26]JC_Budget_Sales_ Amount:33+[ORDER_ITEMS:25]Sales_Amount:7
			[JOBS:26]JC_Budget_Cost_Amount:34:=[JOBS:26]JC_Budget_Cost_Amount:34+[ORDER_ITEMS:25]Cost_Amount:15
			
		Else 
			[JOBS:26]JC_Actual_Sales_Amount:32:=[JOBS:26]JC_Actual_Sales_Amount:32+[ORDER_ITEMS:25]Sales_Amount:7
			[JOBS:26]AC_Actual_Cost_Amount:10:=[JOBS:26]AC_Actual_Cost_Amount:10+[ORDER_ITEMS:25]Cost_Amount:15
			
			If ((DB_bo_RecordModified) & ([JOBS:26]Use_WIP:47))
				Jobs_CostWIP
			End if 
			
		End if 
		Jobs_InLPTot2
		DB_SaveRecord(->[JOBS:26])
		AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
		
		If (OK=1)
			If ([ORDER_ITEMS:25]Job_Stage:35#"")
				If (Records in selection:C76([JOB_STAGES:47])=0)
					CREATE RECORD:C68([JOB_STAGES:47])
					[JOB_STAGES:47]Job_Code:1:=[ORDER_ITEMS:25]Job_Code:34
					[JOB_STAGES:47]Stage_Code:2:=[ORDER_ITEMS:25]Job_Stage:35
					RELATE ONE:C42([JOB_STAGES:47]Stage_Code:2)
					[JOB_STAGES:47]Stage_Name:3:=[STAGES:45]Stage_Name:2
					DB_SaveRecord(->[JOB_STAGES:47])
				End if 
				If ([ORDER_ITEMS:25]State:46="B")
					[JOB_STAGES:47]JC_Budget_Sales_Amount:33:=[JOB_STAGES:47]JC_Budget_Sales_Amount:33+[ORDER_ITEMS:25]Sales_Amount:7
					[JOB_STAGES:47]JC_Budget_Cost_Amount:34:=[JOB_STAGES:47]JC_Budget_Cost_Amount:34+[ORDER_ITEMS:25]Cost_Amount:15
				Else 
					[JOB_STAGES:47]JC_Actual_Sales_Amount:31:=[JOB_STAGES:47]JC_Actual_Sales_Amount:31+[ORDER_ITEMS:25]Sales_Amount:7
					[JOB_STAGES:47]JC_Actual_Cost_Amount:32:=[JOB_STAGES:47]JC_Actual_Cost_Amount:32+[ORDER_ITEMS:25]Cost_Amount:15
					
					If ((DB_bo_RecordModified) & ([JOBS:26]Use_WIP:47) & (([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N")))
						[JOB_STAGES:47]JC_WIP_Cost_Amount:44:=Round:C94(([JOB_STAGES:47]JC_WIP_Cost_Amount:44+[ORDER_ITEMS:25]Cost_Amount:15); 2)
						[JOB_STAGES:47]JS_WIP_Cost_Amount:45:=Round:C94(([JOB_STAGES:47]JT_WIP_Cost_Amount:43+[JOB_STAGES:47]JC_WIP_Cost_Amount:44); 2)
					End if 
					
				End if 
				JobStages_InT2
				DB_SaveRecord(->[JOB_STAGES:47])
			End if 
		End if 
		
	End if 
	
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 

READ ONLY:C145([JOBS:26])
READ ONLY:C145([JOB_STAGES:47])
UNLOAD RECORD:C212([JOBS:26])
UNLOAD RECORD:C212([JOB_STAGES:47])
ERR_MethodTrackerReturn("Jobs CostPost"; $_t_oldMethodName)