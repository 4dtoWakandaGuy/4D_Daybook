If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dAsk_Letter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_lb_Documents;0)
	//ARRAY TEXT(DOC_at_Documenttype;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_WindowHeight; bd1; DIA_l_BUT1; DIA_l_But2; DIA_l_BUT3; DIA_l_BUT4; DIA_l_BUT5; DIA_l_BUT6; DIA_l_BUT7; DIA_l_BUT8)
	C_LONGINT:C283(DIA_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; DIA_t_COL1; DIA_t_COL2; DIA_t_COL3; DIA_t_COL4; DIA_t_COL5; DIA_t_COL6; DIA_t_COL7; DIA_t_COL8; DIA_t_COL9; DIA_t_HED1)
	C_TEXT:C284(DIA_t_HED2; DIA_t_HED3; DIA_t_HED4; DIA_t_HED5; DIA_t_HED6; DIA_t_HED7; DIA_t_HED8; DIA_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dAsk_Letter"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "dAsk_Letter")
		Array_LCStart
		bd1:=Size of array:C274(GEN_at_Identity)
		$_l_WindowHeight:=31+(bd1*13)
		If ($_l_WindowHeight<120)
			$_l_WindowHeight:=120
		End if 
		
		WS_AutoscreenSize(2; $_l_WindowHeight; 363)
		
		LB_SetupListbox(->DIA_lb_Documents; "DIA_t"; "DIA_L"; 1; ->GEN_at_Identity; ->GEN_at_Name; ->DOC_at_Documenttype)
		LB_SetColumnHeaders(->DIA_lb_Documents; "DIA_L"; 1; "Code"; "Name"; "Type")
		
		LB_SetColumnWidths(->DIA_lb_Documents; "DIA_t"; 1; 87; 187; 100)
		
		LB_SetEnterable(->DIA_lb_Documents; False:C215; 0)
		LB_SetScroll(->DIA_lb_Documents; -3; -2)
		LB_StyleSettings(->DIA_lb_Documents; "Black"; 9; "DIA_t"; ->[ACCOUNTS:32])
		LB_SetScroll(->DIA_lb_Documents; GEN_at_Identity)
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[DOCUMENTS:7])
		
End case 
ERR_MethodTrackerReturn("FM:dAsk_Letter"; $_t_oldMethodName)
