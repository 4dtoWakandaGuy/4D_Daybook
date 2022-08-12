//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_PersonAddSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_CallCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes2; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_JobCodes; 0)
	ARRAY TEXT:C222($_at_JobNames; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_PurchaseOrderCodes; 0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	C_LONGINT:C283($_l_AddCount; $_l_CompanyCodeRow; $_l_ContactsCoIndex; $_l_ContactsIndex; $_l_SizeofarrayCompanies)
	C_POINTER:C301($2; $3; $4; $5; $6)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchValue; $_t_SearchWithAt; $1; DB_t_Methodname; SD2_t_SearchCriteria; vForename; vSurname; Vtitle; VwholeName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_PersonAddSearch")

//NG This method is created form SD2_PersonAdd
//It will search for records and return a selection of CONTACTS for the list box area SD_lb_People
//Note that i have not done the fill in here-simply returned a selection of records. This is so this same search COULD be used with other forms
DB_t_Methodname:=Current method name:C684
If (Count parameters:C259>=6)
	$_t_SearchValue:=$1
	Case of 
		: ($_t_SearchValue#"")
			Case of 
				: ("Purchase Invoice:"=SD2_t_SearchCriteria)
					//Search Purchase invoices
					
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_SearchValue+"@")
					//Purchases do not have a contact code so....
					ARRAY TEXT:C222($_at_CompanyCodes; 0)
					SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Company_Code:2; $_at_CompanyCodes; [PURCHASE_INVOICES:37]Purchase_Code:1; $_at_PurchaseOrderCodes)
					//The query with array command cannot be used with subtables..whichi s pain for this
					CREATE EMPTY SET:C140([CONTACTS:1]; "$Set1")
					$_l_SizeofarrayCompanies:=Size of array:C274($_at_CompanyCodes)
					ARRAY TEXT:C222($_at_CompanyCodes2; 0)
					For ($_l_ContactsIndex; 1; $_l_SizeofarrayCompanies)
						$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes2; $_at_CompanyCodes{$_l_ContactsIndex})
						If ($_l_CompanyCodeRow<0)
							APPEND TO ARRAY:C911($_at_CompanyCodes2; $_at_CompanyCodes{$_l_ContactsIndex})
							If ($_at_CompanyCodes{$_l_ContactsIndex}#"")
								QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_at_CompanyCodes{$_l_ContactsIndex}; *)
								QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
								
								SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
								QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
								CREATE SET:C116([CONTACTS:1]; "$Set3")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_at_CompanyCodes{$_l_ContactsIndex})
								CREATE SET:C116([CONTACTS:1]; "$set2")
								UNION:C120("$Set3"; "$Set2"; "$Set2")
								UNION:C120("$Set1"; "$Set2"; "$Set1")
							End if 
						End if 
					End for 
					//now we have a list of all the contacts for all the companies on the purchase codes found--normally one PC
					USE SET:C118("$Set1")
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
								If ($_l_CompanyCodeRow>0)
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Purchase Code"+$_at_PurchaseOrderCodes{$_l_CompanyCodeRow}+")")
									Else 
										APPEND TO ARRAY:C911($5->; "("+"Purchase Code"+$_at_PurchaseOrderCodes{$_l_CompanyCodeRow}+")")
									End if 
									
								Else 
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
									Else 
										APPEND TO ARRAY:C911($5->; "")
									End if 
								End if 
								APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
							Else 
								$_l_AddCount:=0
								
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_CompanyCodeRow>0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
											If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
												APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
												APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
												APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
											End if 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Purchase Code"+$_at_PurchaseOrderCodes{$_l_CompanyCodeRow}+")")
											Else 
												APPEND TO ARRAY:C911($5->; "("+"Purchase Code"+$_at_PurchaseOrderCodes{$_l_CompanyCodeRow}+")")
											End if 
											APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
											$_l_AddCount:=$_l_AddCount+1
										End if 
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
				: ("Invoice:"=SD2_t_SearchCriteria)
					//Search Sales Invoices
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_SearchValue+"@")
					ARRAY TEXT:C222($_at_CompanyCodes; 0)
					ARRAY TEXT:C222($_at_ContactCodes; 0)
					SELECTION TO ARRAY:C260([INVOICES:39]Contact_Code:3; $_at_ContactCodes; [INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers; [INVOICES:39]Company_Code:2; $_at_CompanyCodes)
					
					//The query with array command cannot be used with subtables..whichi s pain for this
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					CREATE SET:C116([CONTACTS:1]; "$Set1")
					
					USE SET:C118("$Set1")
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							//ALL SUBRECORDS([CONTACTS]COMPANIES)
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
								If ($_l_CompanyCodeRow>0)
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Invioice No"+$_at_InvoiceNumbers{$_l_CompanyCodeRow}+")")
									Else 
										APPEND TO ARRAY:C911($5->; "("+"Invioice No"+$_at_InvoiceNumbers{$_l_CompanyCodeRow}+")")
									End if 
									
								Else 
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
									Else 
										APPEND TO ARRAY:C911($5->; "")
									End if 
								End if 
								APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
							Else 
								$_l_AddCount:=0
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_CompanyCodeRow>0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
											If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
												APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
												APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
												APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
											End if 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Invoice No"+$_at_InvoiceNumbers{$_l_CompanyCodeRow}+")")
											Else 
												APPEND TO ARRAY:C911($5->; "("+"Invoice No"+$_at_InvoiceNumbers{$_l_CompanyCodeRow}+")")
											End if 
											APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
											$_l_AddCount:=$_l_AddCount+1
										End if 
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
				: ("Call:"=SD2_t_SearchCriteria)
					QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$_t_SearchValue+"@")
					ARRAY TEXT:C222($_at_CompanyCodes; 0)
					ARRAY TEXT:C222($_at_ContactCodes; 0)
					ARRAY TEXT:C222($_at_CallCodes; 0)
					SELECTION TO ARRAY:C260([SERVICE_CALLS:20]Contact_Code:2; $_at_ContactCodes; [SERVICE_CALLS:20]Call_Code:4; $_at_CallCodes; [SERVICE_CALLS:20]Company_Code:1; $_at_CompanyCodes)
					
					//The query with array command cannot be used with subtables..whichi s pain for this
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					CREATE SET:C116([CONTACTS:1]; "$Set1")
					
					USE SET:C118("$Set1")
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							//ALL SUBRECORDS([CONTACTS]COMPANIES)
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
								If ($_l_CompanyCodeRow>0)
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Service Call"+$_at_CallCodes{$_l_CompanyCodeRow}+")")
									Else 
										APPEND TO ARRAY:C911($5->; "("+"Service Call"+$_at_CallCodes{$_l_CompanyCodeRow}+")")
									End if 
								Else 
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
									Else 
										APPEND TO ARRAY:C911($5->; "")
									End if 
								End if 
								APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
							Else 
								$_l_AddCount:=0
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_CompanyCodeRow>0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
											If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
												APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
												APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
												APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
											End if 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Service Call"+$_at_CallCodes{$_l_CompanyCodeRow}+")")
											Else 
												APPEND TO ARRAY:C911($5->; "("+"Service Call"+$_at_CallCodes{$_l_CompanyCodeRow}+")")
											End if 
											
											APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
											$_l_AddCount:=$_l_AddCount+1
										End if 
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
				: ("Job:"=SD2_t_SearchCriteria)
					QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_SearchValue+"@"; *)
					QUERY:C277([JOBS:26];  | ; [JOBS:26]Job_Name:2=$_t_SearchValue+"@")
					ARRAY TEXT:C222($_at_CompanyCodes; 0)
					ARRAY TEXT:C222($_at_ContactCodes; 0)
					ARRAY TEXT:C222($_at_JobCodes; 0)
					ARRAY TEXT:C222($_at_JobNames; 0)
					SELECTION TO ARRAY:C260([JOBS:26]Contact_Code:4; $_at_ContactCodes; [JOBS:26]Job_Code:1; $_at_JobCodes; [JOBS:26]Company_Code:3; $_at_CompanyCodes; [JOBS:26]Job_Name:2; $_at_JobNames)
					
					//The query with array command cannot be used with subtables..whichi s pain for this
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					CREATE SET:C116([CONTACTS:1]; "$Set1")
					
					USE SET:C118("$Set1")
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							
							
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
								If ($_l_CompanyCodeRow>0)
									If ($_at_JobNames{$_l_CompanyCodeRow}="")
										If ([COMPANIES:2]Company_Name:2#"")
											APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Job Code"+$_at_JobCodes{$_l_CompanyCodeRow}+")")
										Else 
											APPEND TO ARRAY:C911($5->; "("+"Job Code"+$_at_JobCodes{$_l_CompanyCodeRow}+")")
										End if 
										
									Else 
										If ([COMPANIES:2]Company_Name:2#"")
											APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Job "+$_at_JobCodes{$_l_CompanyCodeRow}+" "+$_at_JobNames{$_l_CompanyCodeRow}+")")
										Else 
											APPEND TO ARRAY:C911($5->; "("+"Job "+$_at_JobCodes{$_l_CompanyCodeRow}+" "+$_at_JobNames{$_l_CompanyCodeRow}+")")
										End if 
									End if 
									APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
								Else 
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
									Else 
										APPEND TO ARRAY:C911($5->; "")
									End if 
									APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
								End if 
							Else 
								$_l_AddCount:=0
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_CompanyCodeRow>0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
											If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
												APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
												APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
												APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
											End if 
											If ($_at_JobNames{$_l_CompanyCodeRow}="")
												If ([COMPANIES:2]Company_Name:2#"")
													APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Job Code"+$_at_JobCodes{$_l_CompanyCodeRow}+")")
												Else 
													APPEND TO ARRAY:C911($5->; "("+"Job Code"+$_at_JobCodes{$_l_CompanyCodeRow}+")")
												End if 
												
											Else 
												If ([COMPANIES:2]Company_Name:2#"")
													APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Job "+$_at_JobCodes{$_l_CompanyCodeRow}+" "+$_at_JobNames{$_l_CompanyCodeRow}+")")
												Else 
													APPEND TO ARRAY:C911($5->; "("+"Job "+$_at_JobCodes{$_l_CompanyCodeRow}+" "+$_at_JobNames{$_l_CompanyCodeRow}+")")
												End if 
											End if 
											APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
											$_l_AddCount:=$_l_AddCount+1
										End if 
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
					
					
					
				: ("Order:"=SD2_t_SearchCriteria)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_SearchValue+"@")
					ARRAY TEXT:C222($_at_CompanyCodes; 0)
					ARRAY TEXT:C222($_at_ContactCodes; 0)
					ARRAY TEXT:C222($_at_OrderCodes; 0)
					SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes; [ORDERS:24]Contact_Code:2; $_at_ContactCodes; [ORDERS:24]Company_Code:1; $_at_CompanyCodes)
					
					//The query with array command cannot be used with subtables..whichi s pain for this
					QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
					CREATE SET:C116([CONTACTS:1]; "$Set1")
					
					USE SET:C118("$Set1")
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							//ALL SUBRECORDS([CONTACTS]COMPANIES)
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
								If ($_l_CompanyCodeRow>0)
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Order "+$_at_OrderCodes{$_l_CompanyCodeRow}+")")
									Else 
										APPEND TO ARRAY:C911($5->; "("+"Order "+$_at_OrderCodes{$_l_CompanyCodeRow}+")")
									End if 
								Else 
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
									Else 
										APPEND TO ARRAY:C911($5->; "")
									End if 
								End if 
								APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
							Else 
								$_l_AddCount:=0
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_CompanyCodeRow>0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
											If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
												APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
												APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
												APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
											End if 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+","+"Order"+$_at_OrderCodes{$_l_CompanyCodeRow}+")")
											Else 
												APPEND TO ARRAY:C911($5->; "("+"Order"+$_at_OrderCodes{$_l_CompanyCodeRow}+")")
											End if 
											APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
											$_l_AddCount:=$_l_AddCount+1
										End if 
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
					
				: ("Contact:"=SD2_t_SearchCriteria)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_SearchValue+"@")
					If (Records in selection:C76([CONTACTS:1])=0)
						AA_LoadNameArrays
						VwholeName:=$_t_SearchValue
						AA_ParseName(VwholeName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
						vForename:=Uppers2(vForename; 1)
						vSurname:=Uppers2(UppersSurname(vSurname); 1)
						VWholeName:=""
						Case of 
							: (VForename#"") & (VSurname#"")
								$_t_SearchWithAt:=Sel_AtSign(vForename)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithAt; *)
								$_t_SearchWithAt:=Sel_AtSign(vSurname)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
								If (VTitle#"")
									$_t_SearchWithAt:=Sel_AtSign(vTitle)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
								End if 
								
							: (VSurname#"")
								$_t_SearchWithAt:=Sel_AtSign(VSurname)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
								If (VTitle#"")
									$_t_SearchWithAt:=Sel_AtSign(vTitle)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
								End if 
							: (VForename#"")
								$_t_SearchWithAt:=Sel_AtSign(vForename)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithAt; *)
								//there was not a first and surname entered
								QUERY:C277([CONTACTS:1];  | ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
								If (VTitle#"")
									$_t_SearchWithAt:=Sel_AtSign(vTitle)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
								End if 
								
								//``````````````
							Else 
								$_t_SearchWithAt:=Sel_AtSign($_t_SearchValue)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
						End case 
						
					End if 
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							//ALL SUBRECORDS([CONTACTS]COMPANIES)
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								
								
								If ([COMPANIES:2]Company_Name:2#"")
									APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
								Else 
									APPEND TO ARRAY:C911($5->; "")
								End if 
								APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
							Else 
								$_l_AddCount:=0
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
											APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
											APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
											APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
										End if 
										If ([COMPANIES:2]Company_Name:2#"")
											APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
										Else 
											APPEND TO ARRAY:C911($5->; "")
										End if 
										APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
										$_l_AddCount:=$_l_AddCount+1
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
				: ("Company:"=SD2_t_SearchCriteria)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_SearchValue+"@")
					
					
					If (Records in selection:C76([COMPANIES:2])=0)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_SearchValue+"@")
					End if 
					SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
					CREATE EMPTY SET:C140([CONTACTS:1]; "$Set1")
					$_l_SizeofarrayCompanies:=Size of array:C274($_at_CompanyCodes)
					ARRAY TEXT:C222($_at_CompanyCodes2; 0)
					For ($_l_ContactsIndex; 1; $_l_SizeofarrayCompanies)
						$_l_CompanyCodeRow:=Find in array:C230($_at_CompanyCodes2; $_at_CompanyCodes{$_l_ContactsIndex})
						If ($_l_CompanyCodeRow<0)
							APPEND TO ARRAY:C911($_at_CompanyCodes2; $_at_CompanyCodes{$_l_ContactsIndex})
							If ($_at_CompanyCodes{$_l_ContactsIndex}#"")
								QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_at_CompanyCodes{$_l_ContactsIndex})
								SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
								QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
								CREATE SET:C116([CONTACTS:1]; "$set3")
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_at_CompanyCodes{$_l_ContactsIndex})
								CREATE SET:C116([CONTACTS:1]; "$set2")
								UNION:C120("$Set3"; "$Set2"; "$Set2")
								
								UNION:C120("$Set1"; "$Set2"; "$Set1")
							End if 
						End if 
					End for 
					USE SET:C118("$set1")
					
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							//ALL SUBRECORDS([CONTACTS]COMPANIES)
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								
								
								If ([COMPANIES:2]Company_Name:2#"")
									APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
								Else 
									APPEND TO ARRAY:C911($5->; "")
								End if 
								APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
							Else 
								$_l_AddCount:=0
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
											APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
											APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
											APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
										End if 
										If ([COMPANIES:2]Company_Name:2#"")
											APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
										Else 
											APPEND TO ARRAY:C911($5->; "")
										End if 
										APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
										$_l_AddCount:=$_l_AddCount+1
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
				Else   //No specific criteria has been set for the search..
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_SearchValue+"@")
					If (Records in selection:C76([CONTACTS:1])=0)
						AA_LoadNameArrays
						VwholeName:=$_t_SearchValue
						AA_ParseName(VwholeName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefixes; ->AA_at_ProffesionalAdditions)
						vForename:=Uppers2(vForename; 1)
						vSurname:=Uppers2(UppersSurname(vSurname); 1)
						VWholeName:=""
						Case of 
							: (VForename#"") & (VSurname#"")
								$_t_SearchWithAt:=Sel_AtSign(vForename)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithAt; *)
								$_t_SearchWithAt:=Sel_AtSign(vSurname)
								QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
								If (VTitle#"")
									$_t_SearchWithAt:=Sel_AtSign(vTitle)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
								End if 
								
							: (VSurname#"")
								$_t_SearchWithAt:=Sel_AtSign(VSurname)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
								If (VTitle#"")
									$_t_SearchWithAt:=Sel_AtSign(vTitle)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
								End if 
							: (VForename#"")
								$_t_SearchWithAt:=Sel_AtSign(vForename)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithAt; *)
								//there was not a first and surname entered
								QUERY:C277([CONTACTS:1];  | ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
								If (VTitle#"")
									$_t_SearchWithAt:=Sel_AtSign(vTitle)
									QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
								End if 
								
								//``````````````
							Else 
								$_t_SearchWithAt:=Sel_AtSign($_t_SearchValue)
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
						End case 
						
					End if 
					If (Records in selection:C76([CONTACTS:1])>0)
						CREATE SET:C116([CONTACTS:1]; "$Set1")
					Else 
						CREATE EMPTY SET:C140([CONTACTS:1]; "$Set1")
					End if 
					ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
					If (GenValidatePointer($2)) & (GenValidatePointer($3)) & (GenValidatePointer($4)) & (GenValidatePointer($5)) & (GenValidatePointer($6))
						
						For ($_l_ContactsIndex; 1; Records in selection:C76([CONTACTS:1]))
							QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
							QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							
							//ALL SUBRECORDS([CONTACTS]COMPANIES)
							APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
							APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
							APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
							If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
								QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
								
								
								If ([COMPANIES:2]Company_Name:2#"")
									APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
								Else 
									APPEND TO ARRAY:C911($5->; "")
								End if 
								APPEND TO ARRAY:C911($6->; [CONTACTS:1]Company_Code:1)
							Else 
								$_l_AddCount:=0
								For ($_l_ContactsCoIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
									
									If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
										If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
											APPEND TO ARRAY:C911($2->; [CONTACTS:1]Contact_Code:2)
											APPEND TO ARRAY:C911($3->; [CONTACTS:1]Contact_Name:31)
											APPEND TO ARRAY:C911($4->; [CONTACTS:1]x_ID:33)
										End if 
										If ([COMPANIES:2]Company_Name:2#"")
											APPEND TO ARRAY:C911($5->; "("+[COMPANIES:2]Company_Name:2+")")
										Else 
											APPEND TO ARRAY:C911($5->; "")
										End if 
										APPEND TO ARRAY:C911($6->; [CONTACTS_COMPANIES:145]Company_Code:1)
										$_l_AddCount:=$_l_AddCount+1
									End if 
									NEXT RECORD:C51([CONTACTS_COMPANIES:145])
									
								End for 
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
			End case 
		Else 
			REDUCE SELECTION:C351([CONTACTS:1]; 0)
	End case 
End if 
ERR_MethodTrackerReturn("SD2_PersonAddSearch"; $_t_oldMethodName)
