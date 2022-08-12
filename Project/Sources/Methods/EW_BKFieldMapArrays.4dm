//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_BKFieldMapArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(e_LB_BKfields;0)
	//ARRAY BOOLEAN(e_LB_FieldMap;0)
	//ARRAY LONGINT(EW_al_BKFieldLength;0)
	//ARRAY LONGINT(EW_al_BKFieldType;0)
	//ARRAY LONGINT(EW_al_dbFieldMapTypes;0)
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	//ARRAY TEXT(EW_at_BKDescription;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_BKType;0)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	//ARRAY TEXT(EW_at_DBTypes;0)
	C_BOOLEAN:C305(DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_Index; $_l_Mapnumber; $1; BKF_l_BUT1; BKF_l_BUT2; BKF_l_BUT3; BKF_l_BUT4; BKF_l_BUT5; MAP_l_BUT1)
	C_LONGINT:C283(MAP_l_BUT2; MAP_l_BUT3; MAP_l_BUT4; MAP_l_BUT5)
	C_TEXT:C284(<>FontBold0; <>SYS_t_DefaultFontPlain; $_t_BKTableName; $_t_oldMethodName; $2; $3; oBKF_COL1; oBKF_COL2; oBKF_COL3; oBKF_COL4; oBKF_COL5)
	C_TEXT:C284(oBKF_HED1; oBKF_HED2; oBKF_HED3; oBKF_HED4; oBKF_HED5; oMAP_COL1; oMAP_COL2; oMAP_COL3; oMAP_COL4; oMAP_COL5; oMAP_HED1)
	C_TEXT:C284(oMAP_HED2; oMAP_HED3; oMAP_HED4; oMAP_HED5)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_BKFieldMapArrays")
//EW_BKFieldMapArrays
// 7/10/02 pb
// Builds field arrays for display on Field Map setup dialogue
// Parameters: $1 = the DayBook table number XX changed see below
//                     $1 = the field map reference number 26/08/03 pb
//                     $2 = the BK table (Items or Customers)
//                     $3 = which arrays to set ("BK" or "DB")


$_l_Mapnumber:=$1
$_t_BKTableName:=$2

If ($3="BK")
	ARRAY TEXT:C222(EW_at_BKFieldNames; 0)
	ARRAY TEXT:C222(EW_at_BKDescription; 0)
	ARRAY LONGINT:C221(EW_al_BKFieldType; 0)
	ARRAY LONGINT:C221(EW_al_BKFieldLength; 0)
	ARRAY TEXT:C222(EW_at_BKType; 0)
	
	If ($_t_BKTableName#"")
		// these are the Business Kit fields
		QUERY:C277([EW_BKFields:122]; [EW_BKFields:122]Group:4=$_t_BKTableName)
		SELECTION TO ARRAY:C260([EW_BKFields:122]FieldName:1; EW_at_BKFieldNames; [EW_BKFields:122]Description:2; EW_at_BKDescription; [EW_BKFields:122]Type:3; EW_al_BKFieldType; [EW_BKFields:122]FieldLength:5; EW_al_BKFieldLength)
		ARRAY TEXT:C222(EW_at_BKType; Size of array:C274(EW_al_BKFieldType))
		For ($_l_Index; 1; Size of array:C274(EW_al_BKFieldType))
			EW_at_BKType{$_l_Index}:=FieldType2Text(EW_al_BKFieldType{$_l_Index})
		End for 
		SORT ARRAY:C229(EW_at_BKFieldNames; EW_at_BKDescription; EW_at_BKType; EW_al_BKFieldLength; EW_al_BKFieldType)
	End if 
	LB_SetupListbox(->e_LB_BKfields; "oBKF"; "BKF_L"; 1; ->EW_at_BKFieldNames; ->EW_at_BKDescription; ->EW_at_BKType; ->EW_al_BKFieldLength; ->EW_al_BKFieldType)
	OBJECT SET VISIBLE:C603(EW_al_BKFieldType; False:C215)
	LB_SetColumnHeaders(->e_LB_BKfields; "BKF_L"; 1; "Field Name"; "Description"; "Type"; "Length")
	LB_SetColumnWidths(->e_LB_BKfields; "oBKF"; 1; 65; 80; 40; 30)  // dont need to worry about the invisible ones
	LB_SETFONT(->e_LB_BKfields; "BKF"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
	LB_SETFONT(->e_LB_BKfields; "BKF"; 1; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultBoldFontSize)
	
End if 

If ($3="DB")
	ARRAY TEXT:C222(EW_at_DBFieldNames; 0)
	ARRAY LONGINT:C221(EW_al_DBFieldNumbers; 0)
	ARRAY TEXT:C222(EW_at_BKFieldNames; 0)
	ARRAY LONGINT:C221(EW_al_dbFieldMapTypes; 0)
	ARRAY TEXT:C222(EW_at_DBTypes; 0)
	If ($_l_Mapnumber>0)
		// These are the DayBook field map records
		QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=$_l_Mapnumber)
		SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]DayBookFieldNumber:2; EW_al_DBFieldNumbers; [EW_BK_FieldMap:121]BKFieldName:3; EW_at_BKFieldNames; [EW_BK_FieldMap:121]DaybookFieldName:5; EW_at_DBFieldNames; [EW_BK_FieldMap:121]DaybookFieldType:4; EW_al_dbFieldMapTypes)
		ARRAY TEXT:C222(EW_at_DBTypes; Size of array:C274(EW_al_DBFieldNumbers))
		For ($_l_Index; 1; Size of array:C274(EW_al_DBFieldNumbers))
			EW_at_DBTypes{$_l_Index}:=FieldType2Text(EW_al_dbFieldMapTypes{$_l_Index})
		End for 
		SORT ARRAY:C229(EW_at_DBFieldNames; EW_al_DBFieldNumbers; EW_at_DBTypes; EW_at_BKFieldNames; EW_al_dbFieldMapTypes)
	End if 
	LB_SetupListbox(->e_LB_FieldMap; "oMAP"; "MAP_L"; 1; ->EW_at_DBFieldNames; ->EW_at_BKFieldNames; ->EW_at_DBTypes; ->EW_al_dbFieldMapTypes; ->EW_al_DBFieldNumbers)
	OBJECT SET VISIBLE:C603(EW_al_dbFieldMapTypes; False:C215)
	OBJECT SET VISIBLE:C603(EW_al_DBFieldNumbers; False:C215)
	LB_SetColumnHeaders(->e_LB_FieldMap; "MAP_L"; 1; "DayBook Field"; "ecommerce Field"; "Field Type")
	LB_SetColumnWidths(->e_LB_FieldMap; "oMAP"; 1; 100; 110; 30)  // dont need to worry about the invisible ones
	If (Not:C34(DB_bo_FontsInited))
		DB_SetDefaultFonts
	End if 
	LB_SETFONT(->e_LB_FieldMap; "MAP"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
	LB_SETFONT(->e_LB_FieldMap; "MAP"; 1; <>FontBold0; 0; <>SYS_l_DefaultBoldFontSize)
	
End if 
ERR_MethodTrackerReturn("EW_BKFieldMapArrays"; $_t_oldMethodName)
