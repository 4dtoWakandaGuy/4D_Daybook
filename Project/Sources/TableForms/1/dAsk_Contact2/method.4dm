If (False:C215)
	//Table Form Method Name: [CONTACTS]dask_Contact2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_LBCont;0)
	//ARRAY TEXT(CON_at_DisplayDetail;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_BestHeight; $_l_BestObjectWidth1; $_l_BestObjectWidth2; $_l_BestObjectWidth3; $_l_BestWidth; $_l_FormWidth; $_l_recordIndex; $_l_TotalWidth; $_l_WindowHeight; bd1; CON_l_BUT1)
	C_LONGINT:C283(CON_l_But2; CON_l_BUT3; CON_l_BUT4; CON_l_BUT5; CON_l_BUT6; CON_l_BUT7; CON_l_BUT8; CON_l_BUT9; xNew)
	C_TEXT:C284($_t_oldMethodName; COM_t_BestColumn1; COM_t_BestColumn2; COM_t_BestColumn3; CON_t_COL1; CON_t_COL2; CON_t_COL3; CON_t_COL4; CON_t_COL5; CON_t_COL6; CON_t_COL7)
	C_TEXT:C284(CON_t_COL8; CON_t_COL9; CON_t_HED1; CON_t_HED2; CON_t_HED3; CON_t_HED4; CON_t_HED5; CON_t_HED6; CON_t_HED7; CON_t_HED8; CON_t_HED9)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].dask_Contact2"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(CON_at_DisplayDetail; 0)
		DB_LoadDisplay(Table:C252(->[CONTACTS:1]); ->CON_at_DisplayDetail)
		
		OpenHelp(Table:C252(->[CONTACTS:1]); "dask_Contact2")
		
		Contact_List2
		vContact:=""
		
		If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_Companies)=3))
			
			OBJECT SET VISIBLE:C603(xNew; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddNew"; False:C215)
			OBJECT SET ENABLED:C1123(xNew; False:C215)
			OBJECT SET VISIBLE:C603(XNEW; False:C215)
		End if 
		$_l_BestObjectWidth1:=0
		$_l_BestObjectWidth2:=0
		$_l_BestObjectWidth3:=0
		For ($_l_recordIndex; 1; Size of array:C274(GEN_at_RecordCode))
			COM_t_BestColumn1:=GEN_at_RecordCode{$_l_recordIndex}
			COM_t_BestColumn2:=GEN_at_Name{$_l_recordIndex}
			COM_t_BestColumn3:=GEN_at_Identity{$_l_recordIndex}
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn1; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_BestObjectWidth1)
				$_l_BestObjectWidth1:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn2; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_BestObjectWidth2)
				$_l_BestObjectWidth2:=$_l_BestWidth
			End if 
			OBJECT GET BEST SIZE:C717(COM_t_BestColumn3; $_l_BestWidth; $_l_BestHeight)
			If ($_l_BestWidth>$_l_BestObjectWidth3)
				$_l_BestObjectWidth3:=$_l_BestWidth
			End if 
		End for 
		$_l_BestObjectWidth3:=$_l_BestObjectWidth3+20
		$_l_FormWidth:=377
		$_l_TotalWidth:=$_l_BestObjectWidth1+$_l_BestObjectWidth2+$_l_BestObjectWidth3
		If ($_l_TotalWidth>$_l_FormWidth)
			$_l_FormWidth:=$_l_TotalWidth
		End if 
		
		OBJECT SET VISIBLE:C603(COM_t_BestColumn1; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn2; False:C215)
		OBJECT SET VISIBLE:C603(COM_t_BestColumn3; False:C215)
		
		
		$_l_WindowHeight:=32+(bd1*13)
		If ($_l_WindowHeight<120)
			$_l_WindowHeight:=120
		End if 
		WS_AutoscreenSize(2; $_l_WindowHeight; $_l_FormWidth)
		
		LB_SetupListbox(->CON_lb_LBCont; "CON_t"; "CON_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name; ->GEN_at_Identity; ->SVS_at_PreviewEvent)
		LB_SetColumnHeaders(->CON_lb_LBCont; "CON_L"; 1; "Code"; "Name"; CON_at_DisplayDetail{CON_at_DisplayDetail}; "")
		
		LB_SetColumnWidths(->CON_lb_LBCont; "CON_t"; 1; $_l_BestObjectWidth1; $_l_BestObjectWidth2; $_l_BestObjectWidth3; 0)
		LB_SetEnterable(->CON_lb_LBCont; False:C215; 0)
		LB_SetScroll(->CON_lb_LBCont; -3; -2)
		LB_SETENTRYOPTIONS
		LB_StyleSettings(->CON_lb_LBCont; "Black"; 9; "CON_t"; ->[CONTACTS:1])
		
		GEN_at_Identity:=1
		GEN_at_Name:=1
		GEN_at_RecordCode:=1
		LISTBOX SELECT ROW:C912(CON_lb_LBCont; GEN_at_Identity; 0)
		LB_SetScroll(->CON_lb_LBCont; GEN_at_Identity)
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:dask_Contact2"; $_t_oldMethodName)
