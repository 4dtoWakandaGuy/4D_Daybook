//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs SRMargRep
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
	//ARRAY TEXT(srqtyt;0)
	//Array REAL(sramount;0)
	//Array REAL(srprice;0)
	//Array REAL(srrate;0)
	//Array TEXT(srdesc;0)
	C_LONGINT:C283(vNo; vNo1)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; $Last)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs SRMargRep")
QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
vNo:=Records in selection:C76([JOB_STAGES:47])
Form_SRArray(vNo)
ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Invoice_Number:10; >)
FIRST RECORD:C50([JOB_STAGES:47])
vNo1:=1
$Last:=""
vSubtotal:=0
vVAT:=0
vTotal:=0

While (Not:C34(End selection:C36([JOB_STAGES:47])))
	
	If ([JOB_STAGES:47]Invoice_Number:10=$Last)
		srprice{vNo1}:=0
	Else 
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=[JOB_STAGES:47]Invoice_Number:10)
		srprice{vNo1}:=Sum:C1([INVOICES:39]Total_Invoiced_Excluding_Tax:26)
	End if 
	srqtyt{vNo1}:=[INVOICES:39]Invoice_Number:1
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOB_STAGES:47]Job_Code:1; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=[JOB_STAGES:47]Stage_Code:2)
	srrate{vNo1}:=Sum:C1([ORDER_ITEMS:25]Cost_Amount:15)
	sramount{vNo1}:=Round:C94((srprice{vNo1}-srrate{vNo1}); 2)
	
	srdesc{vNo1}:=[JOB_STAGES:47]Stage_Name:3
	
	vSubtotal:=vSubtotal+srprice{vNo1}
	vVAT:=vVAT+srrate{vNo1}
	vTotal:=vTotal+sramount{vNo1}
	vNo1:=vNo1+1
	$Last:=[INVOICES:39]Invoice_Number:1
	NEXT RECORD:C51([JOB_STAGES:47])
End while 
ERR_MethodTrackerReturn("Jobs SRMargRep"; $_t_oldMethodName)