If (False:C215)
	//object Name: [ORDERS]Orders_OutQ.3D Button3
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_OutQ.3D Button3"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDERS:24]; "Text9"; ->[ORDERS:24]State:15)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_OutQ.3D Button3"; $_t_oldMethodName)