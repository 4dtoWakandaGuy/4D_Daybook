If (False:C215)
	//Table Form Method Name: [USER]SD2_SelectPersons
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
	//ARRAY BOOLEAN(SD2_abo_SelectedPersons;0)
	//ARRAY BOOLEAN(SD2_lb_SelPersons;0)
	//ARRAY TEXT(SD2_at_CurrentDiaryPersons;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; SD_l_BUT1; SD_l_But2; SD_l_BUT3; SD_l_BUT4; SD_l_BUT5; SD_l_BUT6; SD_l_BUT7; SD_l_BUT8; SD_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD_t_COL1; SD_t_COL2; SD_t_COL3; SD_t_COL4; SD_t_COL5; SD_t_COL6; SD_t_COL7; SD_t_COL8; SD_t_COL9; SD_t_HED1)
	C_TEXT:C284(SD_t_HED2; SD_t_HED3; SD_t_HED4; SD_t_HED5; SD_t_HED6; SD_t_HED7; SD_t_HED8; SD_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_SelectPersons"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY BOOLEAN:C223(SD2_abo_SelectedPersons; 0)
		ARRAY BOOLEAN:C223(SD2_abo_SelectedPersons; Size of array:C274(SD2_at_CurrentDiaryPersons))
		SD2_abo_SelectedPersons{1}:=True:C214
		
		LB_SetupListbox(->SD2_lb_SelPersons; "SD_t"; "SD_L"; 1; ->SD2_abo_SelectedPersons; ->SD2_at_CurrentDiaryPersons; ->SD2_at_CurrentDiaryPersons)
		LB_SetColumnHeaders(->SD2_lb_SelPersons; "SD_L"; 1; ""; "Sel"; "Name"; "Initials")
		
		LB_SetColumnWidths(->SD2_lb_SelPersons; "SD_t"; 1; 20; 100; 0)
		
		LB_SetEnterable(->SD2_lb_SelPersons; False:C215; 0)
		LB_SetEnterable(->SD2_lb_SelPersons; True:C214; 1)
		
		LB_SetScroll(->SD2_lb_SelPersons; -3; -2)
		
		LB_StyleSettings(->SD2_lb_SelPersons; "Black"; 9; "SD_t"; ->[DIARY:12])
		LB_Setdividers(->SD2_lb_SelPersons; 0; 0)  //Both off
		LBI_Scrollonresize(->SD2_lb_SelPersons)
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_SelectPersons"; $_t_oldMethodName)
