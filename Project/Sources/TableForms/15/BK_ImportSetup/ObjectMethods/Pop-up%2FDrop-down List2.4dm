If (False:C215)
	//object Name: [USER]BK_ImportSetup.Pop-up%2FDrop-down List2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DM_at_BKFrequencyOptions;0)
	C_BOOLEAN:C305(DM_bo_CModified)
	C_TEXT:C284($_t_oldMethodName; DM_t_BkFrequencyType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Pop-up/Drop-down List2"; Form event code:C388)
If (DM_at_BKFrequencyOptions>0)
	DM_t_BKFREQUENCYTYPE:=DM_at_BKFrequencyOptions{DM_at_BKFrequencyOptions}
	DM_t_BkFrequencyType:=DM_t_BKFREQUENCYTYPE[[1]]
	DM_bo_CModified:=True:C214
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Pop-up/Drop-down List2"; $_t_oldMethodName)
