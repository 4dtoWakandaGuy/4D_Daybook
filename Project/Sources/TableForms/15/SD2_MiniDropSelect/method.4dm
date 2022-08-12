If (False:C215)
	//Table Form Method Name: [USER]SD2_MiniDropSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 11:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_CalendersList;0)
	//ARRAY BOOLEAN(SD2_lb_NameSelector;0)
	//ARRAY LONGINT(SD2_al_CallBackReceived;0)
	//ARRAY LONGINT(SD2_al_ContactTypeSelect;0)
	//ARRAY TEXT(SD2_at_ContactEmailSelect;0)
	//ARRAY TEXT(SD2_at_ContactNamesSelect;0)
	//ARRAY TEXT(SD2_at_ContactsSelect;0)
	C_BOOLEAN:C305(SD2_al_CallBackReceived; DB_bo_NoLoad)
	C_LONGINT:C283($_l_HeightSizeDiifference; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_RowCount; $_l_RowHeight; $_l_WidthSizeDiifference; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; $_l_WindowWIdth; $DOC_l_CallEvent; DOC_l_CallEvent; SD2_l_EmailCalledback; SD2_l_LastSelected; SD2_l_ProcessReady; SD2_l_winLeft; SD2_l_winTop; SD2a_l_But2; SD2a_l_BUT3)
	C_LONGINT:C283(SD2a_l_BUT4; SD2a_l_BUT5; SD2a_l_BUT6; SD2a_l_BUT7; SD2a_l_BUT8; SD2a_l_BUT9; $_l_event; $_l_HeightSizeDiifference; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_RowCount; $_l_RowHeight; $_l_WidthSizeDiifference; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; $_l_WindowWIdth; $DOC_l_CallEvent)
	C_LONGINT:C283(DOC_l_CallEvent; SD2_l_Callback; SD2_l_EmailCalledback; SD2_l_LastSelected; SD2_l_ProcessReady; SD2_l_winLeft; SD2_l_winTop; SD2a_l_BUT1)
	C_TEXT:C284(SD2a_t_COL1; SD2a_t_COL2; SD2a_t_COL3; SD2a_t_COL4; SD2a_t_COL5; SD2a_t_COL6; SD2a_t_COL7; SD2a_t_COL8; SD2a_t_COL9; SD2a_t_HED1; SD2a_t_HED3)
	C_TEXT:C284(SD2a_t_HED4; SD2a_t_HED5; SD2a_t_HED6; SD2a_t_HED7; SD2a_t_HED8; SD2a_t_HED9; $_t_oldMethodName; SD2a_t_HED2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_MiniDropSelect"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		BRING TO FRONT:C326(SD2_l_Callback)
		LB_SetupListbox(->SD2_lb_NameSelector; "SD2a_t"; "SD2a_L"; 1; ->SD2_at_ContactEmailSelect; ->SD2_at_ContactNamesSelect; ->SD2_al_ContactTypeSelect; ->SD2_at_ContactsSelect)
		LB_SetColumnHeaders(->SD2_lb_NameSelector; "SD2a_L"; 1; ""; "Email"; "Name"; "Type"; "RecordIdent")
		LB_SetColumnWidths(->SD2_lb_NameSelector; "SD2a_t"; 1; 160; 120; 0; 0)
		LB_SetEnterable(->SD2_lb_NameSelector; False:C215; 0)
		LB_SetScroll(->SD2_lb_NameSelector; -3; -2)
		
		LB_StyleSettings(->SD2_lb_CalendersList; "Black"; 9; "SD2a_t"; ->[DIARY:12])
		LB_Setdividers(->SD2_lb_NameSelector; 0; 0)  //Both off
		LBI_Scrollonresize(->SD2_lb_NameSelector)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		
		$_l_RowHeight:=LISTBOX Get rows height:C836(SD2_lb_NameSelector)
		$_l_RowCount:=Size of array:C274(SD2_at_ContactEmailSelect)
		$_l_WindowHeight:=$_l_RowCount*$_l_RowHeight
		If ($_l_WindowHeight>300)
			$_l_WindowHeight:=300
		End if 
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowTop+$_l_WindowHeight)
		$_l_WindowWIdth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(SD2_lb_NameSelector; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(SD2_lb_NameSelector; 0; 0; $_l_WindowWIdth; $_l_WindowHeight; *)
		SD2_at_ContactEmailSelect:=1
		SD2_l_LastSelected:=1
		EDIT ITEM:C870(SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect)
		BRING TO FRONT:C326(SD2_l_Callback)
		
	: ($_l_event=On Clicked:K2:4)
		If (SD2_l_LastSelected>0)
			SET PROCESS VARIABLE:C370(SD2_l_Callback; SD2_l_EmailCalledback; 1)
		End if 
	: ($_l_event=On Outside Call:K2:11)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_RowHeight:=LISTBOX Get rows height:C836(SD2_lb_NameSelector)
		$_l_RowCount:=Size of array:C274(SD2_at_ContactEmailSelect)
		$_l_WindowHeight:=$_l_RowCount*$_l_RowHeight
		If ($_l_WindowHeight>300)
			$_l_WindowHeight:=300
		End if 
		$_l_WidthSizeDiifference:=0
		$_l_HeightSizeDiifference:=0
		If (SD2_l_winLeft#$_l_WindowLeft)
			$_l_WidthSizeDiifference:=SD2_l_winLeft-$_l_WindowLeft
		End if 
		If (SD2_l_winTop#$_l_WindowTop)
			$_l_HeightSizeDiifference:=SD2_l_winTop-$_l_WindowTop
		End if 
		SET WINDOW RECT:C444(($_l_WindowLeft+$_l_WidthSizeDiifference); ($_l_WindowTop+$_l_HeightSizeDiifference); ($_l_WindowRight+$_l_WidthSizeDiifference); ($_l_WindowTop+$_l_HeightSizeDiifference)+$_l_WindowHeight)
		$_l_WindowWIdth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(SD2_lb_NameSelector; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(SD2_lb_NameSelector; 0; 0; $_l_WindowWIdth; $_l_WindowHeight; *)
		SD2_at_ContactEmailSelect:=SD2_l_LastSelected
		EDIT ITEM:C870(SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect)
		$DOC_l_CallEvent:=DOC_l_CallEvent
		DOC_l_CallEvent:=0
		Case of 
			: ($DOC_l_CallEvent=1)
				//end process
				DOC_l_CallEvent:=0
				CANCEL:C270
			: ($DOC_l_CallEvent=2)
				If (SD2_at_ContactEmailSelect<=Size of array:C274(SD2_at_ContactEmailSelect))
					SD2_at_ContactEmailSelect:=SD2_at_ContactEmailSelect+1
					
					EDIT ITEM:C870(SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect)
					SD2_l_LastSelected:=SD2_at_ContactEmailSelect
					DOC_l_CallEvent:=0
				End if 
			: ($DOC_l_CallEvent=3)
				If (SD2_at_ContactEmailSelect>=1)
					SD2_at_ContactEmailSelect:=SD2_at_ContactEmailSelect-1
					
					EDIT ITEM:C870(SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect)
					SD2_l_LastSelected:=SD2_at_ContactEmailSelect
					DOC_l_CallEvent:=0
				End if 
			: ($DOC_l_CallEvent=4)
				VARIABLE TO VARIABLE:C635(SD2_l_Callback; SD2_at_ContactNamesSelect; SD2_at_ContactNamesSelect; SD2_at_ContactsSelect; SD2_at_ContactsSelect; SD2_at_ContactEmailSelect; SD2_at_ContactEmailSelect; SD2_al_ContactTypeSelect; SD2_al_ContactTypeSelect)
				SET PROCESS VARIABLE:C370(SD2_l_Callback; SD2_l_ProcessReady; -1)
				SET PROCESS VARIABLE:C370(SD2_l_Callback; SD2_al_CallBackReceived; True:C214)
				
				
				//CANCEL
			: ($DOC_l_CallEvent=5)
				//MoveWindow
				
			Else 
				If (Size of array:C274(SD2_at_ContactEmailSelect)=0)
					CANCEL:C270
				End if 
				
				
		End case 
	: ($_l_event=On Timer:K2:25)
		BEEP:C151
		BRING TO FRONT:C326(Current process:C322)
		
		
End case 
ERR_MethodTrackerReturn("FM [USER].SD2_MiniDropSelect"; $_t_oldMethodName)
