If (False:C215)
	//Table Form Method Name: [WEBSETUP_4D]WebTestProgress_d
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/03/2010 06:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(IWS_lb_LBProcess;0)
	//ARRAY BOOLEAN(IWS2_lb_LBProcess;0)
	//ARRAY LONGINT(<>IWS_al_LastMS;0)
	//ARRAY LONGINT(<>IWS_al_Ms;0)
	//ARRAY LONGINT(IWS_al_PagesReceived;0)
	//ARRAY LONGINT(IWS_al_BytesReceived;0)
	//ARRAY TEXT(<>IWS_at_TestPages;0)
	//ARRAY TEXT(IWS_at_ProcessName;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_IWSProcessIndex; IWS_l_BUT1; IWS_l_But2; IWS_l_BUT3; IWS_l_BUT4; IWS_l_BUT5; IWS_l_BUT6; IWS_l_BUT7; IWS_l_BUT8; IWS_l_BUT9)
	C_LONGINT:C283(IWS2_l_BUT1; IWS2_l_But2; IWS2_l_BUT3; IWS2_l_BUT4; IWS2_l_BUT5; IWS2_l_BUT6; IWS2_l_BUT7; IWS2_l_BUT8; IWS2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; IWS_t_COL1; IWS_t_COL2; IWS_t_COL3; IWS_t_COL4; IWS_t_COL5; IWS_t_COL6; IWS_t_COL7; IWS_t_COL8; IWS_t_COL9; IWS_t_HED1)
	C_TEXT:C284(IWS_t_HED2; IWS_t_HED3; IWS_t_HED4; IWS_t_HED5; IWS_t_HED6; IWS_t_HED7; IWS_t_HED8; IWS_t_HED9; IWS2_t_COL1; IWS2_t_COL2; IWS2_t_COL3)
	C_TEXT:C284(IWS2_t_COL4; IWS2_t_COL5; IWS2_t_COL6; IWS2_t_COL7; IWS2_t_COL8; IWS2_t_COL9; IWS2_t_HED1; IWS2_t_HED2; IWS2_t_HED3; IWS2_t_HED4; IWS2_t_HED5)
	C_TEXT:C284(IWS2_t_HED6; IWS2_t_HED7; IWS2_t_HED8; IWS2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [WEBSETUP_4D].WebTestProgress_d"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[WEBSETUP_4D:129]); "WebTestProgress_d")
		
		LB_SetupListbox(->IWS_lb_LBProcess; "IWS_t"; "IWS_L"; 1; ->IWS_at_ProcessName; ->IWS_al_PagesReceived; ->IWS_al_BytesReceived)
		LB_SetColumnHeaders(->IWS_lb_LBProcess; "IWS_L"; 1; "Process"; "Pages"; "Bytes Received")
		LB_SetColumnWidths(->IWS_lb_LBProcess; "IWS_t"; 1; 122; 73; 104)
		
		LB_SetEnterable(->IWS_lb_LBProcess; False:C215; 0)
		LB_SetScroll(->IWS_lb_LBProcess; -3; -2)
		
		LB_StyleSettings(->IWS_lb_LBProcess; "Black"; 9; "IWS_t"; ->[ACCOUNTS:32])
		
		//``
		
		LB_SetupListbox(->IWS2_lb_LBProcess; "IWS2_t"; "IWS2_L"; 1; -><>IWS_at_TestPages; -><>IWS_al_LastMS; -><>IWS_al_Ms)
		LB_SetColumnHeaders(->IWS2_lb_LBProcess; "IWS2_L"; 1; "Page"; "LastMS"; "Average MS")
		LB_SetColumnWidths(->IWS2_lb_LBProcess; "IWS2_t"; 1; 118; 60; 60)
		
		LB_SetEnterable(->IWS2_lb_LBProcess; False:C215; 0)
		LB_SetScroll(->IWS2_lb_LBProcess; -3; -2)
		LB_StyleSettings(->IWS2_lb_LBProcess; "Black"; 9; "IWS2_t"; ->[ACCOUNTS:32])
		//```
		
		
	: ($_l_event=On Outside Call:K2:11)
		
		For ($_l_IWSProcessIndex; 1; Size of array:C274(IWS_at_ProcessName))
			PAUSE PROCESS:C319(Process number:C372(IWS_at_ProcessName{$_l_IWSProcessIndex}))
		End for 
		
End case 
ERR_MethodTrackerReturn("FM:WebTestProgress_d"; $_t_oldMethodName)
