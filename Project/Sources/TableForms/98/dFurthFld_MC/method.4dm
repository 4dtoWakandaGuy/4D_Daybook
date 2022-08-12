If (False:C215)
	//Table Form Method Name: [CUSTOM_FIELDS]dFurthFld_MC
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
	//ARRAY BOOLEAN(CUS_lb_FurtherFields;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(CUS_at_PageText;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_BOOLEAN:C305(DB_bo_FontsInited; DB_bo_NoLoad; DB_bo_RecordModified; vFromIn)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_event; $_l_Index; $_l_SizeofArray; DB_l_ButtonClickedFunction; FF_l_BUT1; FF_l_BUT2; FF_l_BUT3; FF_l_BUT4; iCancel)
	C_LONGINT:C283(iOK)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_oldMethodName; oFF_COL1; oFF_COL2; oFF_COL3; oFF_COL4; oFF_HED1; oFF_HED2; oFF_HED3; oFF_HED4)
	C_TEXT:C284(vButtDisO)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CUSTOM_FIELDS].dFurthFld_MC"; Form event code:C388)
//dFurthFld_MC
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CUSTOM_FIELDS:98]); "dFurthFld_MC")
		//$err:=AL_SetArraysNam (eALFurth;1;4;"FUR_at_CustomFieldNames";"CUS_at_DisplayedData";"CUS_at_PageText";"FUR_at_CustomFieldTypes")
		LB_SetupListbox(->CUS_lb_FurtherFields; "oFF"; "FF_L"; 1; ->FUR_at_CustomFieldNames; ->CUS_at_DisplayedData; ->CUS_at_PageText; ->FUR_at_CustomFieldTypes)
		LB_StyleSettings(->CUS_lb_FurtherFields; "Black"; 9; "FF"; ->[CUSTOM_FIELDS:98])
		LB_SetColumnHeaders(->CUS_lb_FurtherFields; "FF_L"; 1; "Field Name"; "Value From"; "Value To"; "Type")
		LB_SetColumnWidths(->CUS_lb_FurtherFields; "oFF"; 1; 128; 128; 128; 30)  // dont need to worry about the invisible ones
		LB_SetScroll(->CUS_lb_FurtherFields; -2; -2)
		If (Not:C34(DB_bo_FontsInited))
			DB_SetDefaultFonts
		End if 
		LB_SETFONT(->CUS_lb_FurtherFields; "FF"; 1; <>SYS_t_DefaultFontBold; 1; 1; <>SYS_l_DefaultBoldFontSize; 1)
		LB_SETFONT(->CUS_lb_FurtherFields; "FF"; 2; <>SYS_t_DefaultFontPlain; 1; 1; <>SYS_l_DefaultPlainFontSize; 1)
		OBJECT SET ENTERABLE:C238(FUR_at_CustomFieldNames; False:C215)
		OBJECT SET ENTERABLE:C238(FUR_at_CustomFieldTypes; False:C215)
		OBJECT SET HORIZONTAL ALIGNMENT:C706(FUR_at_CustomFieldTypes; Align center:K42:3)
		
		DB_bo_RecordModified:=False:C215
		vButtDisO:="I DPMOSSFSSSRCAXT"
		Input_Buttons(->[CUSTOM_FIELDS:98]; ->vButtDisO)
	: (($_l_event=On Activate:K2:9) | (vFromIn))
		OpenHelp(Table:C252(->[CUSTOM_FIELDS:98]); "dFurthFld_MC")
		vFromIn:=After:C31
		
		In_ButtChkDis(->vButtDisO)
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=99999)  //>>  >> /no number ??  ??
				$_l_SizeofArray:=Size of array:C274(FUR_at_CustomFieldNames)
				For ($_l_Index; 1; $_l_SizeofArray)
					If (Length:C16(FUR_at_CustomFieldTypes{$_l_Index})=1)
						GOTO OBJECT:C206(CUS_lb_FurtherFields)
						EDIT ITEM:C870(CUS_at_DisplayedData; $_l_Index)
						$_l_Index:=$_l_SizeofArray
					End if 
				End for 
			Else 
				In_ButtdCall(->[CUSTOM_FIELDS:98])
				
		End case 
	: ($_l_event=On Outside Call:K2:11)
		
		
	: ($_l_event=On Data Change:K2:15)
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dFurthFld_MC"; $_t_oldMethodName)
