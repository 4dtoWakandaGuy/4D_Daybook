//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_ShowContactCCards
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ReadOnlyState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_ShowContactCCards")
If ([ORDERS:24]Contact_Code:2#"") & ([ORDERS:24]Company_Code:1#"")
	If ([CONTACTS:1]Contact_Code:2#[ORDERS:24]Contact_Code:2)
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
	End if 
	If ([CONTACTS:1]x_ID:33=0)
		$_bo_ReadOnlyState:=Read only state:C362([CONTACTS:1])
		READ WRITE:C146([CONTACTS:1])
		[CONTACTS:1]x_ID:33:=AA_GetNextID(->[CONTACTS:1]x_ID:33)
		UNLOAD RECORD:C212([CONTACTS:1])
		If ($_bo_ReadOnlyState)
			READ ONLY:C145([CONTACTS:1])
		End if 
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
	End if 
	If ([ORDERS:24]Contact_Code:2#"")
		CCM_ShowContactCards([ORDERS:24]Contact_Code:2; [CONTACTS:1]x_ID:33; [ORDERS:24]Company_Code:1)
		
	End if 
Else 
	Gen_Alert("You must enter a contact onto the order first")
	
End if 
ERR_MethodTrackerReturn("ORD_ShowContactCCards"; $_t_oldMethodName)