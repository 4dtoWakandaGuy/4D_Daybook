If (False:C215)
	//Table Form Method Name: [USER]QV_SelectGroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/10/2012 22:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_lb_Groups;0)
	//ARRAY INTEGER(QV_ai_Tick;0)
	//ARRAY TEXT(QV_at_List;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; QV_ListSelected; QV_NewList)
	C_LONGINT:C283($_l_event; badd; GrpL_BUT1; GrpL_BUT2; GrpL_BUT3; QV_l_SelectType)
	C_TEXT:C284($_t_oldMethodName; oGrpCOL1; oGrpCOL2; oGrpCOL3; oGrpHED1; oGrpHED2; oGrpHED3; QV_SelectText; QV_t_EnteredItem)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].QV_SelectGroups"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "QV_SelectGroups")
		Case of 
			: (QV_l_SelectType=5)
				QV_SelectText:=QV_t_EnteredItem+" Does not exist"+" Select the correct group or click add to Create a new one."
			: (QV_l_SelectType=6)
				QV_SelectText:=QV_t_EnteredItem+" Does not exist"+" Select the correct group."
				
		End case 
		
		
		QV_NewList:=False:C215
		If (QV_t_EnteredItem="")
			OBJECT SET ENABLED:C1123(*; "oAddValue"; False:C215)
		End if 
		
		QV_ListSelected:=False:C215
		WS_AutoscreenSize(3; 325; 260)
		//position and size the window
		
		
		//QV_lb_Groups
		LB_SetupListbox(->QV_lb_Groups; "oGrp"; "GrpL"; 1; ->QV_ai_Tick; ->QV_at_List)
		
		LB_SetColumnHeaders(->QV_lb_Groups; "Locs_L"; 1; "Result"; "Result Name")
		LB_SetColumnWidths(->QV_lb_Groups; "oMacros"; 1; 20; 174)  // dont need to worry about the invisible ones
		LB_StyleSettings(->QV_lb_Groups; "Black"; 9; "Results"; ->[PREFERENCES:116])
		LB_SetEnterable(->QV_lb_Groups; False:C215; 0; "")
		LB_SetColours(->QV_lb_Groups; Black:K11:16; Grey:K11:15; Light grey:K11:13)  // stripey - white font black/grey stipes
		
		LB_SetScroll(->QV_lb_Groups; -1; 0)
		LB_StyleSettings(->QV_lb_Groups; "Black"; 9; "results"; ->[PREFERENCES:116])
		INT_SetLongintCheckFormat(->QV_ai_Tick)
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:QV_SelectGroups"; $_t_oldMethodName)
