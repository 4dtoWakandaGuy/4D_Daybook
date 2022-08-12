If (False:C215)
	//Table Form Method Name: Object Name:      [COMPANIES].dRelate_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:31
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Companies;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_bestHeight; $_l_BestObjectWidth1; $_l_BestObjectWidth2; $_l_bestWidth; $_l_event; $_l_FormWidth; $_l_Index; $_l_oBottom; $_l_OHeight; $_l_oLeft; $_l_oRight)
	C_LONGINT:C283($_l_oTop; $_l_TotalWidth; $_l_WindowBottom; $_l_WindowHeight; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WIndowWidth; bd1; COM_l_BUT1; COM_l_But2)
	C_LONGINT:C283(COM_l_BUT3; COM_l_BUT4; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7; COM_l_BUT8; COM_l_BUT9; xNext)
	C_TEXT:C284($_t_oldMethodName; COM_t_BestColumn1; COM_t_BestColumn2; COM_t_BestColumn3; COM_t_COL1; COM_t_COL2; COM_t_COL3; COM_t_COL4; COM_t_COL5; COM_t_COL6; COM_t_COL7)
	C_TEXT:C284(COM_t_COL8; COM_t_COL9; COM_t_HED1; COM_t_HED2; COM_t_HED3; COM_t_HED4; COM_t_HED5; COM_t_HED6; COM_t_HED7; COM_t_HED8; COM_t_HED9)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dRelate_List"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//TRACE
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		OpenHelp(Table:C252(->[COMPANIES:2]); "dRelate_List")
		$_l_WindowHeight:=(Size of array:C274(GEN_at_Name)*12)+34
		If ($_l_WindowHeight<195)
			$_l_WindowHeight:=195
		End if 
		$_l_FormWidth:=195
		
		$_l_BestObjectWidth1:=10
		$_l_BestObjectWidth2:=10
		
		For ($_l_Index; 1; Size of array:C274(GEN_at_Identity))
			COM_t_BestColumn1:=GEN_at_Identity{$_l_Index}
			COM_t_BestColumn2:=GEN_at_Name{$_l_Index}
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn1; $_l_bestWidth; $_l_bestHeight)
			If ($_l_bestWidth>$_l_BestObjectWidth1)
				$_l_BestObjectWidth1:=$_l_bestWidth
			End if 
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn2; $_l_bestWidth; $_l_bestHeight)
			If ($_l_bestWidth>$_l_BestObjectWidth2)
				$_l_BestObjectWidth2:=$_l_bestWidth
			End if 
			
		End for 
		$_l_BestObjectWidth2:=$_l_BestObjectWidth2+35
		$_l_FormWidth:=195
		$_l_TotalWidth:=$_l_BestObjectWidth1+$_l_BestObjectWidth2
		If ($_l_TotalWidth>$_l_FormWidth)
			$_l_FormWidth:=$_l_TotalWidth
		End if 
		
		OBJECT SET VISIBLE:C603(COM_t_BestColumn1; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn2; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn3; False:C215)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		WS_AutoscreenSize(5; $_l_WindowHeight; $_l_FormWidth)
		SORT ARRAY:C229(GEN_at_Identity; GEN_at_Name; >)
		GEN_at_Identity:=1
		GEN_at_Name:=1
		bd1:=Size of array:C274(GEN_at_Identity)
		If (DB_t_CurrentFormUsage="NC")
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET ENABLED:C1123(xNext; False:C215)
			OBJECT SET VISIBLE:C603(xNext; False:C215)
		End if 
		
		LB_SetupListbox(->COM_lb_Companies; "COM_t"; "COM_L"; 1; ->GEN_at_Identity; ->GEN_at_Name)
		LB_SetColumnHeaders(->COM_lb_Companies; "COM_L"; 1; "Code"; "Name")
		
		LB_SetColumnWidths(->COM_lb_Companies; "COM_t"; 1; 80; 18)
		
		LB_SetEnterable(->COM_lb_Companies; False:C215; 0)
		LB_SetScroll(->COM_lb_Companies; -3; -2)
		LB_SETENTRYOPTIONS
		LB_StyleSettings(->COM_lb_Companies; "Black"; 9; "COM_t"; ->[ACCOUNTS:32])
		
		INT_SetDialog
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WIndowWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(*; "oComSelect"; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
		$_l_OHeight:=$_l_WindowBottom-$_l_oTop
		$_l_oBottom:=$_l_oTop+($_l_OHeight-1)
		OBJECT SET COORDINATES:C1248(*; "oComSelect"; $_l_oLeft; $_l_oTop; ($_l_WIndowWidth-1)-$_l_oLeft; $_l_oBottom-$_l_oTop)
		
		
		
		LISTBOX SELECT ROW:C912(COM_lb_Companies; 1; 0)
		LB_SetScroll(->COM_lb_Companies; 1)
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
	: ($_l_event=On Resize:K2:27)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		$_l_WIndowWidth:=$_l_WindowRight-$_l_WindowLeft
		OBJECT GET COORDINATES:C663(*; "oComSelect"; $_l_oLeft; $_l_oTop; $_l_oRight; $_l_oBottom)
		$_l_OHeight:=$_l_WindowBottom-$_l_oTop
		$_l_oBottom:=$_l_oTop+($_l_OHeight-1)
		OBJECT SET COORDINATES:C1248(*; "oComSelect"; $_l_oLeft; $_l_oTop; ($_l_WIndowWidth-1)-$_l_oLeft; $_l_oBottom-$_l_oTop)
		
End case 
ERR_MethodTrackerReturn("FM:dRelate_List"; $_t_oldMethodName)
