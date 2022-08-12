If (False:C215)
	//Table Form Method Name: [USER]SD2_DiaryOwnerDialog
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; SD2_l_AddPeople; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9)
	C_LONGINT:C283(SD2_l_DiaryOwnerID)
	C_TEXT:C284($_t_oldMethodName; SD2_t_DiaryPersonCode; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9)
	C_TEXT:C284(SD2_t_DiaryPersonName; SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_DiaryOwnerDialog"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		SD2_l_DiaryOwnerID:=0
		SD2_t_DiaryPersonName:=""
		SD2_t_DiaryPersonCode:=""
		
		If ([DIARY:12]Person:8="") | (Size of array:C274(SD2_at_DiaryPersREL)<2)
			If ([DIARY:12]Person:8#"")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
				SD2_t_DiaryPersonCode:=[DIARY:12]Person:8
				SD2_t_DiaryPersonName:=[PERSONNEL:11]Name:2
				SD2_l_DiaryOwnerID:=[PERSONNEL:11]Personnel_ID:48
				OBJECT SET VISIBLE:C603(SD2_l_AddPeople; True:C214)
				OBJECT SET VISIBLE:C603(*; "oAddPerson"; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(SD2_l_AddPeople; False:C215)
				OBJECT SET VISIBLE:C603(*; "oAddPerson"; False:C215)
			End if 
			FORM GOTO PAGE:C247(1)
			WS_AutoscreenSize(3; 140; 250)
		Else 
			
			LB_SetupListbox(->SD2_lb_DiaryOwners; "SD2_t"; "SD2_L"; 1; ->SD2_at_DiaryPersREL; ->SD2_at_DiaryOwnerPersonNM; ->SD2_al_DiaryOwnerpersons; ->SD2_at_DiaryOwnerPersonCD; ->SD2_al_DiaryPersREL)
			
			LB_SetColumnHeaders(->SD2_lb_DiaryOwners; "SD2_L"; 1; "Relation"; "Name"; ""; ""; "")
			
			LB_SetColumnWidths(->SD2_lb_DiaryOwners; "SD2_t"; 1; 50; 155; 0; 0; 0)
			
			LB_SetEnterable(->SD2_lb_DiaryOwners; False:C215; 0)
			LB_SetEnterable(->SD2_lb_DiaryOwners; True:C214; 2)
			LB_SetScroll(->SD2_lb_DiaryOwners; -3; -2)
			
			LB_StyleSettings(->SD2_lb_DiaryOwners; "Black"; 9; "SD2_t"; ->[DIARY:12])
			
			FORM GOTO PAGE:C247(2)
			WS_AutoscreenSize(3; 150; 300)
			
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_DiaryOwnerDialog"; $_t_oldMethodName)
