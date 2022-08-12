//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_Imp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:14
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>MultiCo; $_bo_Create; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Create; $_l_CurrentProcess; $_l_ImportCount; $_l_SearchType; $_l_WindowReferenceRow; r1; vAct1; vAdd; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>DefRole; $_t_AddressLine; $_t_AddressLine1; $_t_AddressLine2; $_t_AddressType; $_t_AlsoKnownAs; $_t_AutoPay; $_t_Comments; $_t_Company; $_t_CompanyArea; $_t_CompanyCounty)
	C_TEXT:C284($_t_CompanyFax; $_t_CompanyFurthers; $_t_CompanySalesPerson; $_t_CompanyStatus; $_t_CompanyTakenBy; $_t_CompanyTelephone; $_t_CompanyTown; $_t_CompanyType; $_t_CompanyValue; $_t_ContactCode; $_t_ContactFurthers)
	C_TEXT:C284($_t_ContactSalesPerson; $_t_ContactSource; $_t_ContactStatus; $_t_ContactType; $_t_Country; $_t_CurrencyCode; $_t_DefaultLayer; $_t_DefaultStage; $_t_DefaultTax; $_t_Department; $_t_EmailAfterAt)
	C_TEXT:C284($_t_Employees; $_t_Esquire; $_t_Extension; $_t_FactorNumber; $_t_FaxNumber; $_t_FieldEndChar; $_t_FinancialYear; $_t_ForeName; $_t_Forename2; $_t_FS; $_t_Further)
	C_TEXT:C284($_t_InboundMailSort; $_t_InvoiceAddress1; $_t_InvoiceAddress2; $_t_InvoiceCompany; $_t_InvoiceCountry; $_t_InvoiceCounty; $_t_InvoiceDeparment; $_t_InvoicePostCode; $_t_InvoiceTown; $_t_JobTitle; $_t_Mobile)
	C_TEXT:C284($_t_ModifiedDate; $_t_ModifiedDateString; $_t_oldMethodName; $_t_Omit; $_t_OutboundMailSort; $_t_ParentCompanyCode; $_t_Plural; $_t_PostCode; $_t_Private; $_t_PurchaseCredit; $_t_PurchaseDeliveryMethod)
	C_TEXT:C284($_t_PurchasePriceGroup; $_t_PurchaseTerms; $_t_Qualifications; $_t_RecordNumber; $_t_Role; $_t_SalesCredit; $_t_SalesDeliveryMethod; $_t_Salutation; $_t_Singular; $_t_SODefaultTerms; $_t_SOPriceGroup)
	C_TEXT:C284($_t_Source; $_t_StopChar; $_t_Surname; $_t_TaxPrefix; $_t_TaxReg; $_t_TFS; $_t_TheirAccountNumber; $_t_Title; $_t_TS; vCompName; vSource)
	C_TEXT:C284(vSurname; vT; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_Imp")
//Companies General Import
Start_Process
$_l_CurrentProcess:=Current process:C322
Companies_File
vAdd:=1
$_t_Singular:="Company"
$_t_Plural:="Companies"
Gen_Confirm("Have you prepared a file of Company and/or Contact_Details to in the expected,"+" Tab-delimited Text format?"; "Yes"; "No")
Companies_ImpQs
If (OK=1)
	If (vSource="YP@")
		Import_YP
	Else 
		If (vSource="ADL")
			Import_Dealers
		Else 
			If (vSource="GB@")
				Companies_ImpGB
			Else 
				Open_PrD_Window($_t_Plural+" Import: Command-. to Cancel")
				MESSAGE:C88(Char:C90(13))
				REDUCE SELECTION:C351([COMPANIES:2]; 0)
				$_t_StopChar:=Char:C90(13)
				$_t_FieldEndChar:=Char:C90(9)
				$_l_ImportCount:=0
				vText:="sdfsdf"
				
				While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#$_l_CurrentProcess))
					IDLE:C311  // 03/04/03 pb
					RECEIVE PACKET:C104(vText; $_t_StopChar)
					Gen_ImpStrip
					If (Length:C16(vText)>3)
						$_t_RecordNumber:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Title:=First_Field(->vT; $_t_FieldEndChar)
						$_t_ForeName:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Surname:=First_Field(->vT; $_t_FieldEndChar)
						$_t_FS:=First_Field(->vT; $_t_FieldEndChar)
						$_t_TFS:=First_Field(->vT; $_t_FieldEndChar)
						$_t_TS:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Salutation:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Qualifications:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Role:=First_Field(->vT; $_t_FieldEndChar)
						$_t_JobTitle:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Department:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Company:=First_Field(->vT; $_t_FieldEndChar)
						$_t_AddressLine1:=First_Field(->vT; $_t_FieldEndChar)
						$_t_AddressLine2:=First_Field(->vT; $_t_FieldEndChar)
						$_t_CompanyTown:=First_Field(->vT; $_t_FieldEndChar)
						$_t_CompanyCounty:=First_Field(->vT; $_t_FieldEndChar)
						$_t_PostCode:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Country:=First_Field(->vT; $_t_FieldEndChar)
						$_t_CompanyTelephone:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Extension:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Mobile:=First_Field(->vT; $_t_FieldEndChar)
						$_t_CompanyFax:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Employees:=First_Field(->vT; $_t_FieldEndChar)
						$_t_ModifiedDate:=First_Field(->vT; $_t_FieldEndChar)
						$_t_FinancialYear:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Comments:=First_Field(->vT; $_t_FieldEndChar)
						$_t_Private:=First_Field(->vT; $_t_FieldEndChar)
						If (vT#"")
							$_t_CompanyStatus:=First_Field(->vT; $_t_FieldEndChar)
							$_t_CompanyType:=First_Field(->vT; $_t_FieldEndChar)
							$_t_Source:=First_Field(->vT; $_t_FieldEndChar)
							$_t_CompanyArea:=First_Field(->vT; $_t_FieldEndChar)
							$_t_CompanySalesPerson:=First_Field(->vT; $_t_FieldEndChar)
							$_t_CompanyTakenBy:=First_Field(->vT; $_t_FieldEndChar)
							$_t_CompanyFurthers:=First_Field(->vT; $_t_FieldEndChar)
							If (vT#"")
								$_t_Omit:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoiceDeparment:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoiceCompany:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoiceAddress1:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoiceAddress2:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoiceTown:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoiceCounty:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoicePostCode:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InvoiceCountry:=First_Field(->vT; $_t_FieldEndChar)
								$_t_CompanyValue:=First_Field(->vT; $_t_FieldEndChar)
								$_t_AlsoKnownAs:=First_Field(->vT; $_t_FieldEndChar)
								$_t_ParentCompanyCode:=First_Field(->vT; $_t_FieldEndChar)
								$_t_SalesCredit:=First_Field(->vT; $_t_FieldEndChar)
								$_t_PurchaseCredit:=First_Field(->vT; $_t_FieldEndChar)
								$_t_TaxPrefix:=First_Field(->vT; $_t_FieldEndChar)
								$_t_TaxReg:=First_Field(->vT; $_t_FieldEndChar)
								$_t_SODefaultTerms:=First_Field(->vT; $_t_FieldEndChar)
								$_t_DefaultTax:=First_Field(->vT; $_t_FieldEndChar)
								$_t_DefaultStage:=First_Field(->vT; $_t_FieldEndChar)
								$_t_SOPriceGroup:=First_Field(->vT; $_t_FieldEndChar)
								$_t_DefaultLayer:=First_Field(->vT; $_t_FieldEndChar)
								$_t_FactorNumber:=First_Field(->vT; $_t_FieldEndChar)
								$_t_AutoPay:=First_Field(->vT; $_t_FieldEndChar)
								$_t_TheirAccountNumber:=First_Field(->vT; $_t_FieldEndChar)
								$_t_InboundMailSort:=First_Field(->vT; $_t_FieldEndChar)
								$_t_OutboundMailSort:=First_Field(->vT; $_t_FieldEndChar)
								
								If (vT#"")
									$_t_ContactCode:=First_Field(->vT; $_t_FieldEndChar)
									$_t_AddressType:=First_Field(->vT; $_t_FieldEndChar)
									$_t_ContactStatus:=First_Field(->vT; $_t_FieldEndChar)
									$_t_ContactType:=First_Field(->vT; $_t_FieldEndChar)
									$_t_ContactSource:=First_Field(->vT; $_t_FieldEndChar)
									$_t_ContactSalesPerson:=First_Field(->vT; $_t_FieldEndChar)
									$_t_ContactFurthers:=First_Field(->vT; $_t_FieldEndChar)
									$_t_Omit:=First_Field(->vT; $_t_FieldEndChar)
									$_t_Comments:=First_Field(->vT; $_t_FieldEndChar)
									$_t_FaxNumber:=First_Field(->vT; $_t_FieldEndChar)
									$_t_EmailAfterAt:=First_Field(->vT; $_t_FieldEndChar)
									$_t_Esquire:=First_Field(->vT; $_t_FieldEndChar)
									$_t_ModifiedDateString:=First_Field(->vT; $_t_FieldEndChar)
									
									If (vT#"")
										$_t_PurchaseTerms:=First_Field(->vT; $_t_FieldEndChar)
										$_t_PurchasePriceGroup:=First_Field(->vT; $_t_FieldEndChar)
										If (vT#"")
											$_t_SalesDeliveryMethod:=First_Field(->vT; $_t_FieldEndChar)
											$_t_PurchaseDeliveryMethod:=First_Field(->vT; $_t_FieldEndChar)
											$_t_CurrencyCode:=First_Field(->vT; $_t_FieldEndChar)  //Added 08/01/09, v631b121 -kmw
										End if 
									End if 
								End if 
							End if 
						End if 
						
						$_l_Create:=0
						If ($_t_Surname="")
							If ($_t_FS#"")
								$_t_Surname:=LastWord2($_t_FS)
								$_t_Title:=FirstWord($_t_FS)
								$_t_ForeName:=RemoveTrail2(RemoveLead(Substring:C12($_t_FS; Length:C16($_t_Title)+2; Length:C16($_t_FS)-Length:C16($_t_Title)-Length:C16($_t_Surname)-2)))
							End if 
							If ($_t_TS#"")
								$_t_Surname:=LastWord2($_t_TS)
								$_t_Title:=FirstWord($_t_TS)
							End if 
							If ($_t_TFS#"")
								$_t_Surname:=LastWord2($_t_TFS)
								$_t_ForeName:=FirstWord($_t_TFS)
							End if 
						End if 
						
						If (($_t_Company#"Company Name") & ($_t_Company#"Company"))
							$_l_ImportCount:=$_l_ImportCount+1
							If ($_t_Surname="")
								MESSAGE:C88("  "+String:C10($_l_ImportCount)+"  "+$_t_Company+"  "+$_t_JobTitle+" "+$_t_Department+Char:C90(13))
							Else 
								MESSAGE:C88("  "+String:C10($_l_ImportCount)+"  "+$_t_Company+"  "+$_t_ForeName+" "+$_t_Surname+Char:C90(13))
							End if 
						End if 
						
						If ((($_t_Company#"") | ($_t_RecordNumber#"")) & ($_t_Company#"Company Name") & ($_t_Company#"Company"))
							If ($_t_RecordNumber#"")
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_RecordNumber)
							Else 
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_Company; *)
								QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Town_or_City:5=$_t_CompanyTown)
								If ($_t_AddressLine1#"")
									$_t_AddressLine:=Substring:C12($_t_AddressLine1; 1; 10)+"@"
									QUERY SELECTION:C341([COMPANIES:2]; [COMPANIES:2]Address_Line_one:3=$_t_AddressLine)
								End if 
							End if 
							If (Records in selection:C76([COMPANIES:2])=0)
								CREATE RECORD:C68([COMPANIES:2])
								vCompName:=$_t_Company
								If ($_t_Surname="*SAME")
									vSurname:=[CONTACTS:1]Surname:5
								Else 
									vSurname:=$_t_Surname
								End if 
								If (($_t_Private="True") | ($_t_Private="Y") | ($_t_Private="1"))
									r1:=1
								Else 
									r1:=0
								End if 
								
								If ($_t_RecordNumber#"")
									[COMPANIES:2]Company_Code:1:=$_t_RecordNumber
								Else 
									Company_No
								End if 
								$_l_Create:=1
							End if 
							
							If (($_l_Create=1) | (vAct1=1))
								If (($_t_Company#"") & ($_t_Company#[COMPANIES:2]Company_Name:2))
									[COMPANIES:2]Company_Name:2:=$_t_Company
									[COMPANIES:2]Company_Abbreviated_Name:52:=Companies_Abbr([COMPANIES:2]Company_Name:2)
								End if 
								If (($_t_AddressLine1#"") & ($_t_AddressLine1#[COMPANIES:2]Address_Line_one:3))
									[COMPANIES:2]Address_Line_one:3:=$_t_AddressLine1
								End if 
								If ($_t_AddressLine2#"")
									[COMPANIES:2]Address_Line_two:4:=$_t_AddressLine2
								End if 
								If (($_t_CompanyTown#"") & ($_t_CompanyTown#[COMPANIES:2]Town_or_City:5))
									[COMPANIES:2]Town_or_City:5:=$_t_CompanyTown
								End if 
								If ($_t_CompanyCounty#"")
									[COMPANIES:2]County_or_State:6:=$_t_CompanyCounty
								End if 
								If ($_t_PostCode#"")
									[COMPANIES:2]Postal_Code:7:=$_t_PostCode
								End if 
								If ($_t_Country#"")
									[COMPANIES:2]Country:8:=$_t_Country
								End if 
								If ($_t_CompanyTelephone#"")
									[COMPANIES:2]Telephone:9:=$_t_CompanyTelephone
								End if 
								If ($_t_CompanyFax#"")
									[COMPANIES:2]Fax:10:=$_t_CompanyFax
								End if 
								If ($_t_CompanyStatus#"")
									[COMPANIES:2]Status:12:=$_t_CompanyStatus
								End if 
								If ($_t_CompanyType#"")
									[COMPANIES:2]Company_Type:13:=$_t_CompanyType
								End if 
								If ($_t_Source#"")
									[COMPANIES:2]Source:14:=$_t_Source
								End if 
								If ($_t_CompanyArea="")
									If ($_t_PostCode#"")
										Companies_InPC
									End if 
								Else 
									[COMPANIES:2]Area:11:=$_t_CompanyArea
								End if 
								If ($_t_CompanyTakenBy#"")
									[COMPANIES:2]Taken_By:26:=$_t_CompanyTakenBy
								End if 
								If ($_t_CompanySalesPerson#"")
									[COMPANIES:2]Sales_Person:29:=$_t_CompanySalesPerson
								End if 
								If ($_t_CompanyFurthers#"")
									vT:=$_t_CompanyFurthers
									While (Length:C16(vT)>0)
										IDLE:C311  // 03/04/03 pb
										$_t_Further:=First_Field(->vT; "|")
										If ($_t_Further#"")
											CREATE RECORD:C68([COMPANIES_RECORD_ANALYSIS:146])
											[COMPANIES_RECORD_ANALYSIS:146]Company_Code:4:=[COMPANIES:2]Company_Code:1
											[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1:=$_t_Further
											SAVE RECORD:C53([COMPANIES_RECORD_ANALYSIS:146])
											
										End if 
									End while 
								End if 
								If ($_t_Employees#"")
									[COMPANIES:2]Size:15:=Num:C11($_t_Employees)
								End if 
								If ([COMPANIES:2]Entry_Date:16=!00-00-00!)
									[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
								End if 
								If ($_t_ModifiedDate#"")
									[COMPANIES:2]Modified_Date:32:=Date:C102($_t_ModifiedDate)
								End if 
								If ($_t_FinancialYear#"")
									[COMPANIES:2]Financial_Year:27:=Date:C102($_t_FinancialYear)
								End if 
								If ($_t_Omit="")
									If ([COMPANIES:2]Omit:17#"N")
										[COMPANIES:2]Omit:17:="N"
									End if 
								Else 
									[COMPANIES:2]Omit:17:=$_t_Omit
								End if 
								If ($_t_Comments#"")
									If ([COMPANIES:2]Comments:30#"")
										[COMPANIES:2]Comments:30:=[COMPANIES:2]Comments:30+Char:C90(13)+$_t_Comments
									Else 
										[COMPANIES:2]Comments:30:=$_t_Comments
									End if 
								End if 
								If (($_t_Private="True") | ($_t_Private="Y") | ($_t_Private="1"))
									[COMPANIES:2]Private:37:=True:C214
								End if 
								If ($_t_InvoiceDeparment#"")
									[COMPANIES:2]Invoice_Dept:24:=$_t_InvoiceDeparment
								End if 
								If ($_t_InvoiceCompany#"")
									[COMPANIES:2]Invoice_Name:25:=$_t_InvoiceCompany
								End if 
								If ($_t_InvoiceAddress1#"")
									[COMPANIES:2]Invoice_Address_Line_One:18:=$_t_InvoiceAddress1
								End if 
								If ($_t_InvoiceAddress2#"")
									[COMPANIES:2]Invoice_Address_Line_Two:19:=$_t_InvoiceAddress2
								End if 
								If ($_t_InvoiceTown#"")
									[COMPANIES:2]Invoice_Town:20:=$_t_InvoiceTown
								End if 
								If ($_t_InvoiceCounty#"")
									[COMPANIES:2]Invoice_County:21:=$_t_InvoiceCounty
								End if 
								If ($_t_InvoicePostCode#"")
									[COMPANIES:2]Invoice_Postcode:22:=$_t_InvoicePostCode
								End if 
								If ($_t_InvoiceCountry#"")
									[COMPANIES:2]Invoice_Country:23:=$_t_InvoiceCountry
								End if 
								If ($_t_CompanyValue#"")
									[COMPANIES:2]Value:31:=Num:C11($_t_CompanyValue)
								End if 
								If ($_t_AlsoKnownAs#"")
									[COMPANIES:2]Also_Known_As:43:=$_t_AlsoKnownAs
								End if 
								If ($_t_ParentCompanyCode#"")
									[COMPANIES:2]Superior:34:=$_t_ParentCompanyCode
								End if 
								If ($_t_SalesCredit#"")
									[COMPANIES:2]Sales_Credit:35:=Num:C11($_t_SalesCredit)
								End if 
								If ($_t_PurchaseCredit#"")
									[COMPANIES:2]Purchase_Credit:36:=Num:C11($_t_PurchaseCredit)
								End if 
								If ($_t_TaxPrefix#"")
									[COMPANIES:2]TAX_Prefix:38:=$_t_TaxPrefix
								End if 
								If ($_t_TaxReg#"")
									[COMPANIES:2]TAX_Registration_Number:39:=$_t_TaxReg
								End if 
								If ($_t_SODefaultTerms#"")
									[COMPANIES:2]SL_Terms:40:=$_t_SODefaultTerms
								End if 
								If ($_t_DefaultTax#"")
									[COMPANIES:2]Default_TAX:41:=$_t_DefaultTax
								End if 
								If ($_t_DefaultStage#"")
									[COMPANIES:2]Default_Credit_Stage:42:=$_t_DefaultStage
								End if 
								If ($_t_SOPriceGroup#"")
									[COMPANIES:2]SO_Price_Group:44:=$_t_SOPriceGroup
								End if 
								If ($_t_DefaultLayer#"")
									[COMPANIES:2]Default_Layer:51:=$_t_DefaultLayer
								End if 
								If ($_t_FactorNumber#"")
									[COMPANIES:2]Factor_Number:46:=$_t_FactorNumber
								End if 
								If ($_t_AutoPay#"")
									[COMPANIES:2]Autopay_Number:47:=$_t_AutoPay
								End if 
								If ($_t_TheirAccountNumber#"")
									[COMPANIES:2]Their_Account_Number:48:=$_t_TheirAccountNumber
								End if 
								If ($_t_InboundMailSort#"")
									[COMPANIES:2]Mailsort_SSC:49:=$_t_InboundMailSort
								End if 
								If ($_t_OutboundMailSort#"")
									[COMPANIES:2]Mailsort_OFN:50:=$_t_OutboundMailSort
								End if 
								If ($_t_PurchaseTerms#"")
									[COMPANIES:2]PL_Terms:53:=$_t_PurchaseTerms
								End if 
								If ($_t_PurchasePriceGroup#"")
									[COMPANIES:2]PO_Price_Group:54:=$_t_PurchasePriceGroup
								End if 
								If ($_t_SalesDeliveryMethod#"")
									[COMPANIES:2]Sales_Delivery_Method:28:=$_t_SalesDeliveryMethod
								End if 
								If ($_t_PurchaseDeliveryMethod#"")
									[COMPANIES:2]Purchase_Delivery_Method:74:=$_t_PurchaseDeliveryMethod
								End if 
								If ($_t_CurrencyCode#"")
									[COMPANIES:2]Default_Currency:59:=$_t_CurrencyCode
								End if 
								If (Modified record:C314([COMPANIES:2]))
									DB_SaveRecord(->[COMPANIES:2])
									AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
									If ($_l_Create=1)
										ADD TO SET:C119([COMPANIES:2]; "CMaster")
									Else 
										If (Not:C34(Is in set:C273("CMaster")))
											ADD TO SET:C119([COMPANIES:2]; "Master")
										End if 
									End if 
								End if 
							End if 
						End if 
						
						If ((($_t_Surname#"") | ($_t_JobTitle#"") | ($_t_ContactCode#"") | ($_t_Department#"")) & ($_t_ContactCode#"Contact Code") & ($_t_ContactCode#"Contact"))
							If (($_t_ContactCode#"") | ($_t_Surname="*SAME"))
								If ($_t_ContactCode#"")
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
								End if 
							Else 
								If (<>MultiCo)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									
									SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
									QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
									$_l_SearchType:=2
								Else 
									$_l_SearchType:=1
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
								End if 
								If ($_t_Surname#"")
									If ($_l_SearchType=1)
										QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_Surname)
									Else 
										QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_Surname)
									End if 
									If ($_t_ForeName#"")
										$_t_Forename2:=Substring:C12($_t_ForeName; 1; 1)+"@"
										QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_Forename2)
									End if 
								Else 
									If ($_t_JobTitle#"")
										If ($_l_SearchType=1)
											QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Job_Title:6=$_t_JobTitle)
										Else 
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Job_Title:6=$_t_JobTitle)
										End if 
									Else 
										If ($_l_SearchType=1)
											QUERY:C277([CONTACTS:1])
										End if 
										If ($_t_Department#"")
											QUERY SELECTION BY FORMULA:C207([CONTACTS:1]; [CONTACTS:1]Dept:8=$_t_Department)
										Else 
											REDUCE SELECTION:C351([CONTACTS:1]; 0)
										End if 
									End if 
								End if 
							End if 
							If (Records in selection:C76([CONTACTS:1])=0)
								$_l_Create:=1
								CREATE RECORD:C68([CONTACTS:1])
								[CONTACTS:1]Company_Code:1:=[COMPANIES:2]Company_Code:1
								If (<>MultiCo)
									CREATE RECORD:C68([CONTACTS_COMPANIES:145])
									[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
									[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
									[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
									
									[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
									[CONTACTS_COMPANIES:145]Address_Type:2:=$_t_AddressType
									DB_SaveRecord(->[CONTACTS_COMPANIES:145])
									
								End if 
								Contact_Code
								If ($_t_ContactCode#"")
									[CONTACTS:1]Contact_Code:2:=$_t_ContactCode
								End if 
							Else 
								$_l_Create:=0
							End if 
							If (($_l_Create=1) | (vAct1=1))
								If ($_t_ForeName#"")
									[CONTACTS:1]Forename:4:=$_t_ForeName
								End if 
								If (($_t_Surname#"") & ($_t_Surname#"*SAME"))
									[CONTACTS:1]Surname:5:=$_t_Surname
								End if 
								If ($_t_Title#"")
									[CONTACTS:1]Title:3:=$_t_Title
								End if 
								If ($_t_JobTitle#"")
									[CONTACTS:1]Job_Title:6:=$_t_JobTitle
								End if 
								If ($_t_Role="")
									If ([CONTACTS:1]Role:11="")
										[CONTACTS:1]Role:11:=<>DefRole
									End if 
								Else 
									[CONTACTS:1]Role:11:=$_t_Role
								End if 
								If ($_t_Extension#"")
									[CONTACTS:1]Extn:9:=$_t_Extension
								End if 
								If ($_t_Department#"")
									[CONTACTS:1]Dept:8:=$_t_Department
								End if 
								If ($_t_Mobile#"")
									[CONTACTS:1]Mobile:12:=$_t_Mobile
								End if 
								If ($_t_Salutation#"")
									[CONTACTS:1]Salutation:7:=$_t_Salutation
								End if 
								If ($_t_Qualifications#"")
									[CONTACTS:1]Qualifications:13:=$_t_Qualifications
								End if 
								If ($_t_ContactStatus#"")
									[CONTACTS:1]Status:14:=$_t_ContactStatus
								End if 
								If ($_t_ContactType#"")
									[CONTACTS:1]Contact_Type:15:=$_t_ContactType
								End if 
								If ($_t_ContactSource#"")
									[CONTACTS:1]Source:16:=$_t_ContactSource
								End if 
								If ($_t_ContactSalesPerson#"")
									[CONTACTS:1]Sales_Person:25:=$_t_ContactSalesPerson
								End if 
								If ($_t_ContactFurthers#"")
									vT:=$_t_ContactFurthers
									While (Length:C16(vT)>0)
										IDLE:C311  // 03/04/03 pb
										$_t_Further:=First_Field(->vT; "|")
										If ($_t_Further#"")
											CREATE RECORD:C68([CONTACTS_RECORD_ANALYSIS:144])
											[CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3:=[CONTACTS:1]Contact_Code:2
											[CONTACTS_RECORD_ANALYSIS:144]ID:2:=AA_GetNextID(->[CONTACTS_RECORD_ANALYSIS:144]ID:2)
											
											[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1:=$_t_Further
											DB_SaveRecord(->[CONTACTS_RECORD_ANALYSIS:144])
										End if 
									End while 
								End if 
								If ($_t_Omit#"")
									[CONTACTS:1]Omit:20:=$_t_Omit
								End if 
								If ($_t_Comments#"")
									[CONTACTS:1]Comments:10:=$_t_Comments
								End if 
								If ($_t_FaxNumber#"")
									[CONTACTS:1]Fax:19:=$_t_FaxNumber
								End if 
								If ($_t_EmailAfterAt#"")
									[CONTACTS:1]EMail_After_At:24:=$_t_EmailAfterAt
									Gen_EmailAddr(->[CONTACTS:1]Email_Before_At:30; ->[CONTACTS:1]EMail_After_At:24; 2)
								End if 
								If (($_t_Esquire="True") | ($_t_Esquire="Y") | ($_t_Esquire="1"))
									[CONTACTS:1]Esquire:27:=True:C214
								End if 
								If ($_t_ModifiedDateString#"")
									[CONTACTS:1]Modified_Date:28:=Date:C102($_t_ModifiedDateString)
								End if 
								If ($_l_Create=0)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									
									QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1)
									If (Records in selection:C76([CONTACTS_COMPANIES:145])=0)
										CREATE RECORD:C68([CONTACTS_COMPANIES:145])
										[CONTACTS_COMPANIES:145]Address_DateAdded:6:=Current date:C33(*)
										[CONTACTS_COMPANIES:145]Contact_Code:4:=[CONTACTS:1]Contact_Code:2
										[CONTACTS_COMPANIES:145]ID:3:=AA_GetNextID(->[CONTACTS_COMPANIES:145]ID:3)
										
										[CONTACTS_COMPANIES:145]Company_Code:1:=[COMPANIES:2]Company_Code:1
										[CONTACTS_COMPANIES:145]Address_Type:2:=$_t_AddressType
										
									Else 
										If ($_t_AddressType#"")
											[CONTACTS_COMPANIES:145]Address_Type:2:=$_t_AddressType
										End if 
									End if 
									DB_SaveRecord(->[CONTACTS_COMPANIES:145])
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									[CONTACTS:1]Company_Code:1:=[CONTACTS_COMPANIES:145]Company_Code:1
								End if 
								
								If (Modified record:C314([CONTACTS:1]))
									DB_SaveRecord(->[CONTACTS:1])
									AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
									If ($_l_Create=1)
										ADD TO SET:C119([CONTACTS:1]; "OMaster")
									Else 
										If (Not:C34(Is in set:C273("OMaster")))
											ADD TO SET:C119([CONTACTS:1]; "Extra2")
										End if 
									End if 
								End if 
							End if 
						End if 
						
					End if 
				End while 
				CLOSE WINDOW:C154
				If (WIN_bo_TrackerInited)
					$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
					If ($_l_WindowReferenceRow>0)
						WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
					End if 
				End if 
				WS_KeepFocus
				
				Companies_ImpEn
				Contacts_ImpEn
				
			End if 
		End if 
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Companies_Imp"; $_t_oldMethodName)
