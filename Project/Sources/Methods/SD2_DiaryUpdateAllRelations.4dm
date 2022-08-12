//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryUpdateAllRelations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryUpdateAllRelations")
ALL RECORDS:C47([DIARY:12])
For ($_l_Index; 1; Records in selection:C76([DIARY:12]))
	SD2_DiaryLoadRelations
	NEXT RECORD:C51([DIARY:12])
End for 
ERR_MethodTrackerReturn("SD2_DiaryUpdateAllRelations"; $_t_oldMethodName)
