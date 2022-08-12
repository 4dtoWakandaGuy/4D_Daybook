
If (False:C215)
	//Table Name:      Trigger on [ACC_Bank_Statements]
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
	C_BOOLEAN:C305(<>SYS_bo_inTrigger)
	C_LONGINT:C283($_l_event; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

C_TEXT:C284($_t_oldMethodName)
$0:=0
$_l_event:=Trigger event:C369
<>SYS_bo_inTrigger:=True:C214

Case of 
		
		
	: ($_l_event=On Saving New Record Event:K3:1) | ($_l_event=On Saving Existing Record Event:K3:2)  //WT - audit for saving new record
		$_t_oldMethodName:=ERR_MethodTracker("TRIGGER [ACC_BANK_Statements]"; Trigger event:C369)
		If (DB_TableTriggerEnabled)
			NaNFixer  // 12/03/04 PB
			If ([ACC_Bank_Statements:198]x_ID:1=0)
				
				[ACC_Bank_Statements:198]x_ID:1:=AA_GetNextID(->[ACC_Bank_Statements:198]x_ID:1)
				
			End if 
		End if 
	: ($_l_event=On Deleting Record Event:K3:3)  //WT - audit for deleting record
End case 


ERR_MethodTrackerReturn("TRIGGER  [ACC_Bank_Statements]"; $_t_oldMethodName)
