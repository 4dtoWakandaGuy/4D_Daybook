If (False:C215)
	//object Name: [ORDERS]Orders_OutQ.3D Button25
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_OutQ.3D Button25"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDERS:24]; "Text21"; ->[ORDERS:24]Required_Date:9)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_OutQ.3D Button25"; $_t_oldMethodName)