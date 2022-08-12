//%attributes = {}
If (False:C215)
	//Project Method Name:      Standing_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vButtDisSJ; vCompany)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Standing_InLPB")
RELATE ONE:C42([RECURRING_JOURNALS:38]Company_Code:1)
vCompany:=[COMPANIES:2]Company_Name:2
RELATE ONE:C42([RECURRING_JOURNALS:38]Transaction_Type_Code:2)
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238([RECURRING_JOURNALS:38]Currency_Code:11; False:C215)
End if 
vButtDisSJ:="I       FSSSRCADT"
Input_Buttons(->[RECURRING_JOURNALS:38]; ->vButtDisSJ)
Macro_AccType("Load "+String:C10(Table:C252(->[RECURRING_JOURNALS:38])))
ERR_MethodTrackerReturn("Standing_InLPB"; $_t_oldMethodName)
