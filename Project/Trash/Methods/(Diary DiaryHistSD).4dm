//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DiaryHistSD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 22:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SD3_at_HistoryType;0)
	//ARRAY TEXT(SD_at_History;0)
	C_LONGINT:C283($_l_Element; $1; vNo)
	C_TEXT:C284($_t_History; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DiaryHistSD")
//Diary_DiaryHistSD - SuperDiary
$_t_History:=""
If (Count parameters:C259>=$1)
	$_l_Element:=$1
	$_t_History:=SD_at_History{$1}
Else 
	$_l_Element:=<>SD3_at_HistoryType
End if 
If ($_l_Element>1)
	If (Records in selection:C76([DIARY:12])>0)
		FIRST RECORD:C50([DIARY:12])
		If ($_t_History#"")
			Diary_HistSrchSD($_t_History)
		Else 
			Diary_HistSrchSD
		End if 
		Diary_SelCheck
		CREATE SET:C116([DIARY:12]; "DMaster")
		vNo:=Records in selection:C76([DIARY:12])
	Else 
		Gen_Alert("Please first select a Diary Item"; "Try again")
	End if 
End if 
<>SD3_at_HistoryType:=1
ERR_MethodTrackerReturn("Diary_DiaryHistSD"; $_t_oldMethodName)