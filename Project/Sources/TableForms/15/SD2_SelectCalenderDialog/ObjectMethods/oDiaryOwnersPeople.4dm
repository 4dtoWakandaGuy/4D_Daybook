If (False:C215)
	//object Name: [USER]SD2_SelectCalenderDialog.oDiaryOwnersPeople
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 11:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_DiaryOwnersPeople;0)
	//ARRAY TEXT(SD2_at_DiaryOwnersResources;0)
	C_LONGINT:C283($_l_event; $_l_FIeldNumber; $_l_SelectedRow; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_SelectCalenderDialog.oDiaryOwnersPeople"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FIeldNumber)
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedRow>0)
			SD2_at_DiaryOwnersResources:=0
			SD2_at_DiaryOwnersPeople:=$_l_SelectedRow
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_SelectCalenderDialog.oDiaryOwnersPeople"; $_t_oldMethodName)
