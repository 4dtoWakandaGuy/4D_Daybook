If (False:C215)
	//object Name: [TRANSACTIONS]Trans_Out.3D Button1
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_Out.3D Button1"; Form event code:C388)
WT_SORT_TABLE_3(->[TRANSACTIONS:29]; "Text2"; ->[TRANSACTIONS:29]Transaction_Type_Code:1)
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_Out.3D Button1"; $_t_oldMethodName)