//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryCallSummaries
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/11/2010 14:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryCallSummaries")
CREATE SET:C116([DIARY:12]; "$temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
ORDER BY:C49([DIARY:12]Person:8; >; [DIARY:12]Date_Do_From:4; >; [DIARY:12]Action_Code:9; >; [DIARY:12]Time_Do_From:6; >)

If (Not:C34(SR_ReportOK("DiarySumm")))
	BREAK LEVEL:C302(1; 1)
	ACCUMULATE:C303([DIARY:12]Value:16)
	FORM SET OUTPUT:C54([DIARY:12]; "Call_Summaries")
	PRINT SELECTION:C60([DIARY:12])
	
End if 
If (Count parameters:C259=0)
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
End if 
ERR_MethodTrackerReturn("SD2_DiaryCallSummaries"; $_t_oldMethodName)