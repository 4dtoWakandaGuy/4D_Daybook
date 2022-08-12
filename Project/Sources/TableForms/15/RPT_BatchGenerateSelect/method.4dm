If (False:C215)
	//Table Form Method Name: [USER]RPT_BatchGenerateSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/04/2010 14:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRT_lb_PrintOptions;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol1Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol2Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol3Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelCol4Desc;0)
	//ARRAY TEXT(RPT_at_GenTypeSelGenType;0)
	//ARRAY TEXT(RPT_at_GenTypeSelRecCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Height; $_l_Width; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; RPT_l_btnGenTypeSelCancel; RPT_l_btnGenTypeSelContinue; RPT_l_btnGenTypeSelToggleAll; RPT_l_BUT1; RPT_l_But2)
	C_LONGINT:C283(RPT_l_BUT3; RPT_l_BUT4; RPT_l_BUT5; RPT_l_BUT6; RPT_l_BUT7; RPT_l_BUT8; RPT_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; RPT_t_GenTypeSelGenTypeHead; RPT_t_COL1; RPT_t_COL2; RPT_t_COL3; RPT_t_COL4; RPT_t_COL5; RPT_t_COL6; RPT_t_COL7; RPT_t_COL8; RPT_t_COL9)
	C_TEXT:C284(RPT_T_GenTypeSelHeader; RPT_T_GenTypeSelHeader1; RPT_T_GenTypeSelHeader2; RPT_T_GenTypeSelHeader3; RPT_T_GenTypeSelHeader4; RPT_t_HED1; RPT_t_HED2; RPT_t_HED3; RPT_t_HED4; RPT_t_HED5; RPT_t_HED6)
	C_TEXT:C284(RPT_t_HED7; RPT_t_HED8; RPT_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].RPT_BatchGenerateSelect"; Form event code:C388)


Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		RPT_l_btnGenTypeSelContinue:=0  //added 13/03/09 v631b120p -kmw
		RPT_l_btnGenTypeSelCancel:=0  //added 13/03/09 v631b120p -kmw
		RPT_l_btnGenTypeSelToggleAll:=0  //added 13/03/09 v631b120p -kmw
		
		LB_SetupListbox(->PRT_lb_PrintOptions; "RPT_t"; "RPT_L"; 1; ->RPT_at_GenTypeSelRecCode; ->RPT_at_GenTypeSelCol1Desc; ->RPT_at_GenTypeSelCol2Desc; ->RPT_at_GenTypeSelCol3Desc; ->RPT_at_GenTypeSelCol4Desc; ->RPT_at_GenTypeSelGenType)
		
		LB_SetColumnHeaders(->PRT_lb_PrintOptions; "RPT_L"; 1; RPT_T_GenTypeSelHeader; RPT_T_GenTypeSelHeader1; RPT_T_GenTypeSelHeader2; RPT_T_GenTypeSelHeader3; RPT_T_GenTypeSelHeader4; RPT_t_GenTypeSelGenTypeHead)
		
		LB_SetEnterable(->PRT_lb_PrintOptions; False:C215; 0)
		LB_SetColumnWidths(->PRT_lb_PrintOptions; "RPT_t"; 1; 75; 150; 150; 150; 190; 105)
		
		$_l_Width:=(459-355)+(87+187+88+50+100+20+20)+10
		$_l_Height:=Size of array:C274(RPT_at_GenTypeSelRecCode)*12
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		If (($_l_windowTop+$_l_Height)>(Screen height:C188-20))
			
			$_l_Height:=(Screen height:C188-20)-$_l_windowTop
		End if 
		WS_AutoscreenSize(3; $_l_Height; $_l_Width)
		LB_SetScroll(->PRT_lb_PrintOptions; -3; -2)
		LB_StyleSettings(->PRT_lb_PrintOptions; "Black"; 9; "RPT_t"; ->[DIARY:12])
		INT_SetDialog
	Else 
		
End case 
ERR_MethodTrackerReturn("FM [USER].RPT_BatchGenerateSelect"; $_t_oldMethodName)
