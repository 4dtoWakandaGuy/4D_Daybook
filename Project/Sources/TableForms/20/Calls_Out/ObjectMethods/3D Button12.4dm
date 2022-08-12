If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_Out.3D Button12
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:22
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_Out.3D Button12"; Form event code:C388)
WT_SORT_TABLE_3(->[SERVICE_CALLS:20]; "Text11"; ->[SERVICE_CALLS:20]Solution_Code:16)
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_Out.3D Button12"; $_t_oldMethodName)