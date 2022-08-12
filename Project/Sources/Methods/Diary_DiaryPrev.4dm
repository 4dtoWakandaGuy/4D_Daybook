//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_DiaryPrev
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryPrev")
//Diary_DiaryPrev
COPY NAMED SELECTION:C331([DIARY:12]; "Selection")
vDate:=vDate-1
Diary_DateSrch
If (Records in selection:C76([DIARY:12])=0)
	Gen_Alert("No Diary Items found - the selection is unchanged"; "OK")
	USE NAMED SELECTION:C332("Selection")
End if 
CLEAR NAMED SELECTION:C333("Selection")
ERR_MethodTrackerReturn("Diary_DiaryPrev"; $_t_oldMethodName)