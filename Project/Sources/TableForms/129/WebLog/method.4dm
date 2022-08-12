If (False:C215)
	//Table Form Method Name: [WEBSETUP_4D]WebLog
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
	//ARRAY LONGINT(<>IWS_al_ProcessTicks;0)
	//ARRAY TEXT(<>IWS_at_LogPage;0)
	//ARRAY TEXT(<>IWS_at_LogTime;0)
	//ARRAY TEXT(<>IWS_at_ProcessName;0)
	C_BOOLEAN:C305(<>IWS_bo_HighlightLast; <>IWS_bo_Log; <>IWS_bo_Shutdown; <>IWS_bo_UseLoadInformer; DB_bo_NoLoad)
	C_LONGINT:C283(<>IWS_l_ShowHits; <>IWS_l_ShowProcessesInLog; GEN_cb_1; GEN_cb_4; GET_l_Button1; IWS_l_BUT1; IWS_l_But2; IWS_l_BUT3; IWS_l_BUT4; IWS_l_BUT5; IWS_l_BUT6)
	C_LONGINT:C283(IWS_l_BUT7; IWS_l_BUT8; IWS_l_BUT9; IWS2_l_BUT1; IWS2_l_But2; IWS2_l_BUT3; IWS2_l_BUT4; IWS2_l_BUT5; IWS2_l_BUT6; IWS2_l_BUT7; IWS2_l_BUT8)
	C_LONGINT:C283(IWS2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; IWS_t_COL1; IWS_t_COL2; IWS_t_COL3; IWS_t_COL4; IWS_t_COL5; IWS_t_COL6; IWS_t_COL7; IWS_t_COL8; IWS_t_COL9; IWS_t_HED1)
	C_TEXT:C284(IWS_t_HED2; IWS_t_HED3; IWS_t_HED4; IWS_t_HED5; IWS_t_HED6; IWS_t_HED7; IWS_t_HED8; IWS_t_HED9; IWS2_t_COL1; IWS2_t_COL2; IWS2_t_COL3)
	C_TEXT:C284(IWS2_t_COL4; IWS2_t_COL5; IWS2_t_COL6; IWS2_t_COL7; IWS2_t_COL8; IWS2_t_COL9; IWS2_t_HED1; IWS2_t_HED2; IWS2_t_HED3; IWS2_t_HED4; IWS2_t_HED5)
	C_TEXT:C284(IWS2_t_HED6; IWS2_t_HED7; IWS2_t_HED8; IWS2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [WEBSETUP_4D].WebLog"; Form event code:C388)
//******************************************************************************
//
//Form Method: WebLog
//
//Written by  John Moore on 11/4/98
//
//Copyright 1998 Modulus Software, Inc.
//
//19990610 b5 - LNH - Added support for SQL logging interface
//******************************************************************************



Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[WEBSETUP_4D:129]); "WebLog")
		GEN_cb_1:=Num:C11(<>IWS_bo_UseLoadInformer)  // Axel 5-2-01
		OBJECT SET ENABLED:C1123(GEN_cb_1; False:C215)
		<>IWS_l_ShowHits:=1
		<>IWS_bo_Log:=True:C214
		<>IWS_l_ShowProcessesInLog:=1
		GEN_cb_4:=0  //Num(◊SQL_bo_Debug)  `19990610 b5 - LNH
		IWS_UpdateLogArrays
		//  MSG_HideWindow   `we don't want this showing once we start up
		
		LB_SetupListbox(->IWS_lb_LBProcess; "IWS_t"; "IWS_L"; 1; -><>IWS_at_ProcessName; -><>IWS_at_ProcessName; -><>IWS_al_ProcessTicks)
		LB_SetColumnHeaders(->IWS_lb_LBProcess; "IWS_L"; 1; "Handler process"; "State"; "Ticks")
		LB_SetColumnWidths(->IWS_lb_LBProcess; "IWS_t"; 1; 87; 71; 46)
		
		LB_SetEnterable(->IWS_lb_LBProcess; False:C215; 0)
		LB_SetScroll(->IWS_lb_LBProcess; -3; -2)
		
		LB_StyleSettings(->IWS_lb_LBProcess; "Black"; 9; "IWS_t"; ->[ACCOUNTS:32])
		
		//``
		
		LB_SetupListbox(->IWS2_lb_LBProcess; "IWS2_t"; "IWS2_L"; 1; -><>IWS_at_LogTime; -><>IWS_at_LogPage)
		LB_SetColumnHeaders(->IWS2_lb_LBProcess; "IWS2_L"; 1; "LOG"; "URL")
		LB_SetColumnWidths(->IWS2_lb_LBProcess; "IWS2_t"; 1; 159; 499)
		
		LB_SetEnterable(->IWS2_lb_LBProcess; False:C215; 0)
		LB_SetScroll(->IWS2_lb_LBProcess; -3; -2)
		LB_StyleSettings(->IWS2_lb_LBProcess; "Black"; 9; "IWS2_t"; ->[ACCOUNTS:32])
		
		
		INT_SetDialog
		
	: (Form event code:C388=On Outside Call:K2:11)
		If (<>IWS_bo_Shutdown)
			<>IWS_bo_Log:=False:C215
			CANCEL:C270
		Else 
			If (<>IWS_l_ShowHits=1) & (<>IWS_bo_HighlightLast)
				<>IWS_at_LogTime:=Size of array:C274(<>IWS_at_LogTime)
				<>IWS_at_LogPage:=Size of array:C274(<>IWS_at_LogPage)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM:WebLog"; $_t_oldMethodName)
