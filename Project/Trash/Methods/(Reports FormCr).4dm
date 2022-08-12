//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports FormCr
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

$_t_oldMethodName:=ERR_MethodTracker("Reports FormCr")
//Reports FormCr
READ WRITE:C146([DOCUMENTS:7])
Reports_FormCr2("SR Contract"; 17; "Contract Form")
Reports_FormCr2("SR Delivery"; 24; "Delivery Note")
Reports_FormCr2("SR Invoice"; 39; "Invoice")
Reports_FormCr2("SR Invoice DT"; 39; "Invoice DT")
Reports_FormCr2("SR Movement"; 40; "Movement Form")
Reports_FormCr2("SR Order Ack"; 24; "Order Ack")
Reports_FormCr2("SR Order Auth"; 24; "Order Auth")
Reports_FormCr2("SR Order Quote"; 24; "Order Quote")
Reports_FormCr2("SR Purch Order"; 57; "Purchase Order")
Reports_FormCr2("SR Remittance"; 37; "Remittance")
Reports_FormCr2("SR Statement"; 39; "Statement")
READ ONLY:C145([DOCUMENTS:7])
UNLOAD RECORD:C212([DOCUMENTS:7])
ERR_MethodTrackerReturn("Reports FormCr"; $_t_oldMethodName)