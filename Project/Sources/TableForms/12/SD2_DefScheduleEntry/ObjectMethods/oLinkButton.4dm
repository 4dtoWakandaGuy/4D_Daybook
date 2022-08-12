If (False:C215)
	//object Name: [DIARY]SD2_DefScheduleEntry.oLinkButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_DisplayDiaryField;0)
	//ARRAY LONGINT(SD2_al_DisplayRecordID;0)
	//ARRAY LONGINT(SD2_al_DisplayRelationTable;0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY LONGINT(SD2_al_relatedContactID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordID;0)
	//ARRAY LONGINT(SD2_al_RelatedRecordTableNum;0)
	//ARRAY LONGINT(SD2_al_RelatedtoDiaryfield;0)
	//ARRAY LONGINT(SD2_al_relationDiaryField;0)
	//ARRAY LONGINT(SD2_al_RelationTable;0)
	//ARRAY TEXT(SD2_at_DisplayrecordCode;0)
	//ARRAY TEXT(SD2_at_DisplayRelations;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeComb;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_InviteStati;0)
	//ARRAY TEXT(SD2_at_RelatedContactName;0)
	//ARRAY TEXT(SD2_at_RelatedContactsCodes;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedRecordName;0)
	//ARRAY TEXT(SD2_at_RelatedRecordType;0)
	//ARRAY TEXT(SD2_at_RelationNames;0)
	C_BOOLEAN:C305($_bo_ContactisAlreadyAdded; $_bo_RecordisAlreadyAdded)
	C_LONGINT:C283($_l_ArraySize; $_l_ContactIndex; $_l_CurrentWinRefOLD; $_l_event; $_l_FieldNumber; $_l_RelatedRecordIndex; $_l_RelationFieldRow; $_l_RelationsIndex; $_l_StatusRow; $_l_TableNumber; $_l_TableRow)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_Ptr_DiaryField; $_ptr_Table)
	C_TEXT:C284($_t_EmailAddress; $_t_oldMethodName; $_t_WindowTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_DefScheduleEntry.oLinkButton"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		$_t_WindowTitle:=Get window title:C450
		
		WIN_l_CurrentWinRef:=Open window:C153(40; 100; 250; 280+40; 34)
		
		DIALOG:C40("SD2_DiaryLinks")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		$_l_TableNumber:=Table:C252(->[DIARY:12])
		
		For ($_l_RelationsIndex; 1; Size of array:C274(SD2_at_DisplayRelations))
			If (SD2_at_DisplayRelations{$_l_RelationsIndex}#"")
				If (SD2_al_DisplayDiaryField{$_l_RelationsIndex}#0)
					$_Ptr_DiaryField:=Field:C253($_l_TableNumber; SD2_al_DisplayDiaryField{$_l_RelationsIndex})
					$_Ptr_DiaryField->:=SD2_at_DisplayrecordCode{$_l_RelationsIndex}
					
					Case of 
						: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[COMPANIES:2]))  //make sure the company is added tot he invitees
							
						: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[CONTACTS:1]))  //make sure the contact is added to the invitees
							$_bo_ContactisAlreadyAdded:=False:C215
							For ($_l_ContactIndex; 1; Size of array:C274(SD2_al_relatedContactID))
								If (SD2_at_RelatedContactsCodes{$_l_ContactIndex}=SD2_at_DisplayrecordCode{$_l_RelationsIndex})
									$_bo_ContactisAlreadyAdded:=False:C215
									$_l_ContactIndex:=Size of array:C274(SD2_al_relatedContactID)
								End if 
							End for 
							If (Not:C34($_bo_ContactisAlreadyAdded))
								APPEND TO ARRAY:C911(SD2_al_relatedContactID; SD2_al_DisplayRecordID{$_l_RelationsIndex})
								APPEND TO ARRAY:C911(SD2_at_RelatedContactsCodes; SD2_at_DisplayrecordCode{$_l_RelationsIndex})
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD2_at_DisplayrecordCode{$_l_RelationsIndex})
								APPEND TO ARRAY:C911(SD2_at_RelatedContactName; [CONTACTS:1]Contact_Name:31)
								$_l_ArraySize:=Size of array:C274(SD2_at_RelatedContactName)
								$_t_EmailAddress:=[CONTACTS:1]Email_Address:35
								UNLOAD RECORD:C212([CONTACTS:1])
								//```
								
								APPEND TO ARRAY:C911(SD2_at_Invitees; SD2_at_RelatedContactName{$_l_ArraySize})
								APPEND TO ARRAY:C911(SD2_al_InviteeClass; 1)
								APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Contact")
								APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; $_t_EmailAddress)
								APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
								$_l_StatusRow:=Find in array:C230(SD2_al_InviteStati; SD2_al_InviteeStatus{Size of array:C274(SD2_al_InviteeStatus)})
								APPEND TO ARRAY:C911(SD2_at_InviteeStatus; SD2_at_InviteStati{$_l_StatusRow})
								APPEND TO ARRAY:C911(SD2_al_RecordID; SD2_al_relatedContactID{$_l_ArraySize})
								
								If (SD2_at_InviteeEmailAddress{Size of array:C274(SD2_at_InviteeEmailAddress)}#"")
									APPEND TO ARRAY:C911(SD2_at_InviteeComb; SD2_at_Invitees{Size of array:C274(SD2_at_Invitees)}+"  <"+SD2_at_InviteeEmailAddress{Size of array:C274(SD2_at_Invitees)}+">")
								Else 
									APPEND TO ARRAY:C911(SD2_at_InviteeComb; SD2_at_Invitees{Size of array:C274(SD2_at_Invitees)}+"  <"+"(No Email)"+">")
								End if 
								//``
							End if 
						Else 
							$_bo_RecordisAlreadyAdded:=False:C215
							For ($_l_RelatedRecordIndex; 1; Size of array:C274(SD2_al_RelatedRecordTableNum))
								If (SD2_al_RelatedRecordTableNum{$_l_RelatedRecordIndex}=SD2_al_RelationTable{$_l_RelationsIndex})
									If (SD2_al_RelatedRecordID{$_l_RelatedRecordIndex}=SD2_al_DisplayRecordID{$_l_RelationsIndex})
										$_bo_RecordisAlreadyAdded:=True:C214
										$_l_RelatedRecordIndex:=Size of array:C274(SD2_al_RelatedRecordTableNum)
										
									End if 
								End if 
							End for 
							
							If (Not:C34($_bo_RecordisAlreadyAdded))
								$_ptr_Table:=Table:C252(SD2_al_DisplayRelationTable{$_l_RelationsIndex})
								Case of 
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[ORDERS:24]))
										$_l_FieldNumber:=Field:C253(->[ORDERS:24]Order_Code:3)
										
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[PRODUCTS:9]))
										$_l_FieldNumber:=Field:C253(->[PRODUCTS:9]Product_Code:1)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[ORDER_ITEMS:25]))
										$_l_FieldNumber:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[PURCHASE_INVOICES:37]))
										$_l_FieldNumber:=Field:C253(->[PURCHASE_INVOICES:37]Purchase_Code:1)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[PURCHASE_INVOICE_ITEMS:158]))
										$_l_FieldNumber:=Field:C253(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[PURCHASE_ORDERS:57]))
										$_l_FieldNumber:=Field:C253(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[PURCHASE_ORDERS_ITEMS:169]))
										$_l_FieldNumber:=Field:C253(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[STOCK_MOVEMENTS:40]))
										$_l_FieldNumber:=Field:C253(->[STOCK_MOVEMENTS:40]Movement_Code:1)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[SERVICE_CALLS:20]))
										$_l_FieldNumber:=Field:C253(->[SERVICE_CALLS:20]Call_Code:4)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[INVOICES:39]))
										$_l_FieldNumber:=Field:C253(->[INVOICES:39]Invoice_Number:1)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[INVOICES_ITEMS:161]))
										$_l_FieldNumber:=Field:C253(->[INVOICES_ITEMS:161]ID:17)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[JOBS:26]))
										$_l_FieldNumber:=Field:C253(->[JOBS:26]Job_Code:1)
									: (SD2_al_DisplayRelationTable{$_l_RelationsIndex}=Table:C252(->[JOB_STAGES:47]))
										$_l_FieldNumber:=Field:C253(->[JOB_STAGES:47]Job_Stage_code:52)
								End case 
								
								
								
								
								
								APPEND TO ARRAY:C911(SD2_al_RelatedRecordTableNum; SD2_al_DisplayRelationTable{$_l_RelationsIndex})
								APPEND TO ARRAY:C911(SD2_al_RelatedRecordID; SD2_al_DisplayRecordID{$_l_RelationsIndex})
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; SD2_at_DisplayrecordCode{$_l_RelationsIndex})
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordName; SD2_at_DisplayRelations{$_l_RelationsIndex})
								
								$_l_TableRow:=Find in array:C230(SD2_al_RelationTable; SD2_al_DisplayRelationTable{$_l_RelationsIndex})
								If ($_l_TableRow>0)
									APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; SD2_at_RelationNames{$_l_TableRow})
									If (SD2_al_relationDiaryField{$_l_TableRow}>0)
										$_l_RelationFieldRow:=Find in array:C230(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_TableRow})
										If ($_l_RelationFieldRow<0)
											APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; SD2_al_relationDiaryField{$_l_TableRow})
											
										Else 
											APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
										End if 
									End if 
								Else 
									APPEND TO ARRAY:C911(SD2_at_RelatedRecordType; "Other...")
									APPEND TO ARRAY:C911(SD2_al_RelatedtoDiaryfield; 0)
								End if 
								
								
							End if 
					End case 
					//SELECTION TO ARRAY([xDiaryRelations]xTableNUM;SD2_al_RelatedRecordTableNum;[xDiaryRelations]xRecordID;SD2_al_RelatedRecordID;[xDiaryRelations]XRecord_Code;SD2_at_RelatedRecordCode;[xDiaryRelations]X_DisplayedName;SD2_at_RelatedRecordName)
					
					
					
				Else 
					//not in the diary field
				End if 
				
			End if 
		End for 
		//then before we dispose of SD2_at_DisplayRelations and its companions check there is nothing that should was removed..everything in the relationship arrays should be in that array.
		
		
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].SD2_DefScheduleEntry.oLinkButton"; $_t_oldMethodName)
