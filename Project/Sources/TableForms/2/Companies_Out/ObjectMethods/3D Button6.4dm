If (False:C215)
	//object Name: [COMPANIES]Companies_Out.3D Button6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>DB_t_CountryLabel; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Companies_Out.3D Button6"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		WT_SORT_TABLE_2(->[COMPANIES:2]; -><>DB_t_CountryLabel; ->[COMPANIES:2]Country:8)
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Companies_Out.3D Button6"; $_t_oldMethodName)