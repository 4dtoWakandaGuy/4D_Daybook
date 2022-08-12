If (False:C215)
	//object Name: [ACCOUNTS]Accounts_Out.3D Button8
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
	C_TEXT:C284($_t_oldMethodName; Cur_S20_MultiCurValuation)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS].Accounts_Out.3D Button8"; Form event code:C388)
//WT_SORT_TABLE_3 (->[ACCOUNTS];"Text2";->[ACCOUNTS]Multicurrency Valuation)
GEN_SortOutput(->Cur_S20_MultiCurValuation; True:C214; ->[ACCOUNTS:32])
ERR_MethodTrackerReturn("OBJ [ACCOUNTS].Accounts_Out.3D Button8"; $_t_oldMethodName)