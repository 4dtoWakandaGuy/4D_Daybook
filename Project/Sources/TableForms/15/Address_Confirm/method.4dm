If (False:C215)
	//Table Form Method Name: [USER]Address_Confirm
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
	C_BOOLEAN:C305(DB_bo_NoLoad; LAB_bo_Modified)
	C_LONGINT:C283($_l_event; LAB_l_Continue)
	C_TEXT:C284($_t_oldMethodName; LAB_AddressMessage)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Address_Confirm"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Address_Confirm")
		WS_AutoscreenSize(3; 220; 355)
		LAB_l_Continue:=0
		LAB_bo_Modified:=False:C215
		
		If (LAB_AddressMessage="")
			LAB_AddressMessage:="Confirm Delivery Address..."
		End if 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].Address_Confirm"; $_t_oldMethodName)
