If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_Out.3D Button1
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_Out.3D Button1"; Form event code:C388)
WT_SORT_TABLE_3(->[SERVICE_CALLS:20]; "Text13"; ->[SERVICE_CALLS:20]Your_Order_Number:25)
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_Out.3D Button1"; $_t_oldMethodName)