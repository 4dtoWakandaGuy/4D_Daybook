If (False:C215)
	//object Name: [USER]BK_ImportSetup.Variable8
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
	//ARRAY TEXT(DM_at_BKRetreiveOptions;0)
	C_BOOLEAN:C305(DM_bo_CModified)
	C_LONGINT:C283(DM_l_BkRetrieveType; DM_l_RecordCount)
	C_TEXT:C284($_t_oldMethodName; DM_t_BkRetrieveType; DM_T_CustomQuery)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Variable8"; Form event code:C388)
If (DM_at_BKRetreiveOptions>0)
	DM_t_BkRetrieveType:=DM_at_BKRetreiveOptions{DM_at_BKRetreiveOptions}
	If (DM_at_BKRetreiveOptions<5)
		DM_l_BkRetrieveType:=DM_at_BKRetreiveOptions
	Else 
		DM_l_BkRetrieveType:=DM_at_BKRetreiveOptions+1
	End if 
	OBJECT SET VISIBLE:C603(DM_T_CustomQuery; False:C215)
	OBJECT SET VISIBLE:C603(*; "DM_o_CustomLabel"; False:C215)
	If (DM_l_BkRetrieveType=3)
		OBJECT SET VISIBLE:C603(*; "DM_o_RecordsLabel"; True:C214)
		OBJECT SET VISIBLE:C603(DM_l_RecordCount; True:C214)
	Else 
		
		OBJECT SET VISIBLE:C603(*; "DM_o_RecordsLabel"; False:C215)
		OBJECT SET VISIBLE:C603(DM_l_RecordCount; False:C215)
		If (DM_l_BkRetrieveType=6)
			OBJECT SET VISIBLE:C603(DM_T_CustomQuery; True:C214)
			OBJECT SET VISIBLE:C603(*; "DM_o_CustomLabel"; True:C214)
		End if 
		
	End if 
	DM_bo_CModified:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Variable8"; $_t_oldMethodName)
