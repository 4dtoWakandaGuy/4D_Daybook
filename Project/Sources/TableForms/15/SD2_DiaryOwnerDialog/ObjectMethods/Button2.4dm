If (False:C215)
	//object Name: [USER]SD2_DiaryOwnerDialog.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_DiaryOwnerpersons;0)
	//ARRAY LONGINT(SD2_al_DiaryPersREL;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonCD;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonNM;0)
	//ARRAY TEXT(SD2_at_DiaryPersREL;0)
	C_LONGINT:C283($_l_PersonRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryOwnerDialog.Button2"; Form event code:C388)

If (SD2_at_DiaryOwnerPersonNM{Size of array:C274(SD2_at_DiaryOwnerPersonNM)}="")
	$_l_PersonRow:=Size of array:C274(SD2_at_DiaryOwnerPersonNM)
	If ($_l_PersonRow>0)
		DELETE FROM ARRAY:C228(SD2_al_DiaryOwnerpersons; $_l_PersonRow)
		DELETE FROM ARRAY:C228(SD2_at_DiaryOwnerPersonNM; $_l_PersonRow)
		DELETE FROM ARRAY:C228(SD2_at_DiaryOwnerPersonCD; $_l_PersonRow)
		DELETE FROM ARRAY:C228(SD2_at_DiaryPersREL; $_l_PersonRow)
		DELETE FROM ARRAY:C228(SD2_al_DiaryPersREL; $_l_PersonRow)
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryOwnerDialog.Button2"; $_t_oldMethodName)
