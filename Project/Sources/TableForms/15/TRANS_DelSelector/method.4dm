If (False:C215)
	//Table Form Method Name: [USER]TRANS_DelSelector
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
	//ARRAY BOOLEAN(ACC_lb_TransItems;0)
	//ARRAY INTEGER(ACC_ai_TransDelete;0)
	//ARRAY REAL(ACC_ar_TransTaxAmtDEL;0)
	//ARRAY REAL(ACC_ar_TransTotalDEL;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_TransIndex; ACC_l_BUT1; ACC_l_But2; ACC_l_BUT3; ACC_l_BUT4; ACC_l_BUT5; ACC_l_BUT6; ACC_l_BUT7; ACC_l_BUT8; ACC_l_BUT9)
	C_LONGINT:C283(ACC_l_Deletion)
	C_TEXT:C284($_t_oldMethodName; ACC_t_COL1; ACC_t_COL2; ACC_t_COL3; ACC_t_COL4; ACC_t_COL5; ACC_t_COL6; ACC_t_COL7; ACC_t_COL8; ACC_t_COL9; ACC_t_HED1)
	C_TEXT:C284(ACC_t_HED2; ACC_t_HED3; ACC_t_HED4; ACC_t_HED5; ACC_t_HED6; ACC_t_HED7; ACC_t_HED8; ACC_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].TRANS_DelSelector"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "TRANS_DelSelector")
		ARRAY INTEGER:C220(ACC_ai_TransDelete; 0)
		ARRAY INTEGER:C220(ACC_ai_TransDelete; Size of array:C274(ACC_ar_TransTaxAmtDEL))
		INT_SetLongintCheckFormat(->ACC_ai_TransDelete)
		
		
		For ($_l_TransIndex; 1; Size of array:C274(ACC_ai_TransDelete))
			ACC_ai_TransDelete{$_l_TransIndex}:=1
		End for 
		ACC_l_Deletion:=0
		
		WS_AutoscreenSize(3; 260; 500)
		
		LB_SetupListbox(->ACC_lb_TransItems; "ACC_t"; "ACC_L"; 1; ->ACC_ai_TransDelete; ->ACC_ar_TransTaxAmtDEL; ->ACC_ar_TransTaxAmtDEL; ->ACC_ar_TransTotalDEL)
		LB_SetColumnHeaders(->ACC_lb_TransItems; "ACC_L"; 1; "Delete"; "Amount"; "Tax Amount"; "Total")
		
		LB_SetColumnWidths(->ACC_lb_TransItems; "ACC_t"; 1; 54; 144; 114; 144)
		
		LB_SetEnterable(->ACC_lb_TransItems; False:C215; 0)
		LB_SetScroll(->ACC_lb_TransItems; -3; -2)
		LB_StyleSettings(->ACC_lb_TransItems; "Black"; 9; "ACC_t"; ->[ACCOUNTS:32])
		
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:TRANS_DelSelector"; $_t_oldMethodName)
