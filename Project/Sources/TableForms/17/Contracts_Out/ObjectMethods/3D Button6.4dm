If (False:C215)
	//object Name: [CONTRACTS]Contracts_Out.3D Button6
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contracts_Out.3D Button6"; Form event code:C388)
WT_SORT_TABLE_3(->[CONTRACTS:17]; "Text6"; ->[CONTRACTS:17]End_Date:6)
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contracts_Out.3D Button6"; $_t_oldMethodName)