If (False:C215)
	//object Name: [USER]SD2_DiaryOwnerDialog.oAddeople
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2010 19:44
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
	C_LONGINT:C283($_l_PersonRow; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9; SD2_l_DiaryOwnerID)
	C_TEXT:C284($_t_oldMethodName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9; SD2_t_DiaryPersonCode)
	C_TEXT:C284(SD2_t_DiaryPersonName; SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryOwnerDialog.oAddeople"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the
If (SD2_l_DiaryOwnerID>0)
	$_l_PersonRow:=Find in array:C230(SD2_al_DiaryOwnerpersons; SD2_l_DiaryOwnerID)
	If ($_l_PersonRow<0)
		APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; SD2_l_DiaryOwnerID)
		APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; SD2_t_DiaryPersonName)
		APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; SD2_t_DiaryPersonCode)
		If ([PERSONNEL:11]Personnel_ID:48#SD2_l_DiaryOwnerID)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD2_l_DiaryOwnerID)
		End if 
		If ([PERSONNEL:11]Global_Access:47)
			APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Resource")
			APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; -1)
		Else 
			APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "Owner")
			APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 1)
		End if 
	End if 
	
	//SD2_at_DiaryOwnerPersonNM
	//SD2_at_DiaryOwnerPersonCD
	//SD2_al_DiaryPersREL(-1=Resource, 1=owner/
	
	LB_SetupListbox(->SD2_lb_DiaryOwners; "SD2_t"; "SD2_L"; 1; ->SD2_at_DiaryPersREL; ->SD2_at_DiaryOwnerPersonNM; ->SD2_al_DiaryOwnerpersons; ->SD2_at_DiaryOwnerPersonCD; ->SD2_al_DiaryPersREL)
	
	LB_SetColumnHeaders(->SD2_lb_DiaryOwners; "SD2_L"; 1; "Relation"; "Name"; ""; ""; "")
	
	LB_SetColumnWidths(->SD2_lb_DiaryOwners; "SD2_t"; 1; 50; 150; 0; 0; 0)
	
	LB_SetEnterable(->SD2_lb_DiaryOwners; False:C215; 0)
	LB_SetEnterable(->SD2_lb_DiaryOwners; True:C214; 2)
	LB_SetScroll(->SD2_lb_DiaryOwners; -3; -2)
	LB_StyleSettings(->SD2_lb_DiaryOwners; "Black"; 9; "SD2_t"; ->[DIARY:12])
	FORM GOTO PAGE:C247(2)
	
	WS_AutoscreenSize(3; 150; 300)
	APPEND TO ARRAY:C911(SD2_al_DiaryOwnerpersons; 0)
	APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonNM; "")
	APPEND TO ARRAY:C911(SD2_at_DiaryOwnerPersonCD; "")
	APPEND TO ARRAY:C911(SD2_at_DiaryPersREL; "")
	APPEND TO ARRAY:C911(SD2_al_DiaryPersREL; 0)
	LB_GoToCell(->SD2_lb_DiaryOwners; 2; Size of array:C274(SD2_al_DiaryPersREL))
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryOwnerDialog.oAddeople"; $_t_oldMethodName)
