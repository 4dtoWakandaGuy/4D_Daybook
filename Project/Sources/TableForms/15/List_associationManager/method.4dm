If (False:C215)
	//Table Form Method Name: [USER]List_associationManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2010 17:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(AA_abo_CheckMark;0)
	//ARRAY BOOLEAN(AA_lb_Fields;0)
	//ARRAY LONGINT(AA_al_TickMark;0)
	//ARRAY TEXT(WS_at_AssociateFIeldNames;0)
	C_BOOLEAN:C305(AA_bo_SaveAssociation; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_Index; AA_l_BUT1; AA_l_But2; AA_l_BUT3; AA_l_BUT4; AA_l_BUT5; AA_l_BUT6; AA_l_BUT7; AA_l_BUT8; AA_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; AA_t_COL1; AA_t_COL2; AA_t_COL3; AA_t_COL4; AA_t_COL5; AA_t_COL6; AA_t_COL7; AA_t_COL8; AA_t_COL9; AA_t_HED1)
	C_TEXT:C284(AA_t_HED2; AA_t_HED3; AA_t_HED4; AA_t_HED5; AA_t_HED6; AA_t_HED7; AA_t_HED8; AA_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].List_associationManager"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "List_associationManager")
		AA_bo_SaveAssociation:=False:C215
		WS_AutoscreenSize(3; 300; 240)
		INT_SetLongintCheckFormat(->AA_al_TickMark)
		
		ARRAY BOOLEAN:C223(AA_abo_CheckMark; Size of array:C274(AA_al_TickMark))
		
		For ($_l_Index; 1; Size of array:C274(AA_al_TickMark))
			AA_abo_CheckMark{$_l_Index}:=(AA_al_TickMark{$_l_Index}=1)
		End for 
		LB_SetupListbox(->AA_lb_Fields; "AA_t"; "AA_L"; 1; ->AA_abo_CheckMark; ->WS_at_AssociateFIeldNames)
		
		LB_SetColumnHeaders(->AA_lb_Fields; "AA_L"; 1; "Select"; "Fields")
		
		LB_SetColumnWidths(->AA_lb_Fields; "AA_t"; 1; 28; 183)
		
		LB_SetEnterable(->AA_lb_Fields; False:C215; 0)
		LB_SetScroll(->AA_lb_Fields; -3; -2)
		LB_StyleSettings(->AA_lb_Fields; "Black"; 9; "AA_t"; ->[ACCOUNTS:32])
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:List_associationManager"; $_t_oldMethodName)
