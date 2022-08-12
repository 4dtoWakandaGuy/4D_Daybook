If (False:C215)
	//Table Form Method Name: [USER]List_Picker
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(AA_at_ListPickItem;0)
	//ARRAY TEXT(AA_t_ListPickItem;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; AA_l_ListSelectedItem)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].List_Picker"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "List_Picker")
		AA_at_ListPickItem:=0
		AA_l_ListSelectedItem:=0
		WS_AutoscreenSize(3; 145; 230)
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].List_Picker"; $_t_oldMethodName)
