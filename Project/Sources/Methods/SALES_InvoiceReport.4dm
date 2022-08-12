//%attributes = {}
If (False:C215)
	//Project Method Name:      SALES_InvoiceReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Sales_at_CompanyCodes;0)
	C_BOOLEAN:C305(Sales_bo_OnScreenMessage)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(Sales_ti_Doc)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SALES_InvoiceReport")
//sales_invoicereport
//this method will print out for the current selection of companies
//a report of the year on year sales
ARRAY TEXT:C222(Sales_at_CompanyCodes; 0)
Sales_bo_OnScreenMessage:=False:C215
If (Records in selection:C76([INVOICES:39])>0)
	DISTINCT VALUES:C339([INVOICES:39]Company_Code:2; Sales_at_CompanyCodes)
	
	If (Size of array:C274(Sales_at_CompanyCodes)>100)
		Sales_bo_OnScreenMessage:=True:C214
	End if 
	
	Sales_ti_Doc:=DB_CreateDocument(""; "TEXT")
	If (Sales_ti_Doc#?00:00:00?)
		If (Sales_bo_OnScreenMessage)
			Open window:C153(40; 100; 300; 200; -1984)
		End if 
		
		
		For ($_l_Index; 1; Size of array:C274(Sales_at_CompanyCodes))
			If (Sales_bo_OnScreenMessage)
				ERASE WINDOW:C160
				
				MESSAGE:C88("Checking "+Sales_at_CompanyCodes{$_l_Index}+" Record "+String:C10($_l_Index)+" of "+String:C10(Records in selection:C76([COMPANIES:2])))
			End if 
			
			
			CALL_SalesYearonYEar(Sales_at_CompanyCodes{$_l_Index}; 4; Sales_ti_Doc)
			NEXT RECORD:C51([COMPANIES:2])
		End for 
		CLOSE DOCUMENT:C267(Sales_ti_Doc)
		If (Sales_bo_OnScreenMessage)
			CLOSE WINDOW:C154
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SALES_InvoiceReport"; $_t_oldMethodName)
