If (False:C215)
	//object Name: [ORDERS]Jobs_TCIn.Popup Drop down List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_TrState;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Jobs_TCIn.Popup Drop down List"; Form event code:C388)
If ((SD_at_TrState=0) | ((DB_GetModuleSettingByNUM(1))=5))
	If (((DB_GetModuleSettingByNUM(1))=5) & (SD_at_TrState#2))
		Gen_Alert("You can only post Actuals in Daybook Silver"; "Cancel")
	End if 
	SD_at_TrState:=2
End if 
If (SD_at_TrState=1)
	If ([ORDERS:24]Your_Order_Number:10#"")
		If ([JOBS:26]Job_Code:1#[ORDERS:24]Your_Order_Number:10)
			MESSAGES OFF:C175
			QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=[ORDERS:24]Your_Order_Number:10)
			MESSAGES ON:C181
			
		End if 
		If ([JOBS:26]Budget_TR:28=False:C215)
			Gen_Alert("Job "+[JOBS:26]Job_Code:1+" will not receive Time Recording postings"; "Cancel")
			SD_at_TrState:=2
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Jobs_TCIn.Popup Drop down List"; $_t_oldMethodName)
//
ERR_MethodTrackerReturn("OBJ [ORDERS]Jobs_TCIn.Popup Drop down List"; $_t_oldMethodName)