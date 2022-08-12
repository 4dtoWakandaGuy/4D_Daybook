If (False:C215)
	//Table Form Method Name: [INVOICES]Inv_StateSub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DataSize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Inv_StateSub"; Form event code:C388)
If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->[INVOICES:39]Invoice_Number:1; ->[INVOICES:39]Invoice_Date:4; ->[INVOICES:39]Your_Order_Number:14; ->[INVOICES:39]Total_Invoiced:5; ->[INVOICES:39]Total_Paid:6; ->[INVOICES:39]Total_Due:7)
	
	//Set_Fonts ("[INVOICES]Invoice No+[INVOICES]Invoice Date+[INVOICES]Your Order No";◊DataSize)
	//Set_Fonts ("[INVOICES]Total Invoiced+[INVOICES]Total Paid+[INVOICES]Total Due";◊DataSize)
	Invoices_ADCalc([INVOICES:39]Total_Due:7)
End if 
ERR_MethodTrackerReturn("FM [INVOICES].Inv_StateSub"; $_t_oldMethodName)
