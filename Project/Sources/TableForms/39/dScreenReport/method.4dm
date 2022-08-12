If (False:C215)
	//Table Form Method Name: Object Name:      [INVOICES].dScreenReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2011 11:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY REAL(a01Real1;0)
	//ARRAY REAL(a01Real3;0)
	//ARRAY REAL(a01Real4;0)
	//ARRAY REAL(a01Real5;0)
	//ARRAY REAL(a01Real6;0)
	//ARRAY REAL(INV_ar_TotalDue;0)
	//ARRAY TEXT(a01Stri1;0)
	//ARRAY TEXT(a01Stri2;0)
	C_BOOLEAN:C305(<>AutoFind; DB_bo_NoLoad; DB_bo_RecordModified; vBefore2)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_ButtonPressed; $_l_event; $_l_PeriodID; DB_l_ButtonClickedFunction; iCancel; INVi_l_BUT1; INVi_l_But2; INVi_l_But3; INVi_l_But4; INVi_l_But5; INVi_l_But6)
	C_LONGINT:C283(INVi_l_But7; INVi_l_But8; iOK; r1; vALLevels)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom; INVi_COL1; INVi_COL2; INVi_COL3; INVi_COL4; INVi_COL5; INVi_COL6; INVi_COL7; INVi_COL8; INVi_HED1)
	C_TEXT:C284(INVi_HED2; INVi_HED3; INVi_HED5; INVi_HED6; INVi_HED8; INVit_HED4; INVit_HED7; vButtDisO; vButtDisTxt; vSelPrev)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].dScreenReport"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
	: ($_l_event=On Resize:K2:27)
		
		
		//WS_AutoscreenSize (2;375;553)
		LBI_Scrollonresize(->GEN_lb_ItemsArea)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		OpenHelp(Table:C252(->[INVOICES:39]); "dScreenReport")
		WS_AutoscreenSize(1; 375; 553; Table name:C256(->[INVOICES:39])+"_"+"dScreenReport")
		ARRAY POINTER:C280(COM_aptr_LBItemsSetup; 0)
		vALLevels:=0
		vDate:=Current date:C33-90
		$_l_PeriodID:=Check_Period
		ACC_t_PeriodFrom:=[PERIODS:33]Period_Code:1
		vDate:=Current date:C33
		r1:=1
		
		Gen_ScrRepLPB
		
		//.$err:=1
		//$err:=AL_SetArraysNam (eALContI;1;8;"a01Stri1";"a01Stri2";"a01Real1";"INV_ar_TotalDue";"a01Real3";"a01Real4";"a01Real5";"a01Real6")
		
		
		LB_SetupListbox(->GEN_lb_ItemsArea; "INVi"; "INVi_L"; 1; ->a01Stri1; ->a01Stri2; ->a01Real1; ->INV_ar_TotalDue; ->a01Real3; ->a01Real4; ->a01Real5; ->a01Real6)
		Gen_ScrRepLPTit  //sets the column hearers
		LB_SetScroll(->GEN_lb_ItemsArea; -2; -2)
		LB_SetColumnWidths(->GEN_lb_ItemsArea; "INVi"; 1; 80; 140; 70; 70; 70; 70; 70; 70)  // dont need to worry about the invisible ones
		LB_SetFormat(->GEN_lb_ItemsArea; 1; ""; 3; 8; Align right:K42:4)  // header,no format, cols 3-8, align right
		LB_SetFormat(->GEN_lb_ItemsArea; 2; ""; 3; 8; Align right:K42:4)  // body,no format, cols 3-8, align right
		LB_StyleSettings(->GEN_lb_ItemsArea; "Black"; 9; "INVi"; ->[INVOICES:39])
		
		//OBJECT SET ENTERABLE(a01Stri1; False)
		////OBJECT SET ENTERABLE(a01Stri2; False)
		//OBJECT SET ENTERABLE(a01Real1; False)
		//OBJECT SET ENTERABLE(INV_ar_TotalDue; False)
		//OBJECT SET ENTERABLE(a01Real3; False)
		//OBJECT SET ENTERABLE(a01Real4; False)
		//OBJECT SET ENTERABLE(a01Real5; False)
		//OBJECT SET ENTERABLE(a01Real6; False)
		//End if
		
		vButtDisTxt:="OMDPMOSS  SSRCAXT"
		Out_Buttons(->[COMPANIES:2]; ->vButtDisTxt)
		
		vBefore2:=True:C214
		//Gen_PostKey (1;92;256)
		
		
	: (vBefore2)
		vBefore2:=False:C215
		Gen_ScrRepCalc
		
		
		
	: ($_l_event=On Activate:K2:9)
		
		OpenHelp(Table:C252(->[INVOICES:39]); "dScreenReport")
		In_ButtChkDis(->vButtDisTxt)
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
		Case of 
			: ($_l_ButtonPressed=DB_GetButtonFunction("Plus")) | ($_l_ButtonPressed=DB_GetButtonFunction("Minus")) | ($_l_ButtonPressed=DB_GetButtonFunction("Open"))
				
				inButtSubHandle(FORM Get current page:C276; ->[INVOICES:39]; "DscreenReport")
				
			: ($_l_ButtonPressed=DB_GetButtonFunction("Find"))
				DB_l_ButtonClickedFunction:=0
				<>AutoFind:=False:C215
				
				vSelPrev:=""
				Comp_Sel
				If (OK=1)
					Gen_ScrRepLPB
					//AL_UpdateArrays (eALContI;-2)`NG Removed 27/07/06 Not needed with list box
					vBefore2:=True:C214
					Gen_PostKey(1; 92; 256)
				End if 
			: ($_l_ButtonPressed=DB_GetButtonFunction("Select")) | ($_l_ButtonPressed=DB_GetButtonFunction("SelectO"))
				Gen_ScrRepSel
			Else 
				BUT_p_ButtonStringPointer:=->vButtDisO
				
		End case 
		In_ButtCall(""; ""; ""; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ""; ""; ""; ""; "")  //R:Startup_OBLPA:D:Startup_OBLPCan
	: ($_l_event=On Data Change:K2:15)
		
		
		DB_bo_RecordModified:=True:C214
End case 
ERR_MethodTrackerReturn("FM:dScreenReport"; $_t_oldMethodName)
