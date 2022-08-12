
If (False:C215)
	//Table Name:      Trigger on [ACCOUNT_BALANCES]
	//------------------ Trigger Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/10/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>BalanceUpdate; <>noBalanceCheck)
	C_LONGINT:C283($_l_event; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ACCOUNT_BALANCES]")


$0:=0
$_l_event:=Trigger event:C369
C_TEXT:C284($_t_oldMethodName)
C_BOOLEAN:C305(<>BalanceUpdate; <>noBalanceCheck)
Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ACCOUNT_BALANCES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=ACC_Buildunique([ACCOUNT_BALANCES:34]Account_Code:2; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
			If ([ACCOUNT_BALANCES:34]x_ID:7=0)
				[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
			End if 
			
			AUTO_AUDIT(->[ACCOUNT_BALANCES:34]; Field:C253(->[ACCOUNT_BALANCES:34]Account_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
			If (Not:C34(<>noBalanceCheck))
				ProcessServices_CreateRecord(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]x_ID:7; "Check Balance")  // 16/04/02 pb
			End if 
		End if 
		
	: ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving old/existing record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ACCOUNT_BALANCES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=ACC_Buildunique([ACCOUNT_BALANCES:34]Account_Code:2; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
			If ([ACCOUNT_BALANCES:34]x_ID:7=0)
				[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
			End if 
			If (Not:C34(<>noBalanceCheck))
				ProcessServices_CreateRecord(->[ACCOUNT_BALANCES:34]; ->[ACCOUNT_BALANCES:34]x_ID:7; "Check Balance")  // 16/04/02 pb
			End if 
			
			AUTO_AUDIT(->[ACCOUNT_BALANCES:34]; Field:C253(->[ACCOUNT_BALANCES:34]Account_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ACCOUNT_BALANCES]"; $_l_event)
		If (DB_TableTriggerEnabled)
			AUTO_AUDIT_DEL(->[ACCOUNT_BALANCES:34]; Field:C253(->[ACCOUNT_BALANCES:34]Account_Code:2); Process_Name(Current process:C322); <>PER_t_CurrentUserInitials)
		End if 
		
		
End case 



ERR_MethodTrackerReturn("TRIGGER [ACCOUNT_BALANCES]"; $_t_oldMethodName)
