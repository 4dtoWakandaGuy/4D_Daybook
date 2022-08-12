//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SetUpPView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(SP_lb_Listbox;0)
	//Array DATE(SP_ad_SPDateFrom;0)
	//Array DATE(SP_ad_SPDateTo;0)
	//Array REAL(SP_ar_SPCurrentProjection;0)
	//Array REAL(SP_ar_SPTargetAmount;0)
	//Array REAL(SP_ar_SPTargetResult;0)
	//Array TEXT(SP_at_SPPeriodCode;0)
	C_BOOLEAN:C305(DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultPlainFontSize; SP_l_BUT1; SP_l_BUT2; SP_l_BUT3; SP_l_BUT4; SP_l_BUT5; SP_l_BUT6; SP_l_SPeriodFromID)
	C_TEXT:C284(<>SYS_t_DefaultFontPlain; $_t_oldMethodName; oSP_COL1; oSP_COL2; oSP_COL3; oSP_COL4; oSP_COL5; oSP_COL6; oSP_HED1; oSP_HED2; oSP_HED3)
	C_TEXT:C284(oSP_HED4; oSP_HED5; oSP_HED6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_SetUpPView")
//this will use a Powerview area but at the moment it is an area list one
If (SP_l_SPeriodFromID>0)
	//SP_Powerview:=0
	LB_SetupListbox(->SP_lb_Listbox; "oSP"; "SP_L"; 1; ->SP_ad_SPDateFrom; ->SP_ad_SPDateTo; ->SP_at_SPPeriodCode; ->SP_ar_SPTargetAmount; ->SP_ar_SPTargetResult; ->SP_ar_SPCurrentProjection)
	LB_StyleSettings(->SP_lb_Listbox; "Blue"; 9; "SP"; ->[SALES_PROJECTION:113])
	LB_SetColumnHeaders(->SP_lb_Listbox; "SP_L"; 1; "From Date"; "To Date"; "Period Code"; "Target"; "Result"; "Current Projection")
	LB_SetColumnWidths(->SP_lb_Listbox; "oSP"; 1; 60; 60; 70; 50; 50; 50)  // dont need to worry about the invisible ones
	LB_SetScroll(->SP_lb_Listbox; -2; -3)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateFrom; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateTo; False:C215)
	OBJECT SET ENTERABLE:C238(SP_at_SPPeriodCode; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ar_SPTargetAmount; True:C214)
	OBJECT SET ENTERABLE:C238(SP_ar_SPTargetResult; True:C214)
	OBJECT SET ENTERABLE:C238(SP_ar_SPCurrentProjection; True:C214)
	OBJECT SET FORMAT:C236(SP_ar_SPCurrentProjection; "######0")
	OBJECT SET FORMAT:C236(SP_ar_SPTargetAmount; "######0")
	OBJECT SET FORMAT:C236(SP_ar_SPTargetResult; "######0")
Else 
	LB_SetupListbox(->SP_lb_Listbox; "oSP"; "SP_L"; 1; ->SP_ad_SPDateFrom; ->SP_ad_SPDateTo; ->SP_ar_SPTargetAmount; ->SP_ar_SPTargetResult; ->SP_ar_SPCurrentProjection)
	LB_SetColumnHeaders(->SP_lb_Listbox; "SP_L"; 1; "From Date"; "To Date"; "Target"; "Result"; "Current Projection")
	LB_SetColumnWidths(->SP_lb_Listbox; "oSP"; 1; 60; 60; 50; 50; 50)  // dont need to worry about the invisible ones
	LB_SetScroll(->SP_lb_Listbox; -2; -3)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateFrom; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateTo; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ar_SPTargetAmount; True:C214)
	OBJECT SET ENTERABLE:C238(SP_ar_SPTargetResult; True:C214)
	OBJECT SET ENTERABLE:C238(SP_ar_SPCurrentProjection; True:C214)
	OBJECT SET FORMAT:C236(SP_ar_SPTargetAmount; "######0")
	OBJECT SET FORMAT:C236(SP_ar_SPTargetResult; "######0")
	OBJECT SET FORMAT:C236(SP_ar_SPCurrentProjection; "######0")
End if 
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 
LB_SETFONT(->SP_lb_Listbox; "SP"; 1; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
ERR_MethodTrackerReturn("SP_SetUpPView"; $_t_oldMethodName)