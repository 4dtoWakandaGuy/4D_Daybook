//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CreditCheckinprocess
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
	C_BOOLEAN:C305($_bo_SNo; $3)
	C_LONGINT:C283($_l_CallBackProcess; $1; GEN_l_CreditCheckCallback; GEN_l_ResultCode; vSNo)
	C_REAL:C285($_r_DueAmount)
	C_TEXT:C284($_t_Alert; $_t_CompanyCode; $_t_DueAmount; $_t_oldMethodName; $2; GEN_t_CreditCheckAlert)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Gen_CreditCheckinprocess")
//Gen_CreditCh2
vSNo:=0
If (Count parameters:C259>=3)
	$_t_CompanyCode:=$2
	$_t_Alert:=""
	$_bo_SNo:=$3
	$_l_CallBackProcess:=$1
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
	
	If ([COMPANIES:2]Sales_Credit:35=0)
		$_t_Alert:=[COMPANIES:2]Company_Name:2+" has no Credit Account"
		If ($_bo_SNo)
			vSNo:=1
		End if 
	Else 
		
		QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$_t_CompanyCode; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)
		$_r_DueAmount:=Sum:C1([INVOICES:39]Total_Due:7)
		$_t_DueAmount:=String:C10($_r_DueAmount; "|Accounts")
		$_t_Alert:=[COMPANIES:2]Company_Name:2+Char:C90(13)
		$_t_Alert:=$_t_Alert+"Limit: "+String:C10([COMPANIES:2]Sales_Credit:35; "|Accounts")+Char:C90(13)+"Used: "+$_t_DueAmount
		If ($_r_DueAmount>[COMPANIES:2]Sales_Credit:35)
			$_t_Alert:=$_t_Alert+" (OVER)"
			If ($_bo_SNo)
				vSNo:=2
			End if 
		End if 
	End if 
	If ([COMPANIES:2]Default_Credit_Stage:42#"")
		RELATE ONE:C42([COMPANIES:2]Default_Credit_Stage:42)
		$_t_Alert:=$_t_Alert+Char:C90(13)+"Credit Stage: "+[COMPANIES:2]Default_Credit_Stage:42+"  "+[CREDIT_STAGES:54]Stage_Name:2+Char:C90(13)
		If (($_bo_SNo) & ([CREDIT_STAGES:54]Prevent_Invoice:7))
			vSNo:=3
		End if 
	Else 
		$_t_Alert:=$_t_Alert+Char:C90(13)+Char:C90(13)
	End if 
	If ($_t_Alert#"")
		If ($_l_CallBackProcess>0)
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; GEN_l_ResultCode; VsNo)
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; GEN_t_CreditCheckAlert; $_t_Alert)
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; GEN_l_CreditCheckCallback; 2)
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Gen_CreditCheckinprocess"; $_t_oldMethodName)