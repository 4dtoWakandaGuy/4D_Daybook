If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_DiaryLinks.oLBDiaryCalls
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_DiaryRelations;0)
	//ARRAY LONGINT(SD2_al_RelatedCodeFieldNumber;0)
	//ARRAY LONGINT(SD2_al_RelatedtableNumber;0)
	//ARRAY LONGINT(SD2_al_RelationshipFields;0)
	//ARRAY LONGINT(SD2_al_RelationshipIDS;0)
	//ARRAY LONGINT(SD2_al_RelationshipTables;0)
	//ARRAY TEXT(SD2_at_RelatedRecordNames;0)
	//ARRAY TEXT(SD2_at_RelationshipCodes;0)
	//ARRAY TEXT(SD2_at_RelationShipnames;0)
	//ARRAY TEXT(SD2_at_RelationShipnamesOLD;0)
	//ARRAY TEXT(SD2_at_RelationShipSelector;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_RelationRow; $_l_RelationRow2; $_l_Row; SD2_l_ListID)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryLinks.oLBDiaryCalls"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)  //open the related record
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(SD2_lb_DiaryRelations; $_l_Column; $_l_Row)
		If ($_l_Row>0) & ($_l_Row<=Size of array:C274(SD2_at_RelationShipnames))
			Case of 
					
				: ($_l_Column=2) & ([DIARY:12]Done:14=False:C215)
					
					LB_SetChoiceList("SD2_l_ListID"; ->SD2_at_RelationShipSelector; ->SD2_at_RelationShipnames)
					LB_SetEnterable(->SD2_lb_DiaryRelations; True:C214; 2)
					LB_SetEnterable(->SD2_lb_DiaryRelations; True:C214; 1)
					LB_GoToCell(->SD2_lb_DiaryRelations; 2; $_l_Row)
				: ($_l_Column=1)
					//SD2_at_RelationShipnames
					If (SD2_at_RelationshipCodes{$_l_Row}#"")
						LB_SetEnterable(->SD2_lb_DiaryRelations; False:C215; 0)
					End if 
				Else 
					LB_SetEnterable(->SD2_lb_DiaryRelations; False:C215; 0)
			End case 
		End if 
	: ($_l_event=On Data Change:K2:15)
		LISTBOX GET CELL POSITION:C971(SD2_lb_DiaryRelations; $_l_Column; $_l_Row)
		If ($_l_Row>0) & ($_l_Row<=Size of array:C274(SD2_at_RelationShipnames))
			Case of 
				: ($_l_Column=1)
					If (SD2_at_RelationShipnames{$_l_Row}#SD2_at_RelationShipnamesOLD{$_l_Row})
						If (SD2_at_RelationShipnamesOLD{$_l_Row}="")  //that is ok
							$_l_RelationRow:=Find in array:C230(SD2_at_RelationShipSelector; SD2_at_RelationShipnames{$_l_Row})
							SD2_at_RelationShipnamesOLD{$_l_Row}:=SD2_at_RelationShipnames{$_l_Row}
							SD2_al_RelationshipTables{$_l_Row}:=SD2_al_RelatedtableNumber{$_l_RelationRow}
							SD2_al_RelationshipFields{$_l_Row}:=SD2_al_RelatedCodeFieldNumber{$_l_RelationRow}
							SD2_al_RelationshipIDS{$_l_Row}:=0
						Else 
							If (SD2_at_RelationshipCodes{$_l_Row}="")
								//that is ok
								SD2_at_RelationShipnamesOLD{$_l_Row}:=SD2_at_RelationShipnames{$_l_Row}
								$_l_RelationRow:=Find in array:C230(SD2_at_RelationShipSelector; SD2_at_RelationShipnames{$_l_Row})
								SD2_al_RelationshipTables{$_l_Row}:=SD2_al_RelatedtableNumber{$_l_RelationRow}
								SD2_al_RelationshipFields{$_l_Row}:=SD2_al_RelatedCodeFieldNumber{$_l_RelationRow}
								SD2_al_RelationshipIDS{$_l_Row}:=0
							Else 
								//change it back
								SD2_at_RelationShipnames{$_l_Row}:=SD2_at_RelationShipnamesOLD{$_l_Row}
							End if 
							
						End if 
					End if 
					
				: ($_l_Column=2)
					If (SD2_at_RelationShipnames{$_l_Row}#SD2_at_RelationShipnamesOLD{$_l_Row})
						If (SD2_at_RelationShipnamesOLD{$_l_Row}="")  //that is ok
							$_l_RelationRow:=Find in array:C230(SD2_at_RelationShipSelector; SD2_at_RelationShipnames{$_l_Row})
							SD2_at_RelationShipnamesOLD{$_l_Row}:=SD2_at_RelationShipnames{$_l_Row}
							SD2_al_RelationshipTables{$_l_Row}:=SD2_al_RelatedtableNumber{$_l_RelationRow}
							SD2_al_RelationshipFields{$_l_Row}:=SD2_al_RelatedCodeFieldNumber{$_l_RelationRow}
							SD2_al_RelationshipIDS{$_l_Row}:=0
						Else 
							If (SD2_at_RelationshipCodes{$_l_Row}="")
								//that is ok
								SD2_at_RelationShipnamesOLD{$_l_Row}:=SD2_at_RelationShipnames{$_l_Row}
								$_l_RelationRow:=Find in array:C230(SD2_at_RelationShipSelector; SD2_at_RelationShipnames{$_l_Row})
								SD2_al_RelationshipTables{$_l_Row}:=SD2_al_RelatedtableNumber{$_l_RelationRow}
								SD2_al_RelationshipFields{$_l_Row}:=SD2_al_RelatedCodeFieldNumber{$_l_RelationRow}
								SD2_al_RelationshipIDS{$_l_Row}:=0
							Else 
								//change it back
								SD2_at_RelationShipnames{$_l_Row}:=SD2_at_RelationShipnamesOLD{$_l_Row}
							End if 
							
						End if 
					End if 
					
					//Editing the code-
					If (SD2_at_RelationShipnames{$_l_Row}#"")
						//we know the table to look up so -the code here is similar to Diary_In LPD where appropriate
						//but note that we do not update the relationship RECORDS till we save the diary record
						
						
						Case of 
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[COMPANIES:2]))
								//This method assumes there is only one company and one contact..this needs changing to support multiples
								$_l_RelationRow:=Find in array:C230(SD2_al_RelationshipTables; 1)  //Relation to contact
								If ($_l_RelationRow>0)
									Check_Company(->SD2_at_RelationshipCodes{$_l_Row}; ->SD2_at_RelationshipCodes{$_l_RelationRow}; ->[DIARY:12])
								Else 
									Check_Company(->SD2_at_RelationshipCodes{$_l_Row}; ->SD2_at_RelationshipCodes{0}; ->[DIARY:12])
									SD2_at_RelationshipCodes{0}:=""
								End if 
								If (SD2_at_RelationshipCodes{$_l_Row}#"")
									QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=SD2_at_RelationshipCodes{$_l_Row})
									SD2_al_RelationshipIDS{$_l_Row}:=[COMPANIES:2]x_ID:63
									[DIARY:12]Status:30:=[COMPANIES:2]Status:12
									SD2_at_RelatedRecordNames{$_l_Row}:=SD2_GetRecordName(->[COMPANIES:2])
									If ($_l_RelationRow>0)
										Check_ContDef(->SD2_at_RelationshipCodes{$_l_Row}; ->SD2_at_RelationshipCodes{0})
										$_t_ContactCode:=SD2_at_RelationshipCodes{0}
										SD2_at_RelationshipCodes{0}:=""
										If ($_t_ContactCode#"")
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
											SD2_al_RelationshipIDS{$_l_RelationRow}:=[CONTACTS:1]x_ID:33
											SD2_at_RelationshipCodes{$_l_RelationRow}:=[CONTACTS:1]Contact_Code:2
											SD2_at_RelatedRecordNames{$_l_RelationRow}:=SD2_GetRecordName(->[CONTACTS:1])
										End if 
									Else 
										//There is no contact on the relations
										Check_ContDef(->SD2_at_RelationshipCodes{$_l_Row}; ->SD2_at_RelationshipCodes{0})
										$_t_ContactCode:=SD2_at_RelationshipCodes{0}
										SD2_at_RelationshipCodes{0}:=""
										If ($_t_ContactCode#"")
											QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
											$_l_RelationRow2:=Find in array:C230(SD2_at_RelationShipSelector; "Contact")
											APPEND TO ARRAY:C911(SD2_at_RelationshipCodes; [CONTACTS:1]Contact_Code:2)
											APPEND TO ARRAY:C911(SD2_at_RelationShipnames; "Contact")
											APPEND TO ARRAY:C911(SD2_at_RelationShipnamesOLD; "Contact")
											APPEND TO ARRAY:C911(SD2_al_RelationshipTables; SD2_al_RelatedtableNumber{$_l_RelationRow2})
											APPEND TO ARRAY:C911(SD2_al_RelationshipFields; SD2_al_RelatedCodeFieldNumber{$_l_RelationRow2})
											APPEND TO ARRAY:C911(SD2_al_RelationshipIDS; [CONTACTS:1]x_ID:33)
											APPEND TO ARRAY:C911(SD2_at_RelatedRecordNames; SD2_GetRecordName(->[CONTACTS:1]))
										End if 
									End if 
									
								Else 
									SD2_al_RelationshipIDS{$_l_Row}:=0
									SD2_at_RelatedRecordNames{$_l_Row}:=""
									
								End if 
								
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[CONTACTS:1]))
								$_l_RelationRow:=Find in array:C230(SD2_al_RelationshipTables; 2)  //Relation to company
								If ($_l_RelationRow>0)
									Check_Contact(->SD2_at_RelationshipCodes{$_l_Row}; ->SD2_at_RelationshipCodes{$_l_RelationRow}; ->[DIARY:12])
								Else 
									Check_Contact(->SD2_at_RelationshipCodes{$_l_Row}; ->SD2_at_RelationshipCodes{0}; ->[DIARY:12])
									SD2_at_RelationshipCodes{0}:=""
								End if 
								
								If (SD2_at_RelationshipCodes{$_l_Row}#"")  //the contact code is modified
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_RelationshipCodes{$_l_Row})
									SD2_al_RelationshipIDS{$_l_Row}:=[CONTACTS:1]x_ID:33
									SD2_at_RelatedRecordNames{$_l_Row}:=SD2_GetRecordName(->[CONTACTS:1])
									
								End if 
								
								
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[CONTRACTS:17]))
								Check_MinorNC(->SD2_at_RelationshipCodes{$_l_Row}; "Contract"; ->[CONTRACTS:17]; ->[CONTRACTS:17]Contract_Code:3; ->[CONTRACTS:17]Company_Code:1)  //5
								If (SD2_at_RelationshipCodes{$_l_Row}#"")
									$_l_RelationRow2:=Find in array:C230(SD2_at_RelationShipSelector; "Contract")
									QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=SD2_at_RelationshipCodes{$_l_Row})
									APPEND TO ARRAY:C911(SD2_at_RelationshipCodes; [CONTRACTS:17]Contract_Code:3)
									APPEND TO ARRAY:C911(SD2_at_RelationShipnames; "Contract")
									APPEND TO ARRAY:C911(SD2_at_RelationShipnamesOLD; "Contract")
									APPEND TO ARRAY:C911(SD2_al_RelationshipTables; SD2_al_RelatedtableNumber{$_l_RelationRow2})
									APPEND TO ARRAY:C911(SD2_al_RelationshipFields; SD2_al_RelatedCodeFieldNumber{$_l_RelationRow2})
									APPEND TO ARRAY:C911(SD2_al_RelationshipIDS; [CONTRACTS:17]x_ID:12)
									APPEND TO ARRAY:C911(SD2_at_RelatedRecordNames; SD2_GetRecordName(->[CONTRACTS:17]))
									$_t_CompanyCode:=[CONTRACTS:17]Company_Code:1
									$_l_RelationRow:=Find in array:C230(SD2_al_RelationshipTables; 2)  //Relation to company
									If ($_l_RelationRow>0)
										If (SD2_at_RelationshipCodes{$_l_RelationRow}#$_t_CompanyCode)
											QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
											$_l_RelationRow2:=Find in array:C230(SD2_at_RelationShipSelector; "Contract")
											QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=SD2_at_RelationshipCodes{$_l_Row})
											APPEND TO ARRAY:C911(SD2_at_RelationshipCodes; [COMPANIES:2]Company_Code:1)
											APPEND TO ARRAY:C911(SD2_at_RelationShipnames; "Contract Company")
											APPEND TO ARRAY:C911(SD2_at_RelationShipnamesOLD; "Contract Company")
											APPEND TO ARRAY:C911(SD2_al_RelationshipTables; SD2_al_RelatedtableNumber{$_l_RelationRow2})
											APPEND TO ARRAY:C911(SD2_al_RelationshipFields; SD2_al_RelatedCodeFieldNumber{$_l_RelationRow2})
											APPEND TO ARRAY:C911(SD2_al_RelationshipIDS; [CONTRACTS:17]x_ID:12)
											APPEND TO ARRAY:C911(SD2_at_RelatedRecordNames; SD2_GetRecordName(->[COMPANIES:2]))
											
											
										End if 
									Else 
										QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
										$_l_RelationRow2:=Find in array:C230(SD2_at_RelationShipSelector; "Contract")
										QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=SD2_at_RelationshipCodes{$_l_Row})
										APPEND TO ARRAY:C911(SD2_at_RelationshipCodes; [COMPANIES:2]Company_Code:1)
										APPEND TO ARRAY:C911(SD2_at_RelationShipnames; "Contract Company")
										APPEND TO ARRAY:C911(SD2_at_RelationShipnamesOLD; "Contract Company")
										APPEND TO ARRAY:C911(SD2_al_RelationshipTables; SD2_al_RelatedtableNumber{$_l_RelationRow2})
										APPEND TO ARRAY:C911(SD2_al_RelationshipFields; SD2_al_RelatedCodeFieldNumber{$_l_RelationRow2})
										APPEND TO ARRAY:C911(SD2_al_RelationshipIDS; [CONTRACTS:17]x_ID:12)
										APPEND TO ARRAY:C911(SD2_at_RelatedRecordNames; SD2_GetRecordName(->[COMPANIES:2]))
										
									End if 
								End if 
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[DIARY:12]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[DOCUMENTS:7]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[INVOICES:39]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[JOB PERSONNEL:48]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[JOB_STAGES:47]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[JOBS:26]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[ORDER_ITEMS:25]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[ORDERS:24]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[PRODUCTS:9]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[PROJECTS:89]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[PURCHASE_ORDERS:57]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[SERVICE_CALLS:20]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[STOCK_MOVEMENTS:40]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[SUBSCRIPTIONS:93]))
							: (SD2_al_RelationshipTables{$_l_Row}=Table:C252(->[TRANSACTION_BATCHES:30]))
								
								
						End case 
					End if 
			End case 
		End if 
	Else 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryLinks.oLBDiaryCalls"; $_t_oldMethodName)
