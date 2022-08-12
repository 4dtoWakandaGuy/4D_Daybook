If (False:C215)
	//object Name: [ORDERS]Orders_Out.3D Button6
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_Out.3D Button6"; Form event code:C388)
WT_SORT_TABLE_3(->[ORDERS:24]; "Text3"; ->[ORDERS:24]Total_Total:8)
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_Out.3D Button6"; $_t_oldMethodName)