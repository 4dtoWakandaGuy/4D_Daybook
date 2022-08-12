//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_PersonAddQueryProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/03/2010 14:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_FoundNameSelect;0)
	//ARRAY LONGINT(SD2_al_FoundNameCLass;0)
	//ARRAY LONGINT(SD2_al_FoundNameID;0)
	ARRAY TEXT:C222($_at_CallCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_CompanyCodes2; 0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_InvoiceCodes; 0)
	ARRAY TEXT:C222($_at_JobCodes; 0)
	ARRAY TEXT:C222($_at_JobNames; 0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_POCodes; 0)
	ARRAY TEXT:C222($_at_PurchaseCodes; 0)
	ARRAY TEXT:C222($_at_SortOrder; 0)
	//ARRAY TEXT(AA_at_ProffesionalAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefixes;0)
	//ARRAY TEXT(SD2_at_FoundDataInfo;0)
	//ARRAY TEXT(SD2_at_FoundNameCode;0)
	//ARRAY TEXT(Sd2_at_FoundNameCompany;0)
	//ARRAY TEXT(SD2_at_FoundNames;0)
	C_LONGINT:C283($_l_AddCount; $_l_CompanyRow; $_l_ContactsCompaniesIndex; $_l_CountCompanyCodes; $_l_Index; $_l_SizeofArray; SD2_l_EmailCalledBack; SD2_l_StopSearch)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName; $_t_SearchCriteria; $_t_SearchValue; $_t_SearchWithAt; $1; $2; SRCH_T_ParamPassed; SRCH_t_SearchValue; vForename; vSurname; Vtitle)
	C_TEXT:C284(VwholeName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_PersonAddQueryProcess")

//This method is kicked off as a process from the person add window
//NG This method is created form SD2_PersonAdd
//It will search for records and return a selection of CONTACTS for the list box area SD_lb_People
//Note that i have not done the fill in here-simply returned a selection of records. This is so this same search COULD be used with other forms
If (Count parameters:C259>=2)
	$_t_SearchCriteria:=$2
	$_t_SearchValue:=$1
	ARRAY TEXT:C222(SD2_at_FoundNameCode; 0)  //($2)
	ARRAY TEXT:C222(SD2_at_FoundNames; 0)  //$3
	ARRAY LONGINT:C221(SD2_al_FoundNameID; 0)  //$4
	ARRAY TEXT:C222(SD2_at_FoundDataInfo; 0)  //$5
	ARRAY TEXT:C222(Sd2_at_FoundNameCompany; 0)
	ARRAY LONGINT:C221(SD2_al_FoundNameCLass; 0)  //(not passed)
	ARRAY BOOLEAN:C223(SD2_abo_FoundNameSelect; 0)  //(not passed)
	ARRAY TEXT:C222($_at_SortOrder; 0)
	
	Case of 
		: ($_t_SearchValue#"")
			Case of 
				: ("Purchase Invoice:"=$_t_SearchCriteria)
					//Search Purchase invoices
					
					QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
						//Purchases do not have a contact code so....
						ARRAY TEXT:C222($_at_CompanyCodes; 0)
						SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Company_Code:2; $_at_CompanyCodes; [PURCHASE_INVOICES:37]Purchase_Code:1; $_at_PurchaseCodes)
						If (SD2_l_StopSearch=0)
							//The query with array command cannot be used with subtables..whichi s pain for this
							CREATE EMPTY SET:C140([CONTACTS:1]; "$Set1")
							$_l_CountCompanyCodes:=Size of array:C274($_at_CompanyCodes)
							ARRAY TEXT:C222($_at_CompanyCodes2; 0)
							For ($_l_Index; 1; $_l_CountCompanyCodes)
								If (SD2_l_StopSearch=0)
									$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes2; $_at_CompanyCodes{$_l_Index})
									If ($_l_CompanyRow<0)
										APPEND TO ARRAY:C911($_at_CompanyCodes2; $_at_CompanyCodes{$_l_Index})
										
										If ($_at_CompanyCodes{$_l_Index}#"")
											QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_at_CompanyCodes{$_l_Index}; *)
											QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
											SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
											QUERY WITH ARRAY:C644([CONTACTS:1]Company_Code:1; $_at_ContactCodes)
											CREATE SET:C116([CONTACTS:1]; "$Set3")
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_at_CompanyCodes{$_l_Index})
											CREATE SET:C116([CONTACTS:1]; "$set2")
											UNION:C120("$Set3"; "$Set2"; "$Set2")
											UNION:C120("$Set1"; "$Set2"; "$Set1")
										End if 
										
									End if 
								Else 
									$_l_Index:=$_l_CountCompanyCodes+1
								End if 
							End for 
							//now we have a list of all the contacts for all the companies on the purchase codes found--normally one PC
							USE SET:C118("$Set1")
							//ORDER BY([CONTACTS];[CONTACTS]Surname;[CONTACTS]Forename;>)
							If (SD2_l_StopSearch=0)
								
								
								
								
								For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
									If (SD2_l_StopSearch=0)
										QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
										QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
										APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
										APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
										
										APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
										APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
										If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
											$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
											If ($_l_CompanyRow>0)
												If ([COMPANIES:2]Company_Name:2#"")
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Purchase Code"+$_at_PurchaseCodes{$_l_CompanyRow}+")")
												Else 
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Purchase Code"+$_at_PurchaseCodes{$_l_CompanyRow}+")")
												End if 
												
											Else 
												If ([COMPANIES:2]Company_Name:2#"")
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
												Else 
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
												End if 
											End if 
											APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
											APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
											APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
										Else 
											$_l_AddCount:=0
											For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
												If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
													$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
													If ($_l_CompanyRow>0)
														QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
														If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
															APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
															APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
															APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
															APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
														End if 
														If ([COMPANIES:2]Company_Name:2#"")
															APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Purchase Code"+$_at_PurchaseCodes{$_l_CompanyRow}+")")
														Else 
															APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Purchase Code"+$_at_PurchaseCodes{$_l_CompanyRow}+")")
														End if 
														APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
														APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
														APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
														
														$_l_AddCount:=$_l_AddCount+1
													End if 
												End if 
												//NEXT SUBRECORD([CONTACTS]COMPANIES)
												NEXT RECORD:C51([CONTACTS_COMPANIES:145])
												
											End for 
										End if 
									Else 
										$_l_Index:=Records in selection:C76([CONTACTS:1])
									End if 
									NEXT RECORD:C51([CONTACTS:1])
								End for 
								
								
							End if 
						End if 
					End if 
				: ("Invoice:"=$_t_SearchCriteria)
					//Search Sales Invoices
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
						ARRAY TEXT:C222($_at_CompanyCodes; 0)
						ARRAY TEXT:C222($_at_ContactCodes; 0)
						If (SD2_l_StopSearch=0)
							SELECTION TO ARRAY:C260([INVOICES:39]Contact_Code:3; $_at_ContactCodes; [INVOICES:39]Invoice_Number:1; $_at_InvoiceCodes; [INVOICES:39]Company_Code:2; $_at_CompanyCodes)
							
							//The query with array command cannot be used with subtables..whichi s pain for this
							QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
							CREATE SET:C116([CONTACTS:1]; "$Set1")
							
							USE SET:C118("$Set1")
							
							
							For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
								If (SD2_l_StopSearch=0)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									//ALL SUBRECORDS([CONTACTS]COMPANIES)
									APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
									APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
									APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
									If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
										$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
										If ($_l_CompanyRow>0)
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Invioice No"+$_at_InvoiceCodes{$_l_CompanyRow}+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Invioice No"+$_at_InvoiceCodes{$_l_CompanyRow}+")")
											End if 
											
										Else 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
											End if 
										End if 
										APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
										APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
										APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
										
									Else 
										$_l_AddCount:=0
										For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
											If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
												$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
												If ($_l_CompanyRow>0)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
													If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
														APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
														APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
														APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
														APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
													End if 
													If ([COMPANIES:2]Company_Name:2#"")
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Invoice No"+$_at_InvoiceCodes{$_l_CompanyRow}+")")
													Else 
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Invoice No"+$_at_InvoiceCodes{$_l_CompanyRow}+")")
													End if 
													APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
													APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
													APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
													$_l_AddCount:=$_l_AddCount+1
												End if 
											End if 
											NEXT RECORD:C51([CONTACTS_COMPANIES:145])
											
										End for 
									End if 
								Else 
									$_l_Index:=Records in selection:C76([CONTACTS:1])
								End if 
								NEXT RECORD:C51([CONTACTS:1])
							End for 
						End if 
					End if 
				: ("Call:"=$_t_SearchCriteria)
					QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
						ARRAY TEXT:C222($_at_CompanyCodes; 0)
						ARRAY TEXT:C222($_at_ContactCodes; 0)
						ARRAY TEXT:C222($_at_CallCodes; 0)
						SELECTION TO ARRAY:C260([SERVICE_CALLS:20]Contact_Code:2; $_at_ContactCodes; [SERVICE_CALLS:20]Call_Code:4; $_at_CallCodes; [SERVICE_CALLS:20]Company_Code:1; $_at_CompanyCodes)
						If (SD2_l_StopSearch=0)
							//The query with array command cannot be used with subtables..whichi s pain for this
							QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
							CREATE SET:C116([CONTACTS:1]; "$Set1")
							
							USE SET:C118("$Set1")
							ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
							
							
							For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
								If (SD2_l_StopSearch=0)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									
									APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
									APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
									APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
									If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
										$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
										If ($_l_CompanyRow>0)
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Service Call"+$_at_CallCodes{$_l_CompanyRow}+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Service Call"+$_at_CallCodes{$_l_CompanyRow}+")")
											End if 
										Else 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
											End if 
										End if 
										APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
										APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
										APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
									Else 
										$_l_AddCount:=0
										For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
											If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
												$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
												If ($_l_CompanyRow>0)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
													If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
														APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
														APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
														APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
														APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
													End if 
													If ([COMPANIES:2]Company_Name:2#"")
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Service Call"+$_at_CallCodes{$_l_CompanyRow}+")")
													Else 
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Service Call"+$_at_CallCodes{$_l_CompanyRow}+")")
													End if 
													
													APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
													APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
													APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
													$_l_AddCount:=$_l_AddCount+1
												End if 
											End if 
											NEXT RECORD:C51([CONTACTS_COMPANIES:145])
											
										End for 
									End if 
								Else 
									$_l_Index:=Records in selection:C76([CONTACTS:1])
								End if 
								NEXT RECORD:C51([CONTACTS:1])
							End for 
						End if 
					End if 
				: ("Job:"=$_t_SearchCriteria)
					QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_t_SearchValue+"@"; *)
					If (SD2_l_StopSearch=0)
						QUERY:C277([JOBS:26];  | ; [JOBS:26]Job_Name:2=$_t_SearchValue+"@")
						If (SD2_l_StopSearch=0)
							ARRAY TEXT:C222($_at_CompanyCodes; 0)
							ARRAY TEXT:C222($_at_ContactCodes; 0)
							ARRAY TEXT:C222($_at_JobCodes; 0)
							ARRAY TEXT:C222($_at_JobNames; 0)
							SELECTION TO ARRAY:C260([JOBS:26]Contact_Code:4; $_at_ContactCodes; [JOBS:26]Job_Code:1; $_at_JobCodes; [JOBS:26]Company_Code:3; $_at_CompanyCodes; [JOBS:26]Job_Name:2; $_at_JobNames)
							If (SD2_l_StopSearch=0)
								//The query with array command cannot be used with subtables..whichi s pain for this
								QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
								CREATE SET:C116([CONTACTS:1]; "$Set1")
								
								USE SET:C118("$Set1")
								ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
								
								For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
									If (SD2_l_StopSearch=0)
										QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
										QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
										
										//ALL SUBRECORDS([CONTACTS]COMPANIES)
										APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
										APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
										APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
										APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
										If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
											$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
											If ($_l_CompanyRow>0)
												If ($_at_JobNames{$_l_CompanyRow}="")
													If ([COMPANIES:2]Company_Name:2#"")
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Job Code"+$_at_JobCodes{$_l_CompanyRow}+")")
													Else 
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Job Code"+$_at_JobCodes{$_l_CompanyRow}+")")
													End if 
													
												Else 
													If ([COMPANIES:2]Company_Name:2#"")
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Job "+$_at_JobCodes{$_l_CompanyRow}+" "+$_at_JobNames{$_l_CompanyRow}+")")
													Else 
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Job "+$_at_JobCodes{$_l_CompanyRow}+" "+$_at_JobNames{$_l_CompanyRow}+")")
													End if 
												End if 
												APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
												APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
												APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
											Else 
												If ([COMPANIES:2]Company_Name:2#"")
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
												Else 
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
												End if 
												APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
												APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
												APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
											End if 
										Else 
											$_l_AddCount:=0
											For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
												If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
													$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
													If ($_l_CompanyRow>0)
														QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
														If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
															APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
															APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
															APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
															APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
														End if 
														If ($_at_JobNames{$_l_CompanyRow}="")
															If ([COMPANIES:2]Company_Name:2#"")
																APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Job Code"+$_at_JobCodes{$_l_CompanyRow}+")")
															Else 
																APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Job Code"+$_at_JobCodes{$_l_CompanyRow}+")")
															End if 
															
														Else 
															If ([COMPANIES:2]Company_Name:2#"")
																APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Job "+$_at_JobCodes{$_l_CompanyRow}+" "+$_at_JobNames{$_l_CompanyRow}+")")
															Else 
																APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Job "+$_at_JobCodes{$_l_CompanyRow}+" "+$_at_JobNames{$_l_CompanyRow}+")")
															End if 
														End if 
														APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
														APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
														APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
														$_l_AddCount:=$_l_AddCount+1
													End if 
												End if 
												NEXT RECORD:C51([CONTACTS_COMPANIES:145])
												
											End for 
										End if 
									Else 
										$_l_Index:=Records in selection:C76([CONTACTS:1])
									End if 
									NEXT RECORD:C51([CONTACTS:1])
								End for 
							End if 
						End if 
					End if 
					
					
				: ("Purchase Order:"=$_t_SearchCriteria)
					QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
						ARRAY TEXT:C222($_at_CompanyCodes; 0)
						ARRAY TEXT:C222($_at_ContactCodes; 0)
						ARRAY TEXT:C222($_at_POCodes; 0)
						SELECTION TO ARRAY:C260([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_POCodes; [PURCHASE_ORDERS:57]Contact_Code:5; $_at_ContactCodes; [PURCHASE_ORDERS:57]Company_Code:1; $_at_CompanyCodes)
						If (SD2_l_StopSearch=0)
							//The query with array command cannot be used with subtables..whichi s pain for this
							QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
							CREATE SET:C116([CONTACTS:1]; "$Set1")
							
							USE SET:C118("$Set1")
							ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
							
							For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
								If (SD2_l_StopSearch=0)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									//ALL SUBRECORDS([CONTACTS]COMPANIES)
									APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
									APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
									APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
									If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
										$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
										If ($_l_CompanyRow>0)
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Purchase Order "+$_at_POCodes{$_l_CompanyRow}+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Purchase Order "+$_at_POCodes{$_l_CompanyRow}+")")
											End if 
										Else 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
											End if 
										End if 
										APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
										APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
										APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
									Else 
										$_l_AddCount:=0
										For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
											If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
												$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
												If ($_l_CompanyRow>0)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
													If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
														APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
														APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
														APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
														APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
													End if 
													If ([COMPANIES:2]Company_Name:2#"")
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Purchase Order"+$_at_POCodes{$_l_CompanyRow}+")")
													Else 
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Purchase Order"+$_at_POCodes{$_l_CompanyRow}+")")
													End if 
													APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
													APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
													APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
													$_l_AddCount:=$_l_AddCount+1
												End if 
											End if 
											NEXT RECORD:C51([CONTACTS_COMPANIES:145])
											
										End for 
									End if 
								Else 
									$_l_Index:=Records in selection:C76([CONTACTS:1])
								End if 
								NEXT RECORD:C51([CONTACTS:1])
							End for 
						End if 
					End if 
				: ("Order:"=$_t_SearchCriteria)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
						ARRAY TEXT:C222($_at_CompanyCodes; 0)
						ARRAY TEXT:C222($_at_ContactCodes; 0)
						ARRAY TEXT:C222($_at_OrderCodes; 0)
						SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes; [ORDERS:24]Contact_Code:2; $_at_ContactCodes; [ORDERS:24]Company_Code:1; $_at_CompanyCodes)
						If (SD2_l_StopSearch=0)
							//The query with array command cannot be used with subtables..whichi s pain for this
							QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
							CREATE SET:C116([CONTACTS:1]; "$Set1")
							
							USE SET:C118("$Set1")
							ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
							
							For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
								If (SD2_l_StopSearch=0)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									//ALL SUBRECORDS([CONTACTS]COMPANIES)
									APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
									APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
									APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
									If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
										$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS:1]Company_Code:1)
										If ($_l_CompanyRow>0)
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Order "+$_at_OrderCodes{$_l_CompanyRow}+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Order "+$_at_OrderCodes{$_l_CompanyRow}+")")
											End if 
										Else 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
											End if 
										End if 
										APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
										APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
										APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
									Else 
										$_l_AddCount:=0
										For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
											If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
												$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes; [CONTACTS_COMPANIES:145]Company_Code:1)
												If ($_l_CompanyRow>0)
													QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
													If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
														APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
														APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
														APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
														APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
													End if 
													If ([COMPANIES:2]Company_Name:2#"")
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+","+"Order"+$_at_OrderCodes{$_l_CompanyRow}+")")
													Else 
														APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+"Order"+$_at_OrderCodes{$_l_CompanyRow}+")")
													End if 
													APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
													APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
													APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
													$_l_AddCount:=$_l_AddCount+1
												End if 
											End if 
											NEXT RECORD:C51([CONTACTS_COMPANIES:145])
											
										End for 
									End if 
								Else 
									$_l_Index:=Records in selection:C76([CONTACTS:1])
								End if 
								NEXT RECORD:C51([CONTACTS:1])
							End for 
						End if 
					End if 
				: ("Contact:"=$_t_SearchCriteria)
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
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
									If (SD2_l_StopSearch=0)
										$_t_SearchWithAt:=Sel_AtSign(vSurname)
										QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
										If (SD2_l_StopSearch=0)
											If (VTitle#"")
												$_t_SearchWithAt:=Sel_AtSign(vTitle)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
											End if 
										End if 
									End if 
									
								: (VSurname#"")
									$_t_SearchWithAt:=Sel_AtSign(VSurname)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
									If (SD2_l_StopSearch=0)
										If (VTitle#"")
											If (SD2_l_StopSearch=0)
												$_t_SearchWithAt:=Sel_AtSign(vTitle)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
											End if 
										End if 
									End if 
								: (VForename#"")
									
									$_t_SearchWithAt:=Sel_AtSign(vForename)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithAt; *)
									If (SD2_l_StopSearch=0)
										//there was not a first and surname entered
										QUERY:C277([CONTACTS:1];  | ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
										If (SD2_l_StopSearch=0)
											If (VTitle#"")
												If (SD2_l_StopSearch=0)
													$_t_SearchWithAt:=Sel_AtSign(vTitle)
													QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
												End if 
											End if 
										End if 
									End if 
									
									//``````````````
								Else 
									$_t_SearchWithAt:=Sel_AtSign($_t_SearchValue)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
							End case 
							
						End if 
						//ORDER BY([CONTACTS];[CONTACTS]Surname;[CONTACTS]Forename;>)
						
						For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
							If (SD2_l_StopSearch=0)
								QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
								QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
								
								APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
								APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
								APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
								APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
								If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
									
									
									If ([COMPANIES:2]Company_Name:2#"")
										APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
									Else 
										APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
									End if 
									APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
									APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
									APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
								Else 
									$_l_AddCount:=0
									For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
										If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
											If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
												APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
												APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
												APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
												APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
											End if 
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
											End if 
											APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
											APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
											APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
											$_l_AddCount:=$_l_AddCount+1
										End if 
										NEXT RECORD:C51([CONTACTS_COMPANIES:145])
										
									End for 
								End if 
								$_l_SizeofArray:=Size of array:C274(SD2_at_FoundNameCode)
								If (Size of array:C274(SD2_at_FoundNames)#$_l_SizeofArray) | (Size of array:C274(SD2_al_FoundNameID)#$_l_SizeofArray) | (Size of array:C274(SD2_at_FoundDataInfo)#$_l_SizeofArray) | (Size of array:C274(Sd2_at_FoundNameCompany)#$_l_SizeofArray) | (Size of array:C274(SD2_al_FoundNameCLass)#$_l_SizeofArray) | (Size of array:C274(SD2_abo_FoundNameSelect)#$_l_SizeofArray)
									//TRACE
								End if 
								
								
							Else 
								$_l_Index:=Records in selection:C76([CONTACTS:1])
							End if 
							NEXT RECORD:C51([CONTACTS:1])
						End for 
					End if 
				: ("Company:"=$_t_SearchCriteria)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
						
						If (Records in selection:C76([COMPANIES:2])=0)
							QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=$_t_SearchValue+"@")
						End if 
						If (SD2_l_StopSearch=0)
							SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
							CREATE EMPTY SET:C140([CONTACTS:1]; "$Set1")
							$_l_CountCompanyCodes:=Size of array:C274($_at_CompanyCodes)
							ARRAY TEXT:C222($_at_CompanyCodes2; 0)
							For ($_l_Index; 1; $_l_CountCompanyCodes)
								If (SD2_l_StopSearch=0)
									$_l_CompanyRow:=Find in array:C230($_at_CompanyCodes2; $_at_CompanyCodes{$_l_Index})
									If ($_l_CompanyRow<0)
										APPEND TO ARRAY:C911($_at_CompanyCodes2; $_at_CompanyCodes{$_l_Index})
										If ($_at_CompanyCodes{$_l_Index}#"")
											QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_at_CompanyCodes{$_l_Index}; *)
											QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
											SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
											
											QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
											CREATE SET:C116([CONTACTS:1]; "$Set3")
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_at_CompanyCodes{$_l_Index})
											CREATE SET:C116([CONTACTS:1]; "$set2")
											UNION:C120("$Set3"; "$Set2"; "$Set2")
											UNION:C120("$Set1"; "$Set2"; "$Set1")
										End if 
									End if 
								Else 
									$_l_Index:=$_l_CountCompanyCodes
								End if 
							End for 
							USE SET:C118("$set1")
							
							ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
							
							For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
								If (SD2_l_StopSearch=0)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
									APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
									APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
									If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
										
										
										If ([COMPANIES:2]Company_Name:2#"")
											APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
										Else 
											APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
										End if 
										APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
										APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
										APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
									Else 
										$_l_AddCount:=0
										For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
											If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
												QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
												If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
													APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
													APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
													APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
													APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
												End if 
												If ([COMPANIES:2]Company_Name:2#"")
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
												Else 
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
												End if 
												APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
												APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
												APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
												$_l_AddCount:=$_l_AddCount+1
											End if 
											NEXT RECORD:C51([CONTACTS_COMPANIES:145])
											
										End for 
									End if 
								Else 
									$_l_Index:=Records in selection:C76([CONTACTS:1])
								End if 
								NEXT RECORD:C51([CONTACTS:1])
							End for 
						End if 
					End if 
				Else   //No specific criteria has been set for the search..
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_SearchValue+"@")
					If (SD2_l_StopSearch=0)
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
									If (SD2_l_StopSearch=0)
										$_t_SearchWithAt:=Sel_AtSign(vSurname)
										QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
										If (VTitle#"")
											If (SD2_l_StopSearch=0)
												$_t_SearchWithAt:=Sel_AtSign(vTitle)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
											End if 
										End if 
									End if 
								: (VSurname#"")
									$_t_SearchWithAt:=Sel_AtSign(VSurname)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
									If (SD2_l_StopSearch=0)
										If (VTitle#"")
											$_t_SearchWithAt:=Sel_AtSign(vTitle)
											If (SD2_l_StopSearch=0)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
											End if 
										End if 
									End if 
								: (VForename#"")
									$_t_SearchWithAt:=Sel_AtSign(vForename)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Forename:4=$_t_SearchWithAt; *)
									If (SD2_l_StopSearch=0)
										//there was not a first and surname entered
										QUERY:C277([CONTACTS:1];  | ; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
										If (SD2_l_StopSearch=0)
											If (VTitle#"")
												$_t_SearchWithAt:=Sel_AtSign(vTitle)
												QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Title:3=$_t_SearchWithAt)
											End if 
										End if 
									End if 
									//``````````````
								Else 
									$_t_SearchWithAt:=Sel_AtSign($_t_SearchValue)
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Surname:5=$_t_SearchWithAt)
							End case 
							
						End if 
						If (SD2_l_StopSearch=0)
							If (Records in selection:C76([CONTACTS:1])>0)
								CREATE SET:C116([CONTACTS:1]; "$Set1")
							Else 
								CREATE EMPTY SET:C140([CONTACTS:1]; "$Set1")
							End if 
							ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; [CONTACTS:1]Forename:4; >)
							
							For ($_l_Index; 1; Records in selection:C76([CONTACTS:1]))
								If (SD2_l_StopSearch=0)
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
									APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
									APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
									APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
									If (Records in selection:C76([CONTACTS_COMPANIES:145])<=1)
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
										
										
										If ([COMPANIES:2]Company_Name:2#"")
											APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
										Else 
											APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
										End if 
										APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
										APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
										APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
									Else 
										$_l_AddCount:=0
										For ($_l_ContactsCompaniesIndex; 1; Records in selection:C76([CONTACTS_COMPANIES:145]))
											
											If ([CONTACTS_COMPANIES:145]Company_Code:1#"")
												QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
												If ($_l_AddCount>0)  //add an extra line for the same contact(should not really happen)
													APPEND TO ARRAY:C911($_at_SortOrder; [CONTACTS:1]Surname:5+""+[CONTACTS:1]Forename:4)
													APPEND TO ARRAY:C911(SD2_at_FoundNameCode; [CONTACTS:1]Contact_Code:2)
													APPEND TO ARRAY:C911(SD2_at_FoundNames; [CONTACTS:1]Contact_Name:31)
													APPEND TO ARRAY:C911(SD2_al_FoundNameID; [CONTACTS:1]x_ID:33)
												End if 
												If ([COMPANIES:2]Company_Name:2#"")
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
												Else 
													APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
												End if 
												APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS_COMPANIES:145]Company_Code:1)
												APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
												APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
												$_l_AddCount:=$_l_AddCount+1
											End if 
											NEXT RECORD:C51([CONTACTS_COMPANIES:145])
											
										End for 
										If ($_l_AddCount=0)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
											
											
											If ([COMPANIES:2]Company_Name:2#"")
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "("+[COMPANIES:2]Company_Name:2+")")
											Else 
												APPEND TO ARRAY:C911(SD2_at_FoundDataInfo; "")
											End if 
											APPEND TO ARRAY:C911(Sd2_at_FoundNameCompany; [CONTACTS:1]Company_Code:1)
											APPEND TO ARRAY:C911(SD2_al_FoundNameCLass; 0)  //(not passed)
											APPEND TO ARRAY:C911(SD2_abo_FoundNameSelect; False:C215)  //(not passed)
											
										End if 
										
									End if 
								Else 
									$_l_Index:=Records in selection:C76([CONTACTS:1])
								End if 
								$_l_SizeofArray:=Size of array:C274(SD2_at_FoundNameCode)
								If (Size of array:C274(SD2_at_FoundNames)#$_l_SizeofArray) | (Size of array:C274(SD2_al_FoundNameID)#$_l_SizeofArray) | (Size of array:C274(SD2_at_FoundDataInfo)#$_l_SizeofArray) | (Size of array:C274(Sd2_at_FoundNameCompany)#$_l_SizeofArray) | (Size of array:C274(SD2_al_FoundNameCLass)#$_l_SizeofArray) | (Size of array:C274(SD2_abo_FoundNameSelect)#$_l_SizeofArray)
									//TRACE
								End if 
								NEXT RECORD:C51([CONTACTS:1])
							End for 
						End if 
					End if 
			End case 
		Else 
			REDUCE SELECTION:C351([CONTACTS:1]; 0)
	End case 
	If (SD2_l_StopSearch=0)
		While (Semaphore:C143("$SD2_SearchGettingAnswer"))
			DelayTicks(2)
		End while 
		SORT ARRAY:C229($_at_SortOrder; SD2_at_FoundNameCode; SD2_at_FoundNames; SD2_al_FoundNameID; SD2_at_FoundDataInfo; Sd2_at_FoundNameCompany; SD2_al_FoundNameCLass; SD2_abo_FoundNameSelect)
		If ($3>0)
			VARIABLE TO VARIABLE:C635($3; SD2_at_FoundNameCode; SD2_at_FoundNameCode; SD2_at_FoundNames; SD2_at_FoundNames; SD2_al_FoundNameID; SD2_al_FoundNameID; SD2_at_FoundDataInfo; SD2_at_FoundDataInfo; Sd2_at_FoundNameCompany; Sd2_at_FoundNameCompany; SD2_al_FoundNameCLass; SD2_al_FoundNameCLass; SD2_abo_FoundNameSelect; SD2_abo_FoundNameSelect)
			
			
		End if 
		SET PROCESS VARIABLE:C370($3; SD2_l_EmailCalledBack; -99)
		SET PROCESS VARIABLE:C370($3; SRCH_T_ParamPassed; "")
		SET PROCESS VARIABLE:C370($3; SRCH_t_SearchValue; "")
		
		POST OUTSIDE CALL:C329($3)  //Added 20/10/08 v631b120a -kmw (i think this line missing was one of the reasons why it wasn't resetting scroll bars which was obviously the intent of -99 process var set)
		
		CLEAR SEMAPHORE:C144("$SD2_SearchGettingAnswer")
		
	End if 
	
End if 
ERR_MethodTrackerReturn("SD2_PersonAddQueryProcess"; $_t_oldMethodName)
