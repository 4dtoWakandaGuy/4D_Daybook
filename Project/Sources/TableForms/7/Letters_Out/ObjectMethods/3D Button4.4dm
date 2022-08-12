If (False:C215)
	//object Name: [DOCUMENTS]Letters_Out.3D Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_Out.3D Button4"; Form event code:C388)
WT_SORT_TABLE_3(Current form table:C627; "Text5"; ->[DOCUMENTS:7]Document_Type:13)
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Letters_Out.3D Button4"; $_t_oldMethodName)