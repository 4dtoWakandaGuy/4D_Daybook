If (False:C215)
	//object Name: [TRANSACTIONS]Trans_Out.3D Button9
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
	C_TEXT:C284($_t_oldMethodName; vTitle2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].Trans_Out.3D Button9"; Form event code:C388)
WT_SORT_TABLE_2(->[TRANSACTIONS:29]; ->vTitle2; ->[TRANSACTIONS:29]Amount:6)
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].Trans_Out.3D Button9"; $_t_oldMethodName)