If (False:C215)
	//object Name: [USER]User_In.Variable35
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
	//ARRAY TEXT(DF_at_SupplierOption;0)
	C_LONGINT:C283($_l_event; $_l_Setting; DF_l_SupplierOption)
	C_TEXT:C284($_t_oldMethodName; DF_t_SupplierOption)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable35"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		DF_t_SupplierOption:=DF_at_SupplierOption{DF_at_SupplierOption}
		$_l_Setting:=0
		DF_l_SupplierOption:=$_l_Setting ?+ DF_at_SupplierOption
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable35"; $_t_oldMethodName)
