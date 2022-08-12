If (False:C215)
	//object Name: [ORDERS]Orders_OutS.3D Button15
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_OutS.3D Button15"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDERS:24]; "Text12"; ->[ORDERS:24]Order_Type:43)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_OutS.3D Button15"; $_t_oldMethodName)