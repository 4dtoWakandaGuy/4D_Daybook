If (False:C215)
	//object Name: [ACCOUNTS]Balances.3D Button3
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Balances.3D Button3"; Form event code:C388)
//WT_SORT_TABLE_3 (->[ACCOUNTS];"Text4"
GEN_SortOutput(->[ACCOUNTS:32]Account_Name:3)
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Balances.3D Button3"; $_t_oldMethodName)