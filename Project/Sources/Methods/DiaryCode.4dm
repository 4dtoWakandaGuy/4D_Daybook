//%attributes = {}

If (False:C215)
	//Project Method Name:      DiaryCode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  07/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isUnique)
	C_LONGINT:C283($_l_isUnique)
	C_TEXT:C284(<>DefPrior; $_t_DiaryCode)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DiaryCode")
Repeat 
	$_t_DiaryCode:=Gen_CodePref(3; ->[DIARY:12]Diary_Code:3)
	SET QUERY DESTINATION:C396(3; $_l_isUnique)
	QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
	If ($_l_isUnique=0)
		[DIARY:12]Diary_Code:3:=$_t_DiaryCode
	End if 
	SET QUERY DESTINATION:C396(0)
Until ($_l_isUnique=0)

If ([DIARY:12]Value:16=0)
	[DIARY:12]Value:16:=1
	[DIARY:12]Cost_Value:75:=1
End if 
If ([DIARY:12]Priority:17="")
	[DIARY:12]Priority:17:=<>DefPrior
End if 
ERR_MethodTrackerReturn("DiaryCode"; $_t_oldMethodName)