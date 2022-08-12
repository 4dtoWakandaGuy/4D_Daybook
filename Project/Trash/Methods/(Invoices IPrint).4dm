//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices IPrint
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/02/2010 23:00
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_RemEmailAddress; 0)
	ARRAY TEXT:C222($_at_RemInvoice; 0)
	//ARRAY TEXT(RPT_at_GenTypeOptions;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol1Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol2Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol3Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol4Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelGenType;0)
	//ARRAY TEXT(RPT_at_GenTypeSelRecCode;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_InvoiceDTSuperReportFoundOK; $_bo_InvoiceSuperReportFoundOK; $_bo_SuperReportFoundOK; $_bo_UserCancel; PRT_bo_AskPerIteration; PRT_bo_AutoIteration; PRT_bo_ToPdf; PRT_bo_ToScreenPreview; RPT_bo_OverrideEmailScreen; SR_bo_Validated)
	C_DATE:C307(vInvDate)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_NewSizeOfArray; $_l_NumAsk; $_l_NumEmailOnly; $_l_NumPrintAndEmail; $_l_NumPrintOnly; $_l_RecordsInSelection; $_l_WhereFound; PRT_Count; RPT_l_btnGenTypeSelCancel)
	C_LONGINT:C283(RPT_l_btnGenTypeSelContinue; RPT_l_btnGenTypeSelToggleAll; xCancel; xNext; xOK)
	C_TEXT:C284($_t_CurrentSuperReportCode; $_T_EmailAddress; $_T_GenerationType; $_t_InvoiceDTSRCode; $_t_InvoiceSRCode; $_t_InvoiceTitle; $_T_Message; $_t_oldMethodName; $_t_PreviousInvoiceCompanyCode; $_t_PreviousSuperReportCode; $_t_WindowTitle)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PRT_t_pdfOutputFilePath; RPT_T_GenTypeSelFooter; RPT_t_GenTypeSelGenTypeHead; RPT_T_GenTypeSelHeader; RPT_T_GenTypeSelHeader1; RPT_T_GenTypeSelHeader2; RPT_T_GenTypeSelHeader3; RPT_T_GenTypeSelHeader4)
	C_TEXT:C284(RPT_T_GenTypeSelMainHeading)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices IPrint")
//Project Method Invoices IPrint /3/2(ID-14117-7452)
//Invoices IPrint
SR_bo_Validated:=False:C215
//If ((◊BarMod#12) & (Not((DB_GetModuleSetting(23)>1) & (DB_GetModuleSetting(Module_SalesOrders)<2))))
//  Gen_Confirm ("Print Delivery Notes?";"Yes";"No")
//  If (OK=1)
//   OUTPUT LAYOUT([INVOICES];"Delivery Note")
//  PRINT SELECTION([INVOICES])
//End if
//End if


//kmw 21/11/08 v631b120i -Added "***best guess explanatory note***" comments in order to try to help me make sense of what it is doing - shouldn't be considered definitive comments for original programmers intentions

//**************************************** Added v631b120l 12/12/08 -kmw ******************************
//(Looked like it was printing/emailing all Invoices_In output screen...
//... rather than just those selecetd so doin gthis just in case.
//... If none selected will assume user wants to apply to all.
//... Sets the curren selection back at the end of this method)
//CREATE SET([INVOICES];"RemOnScreenInvoices")
//USE SET("UserSet")
//If (Records in selection([INVOICES])=0)
//USE SET("RemOnScreenInvoices")
//End if
//**********************************************************************************************************
$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
Gen_Confirm("Do you want to print the Invoice"+("s"*(Num:C11($_l_RecordsInSelection#1)))+" / Credit Note"+("s"*(Num:C11($_l_RecordsInSelection#1)))+"?"; "Yes"; "No")
If (OK=1)
	FIRST RECORD:C50([INVOICES:39])
	
	
	
	//***best guess explanatory note*** Begin actual invoice batch printing code  -kmw 21/11/08 v631b120i
	
	OK:=1
	DB_t_CurrentFormUsage:="Invoice"
	
	
	//***best guess explanatory note*** Remember entire invoice selection  -kmw 21/11/08 v631b120i
	COPY NAMED SELECTION:C331([INVOICES:39]; "$Sel")
	CREATE SET:C116([INVOICES:39]; "IMaster")
	
	
	
	// loop though all invoices - order by company ...and get company prefs (speed up by not reloading pref is invoice comp same as prev) s to generate 3 sets
	
	//3 sets
	
	//ask -do this first thin bung them in the papproiate set.....now have only 2 sets - ideally it woul dhave a way of providing the ask info for each invoice on  a single screen)
	
	//if (any email ones - then ask "review each email or sent automatically?") - proivde some way of editing email prior to quiet send to multiple people.
	
	
	//(for i=1 to 2 thorugh each set)
	
	//email (contains union of "email only" & "print and email") - set 1
	
	//print  (contains union of "print only" & "print and email") - set 2
	
	//******************************************************************  `Added 21/11/08 v631b120i -kmw *********************************************************************
	$_t_InvoiceSRCode:=""
	$_bo_InvoiceSuperReportFoundOK:=(Form_SRProOK("Invoice"+" Email"; [INVOICES:39]Analysis_Code:17))
	If (Records in selection:C76([DOCUMENTS:7])=0) | ($_bo_InvoiceSuperReportFoundOK=False:C215)
		
		$_bo_InvoiceSuperReportFoundOK:=(Form_SRProOK("Invoice"; [INVOICES:39]Analysis_Code:17))
		
	End if 
	$_t_InvoiceSRCode:=[DOCUMENTS:7]Document_Code:1
	$_t_InvoiceDTSRCode:=""
	$_bo_InvoiceDTSuperReportFoundOK:=(Form_SRProOK("Invoice DT"+" Email"; [INVOICES:39]Analysis_Code:17))
	If (Records in selection:C76([DOCUMENTS:7])=0) | ($_bo_InvoiceDTSuperReportFoundOK=False:C215)
		
		$_bo_InvoiceDTSuperReportFoundOK:=(Form_SRProOK("Invoice DT"; [INVOICES:39]Analysis_Code:17))
		
	End if 
	
	$_t_InvoiceDTSRCode:=[DOCUMENTS:7]Document_Code:1
	CREATE EMPTY SET:C140([INVOICES:39]; "RPT_GENERATE_ASK")
	CREATE EMPTY SET:C140([INVOICES:39]; "RPT_GENERATE_EMAIL")
	CREATE EMPTY SET:C140([INVOICES:39]; "RPT_GENERATE_PRINT")
	CREATE EMPTY SET:C140([INVOICES:39]; "RPT_GENERATE_BOTH")
	ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2)
	FIRST RECORD:C50([INVOICES:39])
	$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
	//loop through invoices and create base sets based strictly on report options
	
	ARRAY TEXT:C222($_at_RemInvoice; 0)
	ARRAY TEXT:C222($_at_RemEmailAddress; 0)
	
	
	//track number of each setting type instead of just looking at number in set because later on we start mixing these sets together to end up with a simple set of print and a simple set of email.....this way we can still recall the original setting
	$_l_NumPrintOnly:=0
	$_l_NumEmailOnly:=0
	$_l_NumPrintAndEmail:=0
	$_l_NumAsk:=0
	
	
	//OPEN_AUTOTHERM ("Gathering print preferences...";300;True)  `added kmw 02/03/09 v631b120o
	OPEN_AUTOTHERM("Gathering print preferences..."; 300; True:C214; True:C214)  //disallow auto close kmw 03/03/09 v631b120o
	
	
	//******************************************
	// -KMW 03/03/09 v631b120o - This block moved to prior to for loop as unneccessary to keep doing this and also caused blank  email addresses where it was meant to be unchanged
	$_T_EmailAddress:=""
	$_T_GenerationType:=""
	//******************************************
	
	For ($_l_Index; 1; $_l_RecordsInSelection)
		
		SET_AUTOTHERM("Gathering print preferences for "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsInSelection)+" invoices..."; $_l_Index; $_l_RecordsInSelection)  //Added -kmw 02/03/09 v631b120o
		
		
		If (([INVOICES:39]Delivery_Company:30#"") | ([INVOICES:39]Deliver_To:32#"") | ([INVOICES:39]x_DeliveryAddressID:48>0))
			$_bo_SuperReportFoundOK:=$_bo_InvoiceDTSuperReportFoundOK
			$_t_CurrentSuperReportCode:=$_t_InvoiceDTSRCode
		Else 
			$_bo_SuperReportFoundOK:=$_bo_InvoiceSuperReportFoundOK
			$_t_CurrentSuperReportCode:=$_t_InvoiceSRCode
		End if 
		
		//******************************************
		// -KMW 03/03/09 v631b120o - This block moved to prior to for loop as unneccessary to keep doing this and also caused blank  email addresses where it was meant to be unchanged
		//C_TEXT($_T_GenerationType)
		//C_TEXT($_T_EmailAddress)
		//$_T_EmailAddress:=""
		//$_T_GenerationType:=""
		//******************************************
		
		If ([COMPANIES:2]Company_Code:1#[INVOICES:39]Company_Code:2)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INVOICES:39]Company_Code:2)
		End if 
		If ($_bo_SuperReportFoundOK)
			If ($_l_Index=1)
				//Reports_PrefsGet (->$_T_GenerationType;->$_T_EmailAddress;[INVOICES]Company Code;[DOCUMENTS]LDocument_Code)
				Reports_PrefsGet(->$_T_GenerationType; ->$_T_EmailAddress; [INVOICES:39]Company_Code:2; $_t_CurrentSuperReportCode)  //kmw 03/03/09 v631b120o - Changed to use "$_t_CurrentSuperReportCode"
			Else 
				If ([INVOICES:39]Company_Code:2#$_t_PreviousInvoiceCompanyCode) | ($_t_CurrentSuperReportCode#$_t_PreviousSuperReportCode)
					//Reports_PrefsGet (->$_T_GenerationType;->$_T_EmailAddress;[INVOICES]Company Code;[DOCUMENTS]LDocument_Code)
					Reports_PrefsGet(->$_T_GenerationType; ->$_T_EmailAddress; [INVOICES:39]Company_Code:2; $_t_CurrentSuperReportCode)  //kmw 03/03/09 v631b120o - Changed to use "$_t_CurrentSuperReportCode"
				Else 
					//no need to re-load the pref as it will be the same
				End if 
			End if 
			If ($_T_EmailAddress="")
				//TRACE
			End if 
		Else 
			//Eventually could call some kind of ReportsIn_PrefsGet (internal version of new report options functionality)
			$_T_GenerationType:="Print"  //Currently we simply enforce print only for internal reports
		End if 
		
		//For every invoice, remember email address that would get used if it was emailed - even if that is simply blank
		
		$_l_NewSizeOfArray:=Size of array:C274($_at_RemInvoice)+1
		INSERT IN ARRAY:C227($_at_RemInvoice; $_l_NewSizeOfArray)
		INSERT IN ARRAY:C227($_at_RemEmailAddress; $_l_NewSizeOfArray)
		$_at_RemInvoice{$_l_NewSizeOfArray}:=[INVOICES:39]Invoice_Number:1
		$_at_RemEmailAddress{$_l_NewSizeOfArray}:=$_T_EmailAddress
		
		
		
		Case of 
			: ($_T_GenerationType="Print")
				ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_PRINT")
				$_l_NumPrintOnly:=$_l_NumPrintOnly+1
			: ($_T_GenerationType="Email")
				ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_EMAIL")
				$_l_NumEmailOnly:=$_l_NumEmailOnly+1
			: ($_T_GenerationType="Print AND Email")
				ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_BOTH")
				$_l_NumPrintAndEmail:=$_l_NumPrintAndEmail+1
			: ($_T_GenerationType="Ask user at the time report generated.")
				ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_ASK")
				$_l_NumAsk:=$_l_NumAsk+1
			Else   //shouldn't happen
				ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_ASK")
				$_l_NumAsk:=$_l_NumAsk+1
		End case 
		$_t_PreviousSuperReportCode:=$_t_CurrentSuperReportCode
		$_t_PreviousInvoiceCompanyCode:=[INVOICES:39]Company_Code:2
		NEXT RECORD:C51([INVOICES:39])
	End for 
	
	
	CLOSE_AUTOTHERM  //Added -kmw 02/03/09 v631b120o
	
	
	//put "both" set into both the email and print
	UNION:C120("RPT_GENERATE_EMAIL"; "RPT_GENERATE_BOTH"; "RPT_GENERATE_EMAIL")  //union email and both into email (email now contains any invoice that should be emailed)
	UNION:C120("RPT_GENERATE_PRINT"; "RPT_GENERATE_BOTH"; "RPT_GENERATE_PRINT")  //union print and both into print (print now contains any invoice that should be printed)
	
	
	
	
	//ask about  "ask" set and put each one into either email or print depending on result of ask
	USE SET:C118("RPT_GENERATE_ASK")
	
	//*************** begin if any of the invoices were set (via company or report) to ASK at time of printing *************
	
	$_bo_UserCancel:=False:C215  //added v631b120p 13/03/09 -kmw
	
	If (Records in selection:C76([INVOICES:39])>0)
		ORDER BY:C49([INVOICES:39]; [COMPANIES:2]Company_Name:2)
		FIRST RECORD:C50([INVOICES:39])
		
		//init arrays to zero in case this has been run before in same process
		ARRAY TEXT:C222(RPT_at_GenTypeSelRecCode; 0)
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol1Desc; 0)
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol2Desc; 0)
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol3Desc; 0)
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol4Desc; 0)
		ARRAY TEXT:C222(RPT_at_GenTypeSelGenType; 0)
		
		$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
		
		SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; RPT_at_GenTypeSelRecCode)
		
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol1Desc; $_l_RecordsInSelection)
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol2Desc; $_l_RecordsInSelection)
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol3Desc; $_l_RecordsInSelection)
		ARRAY TEXT:C222(RPT_at_GenTypeSelCol4Desc; $_l_RecordsInSelection)
		ARRAY TEXT:C222(RPT_at_GenTypeSelGenType; $_l_RecordsInSelection)
		
		ORDER BY:C49([INVOICES:39]; [COMPANIES:2]Company_Name:2)
		FIRST RECORD:C50([INVOICES:39])
		
		
		//OPEN_AUTOTHERM ("Preparing Report Options...";300;True)  `Added kmw 02/03/09 v631b120o
		OPEN_AUTOTHERM("Preparing Report Options..."; 300; True:C214; True:C214)  //disallow auto close kmw 03/03/09 v631b120o
		
		For ($_l_Index; 1; $_l_RecordsInSelection)
			
			SET_AUTOTHERM("Preparing Report Options for "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsInSelection)+" invoices..."; $_l_Index; $_l_RecordsInSelection)  //Added -kmw 02/03/09 v631b120o
			If ([COMPANIES:2]Company_Code:1#[INVOICES:39]Company_Code:2)
				QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[INVOICES:39]Company_Code:2)
			End if 
			RPT_at_GenTypeSelCol1Desc{$_l_Index}:=[COMPANIES:2]Company_Name:2
			RPT_at_GenTypeSelCol2Desc{$_l_Index}:=String:C10([INVOICES:39]Total_Invoiced:5; "|Accounts")
			RPT_at_GenTypeSelCol3Desc{$_l_Index}:=String:C10([INVOICES:39]Due_Date:18; Internal date short:K1:7)
			$_l_WhereFound:=Find in array:C230($_at_RemInvoice; [INVOICES:39]Invoice_Number:1)
			If ($_l_WhereFound>0)  //Should be!
				RPT_at_GenTypeSelCol4Desc{$_l_Index}:=$_at_RemEmailAddress{$_l_WhereFound}
			Else 
				RPT_at_GenTypeSelCol4Desc{$_l_Index}:=""
			End if 
			RPT_at_GenTypeSelGenType{$_l_Index}:="Email"
			
			//RPT_at_GenTypeSelCol1Desc{$_l_Index}:="Some Company ltd"
			//RPT_at_GenTypeSelCol4Desc{$_l_Index}:="someaddress@somecompany.com"
			
			NEXT RECORD:C51([INVOICES:39])
		End for 
		
		CLOSE_AUTOTHERM  //Added kmw 02/03/09 v631b120o
		
		
		ARRAY TEXT:C222(RPT_at_GenTypeOptions; 3)
		RPT_at_GenTypeOptions{1}:="Print"
		RPT_at_GenTypeOptions{2}:="Email"
		RPT_at_GenTypeOptions{3}:="Print AND Email"
		
		RPT_T_GenTypeSelHeader:="Invoice No."
		RPT_T_GenTypeSelHeader1:="Company Name"
		RPT_T_GenTypeSelHeader2:="Total Amount"
		RPT_T_GenTypeSelHeader3:="Due Date"
		RPT_T_GenTypeSelHeader4:="Address used if emailed"
		
		RPT_t_GenTypeSelGenTypeHead:="Generate As"
		
		RPT_T_GenTypeSelMainHeading:="Click on 'Generate As' column to alter how individual invoice reports should be g"+"enera"+"ted, or click 'Toggle All' to change them all at once."+".."
		
		
		Case of 
			: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
				RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" Invoices_Listed above, "+String:C10($_l_NumPrintOnly)+" other invoices will be printed, "+String:C10($_l_NumEmailOnly)+" other invoices will be emailed and "+String:C10($_l_NumPrintAndEmail)+" other invoices will be printed and emailed.)"
			: ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
				RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" Invoices_Listed above, "+String:C10($_l_NumEmailOnly)+" other invoices will be emailed and "+String:C10($_l_NumPrintAndEmail)+" other invoices will be printed and emailed.)"
			: ($_l_NumPrintOnly>0) & ($_l_NumPrintAndEmail>0)
				RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" Invoices_Listed above, "+String:C10($_l_NumPrintOnly)+" other invoices will be printed and "+String:C10($_l_NumEmailOnly)+" other invoices will be printed and emailed.)"
			: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0)
				RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" Invoices_Listed above, "+String:C10($_l_NumPrintOnly)+" other invoices will be printed and "+String:C10($_l_NumEmailOnly)+" other invoices will be emailed.)"
			: ($_l_NumPrintOnly>0)
				RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" Invoices_Listed above, "+String:C10($_l_NumPrintOnly)+" other invoices will be printed.)"
			: ($_l_NumEmailOnly>0)
				RPT_T_GenTypeSelFooter:="(NOTE: In addition to the "+String:C10($_l_NumAsk)+" Invoices_Listed above, "+String:C10($_l_NumEmailOnly)+" other invoices will be emailed.)"
				
			Else 
				RPT_T_GenTypeSelFooter:=""
		End case 
		
		RPT_l_btnGenTypeSelContinue:=0  //added v631b120p 13/03/09 -kmw
		RPT_l_btnGenTypeSelCancel:=0  //added v631b120p 13/03/09 -kmw
		RPT_l_btnGenTypeSelToggleAll:=0  //added v631b120p 13/03/09 -kmw
		
		DIALOG:C40([USER:15]; "RPT_BatchGenerateSelect")
		CLOSE WINDOW:C154  //added 27/11/08 v631b120i -kmw
		
		If (RPT_l_btnGenTypeSelContinue=1)  //added v631b120p 13/03/09 -kmw
			
			$_l_RecordsInSelection:=Size of array:C274(RPT_at_GenTypeSelRecCode)
			
			For ($_l_Index; 1; $_l_RecordsInSelection)
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=RPT_at_GenTypeSelRecCode{$_l_Index})
				Case of 
					: (RPT_at_GenTypeSelGenType{$_l_Index}="Print")
						ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_PRINT")
						$_l_NumPrintOnly:=$_l_NumPrintOnly+1
						
					: (RPT_at_GenTypeSelGenType{$_l_Index}="Email")
						ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_EMAIL")
						$_l_NumEmailOnly:=$_l_NumEmailOnly+1
						
					: (RPT_at_GenTypeSelGenType{$_l_Index}="Print AND Email")
						ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_PRINT")
						ADD TO SET:C119([INVOICES:39]; "RPT_GENERATE_EMAIL")
						$_l_NumPrintAndEmail:=$_l_NumPrintAndEmail+1
						
					Else 
						//shouldn't happen
				End case 
			End for 
		Else   //added v631b120p 13/03/09 -kmw
			$_bo_UserCancel:=True:C214  //added v631b120p 13/03/09 -kmw
		End if   //added v631b120p 13/03/09 -kmw
		
	End if 
	//*************** end if any of the invoices were set (via company or report) to ASK at time of printing *************
	
	//************************************************************************************************************************************************************
	
	If ($_bo_UserCancel=False:C215)  //added v631b120p 13/03/09 -kmw
		//$NumInvoicesToEmail:=Records in set("RPT_GENERATE_EMAIL")
		//$NumInvoicesToPrint:=Records in set("RPT_GENERATE_PRINT")
		
		//Display message about how many invoices will be printed or emailed etc and if any emails ask user if they wish to review each one or just send.
		RPT_bo_OverrideEmailScreen:=False:C215
		Case of 
			: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
				xCancel:=0
				xOK:=0
				$_T_Message:=String:C10($_l_NumPrintOnly)+" invoices will be printed."
				$_T_Message:=$_T_Message+" "+String:C10($_l_NumEmailOnly)+" invoices will be emailed."
				$_T_Message:=$_T_Message+" "+String:C10($_l_NumPrintAndEmail)+" invoices will be printed and emailed."
				$_T_Message:=$_T_Message+Char:C90(13)
				$_T_Message:=$_T_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
				Gen_Confirm($_T_Message; "Review"; "Just Send")
				RPT_bo_OverrideEmailScreen:=(xCancel=1)
				
			: ($_l_NumPrintOnly>0) & ($_l_NumEmailOnly>0)
				xCancel:=0
				xOK:=0
				$_T_Message:=String:C10($_l_NumPrintOnly)+" invoices will be printed."
				$_T_Message:=$_T_Message+" "+String:C10($_l_NumEmailOnly)+" invoices will be emailed."
				$_T_Message:=$_T_Message+Char:C90(13)
				$_T_Message:=$_T_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
				Gen_Confirm($_T_Message; "Review"; "Just Send")
				RPT_bo_OverrideEmailScreen:=(xCancel=1)
				
			: ($_l_NumPrintOnly>0) & ($_l_NumPrintAndEmail>0)
				xCancel:=0
				xOK:=0
				$_T_Message:=String:C10($_l_NumPrintOnly)+" invoices will be printed."
				$_T_Message:=$_T_Message+" "+String:C10($_l_NumPrintAndEmail)+" invoices will be printed and emailed."
				$_T_Message:=$_T_Message+Char:C90(13)
				$_T_Message:=$_T_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
				Gen_Confirm($_T_Message; "Review"; "Just Send")
				RPT_bo_OverrideEmailScreen:=(xCancel=1)
				
			: ($_l_NumEmailOnly>0) & ($_l_NumPrintAndEmail>0)
				xCancel:=0
				xOK:=0
				$_T_Message:=String:C10($_l_NumEmailOnly)+" invoices will be emailed."
				$_T_Message:=$_T_Message+" "+String:C10($_l_NumPrintAndEmail)+" invoices will be printed and emailed."
				$_T_Message:=$_T_Message+Char:C90(13)
				$_T_Message:=$_T_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
				Gen_Confirm($_T_Message; "Review"; "Just Send")
				RPT_bo_OverrideEmailScreen:=(xCancel=1)
				
			: ($_l_NumPrintOnly>0)
				$_T_Message:=String:C10($_l_NumPrintOnly)+" invoices will be printed."
				Gen_Alert($_T_Message)
				
			: ($_l_NumEmailOnly>0)
				xCancel:=0
				xOK:=0
				$_T_Message:=String:C10($_l_NumEmailOnly)+" invoices will be emailed."
				$_T_Message:=$_T_Message+Char:C90(13)
				$_T_Message:=$_T_Message+Char:C90(13)+"Do you want to review each email prior to sending it?"
				Gen_Confirm($_T_Message; "Review"; "Just Send")
				RPT_bo_OverrideEmailScreen:=(xCancel=1)
			Else 
				//shouldn't happen!!!
		End case 
		
		$_T_GenerationType:=""
		
		//C_BOOLEAN(RPT_bo_OverrideUsingRPTOption)
		//RPT_bo_OverrideUsingRPTOption:=True
		
		For ($_l_Index2; 1; 2)  //Added 21/11/08 v631b120i -kmw
			
			//TRACE
			
			Case of 
				: ($_l_Index2=1)
					USE SET:C118("RPT_GENERATE_PRINT")
					ORDER BY:C49([INVOICES:39]; [COMPANIES:2]Company_Name:2)
					$_T_GenerationType:="PRINT"
					
				: ($_l_Index2=2)
					USE SET:C118("RPT_GENERATE_EMAIL")
					ORDER BY:C49([INVOICES:39]; [COMPANIES:2]Company_Name:2)
					$_T_GenerationType:="EMAIL"
					
				Else   //shouldn't currently happen!
					$_T_GenerationType:="Ask user at the time report generated."
					REDUCE SELECTION:C351([INVOICES:39]; 0)
			End case 
			
			
			//CLEAR NAMED SELECTION("$Sel")
			If (OK=1)
				If (Records in selection:C76([INVOICES:39])>0)
					If (False:C215)
						Gen_PPMulti(->[INVOICES:39]; "Form"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice"; [INVOICES:39]Analysis_Code:17)
					Else 
						//***best guess explanatory note*** looks like Gen_PPMulti must have acted like Gen_PPSingle (in its limittations with sub-fomrs - see notes in Gen_PPSingle_2) so seems here that Gen_PPSingle_2 has manually been used as a multi report generator   -kmw 21/11/08 v631b120i
						
						//******************************************************** Added  kmw 02/03/09 v631b120o ********************************************************
						Case of 
							: ($_T_GenerationType="PRINT")
								OPEN_THERMOMETER("Printing Invoices..."; True:C214; True:C214)
							: ($_T_GenerationType="EMAIL")
								OPEN_THERMOMETER("Emailing Invoices..."; True:C214; True:C214)
							Else   //shouldn't happen at this stage
								OPEN_THERMOMETER("Generating Invoices..."; True:C214; True:C214)
						End case 
						//****************************************************************************************************************************************************************
						
						
						FIRST RECORD:C50([INVOICES:39])
						PRT_Count:=Records in selection:C76([INVOICES:39])
						PRT_bo_ToScreenPreview:=False:C215
						PRT_bo_ToPdf:=False:C215
						PRT_bo_AskPerIteration:=False:C215
						PRT_bo_AutoIteration:=False:C215
						PRT_t_pdfOutputFilePath:=""
						$_t_WindowTitle:=Get window title:C450
						For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
							$_t_InvoiceTitle:=[INVOICES:39]Invoice_Number:1
							
							$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; ":"; "")
							$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "/"; "_")
							$_t_InvoiceTitle:=Replace string:C233($_t_InvoiceTitle; "\\"; "_")
							
							SET WINDOW TITLE:C213($_t_InvoiceTitle)
							
							//******************************************************** Added  kmw 02/03/09 v631b120o ********************************************************
							Case of 
								: ($_T_GenerationType="PRINT")
									SET_THERMOMETER("Printing "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsInSelection)+" invoices..."; (($_l_Index*100)\$_l_RecordsInSelection))
									
								: ($_T_GenerationType="EMAIL")
									SET_THERMOMETER("Emailing "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsInSelection)+" invoices..."; (($_l_Index*100)\$_l_RecordsInSelection))
								Else   //shouldn't happen at this stage
									SET_THERMOMETER("Generating "+String:C10($_l_Index)+" of "+String:C10($_l_RecordsInSelection)+" invoices..."; (($_l_Index*100)\$_l_RecordsInSelection))
									
							End case 
							//****************************************************************************************************************************************************************
							
							
							If (([INVOICES:39]Delivery_Company:30#"") | ([INVOICES:39]Deliver_To:32#"") | ([INVOICES:39]x_DeliveryAddressID:48>0))
								
								$_l_WhereFound:=Find in array:C230($_at_RemInvoice; [INVOICES:39]Invoice_Number:1)
								If ($_l_WhereFound>0)
									$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form DT2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice DT"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice DT"; [INVOICES:39]Analysis_Code:17; False:C215; $_l_Index; $_T_GenerationType; $_at_RemEmailAddress{$_l_WhereFound})
								Else 
									$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form DT2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice DT"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice DT"; [INVOICES:39]Analysis_Code:17; False:C215; $_l_Index)
								End if 
								
							Else 
								$_l_WhereFound:=Find in array:C230($_at_RemInvoice; [INVOICES:39]Invoice_Number:1)
								If ($_l_WhereFound>0)
									$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice"; [INVOICES:39]Analysis_Code:17; False:C215; $_l_Index; $_T_GenerationType; $_at_RemEmailAddress{$_l_WhereFound})
								Else 
									$_bo_Continue:=Gen_PPSingle_2(->[INVOICES:39]; ->[INVOICES_ITEMS:161]; "Form2"; "INVFormSub2"; "Invoices Out"; DB_t_CurrentFormUsage; "Invoice"; "Invoices_FormL2"; 0; ->[INVOICES:39]State:10; "Invoice"; [INVOICES:39]Analysis_Code:17; False:C215; $_l_Index)
								End if 
							End if 
							NEXT RECORD:C51([INVOICES:39])
							If ($_bo_Continue=False:C215)
								$_l_Index:=Records in selection:C76([INVOICES:39])
							End if 
						End for 
						SET WINDOW TITLE:C213($_t_WindowTitle)
						
						CLOSE_THERMOMETER  //Added  kmw 02/03/09 v631b120o
						
					End if 
				End if 
				//TRACE
				If (OK=1)
					USE SET:C118("IMaster")
					QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=0)
					$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
					If ($_l_RecordsInSelection>0)
						
						xNext:=0
						If (DB_GetLedgerINVAllowUnproc)
							If ($_l_RecordsInSelection=1)
								Gen_Confirm3("Was the Invoice printed OK?  Post it now or Batch it?"; "Post it"; "Cancel"; "Batch it")
							Else 
								Gen_Confirm3("Were the Invoices printed OK?  Post them now or Batch them?"; "Post them"; "Cancel"; "Batch them")
							End if 
						Else 
							If ($_l_RecordsInSelection=1)
								Gen_Confirm("Post the Invoice now or Batch it?"; "Post it"; "Batch it")
							Else 
								Gen_Confirm("Post the Invoices now or Batch them?"; "Post them"; "Batch them")
							End if 
							If (OK=0)
								xNext:=1
								OK:=1
							End if 
						End if 
						
						If (OK=1) | (xNext=1)
							If (xNext=1)
								FIRST RECORD:C50([INVOICES:39])
								While (Not:C34(End selection:C36([INVOICES:39])))
									[INVOICES:39]State:10:=1
									DB_SaveRecord(->[INVOICES:39])
									NEXT RECORD:C51([INVOICES:39])
								End while 
								FIRST RECORD:C50([INVOICES:39])
								Invoices_InLPSt
							Else 
								DB_t_CurrentFormUsage2:="NR"
								FIRST RECORD:C50([INVOICES:39])
								While (Not:C34(End selection:C36([INVOICES:39])))
									vInvDate:=[INVOICES:39]Invoice_Date:4
									Inv_InvCalc
									Inv_InvPost
									NEXT RECORD:C51([INVOICES:39])
								End while 
								FIRST RECORD:C50([INVOICES:39])
								Invoices_InLPSt
							End if 
						End if 
					End if 
				End if 
				
			End if 
			
		End for 
		
		
		//RPT_bo_OverrideUsingRPTOption:=False
		RPT_bo_OverrideEmailScreen:=False:C215
		
	Else   //added v631b120p 13/03/09 -kmw
		//do nothing  (user cancel)  v631b120p 13/03/09 -kmw
	End if   //added v631b120p 13/03/09 -kmw
	
	
Else 
	If (DB_GetLedgerINVAllownoPrint)  //& (◊InvUnproc=False))
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10=0)
		$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
		If ($_l_RecordsInSelection>0)
			If ($_l_RecordsInSelection=1)
				Gen_Confirm3("Are you ready to post the Invoice?"; "Post it"; "Cancel"; "Batch it")
			Else 
				Gen_Confirm3("Are you ready to post the Invoices?"; "Post them"; "Cancel"; "Batch them")
			End if 
			If (OK=1) | (xNext=1)
				If (xNext=1)
					FIRST RECORD:C50([INVOICES:39])
					While (Not:C34(End selection:C36([INVOICES:39])))
						[INVOICES:39]State:10:=1
						DB_SaveRecord(->[INVOICES:39])
						NEXT RECORD:C51([INVOICES:39])
					End while 
					FIRST RECORD:C50([INVOICES:39])
					Invoices_InLPSt
				Else 
					DB_t_CurrentFormUsage2:="NR"
					FIRST RECORD:C50([INVOICES:39])
					While (Not:C34(End selection:C36([INVOICES:39])))
						vInvDate:=[INVOICES:39]Invoice_Date:4
						Inv_InvCalc
						Inv_InvPost
						NEXT RECORD:C51([INVOICES:39])
					End while 
					FIRST RECORD:C50([INVOICES:39])
					Invoices_InLPSt
				End if 
			End if 
		End if 
	End if 
End if 
//OUTPUT FORM([INVOICES];"Invoices Out")

//USE SET("RemOnScreenInvoices")  `Added v631b120l 12/12/08 -kmw (revert back to original selection -see new notes near top of this method)
ERR_MethodTrackerReturn("Invoices IPrint"; $_t_oldMethodName)
