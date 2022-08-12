If (False:C215)
	//Table Form Method Name: [COMPANIES]dStatsView13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_stats;0)
	//ARRAY LONGINT(<>SV_al_Calc3;0)
	//ARRAY LONGINT(<>SV_al_Calc4;0)
	//ARRAY LONGINT(<>SV_al_Field3;0)
	//ARRAY LONGINT(<>SV_al_Field4;0)
	//ARRAY LONGINT(<>SV_al_TableNums;0)
	//ARRAY LONGINT(aSV2;0)
	//ARRAY REAL(aSV3;0)
	//ARRAY REAL(aSV4;0)
	//ARRAY TEXT(<>SV_at_FieldName1;0)
	//ARRAY TEXT(aSVN1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	//ARRAY TEXT(SV_at_CalcOption3;0)
	//ARRAY TEXT(SV_at_CalcOption4;0)
	//ARRAY TEXT(SV_at_Field4;0)
	//ARRAY TEXT(SV_at_FieldName1;0)
	//ARRAY TEXT(SV_at_FieldName3;0)
	//ARRAY TEXT(SV_at_FieldName4;0)
	C_BOOLEAN:C305(<>Stats_bo_Arraysinited; <>StatsSwitch; DB_bo_NoLoad; StatsSwitch)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_event; $_l_TableRow; $g; bd1; bd10; bd11; bd12; bd13; bd14; bd2)
	C_LONGINT:C283(bd3; bd4; bd5; bd6; COM_l_BUT1; COM_l_But2; COM_l_BUT3; COM_l_BUT4; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7)
	C_LONGINT:C283(COM_l_BUT8; COM_l_BUT9; DB_l_ButtonClickedFunction; iCancel; iOK; r1)
	C_TEXT:C284($_t_oldMethodName; COM_t_COL1; COM_t_COL2; COM_t_COL3; COM_t_COL4; COM_t_COL5; COM_t_COL6; COM_t_COL7; COM_t_COL8; COM_t_COL9; COM_t_HED1)
	C_TEXT:C284(COM_t_HED2; COM_t_HED3; COM_t_HED4; COM_t_HED5; COM_t_HED6; COM_t_HED7; COM_t_HED8; COM_t_HED9; vButtDisTxt; vTitle20)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dStatsView13"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(<>Stats_bo_Arraysinited))
			StatsView_Setup
		End if 
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dStatsView13")
		r1:=1
		If (Gen_Option=False:C215)
			$_l_TableRow:=Find in array:C230(<>SV_al_TableNums; SV_al_TableNumber{1})
			If ($_l_TableRow>0)
				$g:=Find in array:C230(SV_at_FieldName1; <>SV_at_FieldName1{$_l_TableRow})
				If ($g>0)
					SV_at_FieldName1:=$g
					If (<>SV_al_Field3{$_l_TableRow}>0)
						SV_at_FieldName3:=<>SV_al_Field3{$_l_TableRow}
					End if 
					If (<>SV_al_Field4{$_l_TableRow}>0)
						SV_at_FieldName4:=<>SV_al_Field4{$_l_TableRow}
					End if 
					If (<>SV_al_Calc3{$_l_TableRow}>0)
						SV_at_CalcOption3:=<>SV_al_Calc3{$_l_TableRow}
					End if 
					If (<>SV_al_Calc4{$_l_TableRow}>0)
						SV_at_CalcOption4:=<>SV_al_Calc4{$_l_TableRow}
					End if 
				End if 
			End if 
		End if 
		
		bd10:=0  //The Show All Field 1s check box
		bd11:=0  //The Find check box
		If (Size of array:C274(DB_at_TableName)=1)
			OBJECT SET ENABLED:C1123(bd11; False:C215)
			//_O_DISABLE BUTTON(bd11)
		End if 
		bd12:=0  //Delay recalc check box
		bd13:=0  //the x Chars check box
		bd14:=0  //the no of chars
		vTitle20:=""  //Used to show 'Calculating ...'
		//NB bd15, bd16, bd17 are used by progress indicator
		
		StatsView_Cal1
		
		bd1:=SV_at_FieldName1  //These are used to prevent unnec recalcs
		bd2:=DB_at_TableName
		bd3:=SV_at_FieldName3
		bd4:=SV_at_FieldName4
		bd5:=SV_at_CalcOption3
		bd6:=SV_at_CalcOption4
		
		vButtDisTxt:="IMDPMOSS SSSRCADT"
		Input_Buttons(->[COMPANIES:2]; ->vButtDisTxt)
		
		//`
		//aSVN1 175
		//aSV2 107
		//aSV3 109
		//aSV4 125
		
		
		LB_SetupListbox(->COM_lb_stats; "COM_t"; "COM_L"; 1; ->aSVN1; ->aSV2; ->aSV3; ->aSV4)
		LB_SetColumnHeaders(->COM_lb_stats; "COM_L"; 1; "COl1"; "COl2"; "COl3"; "COL4")
		
		LB_SetColumnWidths(->COM_lb_stats; "COM_t"; 1; 175; 107; 109; 125)
		
		LB_SetEnterable(->COM_lb_stats; False:C215; 0)
		LB_SetScroll(->COM_lb_stats; -3; -2)
		LB_SETENTRYOPTIONS
		LB_StyleSettings(->COM_lb_stats; "Black"; 9; "COM_t"; ->[ACCOUNTS:32])
		
		//``
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[COMPANIES:2]); "dStatsView13")
		vButtDisTxt:="IMDPMOSS SSSRCADT"
		In_ButtChkDis(->vButtDisTxt)
		bd1:=SV_at_FieldName1
		bd2:=DB_at_TableName
		bd3:=SV_at_FieldName3
		bd4:=SV_at_FieldName4
		bd5:=SV_at_CalcOption3
		bd6:=SV_at_CalcOption4
		vTitle20:=""
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		If ((DB_l_ButtonClickedFunction#0) | (iCancel=0) | ((iCancel=1) & (<>SYS_l_CancelProcess=Current process:C322)))  //Prevents dropping out if Cancel calcs
			In_ButtCall(""; ""; ""; ->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ""; ""; ""; ""; "StatsView_Sel")
		Else 
			If (<>StatsSwitch)
				<>StatsSwitch:=False:C215
				StatsSwitch:=True:C214
				CANCEL:C270
				
			End if 
			
		End if 
	: ($_l_event=On Outside Call:K2:11)
		If (<>StatsSwitch)
			<>StatsSwitch:=False:C215
			StatsSwitch:=True:C214
			CANCEL:C270
			
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:dStatsView13"; $_t_oldMethodName)
