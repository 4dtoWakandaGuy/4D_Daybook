If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_Apply
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(s0)
	//ARRAY BOOLEAN(DU_abo_ClearValues;0)
	//ARRAY BOOLEAN(DU_lb_FieldNames;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY LONGINT(AA_l_aListitemIDs;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(DU_at_ChangedValue;0)
	//ARRAY TEXT(DU_at_ChangeTypes;0)
	//ARRAY TEXT(DU_at_ChangeTypesPOPup;0)
	//ARRAY TEXT(DU_at_FieldChangeTypes;0)
	//ARRAY TEXT(SVS_at_PreviewTypeN;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_FieldRow; $_l_Index; $_l_TablePosition; ch1; ch2; DU_l_BUT1; DU_l_BUT10; DU_l_BUT11; DU_l_BUT12; DU_l_BUT13)
	C_LONGINT:C283(DU_l_BUT14; DU_l_BUT15; DU_l_BUT16; DU_l_BUT17; DU_l_BUT18; DU_l_BUT19; DU_l_BUT2; DU_l_BUT20; DU_l_BUT21; DU_l_BUT22; DU_l_BUT23)
	C_LONGINT:C283(DU_l_BUT24; DU_l_BUT25; DU_l_BUT26; DU_l_BUT27; DU_l_BUT3; DU_l_BUT4; DU_l_BUT5; DU_l_BUT6; DU_l_BUT7; DU_l_BUT8; DU_l_BUT9)
	C_LONGINT:C283(GEN_l_CurrentTable; r0)
	C_TEXT:C284($_t_oldMethodName; oDU_COL1; oDU_COL10; oDU_COL11; oDU_COL12; oDU_COL13; oDU_COL14; oDU_COL15; oDU_COL16; oDU_COL17; oDU_COL18)
	C_TEXT:C284(oDU_COL19; oDU_COL2; oDU_COL20; oDU_COL21; oDU_COL22; oDU_COL23; oDU_COL24; oDU_COL25; oDU_COL26; oDU_COL27; oDU_COL3)
	C_TEXT:C284(oDU_COL4; oDU_COL5; oDU_COL6; oDU_COL7; oDU_COL8; oDU_COL9; oDU_HED1; oDU_HED10; oDU_HED11; oDU_HED12; oDU_HED13)
	C_TEXT:C284(oDU_HED14; oDU_HED15; oDU_HED16; oDU_HED17; oDU_HED18; oDU_HED19; oDU_HED2; oDU_HED20; oDU_HED21; oDU_HED22; oDU_HED23)
	C_TEXT:C284(oDU_HED24; oDU_HED25; oDU_HED26; oDU_HED27; oDU_HED3; oDU_HED4; oDU_HED5; oDU_HED6; oDU_HED7; oDU_HED8; oDU_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_Apply"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Load_Fields
		
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_Apply")
		ARRAY TEXT:C222(AA_at_ListItems; 0)
		ARRAY LONGINT:C221(AA_l_aListitemIDs; 0)
		OBJECT SET VISIBLE:C603(AA_at_ListItems; False:C215)
		
		s0:=1
		r0:=1
		OBJECT SET VISIBLE:C603(*; "oNoChange"; False:C215)
		$_l_FieldRow:=Find in array:C230(<>SYS_at_CurrentTableFieldNames; "Export")
		If ($_l_FieldRow>0)
			$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; vNo)
			$_l_FieldRow:=<>SYS_al_2DFieldNumbers{$_l_TablePosition}{$_l_FieldRow}
		End if 
		
		If ($_l_FieldRow>0)
			ch1:=1
		Else 
			OBJECT SET ENABLED:C1123(ch1; False:C215)
		End if 
		
		If (<>SYS_al_TableUniqueField{vNo}=0)
			OBJECT SET ENABLED:C1123(ch2; False:C215)
		End if 
		INT_SetDialog
		SD2_SetDiaryPopup
		ARRAY TEXT:C222(DU_at_ChangeTypes; 0)
		ARRAY TEXT:C222(DU_at_ChangeTypesPOPup; 0)
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "None")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Change to")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Add to End")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Add to Value")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Add to Date")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Add to Start")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Subtract from Value")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Subtract from Date")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Change Flag")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Remove String")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "% Change")
		APPEND TO ARRAY:C911(DU_at_ChangeTypes; "Evaluated Change")
		
		
		
		//`````````````````````
		ARRAY TEXT:C222(DU_at_FieldChangeTypes; 0)
		ARRAY TEXT:C222(DU_at_FieldChangeTypes; Size of array:C274(SVS_at_PreviewTypeN))
		For ($_l_Index; 1; Size of array:C274(SVS_at_PreviewTypeN))
			DU_at_FieldChangeTypes{$_l_Index}:="None"
		End for 
		//`TRACE
		ARRAY TEXT:C222(DU_at_ChangedValue; 0)  //note text
		ARRAY TEXT:C222(DU_at_ChangedValue; Size of array:C274(SVS_at_PreviewTypeN))
		ARRAY BOOLEAN:C223(DU_abo_ClearValues; 0)
		ARRAY BOOLEAN:C223(DU_abo_ClearValues; Size of array:C274(SVS_at_PreviewTypeN))
		LB_SetupListbox(->DU_lb_FieldNames; "oDU"; "DU_L"; 1; ->SVS_at_PreviewTypeN; ->DU_at_FieldChangeTypes; ->DU_at_ChangedValue; ->DU_abo_ClearValues)
		LB_SetColumnHeaders(->DU_lb_FieldNames; "DU_L"; 1; "Fields"; "Change Type"; "Data to Change"; "Clear Values")
		
		
		LB_SetColumnWidths(->DU_lb_FieldNames; "oABR"; 1; 120; 100; 275; 40)
		
		
		
		LB_SetScroll(->DU_lb_FieldNames; -2; -2)
		LB_SetChoiceList("ChangeTypes"; ->DU_at_ChangeTypes; ->DU_at_FieldChangeTypes; ->DU_abo_ClearValues)
		LB_SetEnterable(->DU_lb_FieldNames; False:C215; 0)
		LB_SetEnterable(->DU_lb_FieldNames; True:C214; 2)
		LB_SetEnterable(->DU_lb_FieldNames; True:C214; 3)
		LB_SetEnterable(->DU_lb_FieldNames; True:C214; 4)
		LB_StyleSettings(->DU_lb_FieldNames; "Black"; 9; "STK_t"; ->[COMPANIES:2])
		
		//``````````````````
	: ($_l_event=On Deactivate:K2:10)
		//   PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(Table:C252(GEN_l_CurrentTable))
		
End case 
ERR_MethodTrackerReturn("FM:dAsk_Apply"; $_t_oldMethodName)
