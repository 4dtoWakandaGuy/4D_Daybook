If (False:C215)
	//object Name: [ORDERS]Orders_Out.3D Button22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.3D Button22"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		WT_SORT_TABLE_3(->[ORDERS:24]; "Text32"; ->[COMPANIES:2]Company_Name:2)
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.3D Button22"; $_t_oldMethodName)
