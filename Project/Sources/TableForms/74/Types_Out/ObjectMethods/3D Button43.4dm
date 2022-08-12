If (False:C215)
	//object Name: [ADDRESS_FORMATS]Types_out.3D Button43
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ADDRESS_FORMATS].Types_out.3D Button43"; Form event code:C388)
//WT_SORT_TABLE_3 (->[ADDRESS FORMATS];"Text2";
GEN_SortOutput(->[ADDRESS_FORMATS:74]Format_Code:1)
ERR_MethodTrackerReturn("OBJ [ADDRESS_FORMATS].Types_out.3D Button43"; $_t_oldMethodName)