//%attributes = {}
If (False:C215)
	//Project Method Name:      SR_StatementonStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(INV_ar_DueAmounts;0)
	//ARRAY REAL(INV_ar_InvoicedAmounts;0)
	//ARRAY REAL(INV_ar_PaidAmounts;0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_AgeDays; $_l_Index)
	C_REAL:C285(v0; v31; v61; v91; vSubTotal; vTotal; vTotalReceived)
	C_TEXT:C284($_t_oldMethodName; vDetails; vNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR_StatementonStart")



//<code>
vDetails:=""
vNumber:=[COMPANIES:2]Company_Code:1

vSubTotal:=0
vTotalReceived:=0
v0:=0
v31:=0
v61:=0
v91:=0
vTotal:=0
vSubTotal:=0
vTotalReceived:=0

Comp_DetailsI
If (vDetails="")
	Letter_Details
End if 

For ($_l_Index; 1; Size of array:C274(INV_ar_InvoicedAmounts))
	vSubTotal:=vSubTotal+INV_ar_InvoicedAmounts{$_l_Index}
	vTotalReceived:=vTotalReceived+INV_ar_PaidAmounts{$_l_Index}
	vTotal:=vTotal+INV_ar_DueAmounts{$_l_Index}
	
	//calculate ageing information due date etc
	
	$_l_AgeDays:=<>DB_d_CurrentDate-INV_ad_InvoiceDates{$_l_Index}
	
	If ($_l_AgeDays>DB_GetLedgerADStageThree)
		v91:=v91+INV_ar_DueAmounts{$_l_Index}
	End if 
	If (($_l_AgeDays>DB_GetLedgerADStageTwo) & ($_l_AgeDays<=DB_GetLedgerADStageThree))
		v61:=v61+INV_ar_DueAmounts{$_l_Index}
	End if 
	If (($_l_AgeDays>DB_GetLedgerADStageOne) & ($_l_AgeDays<=DB_GetLedgerADStageTwo))
		v31:=v31+INV_ar_DueAmounts{$_l_Index}
	End if 
	If ($_l_AgeDays<=DB_GetLedgerADStageOne)
		v0:=v0+INV_ar_DueAmounts{$_l_Index}
	End if 
End for 

//</code>

//<return>
//$0 :=
//</return>
ERR_MethodTrackerReturn("SR_StatementonStart"; $_t_oldMethodName)
