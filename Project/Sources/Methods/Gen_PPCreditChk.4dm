//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_PPCreditChk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_PPCreditChk")
RELATE ONE:C42($1->)
RELATE ONE:C42([COMPANIES:2]Default_Credit_Stage:42)
If ($2->)
	Gen_Alert("The Company "+[COMPANIES:2]Company_Code:1+" has a Credit Stage of "+[CREDIT_STAGES:54]Stage_Code:1+" "+[CREDIT_STAGES:54]Stage_Name:2+" and cannot be "+$3; "Cancel")
	$0:=False:C215
Else 
	$0:=True:C214
End if 
ERR_MethodTrackerReturn("Gen_PPCreditChk"; $_t_oldMethodName)