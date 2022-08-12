
If (False:C215)
	//Table Name:      Trigger on [TRANSACTIONS]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/04/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BLOB:C604(ACC_blb_UniqueID)
	C_BOOLEAN:C305(<>TransactionDisableValidation; ACC_bo_ReportPrefsLoaded)
	C_LONGINT:C283($_l_event; $_l_One; $_l_Zero; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_UniqueIDOLD)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTIONS]")


$0:=0


$_l_event:=Trigger event:C369
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)
		//TRACE
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			[TRANSACTIONS:29]Unique_StringIdent:28:=ACC_Buildunique([TRANSACTIONS:29]Account_Code:3; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
			[TRANSACTIONS:29]Unique_StringIdentTAX:29:=TRANS_BuildUniqueTAX
			
			If ([TRANSACTIONS:29]Transaction_ID:31=0)
				[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextID(->[TRANSACTIONS:29]Transaction_ID:31)
			End if 
			If (Not:C34(<>TransactionDisableValidation))
				ProcessServices_CreateRecord(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_ID:31; "Validate Transaction"; [TRANSACTIONS:29]Batch_Number:7)  // 18/11/02 NG
				TEXT TO BLOB:C554([TRANSACTIONS:29]Unique_StringIdent:28; ACC_blb_UniqueID; 3)
				
				$_l_One:=1
				ProcessServices_CreateRecord(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_ID:31; "Update account"; 1; 0; 0; True:C214; ->ACC_blb_UniqueID)  // 18/11/02 NG
			End if 
			AUTO_AUDIT(->[TRANSACTIONS:29]; Field:C253(->[TRANSACTIONS:29]Transaction_Type_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		//TRACE
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			
			If ([TRANSACTIONS:29]Transaction_ID:31=0)
				[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextID(->[TRANSACTIONS:29]Transaction_ID:31)
			End if 
			
			NaNFixer  // 12/03/04 PB
			[TRANSACTIONS:29]Unique_StringIdent:28:=ACC_Buildunique([TRANSACTIONS:29]Account_Code:3; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
			[TRANSACTIONS:29]Unique_StringIdentTAX:29:=TRANS_BuildUniqueTAX
			If (Not:C34(<>TransactionDisableValidation))
				ProcessServices_CreateRecord(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_ID:31; "Validate Transaction"; [TRANSACTIONS:29]Batch_Number:7)
				C_BLOB:C604(ACC_blb_UniqueID)  // 18/11/2002 NG
				// tell the system to update the old account balance
				$_t_UniqueIDOLD:=ACC_Buildunique(Old:C35([TRANSACTIONS:29]Account_Code:3); Old:C35([TRANSACTIONS:29]Analysis_Code:2); Old:C35([TRANSACTIONS:29]Period_Code:12); Old:C35([TRANSACTIONS:29]Layer_Code:23); Old:C35([TRANSACTIONS:29]Currency_Code:22))
				If ($_t_UniqueIDOLD#[TRANSACTIONS:29]Unique_StringIdent:28)
					TEXT TO BLOB:C554($_t_UniqueIDOLD; ACC_blb_UniqueID; 3)
					C_LONGINT:C283($_l_One)
					$_l_One:=-1
					ProcessServices_CreateRecord(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_ID:31; "Update account"; $_l_One; $_l_Zero; $_l_Zero; True:C214; ->ACC_blb_UniqueID)  // 18/11/02 NG
					TEXT TO BLOB:C554([TRANSACTIONS:29]Unique_StringIdent:28; ACC_blb_UniqueID; 3)
					$_l_One:=1
					ProcessServices_CreateRecord(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_ID:31; "Update account"; $_l_One; $_l_Zero; $_l_Zero; True:C214; ->ACC_blb_UniqueID)  // 18/11/02 NG
				Else 
					If (Old:C35([TRANSACTIONS:29]Amount:6)#[TRANSACTIONS:29]Amount:6) | (Old:C35([TRANSACTIONS:29]Tax_Amount:16)#[TRANSACTIONS:29]Tax_Amount:16) | (Old:C35([TRANSACTIONS:29]Total:17)#[TRANSACTIONS:29]Total:17)
						$_l_One:=-1
						ProcessServices_CreateRecord(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_ID:31; "Update account"; $_l_One; $_l_Zero; $_l_Zero; True:C214; ->ACC_blb_UniqueID)  // 18/11/02 NG
					End if 
					
				End if 
				[TRANSACTIONS:29]Unique_StringIdentTAX:29:=TRANS_BuildUniqueTAX
				
				
			End if 
			AUTO_AUDIT(->[TRANSACTIONS:29]; Field:C253(->[TRANSACTIONS:29]Transaction_Type_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [TRANSACTIONS]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[TRANSACTIONS:29]; Field:C253(->[TRANSACTIONS:29]Transaction_Type_Code:1); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			TEXT TO BLOB:C554([TRANSACTIONS:29]Unique_StringIdent:28; ACC_blb_UniqueID; 3)
			C_LONGINT:C283($_l_One)
			$_l_One:=-1
			
			ProcessServices_CreateRecord(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Transaction_ID:31; "Update account"; $_l_One; $_l_Zero; $_l_Zero; True:C214; ->ACC_blb_UniqueID)  // 18/11/02 NG
		End if 
		
End case 






ERR_MethodTrackerReturn("TRIGGER [TRANSACTIONS]"; $_t_oldMethodName)
