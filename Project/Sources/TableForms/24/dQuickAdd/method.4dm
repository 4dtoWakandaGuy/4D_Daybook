If (False:C215)
	//Table Form Method Name: [ORDERS]dQuickAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2012 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(ORD_ar_QuickAddQuantity;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdCode;0)
	//ARRAY TEXT(ORD_AT_QuickAddProdName;0)
	//ARRAY TEXT(ORD_AT_QuickAddSerialNo;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $No; DB_l_ButtonClickedFunction; iCancel; iOK; vAct1; vAct2; vProcaMod)
	C_REAL:C285(vQuantity)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; vButtDisQA; vProdCode; vProdName; vSerialNo; vTitle2; vTitle3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].dQuickAdd"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Activate:K2:9)
		
		In_ButtChkDis(->vButtDisQA)
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				
				Case of 
					: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus"))
						QuickAdd_UpLine
					: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus"))
						vAct1:=ORD_AT_QuickAddProdCode
						If (vAct1#0)
							DELETE FROM ARRAY:C228(ORD_AT_QuickAddProdCode; vAct1; 1)
							DELETE FROM ARRAY:C228(ORD_AT_QuickAddProdName; vAct1; 1)
							DELETE FROM ARRAY:C228(ORD_ar_QuickAddQuantity; vAct1; 1)
							DELETE FROM ARRAY:C228(ORD_AT_QuickAddSerialNo; vAct1; 1)
							If (vAct1>Size of array:C274(ORD_AT_QuickAddProdCode))
								ORD_AT_QuickAddProdCode:=0
								ORD_AT_QuickAddProdName:=0
								ORD_ar_QuickAddQuantity:=0
								ORD_AT_QuickAddSerialNo:=0
								vAct1:=ORD_AT_QuickAddProdCode
								vProdCode:=""
								vProdName:=""
								vQuantity:=1
								vSerialNo:=""
							Else 
								vProdCode:=ORD_AT_QuickAddProdCode{vAct1}
								vProdName:=ORD_AT_QuickAddProdName{vAct1}
								vQuantity:=ORD_ar_QuickAddQuantity{vAct1}
								vSerialNo:=ORD_AT_QuickAddSerialNo{vAct1}
							End if 
						End if 
						vAct2:=Size of array:C274(ORD_AT_QuickAddProdCode)
						
				End case 
				DB_l_ButtonClickedFunction:=0
			Else 
				In_ButtCall("P:QuickAdd_InLPA:D:QuickAdd_InCan"; ""; ""; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; "Recordings"; ""; ""; ""; ""; ""; ->[ORDER_ITEMS:25]; ->vButtDisQA)
		End case 
	: ($_l_event=On Data Change:K2:15)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[ORDERS:24]); "dQuickAdd")
		If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3) | (vProcaMod=13))
			vTitle2:="Not Used"
			OBJECT SET FONT STYLE:C166(vTitle2; 0)
			OBJECT SET ENTERABLE:C238(vSerialNo; False:C215)
		Else 
			vTitle2:="Serial No"
		End if 
		vTitle3:="Product Name"
		If (vProcaMod=7)
			OBJECT SET ENTERABLE:C238(vProdName; False:C215)
			OBJECT SET FONT STYLE:C166(vTitle3; 0)
		End if 
		vButtDisQA:="I D  OSPFSSSRCADT"
		Input_Buttons(->vButtDisQA)
		In_ButtChkDis(->vButtDisQA)
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dQuickAdd"; $_t_oldMethodName)
