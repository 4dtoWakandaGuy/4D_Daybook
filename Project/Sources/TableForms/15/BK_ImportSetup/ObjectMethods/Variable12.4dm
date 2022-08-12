If (False:C215)
	//object Name: [USER]BK_ImportSetup.Variable12
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; DM_t_BkFrequencyType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Variable12"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		DM_bo_CModified:=True:C214
		If (DM_t_BKFREQUENCYTYPE="") | (DM_t_BKFREQUENCYTYPE="Not Set")
			DM_t_BKFREQUENCYTYPE:=DM_at_BKFrequencyOptions{Find in array:C230(DM_at_BKFrequencyOptions; "Hours")}
			DM_t_BkFrequencyType:=DM_t_BKFREQUENCYTYPE[[1]]
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Variable12"; $_t_oldMethodName)
