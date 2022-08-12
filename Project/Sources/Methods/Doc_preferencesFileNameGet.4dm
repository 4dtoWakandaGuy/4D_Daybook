//%attributes = {}
If (False:C215)
	//Project Method Name:      Doc_preferencesFileNameGet
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
	C_DATE:C307($_d_DateToday)
	C_TEXT:C284($_t_DaySTR; $_t_DocumentName; $_t_monthString; $_t_oldMethodName; $_t_YearString; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_preferencesFileNameGet")

$_t_DocumentName:=$1

$_d_DateToday:=Current date:C33(*)
$_t_DaySTR:=String:C10(Day of:C23($_d_DateToday); "00")
$_t_monthString:=String:C10(Month of:C24($_d_DateToday); "00")
$_t_YearString:=String:C10(Year of:C25($_d_DateToday))

$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<DDMMYEAR>"; $_t_DaySTR+$_t_monthString+$_t_YearString)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<MMDDYEAR>"; $_t_monthString+$_t_DaySTR+$_t_YearString)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<YEARMMDD>"; $_t_YearString+$_t_monthString+$_t_DaySTR)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<MMYEAR>"; $_t_monthString+$_t_YearString)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<YEARMM>"; $_t_YearString+$_t_monthString)
$_t_DocumentName:=Document_EmailFieldTokens($_t_DocumentName)
$_t_DocumentName:=Document_emailMacroTokens($_t_DocumentName)  //added 12/12/07 -kmw
$_t_YearString:=Substring:C12($_t_YearString; Length:C16($_t_YearString)-1; 2)

$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<DDMMYY>"; $_t_DaySTR+$_t_monthString+$_t_YearString)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<MMDDYY>"; $_t_monthString+$_t_DaySTR+$_t_YearString)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<YYMMDD>"; $_t_YearString+$_t_monthString+$_t_DaySTR)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<MMYY>"; $_t_monthString+$_t_YearString)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<YYMM>"; $_t_YearString+$_t_monthString)

$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<Month>"; (MonthName($_d_DateToday)))

$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<ContactCode>"; [CONTACTS:1]Contact_Code:2)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<CompanyCode>"; [COMPANIES:2]Company_Code:1)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<InvoiceNo>"; [INVOICES:39]Invoice_Number:1)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<OrderCode>"; [ORDERS:24]Order_Code:3)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<OrderNo>"; [ORDERS:24]Order_Code:3)
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<PurchaseOrderNo>"; [PURCHASE_ORDERS:57]Purchase_Order_Number:2)  //Tue, Mar 13, 2007 balinderwalia: added
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<PurchaseInvoiceNo>"; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)  //Tue, Mar 13, 2007 balinderwalia: added
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<PurchasesCode>"; [PURCHASE_INVOICES:37]Purchase_Code:1)  //Tue, Mar 13, 2007 balinderwalia: added
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "<PurchaseCode>"; [PURCHASE_INVOICES:37]Purchase_Code:1)  //Tue, Mar 13, 2007 balinderwalia: added
$_t_DocumentName:=Replace string:C233($_t_DocumentName; "/"; "_")
$_t_DocumentName:=Replace string:C233($_t_DocumentName; ""; "_")

If (Length:C16($_t_DocumentName)>80)
	$_t_DocumentName:=Substring:C12($_t_DocumentName; 1; 80)
End if 

$0:=$_t_DocumentName
ERR_MethodTrackerReturn("Doc_preferencesFileNameGet"; $_t_oldMethodName)