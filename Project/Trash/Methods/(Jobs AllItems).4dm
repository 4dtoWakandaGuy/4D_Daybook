//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs AllItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:08
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs AllItems")
Menu_Record("Jobs AllItems"; "Show All Cost Items")
If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
Gen_Confirm("Do you want to see all Budget or all Actual items?"; "Actual"; "Budget")
If (OK=1)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="A"; *)
	QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]State:46=""; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1)
Else 
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]State:46="B"; *)
	QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1)
End if 
If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
	OrderI_LevelSrc(0)
End if 
ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35; >)
ERR_MethodTrackerReturn("Jobs AllItems"; $_t_oldMethodName)