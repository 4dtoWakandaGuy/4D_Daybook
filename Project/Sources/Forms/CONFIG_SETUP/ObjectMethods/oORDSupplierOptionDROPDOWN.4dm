If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.oORDSupplierOptionDROPDOWN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DF_at_SupplierOption;0)
	C_LONGINT:C283($_l_Event; $_l_Setting; DF_l_SupplierOption)
	C_TEXT:C284($_t_oldMethodName; DF_t_SupplierOption)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oORDSupplierOptionDROPDOWN")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oORDSupplierOptionDROPDOWN"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		DF_t_SupplierOption:=DF_at_SupplierOption{DF_at_SupplierOption}
		$_l_Setting:=0
		DF_l_SupplierOption:=$_l_Setting ?+ DF_at_SupplierOption
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oORDSupplierOptionDROPDOWN"; $_t_oldMethodName)
