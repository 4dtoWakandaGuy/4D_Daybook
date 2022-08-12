//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_FormCr
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_FormCr")
//Reports_FormCr
READ WRITE:C146([DOCUMENTS:7])
Reports_FormCr2("SR_Contract"; 17; "Contract_Form")
Reports_FormCr2("SR_Delivery"; 24; "Delivery_Note")
Reports_FormCr2("SR_Invoice"; 39; "Invoice")
Reports_FormCr2("SR_Invoice_DT"; 39; "Invoice_DT")
Reports_FormCr2("SR_Movement"; 40; "Movement_Form")
Reports_FormCr2("SR_Order_Ack"; 24; "Order_Ack")
Reports_FormCr2("SR_Order_Auth"; 24; "Order_Auth")
Reports_FormCr2("SR_Order_Quote"; 24; "Order Quote")
Reports_FormCr2("SR_Purch_Order"; 57; "Purchase_Order")
Reports_FormCr2("SR_Remittance"; 37; "Remittance")
Reports_FormCr2("SR_Statement"; 39; "Statement")
READ ONLY:C145([DOCUMENTS:7])
UNLOAD RECORD:C212([DOCUMENTS:7])
ERR_MethodTrackerReturn("Reports_FormCr"; $_t_oldMethodName)
