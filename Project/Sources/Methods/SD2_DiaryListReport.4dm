//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryListReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   10/11/2010 23:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm; vNo; vNo2)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_CurrentFormUsage)
	C_TIME:C306(vHours)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryListReport")
CREATE SET:C116([DIARY:12]; "$Temp")
If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (Records in selection:C76([DIARY:12])>0)
	
	If (Not:C34(SR_ReportOK("DiaryTime")))
		vNo:=Records in selection:C76([DIARY:12])
		vNo2:=vNo
		ORDER BY:C49([DIARY:12]; [DIARY:12]Job_Code:19; >; [DIARY:12]Stage_Code:21; >; [DIARY:12]Person:8; >; [DIARY:12]Date_Done_From:5; >)
		DB_t_CurrentFormUsage:="Print"
		
		If (vNo2#Records in selection:C76([DIARY:12]))
			ORDER BY:C49([DIARY:12]; [DIARY:12]Job_Code:19; >; [DIARY:12]Stage_Code:21; >; [DIARY:12]Person:8; >; [DIARY:12]Date_Done_From:5; >)
			vNo:=Records in selection:C76([DIARY:12])
		End if 
		FORM SET OUTPUT:C54([DIARY:12]; "Diary_ListT")
		BREAK LEVEL:C302(3)
		ACCUMULATE:C303([DIARY:12]Units:20; vHours; [DIARY:12]Value:16)
		PRINT SELECTION:C60([DIARY:12])
		
	End if 
	
	
	
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
ERR_MethodTrackerReturn("SD2_DiaryListReport"; $_t_oldMethodName)