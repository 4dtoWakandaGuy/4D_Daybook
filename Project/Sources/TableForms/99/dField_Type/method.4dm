If (False:C215)
	//Table Form Method Name: [CUSTOM_FIELD_DEFINITiONS]dField_Type
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; r0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [CUSTOM_FIELD_DEFINITiONS].dField_Type"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	OpenHelp(Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]); "dField_Type")
	r0:=1
	INT_SetDialog
	
End if 
ERR_MethodTrackerReturn("FM [CUSTOM_FIELD_DEFINITiONS].dField_Type"; $_t_oldMethodName)
