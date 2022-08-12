//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_ADSRBo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/04/2011 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CB_bo_ConvertAtOlderRate; CB_bo_ConvertAtOldRate)
	C_REAL:C285(vT1; vT2; vT3; vT4; vT5; vT6; vTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; CUR_t_ouputCurrency; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_ADSRBo")
//Invoices_ADSRSt - created for Seymour 4.1.001
If (CUR_t_ouputCurrency="")
	CUR_t_ouputCurrency:=<>SYS_t_BaseCurrency
End if 

If (False:C215)
	vTotal:=CurrConv_Convert([INVOICES:39]Total_Due:7; [INVOICES:39]Invoice_Date:4; [INVOICES:39]Currency_Code:27)
Else 
	Vtotal:=CUR_ConvertValue([INVOICES:39]Total_Due:7; [INVOICES:39]Currency_Code:27; CUR_t_ouputCurrency; CB_bo_ConvertAtOldRate; CB_bo_ConvertAtOlderRate)
	
	
	
End if 

vT1:=0
vT2:=0
vT3:=0
vT4:=0
vT5:=0
vT6:=0

Case of 
	: ([INVOICES:39]Period_Code:13=vTitle1)
		vT1:=vTotal
	: ([INVOICES:39]Period_Code:13=vTitle2)
		vT2:=vTotal
	: ([INVOICES:39]Period_Code:13=vTitle3)
		vT3:=vTotal
	: ([INVOICES:39]Period_Code:13=vTitle4)
		vT4:=vTotal
	: ([INVOICES:39]Period_Code:13=vTitle5)
		vT5:=vTotal
	Else 
		vT6:=vTotal
End case 
ERR_MethodTrackerReturn("Invoices_ADSRBo"; $_t_oldMethodName)