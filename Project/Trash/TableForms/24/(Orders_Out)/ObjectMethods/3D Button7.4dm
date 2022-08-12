If (False:C215)
	//object Name: [ORDERS]Orders_Out.3D Button7
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.3D Button7"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDERS:24]; "Text16"; ->[ORDERS:24]Person:5)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.3D Button7"; $_t_oldMethodName)