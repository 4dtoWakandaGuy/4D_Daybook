//%attributes = {}
If (False:C215)
	//Project Method Name:      Document_EmailTokens
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_CurrentDate)
	C_TEXT:C284($_t_DayString; $_t_monthString; $_t_oldMethodName; $_t_Text; $_t_YearString; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Document_EmailTokens")

$0:=""
If (Count parameters:C259>=1)
	$0:=$1
	$_t_Text:=$1
	If ($_t_Text#"")
		$_d_CurrentDate:=Current date:C33(*)
		$_t_DayString:=String:C10(Day of:C23($_d_CurrentDate); "00")
		$_t_monthString:=String:C10(Month of:C24($_d_CurrentDate); "00")
		$_t_YearString:=String:C10(Year of:C25($_d_CurrentDate))
		
		$_t_Text:=Replace string:C233($_t_Text; "<DDMMYEAR>"; $_t_DayString+$_t_monthString+$_t_YearString)
		$_t_Text:=Replace string:C233($_t_Text; "<MMDDYEAR>"; $_t_monthString+$_t_DayString+$_t_YearString)
		$_t_Text:=Replace string:C233($_t_Text; "<YEARMMDD>"; $_t_YearString+$_t_monthString+$_t_DayString)
		$_t_Text:=Replace string:C233($_t_Text; "<MMYEAR>"; $_t_monthString+$_t_YearString)
		$_t_Text:=Replace string:C233($_t_Text; "<YEARMM>"; $_t_YearString+$_t_monthString)
		
		$_t_YearString:=Substring:C12($_t_YearString; Length:C16($_t_YearString)-1; 2)
		
		$_t_Text:=Replace string:C233($_t_Text; "<DDMMYY>"; $_t_DayString+$_t_monthString+$_t_YearString)
		$_t_Text:=Replace string:C233($_t_Text; "<MMDDYY>"; $_t_monthString+$_t_DayString+$_t_YearString)
		$_t_Text:=Replace string:C233($_t_Text; "<YYMMDD>"; $_t_YearString+$_t_monthString+$_t_DayString)
		$_t_Text:=Replace string:C233($_t_Text; "<MMYY>"; $_t_monthString+$_t_YearString)
		$_t_Text:=Replace string:C233($_t_Text; "<YYMM>"; $_t_YearString+$_t_monthString)
		$_t_Text:=Document_EmailFieldTokens($_t_Text)
		$_t_Text:=Document_emailMacroTokens($_t_Text)  //added 12/12/07 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "<Month>"; (MonthName($_d_CurrentDate)))
		$_t_Text:=Replace string:C233($_t_Text; "<ContactCode>"; [CONTACTS:1]Contact_Code:2)
		$_t_Text:=Replace string:C233($_t_Text; "<ContactFirstName>"; [CONTACTS:1]Forename:4)  //added 12/12/07 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "<ContactLastName>"; [CONTACTS:1]Surname:5)  //added 12/12/07 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "<ContactFullName>"; [CONTACTS:1]Contact_Name:31)  //added 12/12/07 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "<CompanyCode>"; [COMPANIES:2]Company_Code:1)
		$_t_Text:=Replace string:C233($_t_Text; "<CompanyName>"; [COMPANIES:2]Company_Name:2)  //added 12/12/07 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "<InvoiceNo>"; [INVOICES:39]Invoice_Number:1)
		$_t_Text:=Replace string:C233($_t_Text; "<OrderCode>"; [ORDERS:24]Order_Code:3)
		$_t_Text:=Replace string:C233($_t_Text; "<OrderNo>"; [ORDERS:24]Order_Code:3)
		$_t_Text:=Replace string:C233($_t_Text; "<PurchaseOrderNo>"; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)  //Tue, Mar 13, 2007 balinderwalia: added
		$_t_Text:=Replace string:C233($_t_Text; "<PurchaseInvoiceNo>"; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)  //Tue, Mar 13, 2007 balinderwalia: added
		$_t_Text:=Replace string:C233($_t_Text; "<PurchasesCode>"; [PURCHASE_INVOICES:37]Purchase_Code:1)  //Tue, Mar 13, 2007 balinderwalia: added
		$_t_Text:=Replace string:C233($_t_Text; "<PurchaseCode>"; [PURCHASE_INVOICES:37]Purchase_Code:1)  //Tue, Mar 13, 2007 balinderwalia: added
		$_t_Text:=Replace string:C233($_t_Text; "<DiaryCode>"; [DIARY:12]Diary_Code:3)  //added 08/10/08 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "<DiaryActionDescription>"; [DIARY:12]Action_Details:10)  //added 08/10/08 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "<DiaryResultDescription>"; [DIARY:12]Result_Description:12)  //added 08/10/08 -kmw
		$_t_Text:=Replace string:C233($_t_Text; "/"; "_")
		$_t_Text:=Replace string:C233($_t_Text; ""; "_")
		$0:=$_t_Text
	End if 
	
End if 
ERR_MethodTrackerReturn("Document_EmailTokens"; $_t_oldMethodName)