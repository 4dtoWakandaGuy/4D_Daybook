If (False:C215)
	//object Name: [USER]SD2_DiaryOwnerDialog.oAddeople1
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
	//ARRAY BOOLEAN(SD2_lb_DiaryOwners;0)
	//ARRAY LONGINT(SD2_al_DiaryOwnerpersons;0)
	//ARRAY LONGINT(SD2_al_DiaryPersREL;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonCD;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonNM;0)
	//ARRAY TEXT(SD2_at_DiaryPersREL;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryOwnerDialog.oAddeople1"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the
If (SD2_at_DiaryOwnerPersonNM{Size of array:C274(SD2_at_DiaryOwnerPersonNM)}#"")
	
	APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; 0)
	APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; "")
	APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; "")
	APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "")
	APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 0)
	LB_GoToCell(->SD2_lb_DiaryOwners; 2; Size of array:C274(SD2_al_DiaryPersREL))
Else 
	LB_GoToCell(->SD2_lb_DiaryOwners; 2; Size of array:C274(SD2_al_DiaryPersREL))
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryOwnerDialog.oAddeople1"; $_t_oldMethodName)
