//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_LPAge
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 14:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vContr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_LPAge")
//See Also LP Invoices_Out & Pay
vCalls:=<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4
If ([INVOICES:39]Due_Date:18#!00-00-00!) & ([INVOICES:39]Total_Due:7>=0)
	vContr:=<>DB_d_CurrentDate-[INVOICES:39]Due_Date:18
Else 
	If ([INVOICES:39]Total_Due:7<=0)  //modified NG march 2004
		vContr:=0
	Else 
		vContr:=<>DB_d_CurrentDate-[INVOICES:39]Invoice_Date:4
	End if 
End if 
If (vContr<0)
	vContr:=0
End if 
ERR_MethodTrackerReturn("Invoices_LPAge"; $_t_oldMethodName)