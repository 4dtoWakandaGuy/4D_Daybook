If (False:C215)
	//object Name: [USER]SD2_DiaryLinks.oRemoveEventRelation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_DiaryOwners;0)
	//ARRAY LONGINT(SD2_al_DiaryOwnerpersons;0)
	//ARRAY LONGINT(SD2_al_DiaryPersREL;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonCD;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonNM;0)
	//ARRAY TEXT(SD2_at_DiaryPersREL;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryLinks.oRemoveEventRelation"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the
LISTBOX GET CELL POSITION:C971(SD2_lb_DiaryOwners; $_l_Column; $_l_Row)
If ($_l_Row>0)
	DELETE FROM ARRAY:C228(SD2_at_DiaryOwnerPersonNM; $_l_Row)
	DELETE FROM ARRAY:C228(SD2_at_DiaryOwnerPersonCD; $_l_Row)
	DELETE FROM ARRAY:C228(SD2_al_DiaryOwnerpersons; $_l_Row)
	DELETE FROM ARRAY:C228(SD2_at_DiaryPersREL; $_l_Row)
	DELETE FROM ARRAY:C228(SD2_al_DiaryPersREL; $_l_Row)
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryLinks.oRemoveEventRelation"; $_t_oldMethodName)
