If (False:C215)
	//Table Form Method Name: Object Name:      [DOCUMENTS].dMerge
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_lb_MergeFrom;0)
	//ARRAY BOOLEAN(DOC_lb_MergeTo;0)
	//ARRAY DATE(INV_ad_AllocationDate;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	//ARRAY REAL(INV_ar_DisplayAllocationAmount;0)
	//ARRAY TEXT(a01Stri1;0)
	//ARRAY TEXT(a01Stri2;0)
	//ARRAY TEXT(a01Stri3;0)
	//ARRAY TEXT(a01Stri4;0)
	//ARRAY TEXT(INV_at_DisplayAllocSource;0)
	//ARRAY TEXT(LB_at_02_1;0)
	//ARRAY TEXT(LB_at_02_2;0)
	//ARRAY TEXT(LB_at_02_3;0)
	//ARRAY TEXT(LB_at_02_4;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; bd2; bd3; ch0; DO2C_l_BUT6; DOC_l_BUT1; DOC_l_BUT2; DOC_l_BUT3; DOC_l_BUT4; DOC_l_BUT5; DOC_l_BUT6)
	C_LONGINT:C283(DOC_l_BUT8; DOC_l_BUT9; DOC_L7; DOC2_l_BUT1; DOC2_l_BUT2; DOC2_l_BUT3; DOC2_l_BUT4; DOC2_l_BUT5; DOC2_l_BUT7; DOC2_l_BUT8; DOC2_l_BUT9)
	C_LONGINT:C283(vALLevels; xOK)
	C_TEXT:C284($_t_oldMethodName; oDCopy_COL1; oDcopy_COL2; oDcopy_COL3; oDcopy_COL4; oDcopy_COL5; oDcopy_COL6; oDcopy_COL7; oDcopy_COL8; oDcopy_COL9; oDcopy_HED1)
	C_TEXT:C284(oDcopy_HED2; oDcopy_HED3; oDcopy_HED4; oDcopy_HED5; oDcopy_HED6; oDcopy_HED7; oDcopy_HED8; oDcopy_HED9; oDmerge_COL1; oDmerge_COL2; oDmerge_COL3)
	C_TEXT:C284(oDmerge_COL4; oDmerge_COL5; oDmerge_COL6; oDmerge_COL7; oDmerge_COL8; oDmerge_COL9; oDmerge_HED1; oDmerge_HED2; oDmerge_HED3; oDmerge_HED4; oDmerge_HED5)
	C_TEXT:C284(oDmerge_HED6; oDmerge_HED7; oDmerge_HED8; oDmerge_HED9; vRequest; vTitle1; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dMerge"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "dMerge")
		
		ARRAY BOOLEAN:C223(DOC_lb_MergeTo; 0)
		
		
		bd2:=0
		bd3:=2
		ch0:=1
		vTitle1:="0 Contacts found ..."
		vTitle2:="0 Contacts to Merge ..."
		vRequest:=""
		OBJECT SET ENABLED:C1123(xOK; False:C215)
		//Object Set Enabled(xOK;FALSE)
		
		ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
		ARRAY POINTER:C280(ORD_aPtr_OrderItemsSetup; 0)
		vALLevels:=2
		//LBi_ArrDef01 
		LBI_AddDef07to99(1)
		LBI_AddDef07to99(2)
		LBI_ArrayDefPic(1)
		LBI_arrayDefTime(1)
		LBI_ArrayDefPic(2)
		LBI_arrayDefTime(2)
		//LBi_ArrDef02 
		LB_SetupListbox(->DOC_lb_MergeFrom; "oDcopy"; "DOC2_L"; 1; ->a01Stri1; ->a01Stri2; ->a01Stri3; ->a01Stri4)
		//$err:=AL_SetArraysNam (eALContI;1;4;"a01Stri1";"a01Stri2";"a01Stri3";"a01Stri3";"a01Stri4")
		
		LB_SetColumnHeaders(->DOC_lb_MergeFrom; "DOC2_L"; 1; "Contact"; "Company"; "Contact Code"; "Company Code"; "")
		LB_SetColumnWidths(->DOC_lb_MergeFrom; "oDcopy"; 1; 117; 117; 100; 100)
		OBJECT SET VISIBLE:C603(a01Stri4; False:C215)
		LB_SetScroll(->DOC_lb_MergeFrom; -3; -2)
		
		//$err:=AL_SetArraysNam (eALOrdII;1;4;"LB_at_02_1";"LB_at_02_2";"LB_at_02_3";"LB_at_02_3";"LB_at_02_4")
		//NG 27/07/06 Modified to use list box although this form is probably out out use
		LB_SetupListbox(->DOC_lb_MergeTo; "oDmerge"; "DOC_L"; 1; ->LB_at_02_1; ->LB_at_02_2; ->LB_at_02_3; ->LB_at_02_4)
		OBJECT SET ENTERABLE:C238(INV_at_DisplayAllocSource; False:C215)
		OBJECT SET ENTERABLE:C238(INV_ar_DisplayAllocationAmount; False:C215)
		OBJECT SET ENTERABLE:C238(INV_ad_AllocationDate; False:C215)
		
		LB_SetColumnHeaders(->DOC_lb_MergeTo; "DOC_L"; 1; "Contact"; "Company"; "Contact Code"; "Company Code"; "")
		LB_SetColumnWidths(->DOC_lb_MergeTo; "oDmerge"; 1; 117; 117; 100; 100)
		OBJECT SET VISIBLE:C603(LB_at_02_4; False:C215)
		LB_SetScroll(->DOC_lb_MergeTo; -3; -2)
		
		//If ($err=0)
		//Letters_SWMerAL (->eALOrdII) `This call not required as setup here
		
		//End if 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].dMerge"; $_t_oldMethodName)
