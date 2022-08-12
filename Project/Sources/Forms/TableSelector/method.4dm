If (False:C215)
	//Project Form Method Name:      TableSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/01/2013 05:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_abo_TableSelector;0)
	//ARRAY BOOLEAN(SEL_lb_Tables;0)
	//ARRAY LONGINT(DB_al_TableNumbers;0)
	//ARRAY TEXT(DB_at_TableNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; $_l_Index; $_l_WIndowBottom; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop; DB_but_SelectAll; SEL_l_BUT1; SEL_l_But2; SEL_l_BUT3; SEL_l_BUT5)
	C_LONGINT:C283(SEL_l_BUT6; SEL_l_BUT7; SEL_l_BUT8; SEL_l_BUT9; $_l_CurrentRow; $_l_Event; $_l_Index; $_l_WIndowBottom; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop)
	C_LONGINT:C283(DB_but_SelectAll; DB_l_AllButtonState; SEL_l_BUT4)
	C_TEXT:C284(SEL_t_COL1; SEL_t_COL2; SEL_t_COL3; SEL_t_COL4; SEL_t_COL5; SEL_t_COL6; SEL_t_COL7; SEL_t_COL8; SEL_t_COL9; SEL_t_HED1; SEL_t_HED3)
	C_TEXT:C284(SEL_t_HED4; SEL_t_HED5; SEL_t_HED6; SEL_t_HED7; SEL_t_HED8; SEL_t_HED9; $_t_oldMethodName; SEL_t_HED2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM TableSelector"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		
		//SET WINDOW RECT((Screen width/2)-130;(Screen height/2)-55;(Screen width/2)+130;(Screen height/2)+55)
		
		
		ARRAY TEXT:C222(DB_at_TableNames; Get last table number:C254)
		ARRAY LONGINT:C221(DB_al_TableNumbers; Get last table number:C254)
		
		$_l_CurrentRow:=0
		For ($_l_Index; 1; Get last table number:C254)
			If (Is table number valid:C999($_l_Index))
				$_l_CurrentRow:=$_l_CurrentRow+1
				DB_al_TableNumbers{$_l_CurrentRow}:=$_l_Index
				DB_at_TableNames{$_l_CurrentRow}:=Table name:C256($_l_Index)
			End if 
		End for 
		ARRAY TEXT:C222(DB_at_TableNames; $_l_CurrentRow)
		ARRAY LONGINT:C221(DB_al_TableNumbers; $_l_CurrentRow)
		ARRAY BOOLEAN:C223(DB_abo_TableSelector; 0)
		ARRAY BOOLEAN:C223(DB_abo_TableSelector; $_l_CurrentRow)
		
		
		OBJECT SET TITLE:C194(DB_but_SelectAll; "Select All")
		DB_l_AllButtonState:=0
		
		LB_SetupListbox(->SEL_lb_Tables; "SEL_t"; "SEL_L"; 1; ->DB_abo_TableSelector; ->DB_at_TableNames; ->DB_al_TableNumbers)
		LB_SetColumnHeaders(->SEL_lb_Tables; "SEL_L"; 1; "Select"; "Table"; "Table Num")
		LB_SetColumnWidths(->SEL_lb_Tables; "SEL_t"; 1; 40; 140)
		LB_SetEnterable(->SEL_lb_Tables; False:C215; 0)
		LB_SetEnterable(->SEL_lb_Tables; True:C214; 1)
		LB_SetScroll(->SEL_lb_Tables; -3; -2)
		LB_StyleSettings(->SEL_lb_Tables; "Black"; 9; "SEL_t"; ->[COMPANIES:2])
		
		
		
End case 
ERR_MethodTrackerReturn("FM TableSelector"; $_t_oldMethodName)
