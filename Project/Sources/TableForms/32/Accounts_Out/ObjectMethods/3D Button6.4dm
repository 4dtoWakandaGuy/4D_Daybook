If (False:C215)
	//object Name: [ACCOUNTS]Accounts_Out.3D Button6
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
	C_TEXT:C284($_t_oldMethodName; vTitle4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_Out.3D Button6"; Form event code:C388)
//WT_SORT_TABLE_2 (->[ACCOUNTS];"Text2";->VTitle4)
If (False:C215)
	GEN_SortOutput(->vTitle4; True:C214; ->[ACCOUNTS:32])
End if 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_Out.3D Button6"; $_t_oldMethodName)
