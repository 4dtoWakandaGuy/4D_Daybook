If (False:C215)
	//Table Form Method Name: [COMPANIES]dLists
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
	//ARRAY LONGINT(LM_al_ListItemsModified;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(LM_at_ListitemModified;0)
	C_BOOLEAN:C305(<>PER_bo_SystemSettingAccess; DB_bo_NoLoad)
	C_LONGINT:C283($_l_bestHeight; $_l_BestObjectWidth1; $_l_bestWidth; $_l_event; $_l_FormWIdth; $_l_Index; $_l_SIze; $_l_SizeOfArray; $_l_TotalWidth; bd1; bd2)
	C_LONGINT:C283(COM_l_BUT1; COM_l_But2; COM_l_BUT3; COM_l_BUT4; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7; COM_l_BUT8; COM_l_BUT9; vAdd; xCount)
	C_LONGINT:C283(xNext)
	C_TEXT:C284($_t_oldMethodName; COM_t_BestColumn1; COM_t_BestColumn2; COM_t_BestColumn3; COM_t_COL1; COM_t_COL2; COM_t_COL3; COM_t_COL4; COM_t_COL5; COM_t_COL6; COM_t_COL7)
	C_TEXT:C284(COM_t_COL8; COM_t_COL9; COM_t_HED1; COM_t_HED2; COM_t_HED3; COM_t_HED4; COM_t_HED5; COM_t_HED6; COM_t_HED7; COM_t_HED8; COM_t_HED9)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dLists"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY LONGINT:C221(LM_al_ListItemsModified; 0)
		ARRAY TEXT:C222(LM_at_ListitemModified; 0)
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dLists")
		
		SORT ARRAY:C229(GEN_at_Name; GEN_at_RecordCode; GEN_at_Identity; >)
		If (False:C215)
			GEN_at_Name:=1
			GEN_at_RecordCode:=1
			GEN_at_Identity:=1
		End if 
		
		If (vAdd=1) & (False:C215)
			bd2:=1
			OBJECT SET ENTERABLE:C238(vText; True:C214)
			$_l_SizeOfArray:=Size of array:C274(GEN_at_Name)+1
			INSERT IN ARRAY:C227(GEN_at_Name; $_l_SizeOfArray; 1)
			INSERT IN ARRAY:C227(GEN_at_RecordCode; $_l_SizeOfArray; 1)
			INSERT IN ARRAY:C227(GEN_at_Identity; $_l_SizeOfArray; 1)
			GEN_at_Name{$_l_SizeOfArray}:=vText
			GEN_at_RecordCode{$_l_SizeOfArray}:=""
			GEN_at_Identity{$_l_SizeOfArray}:="+"
			GEN_at_Name:=$_l_SizeOfArray
			GEN_at_RecordCode:=$_l_SizeOfArray
			GEN_at_Identity:=$_l_SizeOfArray
		Else 
			
			If (Size of array:C274(GEN_at_Name)>0)
				GEN_at_Name:=1
				GEN_at_RecordCode:=1
				GEN_at_Identity:=1
			Else 
				GEN_at_Name:=0
				GEN_at_RecordCode:=0
				GEN_at_Identity:=0
			End if 
			
			vText:=GEN_at_Name{GEN_at_Name}
			bd2:=0
			OBJECT SET ENTERABLE:C238(vText; False:C215)
			OBJECT SET ENABLED:C1123(xcount; False:C215)
			//_O_DISABLE BUTTON(xCount)
			OBJECT SET VISIBLE:C603(xcount; False:C215)
		End if 
		//``
		$_l_BestObjectWidth1:=195
		
		For ($_l_Index; 1; Size of array:C274(GEN_at_Name))
			COM_t_BestColumn1:=GEN_at_Name{$_l_Index}
			
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn1; $_l_bestWidth; $_l_bestHeight)
			If ($_l_bestWidth>$_l_BestObjectWidth1)
				$_l_BestObjectWidth1:=$_l_bestWidth
			End if 
			
		End for 
		$_l_BestObjectWidth1:=$_l_BestObjectWidth1+35
		$_l_FormWIdth:=195
		$_l_TotalWidth:=$_l_BestObjectWidth1
		If ($_l_TotalWidth>$_l_FormWIdth)
			$_l_FormWIdth:=$_l_TotalWidth
		End if 
		$_l_SIze:=22+(Size of array:C274(GEN_at_Name)*13)
		If ($_l_SIze<138)
			$_l_SIze:=138
		End if 
		WS_AutoscreenSize(2; $_l_SIze; $_l_FormWIdth)
		
		OBJECT SET VISIBLE:C603(COM_t_BestColumn1; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn2; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn3; False:C215)
		
		LB_SetupListbox(->COM_lb_Companies; "COM_t"; "COM_L"; 1; ->GEN_at_Name; ->GEN_at_RecordCode; ->GEN_at_Identity)
		LB_SetColumnHeaders(->COM_lb_Companies; "COM_L"; 1; "Name"; "Name"; "Next")
		
		LB_SetColumnWidths(->COM_lb_Companies; "COM_t"; 1; $_l_BestObjectWidth1; 0; 0)
		
		LB_SetEnterable(->COM_lb_Companies; False:C215; 0)
		LB_SetScroll(->COM_lb_Companies; -3; -2)
		LB_SETENTRYOPTIONS
		LB_StyleSettings(->COM_lb_Companies; "Black"; 9; "COM_t"; ->[ACCOUNTS:32])
		
		//```
		bd1:=Size of array:C274(GEN_at_Name)
		If (<>PER_bo_SystemSettingAccess=False:C215)
			//_O_DISABLE BUTTON(xNext)
			OBJECT SET ENABLED:C1123(xNext; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET VISIBLE:C603(xNext; False:C215)
			//_O_DISABLE BUTTON(xCount)
			OBJECT SET ENABLED:C1123(xCount; False:C215)
			OBJECT SET VISIBLE:C603(*; "oremoveone"; False:C215)
			OBJECT SET VISIBLE:C603(xCount; False:C215)
		End if 
		If (DB_t_CurrentFormUsage="NC")
			//_O_DISABLE BUTTON(xNext)
			OBJECT SET ENABLED:C1123(xNext; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET VISIBLE:C603(xNext; False:C215)
			
		End if 
		
		INT_SetDialog
		LISTBOX SELECT ROW:C912(COM_lb_Companies; GEN_at_Name; 0)
		LB_SetScroll(->COM_lb_Companies; GEN_at_Name)
		SD2_SetDiaryPopup
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM:dLists"; $_t_oldMethodName)
