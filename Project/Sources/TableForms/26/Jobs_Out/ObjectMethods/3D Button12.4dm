If (False:C215)
	//object Name: [JOBS]Jobs_Out.3D Button12
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Jobs_Out.3D Button12"; Form event code:C388)
WT_SORT_TABLE_3(->[JOBS:26]; "Text3"; ->[JOBS:26]AS_Quoted_Amount:11)
ERR_MethodTrackerReturn("OBJ [JOBS].Jobs_Out.3D Button12"; $_t_oldMethodName)