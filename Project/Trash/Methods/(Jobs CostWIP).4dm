//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs CostWIP
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
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SREuroAmt;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_JobCodeRow)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs CostWIP")
//Jobs CostWIP
If (([JOBS:26]Use_WIP:47) & (DB_bo_RecordModified))
	If (([ORDER_ITEMS:25]Job_Stage:35="") | ([JOB_STAGES:47]Invoice_Number:10="") | ([JOB_STAGES:47]Invoice_Number:10="N"))
		$_l_JobCodeRow:=Find in array:C230(SRProdCode; [JOBS:26]Job_Code:1)
		If ($_l_JobCodeRow<1)
			Form_SRArrIns(1)
			$_l_JobCodeRow:=Size of array:C274(SRProdCode)
			SRProdCode{$_l_JobCodeRow}:=[JOBS:26]Job_Code:1
		End if 
		SRAmount{$_l_JobCodeRow}:=Round:C94((SRAmount{$_l_JobCodeRow}+[ORDER_ITEMS:25]Cost_Amount:15); 2)
		SREuroAmt{$_l_JobCodeRow}:=WS_EuroConvertor(SRAmount{$_l_JobCodeRow}; [ORDERS:24]Currency_Code:32)
		[JOBS:26]JC_WIP_Cost_Amount:44:=Round:C94(([JOBS:26]JC_WIP_Cost_Amount:44+[ORDER_ITEMS:25]Cost_Amount:15); 2)
		If ([ORDER_ITEMS:25]Job_Stage:35="")
			[JOBS:26]JC_WIP_Job_Cost_Amount:46:=Round:C94(([JOBS:26]JC_WIP_Job_Cost_Amount:46+[ORDER_ITEMS:25]Cost_Amount:15); 2)
		End if 
		[JOBS:26]JS_WIP_Cost_Amount:45:=Round:C94(([JOBS:26]JT_WIP_Cost_Amount:43+[JOBS:26]JC_WIP_Cost_Amount:44+[JOBS:26]JC_WIP_Job_Cost_Amount:46); 2)
	Else 
		$_l_JobCodeRow:=Find in array:C230(SRQtyT; [JOBS:26]Job_Code:1)
		If ($_l_JobCodeRow<1)
			INSERT IN ARRAY:C227(SRQtyT; 9999; 1)
			INSERT IN ARRAY:C227(SRPrice; 9999; 1)
			$_l_JobCodeRow:=Size of array:C274(SRQtyT)
			SRQtyT{$_l_JobCodeRow}:=[JOBS:26]Job_Code:1
		End if 
		SRPrice{$_l_JobCodeRow}:=Round:C94((SRPrice{$_l_JobCodeRow}+[ORDER_ITEMS:25]Cost_Amount:15); 2)
	End if 
End if 
ERR_MethodTrackerReturn("Jobs CostWIP"; $_t_oldMethodName)