If (False:C215)
	//object Name: [ORDERS]Orders OutVQ.3D Button21
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders OutVQ.3D Button21"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDERS:24]; "Text11"; ->[ORDERS:24]Comments_2:40)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders OutVQ.3D Button21"; $_t_oldMethodName)