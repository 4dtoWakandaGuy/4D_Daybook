If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_Out.3D Button5
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_Out.3D Button5"; Form event code:C388)
WT_SORT_TABLE_3(->[SERVICE_CALLS:20]; "Text9"; ->[SERVICE_CALLS:20]Person:11)
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_Out.3D Button5"; $_t_oldMethodName)