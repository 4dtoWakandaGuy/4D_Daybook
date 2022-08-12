//%attributes = {}
If (False:C215)
	//Project Method Name: LBi_inclSetup
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 
	//Created BY: 
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	//ARRAY TEXT(LAy_at_FontList;0)
	C_BLOB:C604($_blb_Formula)
	C_BOOLEAN:C305($_bo_FontDef9; $_bo_FooterUsed; $_bo_HideLastColumn; $_bo_PointersInited; $_bo_ReadOnly; $_bo_TableBracket; $_bo_TableStartPosition; DB_bo_FontsInited; LAY_bo_Fontinited; LAY_bo_ShowLastColumn)
	C_LONGINT:C283(<>ALselectinEntryMode; <>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; <>vALMode; $_l_CalculatedColumnPosition; $_l_CharacterPosition; $_l_ColumnIndex; $_l_ColumnNumber; $_l_CurrentNumberOfColumns; $_l_DataType; $_l_DataType2)
	C_LONGINT:C283($_l_EntryOptionNumber; $_l_Error; $_l_FieldNumber; $_l_FIndTableIndex; $_l_FontHeight; $_l_FontNamePosition; $_l_FontSize; $_l_FontStyle; $_l_Footer9Ptr; $_l_FooterType; $_l_FormulaRow)
	C_LONGINT:C283($_l_HeaderFontStyle; $_l_IncreaseWidth; $_l_KeyTableNumber; $_l_LastFontStyle; $_l_LevelNumber; $_l_MaxFontSize; $_l_MultipleWidth; $_l_NumberofColumns; $_l_ObjectBottom; $_l_ObjectHeight; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop; $_l_ObjectWIdth; $_l_offset; $_l_RecordCount; $_l_ScriptCount; $_l_Size9; $_l_TableNumber; $_l_TableofThisField; $_l_TotalHeight; $_l_TotalWidth)
	C_LONGINT:C283($_l_VisibleObjectWIdth; $_l_Width; LB_l_FontColor; o1_l_BUT1; o1_l_BUT10; o1_l_BUT11; o1_l_BUT12; o1_l_BUT13; o1_l_BUT14; o1_l_BUT15; o1_l_BUT16)
	C_LONGINT:C283(o1_l_BUT17; o1_l_BUT18; o1_l_BUT19; o1_l_BUT2; o1_l_BUT20; o1_l_BUT21; o1_l_BUT22; o1_l_BUT23; o1_l_BUT24; o1_l_BUT25; o1_l_BUT26)
	C_LONGINT:C283(o1_l_BUT27; o1_l_BUT28; o1_l_BUT29; o1_l_BUT3; o1_l_BUT30; o1_l_BUT31; o1_l_BUT32; o1_l_BUT33; o1_l_BUT34; o1_l_BUT35; o1_l_BUT36)
	C_LONGINT:C283(o1_l_BUT37; o1_l_BUT38; o1_l_BUT39; o1_l_BUT4; o1_l_BUT40; o1_l_BUT5; o1_l_BUT6; o1_l_BUT7; o1_l_BUT8; o1_l_BUT9; o1_L1)
	C_LONGINT:C283(o1_L2; o1_L3; o1_L4; o1_L5; o1_L6; o1_L7; o1_L8; o1_L9; o2_l_BUT1; o2_l_BUT10; o2_l_BUT11)
	C_LONGINT:C283(o2_l_BUT12; o2_l_BUT13; o2_l_BUT14; o2_l_BUT15; o2_l_BUT16; o2_l_BUT17; o2_l_BUT18; o2_l_BUT19; o2_l_BUT2; o2_l_BUT20; o2_l_BUT21)
	C_LONGINT:C283(o2_l_BUT22; o2_l_BUT23; o2_l_BUT24; o2_l_BUT25; o2_l_BUT26; o2_l_BUT27; o2_l_BUT28; o2_l_BUT29; o2_l_BUT3; o2_l_BUT30; o2_l_BUT31)
	C_LONGINT:C283(o2_l_BUT32; o2_l_BUT33; o2_l_BUT34; o2_l_BUT35; o2_l_BUT36; o2_l_BUT37; o2_l_BUT38; o2_l_BUT39; o2_l_BUT4; o2_l_BUT40; o2_l_BUT5)
	C_LONGINT:C283(o2_l_BUT6; o2_l_BUT7; o2_l_BUT8; o2_l_BUT9; o2_L1; o2_L2; o2_L3; o2_L4; o2_L5; o2_L6; o2_L7)
	C_LONGINT:C283(o2_L8; o2_L9; o3_l_BUT1; o3_l_BUT10; o3_l_BUT11; o3_l_BUT12; o3_l_BUT13; o3_l_BUT14; o3_l_BUT15; o3_l_BUT16; o3_l_BUT17)
	C_LONGINT:C283(o3_l_BUT18; o3_l_BUT19; o3_l_BUT2; o3_l_BUT20; o3_l_BUT21; o3_l_BUT22; o3_l_BUT23; o3_l_BUT24; o3_l_BUT25; o3_l_BUT26; o3_l_BUT27)
	C_LONGINT:C283(o3_l_BUT28; o3_l_BUT29; o3_l_BUT3; o3_l_BUT30; o3_l_BUT31; o3_l_BUT32; o3_l_BUT33; o3_l_BUT34; o3_l_BUT35; o3_l_BUT36; o3_l_BUT37)
	C_LONGINT:C283(o3_l_BUT38; o3_l_BUT39; o3_l_BUT4; o3_l_BUT40; o3_l_BUT5; o3_l_BUT6; o3_l_BUT7; o3_l_BUT8; o3_l_BUT9; o3_L1; o3_L2)
	C_LONGINT:C283(o3_L3; o3_L4; o3_L5; o3_L6; o3_L7; o3_L8; o3_L9; o4_l_BUT1; o4_l_BUT10; o4_l_BUT11; o4_l_BUT12)
	C_LONGINT:C283(o4_l_BUT13; o4_l_BUT14; o4_l_BUT15; o4_l_BUT16; o4_l_BUT17; o4_l_BUT18; o4_l_BUT19; o4_l_BUT2; o4_l_BUT20; o4_l_BUT21; o4_l_BUT22)
	C_LONGINT:C283(o4_l_BUT23; o4_l_BUT24; o4_l_BUT25; o4_l_BUT26; o4_l_BUT27; o4_l_BUT28; o4_l_BUT29; o4_l_BUT3; o4_l_BUT30; o4_l_BUT31; o4_l_BUT32)
	C_LONGINT:C283(o4_l_BUT33; o4_l_BUT34; o4_l_BUT35; o4_l_BUT36; o4_l_BUT37; o4_l_BUT38; o4_l_BUT39; o4_l_BUT4; o4_l_BUT40; o4_l_BUT5; o4_l_BUT6)
	C_LONGINT:C283(o4_l_BUT7; o4_l_BUT8; o4_l_BUT9; o4_L1; o4_L2; o4_L3; o4_L4; o4_L5; o4_L6; o4_L7; o4_L8)
	C_LONGINT:C283(o4_L9; o5_l_BUT1; o5_l_BUT10; o5_l_BUT11; o5_l_BUT12; o5_l_BUT13; o5_l_BUT14; o5_l_BUT15; o5_l_BUT16; o5_l_BUT17; o5_l_BUT18)
	C_LONGINT:C283(o5_l_BUT19; o5_l_BUT2; o5_l_BUT20; o5_l_BUT21; o5_l_BUT22; o5_l_BUT23; o5_l_BUT24; o5_l_BUT25; o5_l_BUT26; o5_l_BUT27; o5_l_BUT28)
	C_LONGINT:C283(o5_l_BUT29; o5_l_BUT3; o5_l_BUT30; o5_l_BUT31; o5_l_BUT32; o5_l_BUT33; o5_l_BUT34; o5_l_BUT35; o5_l_BUT36; o5_l_BUT37; o5_l_BUT38)
	C_LONGINT:C283(o5_l_BUT39; o5_l_BUT4; o5_l_BUT40; o5_l_BUT5; o5_l_BUT6; o5_l_BUT7; o5_l_BUT8; o5_l_BUT9; o5_L1; o5_L2; o5_L3)
	C_LONGINT:C283(o5_L4; o5_L5; o5_L6; o5_L7; o5_L8; o5_L9; o6_l_BUT1; o6_l_BUT10; o6_l_BUT11; o6_l_BUT12; o6_l_BUT13)
	C_LONGINT:C283(o6_l_BUT14; o6_l_BUT15; o6_l_BUT16; o6_l_BUT17; o6_l_BUT18; o6_l_BUT19; o6_l_BUT2; o6_l_BUT20; o6_l_BUT21; o6_l_BUT22; o6_l_BUT23)
	C_LONGINT:C283(o6_l_BUT24; o6_l_BUT25; o6_l_BUT26; o6_l_BUT27; o6_l_BUT28; o6_l_BUT29; o6_l_BUT3; o6_l_BUT30; o6_l_BUT31; o6_l_BUT32; o6_l_BUT33)
	C_LONGINT:C283(o6_l_BUT34; o6_l_BUT35; o6_l_BUT36; o6_l_BUT37; o6_l_BUT38; o6_l_BUT39; o6_l_BUT4; o6_l_BUT40; o6_l_BUT5; o6_l_BUT6; o6_l_BUT7)
	C_LONGINT:C283(o6_l_BUT8; o6_l_BUT9; o6_L1; o6_L2; o6_L3; o6_L4; o6_L5; o6_L6; o6_L7; o6_L8; o6_L9)
	C_POINTER:C301($_l_KeyTable; $_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayFontName; $_ptr_ArrayFontStyle; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters)
	C_POINTER:C301($_Ptr_ArrayofColumnFormulas; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayofRollovers; $_ptr_ArrayReferences; $_ptr_ColumnVars; $_ptr_EnterabilityArray; $_ptr_FIeld; $_ptr_FooterVariable; $_ptr_HeaderVars)
	C_POINTER:C301($_ptr_KeyField; $_ptr_LBParentTable; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxAreaSetup; $_ptr_ListboxColumn; $_ptr_ListboxColumnForm2; $_ptr_ListboxColumnKeyN; $_ptr_Table; $_ptr_ThisColumnArray; $_Ptr_ThisColumnField)
	C_POINTER:C301($_Ptr_ThisColumnFooter; $_ptr_ThisColumnHeaderButton; $_ptr_ThisFIeld; $1)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_After; $_t_Base64Blob; $_t_Before; $_t_ButtonPrefix; $_t_ColourName; $_t_ColumnColour; $_t_ColumnFormula; $_t_ColumnName; $_t_ColumnPrefix)
	C_TEXT:C284($_t_FieldName; $_t_FieldNameString; $_t_FontName; $_t_FooterName; $_t_FooterObjectName; $_t_FooterPrefix; $_t_FooterTypeString; $_t_Format; $_t_Formula; $_t_FormulaString; $_t_HeaderName)
	C_TEXT:C284($_t_HeaderPrefix; $_t_LastFonName; $_t_LevelID; $_t_LevelNumber; $_t_ObjectPrefix; $_t_oldMethodName; $_t_TableName; $_t_VariableName; o1_COL1; o1_COL10; o1_COL11)
	C_TEXT:C284(o1_COL12; o1_COL13; o1_COL14; o1_COL15; o1_COL16; o1_COL17; o1_COL18; o1_COL19; o1_COL2; o1_COL20; o1_COL21)
	C_TEXT:C284(o1_COL22; o1_COL23; o1_COL24; o1_COL25; o1_COL26; o1_COL27; o1_COL28; o1_COL29; o1_COL3; o1_COL30; o1_COL31)
	C_TEXT:C284(o1_COL32; o1_COL33; o1_COL34; o1_COL35; o1_COL36; o1_COL37; o1_COL38; o1_COL39; o1_COL4; o1_COL40; o1_COL5)
	C_TEXT:C284(o1_COL6; o1_COL7; o1_COL8; o1_COL9; o1_HED1; o1_HED10; o1_HED11; o1_HED12; o1_HED13; o1_HED14; o1_HED15)
	C_TEXT:C284(o1_HED16; o1_HED17; o1_HED18; o1_HED19; o1_HED2; o1_HED20; o1_HED21; o1_HED22; o1_HED23; o1_HED24; o1_HED25)
	C_TEXT:C284(o1_HED26; o1_HED27; o1_HED28; o1_HED29; o1_HED3; o1_HED30; o1_HED31; o1_HED32; o1_HED33; o1_HED34; o1_HED35)
	C_TEXT:C284(o1_HED36; o1_HED37; o1_HED38; o1_HED39; o1_HED4; o1_HED40; o1_HED5; o1_HED6; o1_HED7; o1_HED8; o1_HED9)
	C_TEXT:C284(o2_COL1; o2_COL10; o2_COL11; o2_COL12; o2_COL13; o2_COL14; o2_COL15; o2_COL16; o2_COL17; o2_COL18; o2_COL19)
	C_TEXT:C284(o2_COL2; o2_COL20; o2_COL21; o2_COL22; o2_COL23; o2_COL24; o2_COL25; o2_COL26; o2_COL27; o2_COL28; o2_COL29)
	C_TEXT:C284(o2_COL3; o2_COL30; o2_COL31; o2_COL32; o2_COL33; o2_COL34; o2_COL35; o2_COL36; o2_COL37; o2_COL38; o2_COL39)
	C_TEXT:C284(o2_COL4; o2_COL40; o2_COL5; o2_COL6; o2_COL7; o2_COL8; o2_COL9; o2_HED1; o2_HED10; o2_HED11; o2_HED12)
	C_TEXT:C284(o2_HED13; o2_HED14; o2_HED15; o2_HED16; o2_HED17; o2_HED18; o2_HED19; o2_HED2; o2_HED20; o2_HED21; o2_HED22)
	C_TEXT:C284(o2_HED23; o2_HED24; o2_HED25; o2_HED26; o2_HED27; o2_HED28; o2_HED29; o2_HED3; o2_HED30; o2_HED31; o2_HED32)
	C_TEXT:C284(o2_HED33; o2_HED34; o2_HED35; o2_HED36; o2_HED37; o2_HED38; o2_HED39; o2_HED4; o2_HED40; o2_HED5; o2_HED6)
	C_TEXT:C284(o2_HED7; o2_HED8; o2_HED9; o3_COL1; o3_COL10; o3_COL11; o3_COL12; o3_COL13; o3_COL14; o3_COL15; o3_COL16)
	C_TEXT:C284(o3_COL17; o3_COL18; o3_COL19; o3_COL2; o3_COL20; o3_COL21; o3_COL22; o3_COL23; o3_COL24; o3_COL25; o3_COL26)
	C_TEXT:C284(o3_COL27; o3_COL28; o3_COL29; o3_COL3; o3_COL30; o3_COL31; o3_COL32; o3_COL33; o3_COL34; o3_COL35; o3_COL36)
	C_TEXT:C284(o3_COL37; o3_COL38; o3_COL39; o3_COL4; o3_COL40; o3_COL5; o3_COL6; o3_COL7; o3_COL8; o3_COL9; o3_HED1)
	C_TEXT:C284(o3_HED10; o3_HED11; o3_HED12; o3_HED13; o3_HED14; o3_HED15; o3_HED16; o3_HED17; o3_HED18; o3_HED19; o3_HED2)
	C_TEXT:C284(o3_HED20; o3_HED21; o3_HED22; o3_HED23; o3_HED24; o3_HED25; o3_HED26; o3_HED27; o3_HED28; o3_HED29; o3_HED3)
	C_TEXT:C284(o3_HED30; o3_HED31; o3_HED32; o3_HED33; o3_HED34; o3_HED35; o3_HED36; o3_HED37; o3_HED38; o3_HED39; o3_HED4)
	C_TEXT:C284(o3_HED40; o3_HED5; o3_HED6; o3_HED7; o3_HED8; o3_HED9; o4_COL1; o4_COL10; o4_COL11; o4_COL12; o4_COL13)
	C_TEXT:C284(o4_COL14; o4_COL15; o4_COL16; o4_COL17; o4_COL18; o4_COL19; o4_COL2; o4_COL20; o4_COL21; o4_COL22; o4_COL23)
	C_TEXT:C284(o4_COL24; o4_COL25; o4_COL26; o4_COL27; o4_COL28; o4_COL29; o4_COL3; o4_COL30; o4_COL31; o4_COL32; o4_COL33)
	C_TEXT:C284(o4_COL34; o4_COL35; o4_COL36; o4_COL37; o4_COL38; o4_COL39; o4_COL4; o4_COL40; o4_COL5; o4_COL6; o4_COL7)
	C_TEXT:C284(o4_COL8; o4_COL9; o4_HED1; o4_HED10; o4_HED11; o4_HED12; o4_HED13; o4_HED14; o4_HED15; o4_HED16; o4_HED17)
	C_TEXT:C284(o4_HED18; o4_HED19; o4_HED2; o4_HED20; o4_HED21; o4_HED22; o4_HED23; o4_HED24; o4_HED25; o4_HED26; o4_HED27)
	C_TEXT:C284(o4_HED28; o4_HED29; o4_HED3; o4_HED30; o4_HED31; o4_HED32; o4_HED33; o4_HED34; o4_HED35; o4_HED36; o4_HED37)
	C_TEXT:C284(o4_HED38; o4_HED39; o4_HED4; o4_HED40; o4_HED5; o4_HED6; o4_HED7; o4_HED8; o4_HED9; o5_COL1; o5_COL10)
	C_TEXT:C284(o5_COL11; o5_COL12; o5_COL13; o5_COL14; o5_COL15; o5_COL16; o5_COL17; o5_COL18; o5_COL19; o5_COL2; o5_COL20)
	C_TEXT:C284(o5_COL21; o5_COL22; o5_COL23; o5_COL24; o5_COL25; o5_COL26; o5_COL27; o5_COL28; o5_COL29; o5_COL3; o5_COL30)
	C_TEXT:C284(o5_COL31; o5_COL32; o5_COL33; o5_COL34; o5_COL35; o5_COL36; o5_COL37; o5_COL38; o5_COL39; o5_COL4; o5_COL40)
	C_TEXT:C284(o5_COL5; o5_COL6; o5_COL7; o5_COL8; o5_COL9; o5_HED1; o5_HED10; o5_HED11; o5_HED12; o5_HED13; o5_HED14)
	C_TEXT:C284(o5_HED15; o5_HED16; o5_HED17; o5_HED18; o5_HED19; o5_HED2; o5_HED20; o5_HED21; o5_HED22; o5_HED23; o5_HED24)
	C_TEXT:C284(o5_HED25; o5_HED26; o5_HED27; o5_HED28; o5_HED29; o5_HED3; o5_HED30; o5_HED31; o5_HED32; o5_HED33; o5_HED34)
	C_TEXT:C284(o5_HED35; o5_HED36; o5_HED37; o5_HED38; o5_HED39; o5_HED4; o5_HED40; o5_HED5; o5_HED6; o5_HED7; o5_HED8)
	C_TEXT:C284(o5_HED9; o6_COL1; o6_COL10; o6_COL11; o6_COL12; o6_COL13; o6_COL14; o6_COL15; o6_COL16; o6_COL17; o6_COL18)
	C_TEXT:C284(o6_COL19; o6_COL2; o6_COL20; o6_COL21; o6_COL22; o6_COL23; o6_COL24; o6_COL25; o6_COL26; o6_COL27; o6_COL28)
	C_TEXT:C284(o6_COL29; o6_COL3; o6_COL30; o6_COL31; o6_COL32; o6_COL33; o6_COL34; o6_COL35; o6_COL36; o6_COL37; o6_COL38)
	C_TEXT:C284(o6_COL39; o6_COL4; o6_COL40; o6_COL5; o6_COL6; o6_COL7; o6_COL8; o6_COL9; o6_HED1; o6_HED10; o6_HED11)
	C_TEXT:C284(o6_HED12; o6_HED13; o6_HED14; o6_HED15; o6_HED16; o6_HED17; o6_HED18; o6_HED19; o6_HED2; o6_HED20; o6_HED21)
	C_TEXT:C284(o6_HED22; o6_HED23; o6_HED24; o6_HED25; o6_HED26; o6_HED27; o6_HED28; o6_HED29; o6_HED3; o6_HED30; o6_HED31)
	C_TEXT:C284(o6_HED32; o6_HED33; o6_HED34; o6_HED35; o6_HED36; o6_HED37; o6_HED38; o6_HED39; o6_HED4; o6_HED40; o6_HED5)
	C_TEXT:C284(o6_HED6; o6_HED7; o6_HED8; o6_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_inclSetup"; Form event code:C388)
//ALInclSetup - key field method
//xNG--i have modified the thermometers so that they are contextual-if there are more than 50 columns they will display

//SET CURSOR(4)
//LB_FM_COLUMCalcsInited:=False

$_t_ColourName:=""
$_ptr_ListboxAreaSetup:=$1
$_ptr_ListboxArea:=$_ptr_ListboxAreaSetup->{1}
$_ptr_ArrayFieldPointers:=$_ptr_ListboxAreaSetup->{2}
$_ptr_ArrayOfArrayNames:=$_ptr_ListboxAreaSetup->{4}
$_ptr_ArrayofArrayPointers:=$_ptr_ListboxAreaSetup->{3}
$_ptr_ArrayOfColumFormats:=$_ptr_ListboxAreaSetup->{5}
$_Ptr_ArrayofColumnFormulas:=$_ptr_ListboxAreaSetup->{6}
$_l_KeyTable:=$_ptr_ListboxAreaSetup->{7}
$_ptr_LbTable:=$_ptr_ListboxAreaSetup->{7}
$_Ptr_KeyField:=$_ptr_ListboxAreaSetup->{8}
$_ptr_ArrayReferences:=$_ptr_ListboxAreaSetup->{9}
$_t_LevelID:=$_ptr_ArrayReferences->{1}
$_ptr_ArrayFontName:=Get pointer:C304("LB_at_"+$_t_LevelID+"FontName")
$_ptr_ArrayFontStyle:=Get pointer:C304("LB_at_"+$_t_LevelID+"FontStyle")

$_ptr_LBParentTable:=$_ptr_ListboxAreaSetup->{10}
//TRACE
$_ptr_ArrayofColumnLabels:=$_ptr_ListboxAreaSetup->{12}
$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxAreaSetup->{13}
$_ptr_EnterabilityArray:=$_ptr_ListboxAreaSetup->{14}
$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxAreaSetup->{15}
$_ptr_ArrayofColumnFonts:=$_ptr_ListboxAreaSetup->{16}
$_ptr_ArrayofColumnColors:=$_ptr_ListboxAreaSetup->{17}
$_ptr_ArrayofColumnFooters:=$_ptr_ListboxAreaSetup->{18}
$_ptr_ArrayofRollovers:=$_ptr_ListboxAreaSetup->{21}

$_ptr_areaTypeVariable:=$_ptr_ListboxAreaSetup->{19}
$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->))) | ((Read only state:C362($_ptr_LBParentTable->)) | (Locked:C147($_ptr_LBParentTable->)))

$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayOfArrayNames->)
//``

RESOLVE POINTER:C394($_ptr_ArrayFieldPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
$_t_LevelID:=$_ptr_ArrayReferences->{1}
If (Num:C11($_t_LevelID)<10)
	$_t_LevelNumber:=Substring:C12($_t_LevelID; 2; Length:C16($_t_LevelID))
Else 
	$_t_LevelNumber:=$_t_LevelID
End if 

$_l_LevelNumber:=Num:C11($_t_LevelNumber)
$_t_ObjectPrefix:="o"+$_t_LevelNumber
$_t_ButtonPrefix:="o"+$_t_LevelNumber+"_L"
If (False:C215)
	Case of 
		: ($_t_VariableName="a01FldP")
			
			$_t_ObjectPrefix:="o1"
			$_t_ButtonPrefix:="o1_L"
		: ($_t_VariableName="a02FldP")
			
			$_t_ObjectPrefix:="o2"
			$_t_ButtonPrefix:="o2_L"
			
		: ($_t_VariableName="a03FldP")
			
			$_t_ObjectPrefix:="o3"
			$_t_ButtonPrefix:="o3_L"
		: ($_t_VariableName="a04FldP")
			
			$_t_ObjectPrefix:="o4"
			$_t_ButtonPrefix:="o4_L"
		: ($_t_VariableName="a05FldP")
			
			
			$_t_ObjectPrefix:="o5"
			$_t_ButtonPrefix:="o5_L"
		: ($_t_VariableName="a06FldP")
			$_t_ObjectPrefix:="o6"
			$_t_ButtonPrefix:="o6_L"
	End case 
Else 
	LBI_DefineFooters($_t_LevelNumber)
	
End if 
$_t_ColumnPrefix:=$_t_ObjectPrefix+"_COL"
$_t_HeaderPrefix:=$_t_ObjectPrefix+"_HED"
$_t_ButtonPrefix:=$_t_ButtonPrefix+"_BUT"
$_t_FooterPrefix:=$_t_ObjectPrefix+"_FOT"


$_ptr_ListboxArea:=$_ptr_ListboxAreaSetup->{1}
$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxAreaSetup->{13}
$_l_CurrentNumberOfColumns:=LISTBOX Get number of columns:C831($_ptr_ListboxArea->)
If ($_l_CurrentNumberOfColumns>0)
	LISTBOX DELETE COLUMN:C830($_ptr_ListboxArea->; 1; $_l_CurrentNumberOfColumns)
End if 
//$t:=0
$_l_offset:=0  //for any extra columns
$_l_ColumnNumber:=0

$_l_KeyTableNumber:=Table:C252($_l_KeyTable)
$_l_ScriptCount:=0
$_l_MaxFontSize:=0
//TRACE
Repeat 
	$_l_ColumnNumber:=$_l_ColumnNumber+1
	If ($_l_ColumnNumber<=Size of array:C274($_ptr_ArrayOfArrayNames->))
		//For ($_l_ColumnNumber;1;$_l_NumberofColumns)
		//LB_SetupListbox ($_ptr_ListboxArea;$_t_ObjectPrefix;$_t_ButtonPrefix;$_l_ColumnNumber;$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber})
		//LB_SetColumnHeaders ($_ptr_ListboxArea;"INV_L";$_l_ColumnNumber;$_ptr_ArrayofColumnLabels->{$_l_ColumnNumber})
		
		//If (False)
		$_t_ColumnName:=$_t_ColumnPrefix+String:C10($_l_ColumnNumber)
		$_t_FooterName:=$_t_FooterPrefix+String:C10($_l_ColumnNumber)
		$_t_HeaderName:=$_t_HeaderPrefix+String:C10($_l_ColumnNumber)
		$_ptr_ThisColumnArray:=Get pointer:C304($_ptr_ArrayOfArrayNames->{$_l_ColumnNumber})
		$_l_FooterType:=$_ptr_ArrayofColumnFooters->{$_l_ColumnNumber}
		$_ptr_ThisColumnHeaderButton:=Get pointer:C304($_t_ButtonPrefix+String:C10($_l_ColumnNumber))
		If ($_ptr_areaTypeVariable-><3)
			If (($_l_FooterType)>1)
				Case of 
					: ($_l_FooterType=2)  //custom string(COUNT)-so use a numeric in here
						$_t_FooterObjectName:="oFOT_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
						
						$_t_FooterTypeString:="FOT_r_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
						$_ptr_FooterVariable:=Get pointer:C304($_t_FooterTypeString)
						LISTBOX INSERT COLUMN:C829($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_ptr_ThisColumnArray->; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->; $_t_FooterObjectName; $_ptr_FooterVariable->)
					Else 
						//type is numeric...
						$_t_FooterObjectName:="oFOT_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
						
						$_t_FooterTypeString:="FOT_R_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
						$_ptr_FooterVariable:=Get pointer:C304($_t_FooterTypeString)
						LISTBOX INSERT COLUMN:C829($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_ptr_ThisColumnArray->; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->; $_t_FooterObjectName; $_ptr_FooterVariable->)
				End case 
			Else 
				LISTBOX INSERT COLUMN:C829($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_ptr_ThisColumnArray->; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->)
			End if 
		Else 
			
			
			$_bo_TableStartPosition:=False:C215
			$_t_ColumnFormula:=$_Ptr_ArrayofColumnFormulas->{$_l_ColumnNumber}
			If ($_t_ColumnFormula#"")  //this is a fomula based column
				$_l_ScriptCount:=$_l_ScriptCount+1
				$_l_CalculatedColumnPosition:=Position:C15("LB_CalculatedColumn"; $_t_ColumnFormula)
				If ($_l_CalculatedColumnPosition=0)
				End if 
				
				If ($_l_ScriptCount<99)
					If ($_l_ScriptCount>0)
						
						$_bo_TableBracket:=(Position:C15("["; $_t_ColumnFormula)>0)
						$_ptr_ThisFIeld:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
						$_l_DataType:=Type:C295($_ptr_ThisFIeld->)
						$_t_ColumnFormula:=$_Ptr_ArrayofColumnFormulas->{$_l_ColumnNumber}
						$_l_CalculatedColumnPosition:=Position:C15("~"; $_t_ColumnFormula)
						//```
						While ($_l_CalculatedColumnPosition>0)
							//IDLE  ` 03/04/03 pb
							$_t_Before:=Substring:C12($_t_ColumnFormula; 1; $_l_CalculatedColumnPosition-1)
							$_t_FormulaString:=Substring:C12($_t_ColumnFormula; $_l_CalculatedColumnPosition+1)
							$_l_CharacterPosition:=Position:C15("~"; $_t_FormulaString)
							If ($_l_CharacterPosition>0)
								$_t_After:=Substring:C12($_t_FormulaString; $_l_CharacterPosition+1)
								$_t_FormulaString:=Substring:C12($_t_FormulaString; 1; $_l_CharacterPosition-1)
								$_ptr_ListboxColumnForm2:=$_ptr_ListboxAreaSetup->{12}
								$_l_FormulaRow:=Find in array:C230($_ptr_ListboxColumnForm2->; $_t_FormulaString)
								If ($_l_FormulaRow>0)
									$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_FormulaRow}
									RESOLVE POINTER:C394($_Ptr_ThisColumnField; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
									$_ptr_Table:=Table:C252($_l_TableNumber)
									$_ptr_FIeld:=Field:C253($_l_TableNumber; $_l_FieldNumber)
									$_t_TableName:=Table name:C256($_l_TableNumber)
									$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
									$_t_FormulaString:="["+$_t_TableName+"]"+$_t_FieldName
									$_t_ColumnFormula:=$_t_Before+$_t_FormulaString+$_t_After
								Else 
									$_t_ColumnFormula:=$_t_Before+$_t_After
								End if 
								$_l_CalculatedColumnPosition:=Position:C15("~"; $_t_ColumnFormula)
							Else 
								$_t_ColumnFormula:=$_t_Before+"~"+$_t_FormulaString
								$_l_CalculatedColumnPosition:=0
							End if 
						End while 
						$_l_CalculatedColumnPosition:=Position:C15("LB_CalculatedColumn"; $_t_ColumnFormula)
						If ($_l_CalculatedColumnPosition=0)
							$_l_CalculatedColumnPosition:=Position:C15("Macro"; $_t_ColumnFormula)
							If ($_l_CalculatedColumnPosition>0)
								
								//TRACE
								$_ptr_KeyField:=$_ptr_ListboxAreaSetup->{8}
								$_ptr_ArrayReferences:=$_ptr_ArrayReferences->{9}
								$_t_LevelID:=$_ptr_ArrayReferences->{1}
								$_l_DataType2:=Type:C295($_ptr_KeyField->)
								RESOLVE POINTER:C394($_ptr_ArrayReferences; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
								
								
								If (True:C214)
									$_t_TableName:=Table name:C256($_ptr_KeyField)
									$_t_FieldName:=Field name:C257($_ptr_KeyField)
									$_t_FieldNameString:="["+Table name:C256($_ptr_KeyField)+"]"+Field name:C257($_ptr_KeyField)
									$_t_Formula:=$_t_ColumnFormula
									$_t_Base64Blob:=""
									
									SET BLOB SIZE:C606($_blb_Formula; 0)
									TEXT TO BLOB:C554($_t_Formula; $_blb_Formula; 0)
									BASE64 ENCODE:C895($_blb_Formula; $_t_Base64Blob)
									If (False:C215)
										Case of 
												
												
											: ($_l_DataType=Is date:K8:7)
												
												$_t_ColumnFormula:="LB_CalculatedColumnDATE("+Char:C90(34)+$_t_VariableName+Char:C90(34)+";"+Char:C90(34)+String:C10($_l_ColumnNumber)+Char:C90(34)+";"+Char:C90(34)+$_t_LevelID+Char:C90(34)+";"+Char:C90(34)+$_t_Base64Blob+Char:C90(34)+")"
												
											: ($_l_DataType=Is boolean:K8:9)
												$_t_ColumnFormula:="LB_CalculatedColumnBoolean("+Char:C90(34)+$_t_VariableName+Char:C90(34)+";"+Char:C90(34)+String:C10($_l_ColumnNumber)+Char:C90(34)+";"+Char:C90(34)+$_t_LevelID+Char:C90(34)+";"+Char:C90(34)+$_t_Base64Blob+Char:C90(34)+")"
												
											: ($_l_DataType=Is alpha field:K8:1) | ($_l_DataType=Is text:K8:3)
												$_t_ColumnFormula:="LB_CalculatedColumnTEXT("+Char:C90(34)+$_t_VariableName+Char:C90(34)+";"+Char:C90(34)+String:C10($_l_ColumnNumber)+Char:C90(34)+";"+Char:C90(34)+$_t_LevelID+Char:C90(34)+";"+Char:C90(34)+$_t_Base64Blob+Char:C90(34)+")"
												// /$_t_ColumnFormula:="LB_CalculatedColumnREAL("+Char(34)+$_t_VariableName+Char(34)+";"+Char(34)+String($_l_ColumnNumber)+Char(34)+";"+Char(34)+$_t_LevelID+Char(34)+";"+Char(34)+$_t_Base64Blob+Char(34)+")"
												
												
											: ($_l_DataType=Is longint:K8:6) | ($_l_DataType=Is integer:K8:5)
												$_t_ColumnFormula:="LB_CalculatedColumnLONG("+Char:C90(34)+$_t_VariableName+Char:C90(34)+";"+Char:C90(34)+String:C10($_l_ColumnNumber)+Char:C90(34)+";"+Char:C90(34)+$_t_LevelID+Char:C90(34)+";"+Char:C90(34)+$_t_Base64Blob+Char:C90(34)+")"
												
											: ($_l_DataType=Is real:K8:4)
												
												//extract the macro name.
												//$_l_CalculatedColumnPosition:=po
												$_t_ColumnFormula:="LB_CalculatedColumnREAL("+Char:C90(34)+$_t_VariableName+Char:C90(34)+";"+Char:C90(34)+String:C10($_l_ColumnNumber)+Char:C90(34)+";"+Char:C90(34)+$_t_LevelID+Char:C90(34)+";"+Char:C90(34)+$_t_Base64Blob+Char:C90(34)+")"
												
												
												
												//;"+Char(34)+String($_l_ColumnNumber)+Char(34)+";"+Char(34)+$_t_LevelID+Char(34)+";"+$_t_Base64Blob+")"
												
												//;"+String($_l_ColumnNumber)+";"+Char(34)+$_t_LevelID+Char(34)+";"+$_t_Base64Blob+")"
												
												
												
											: ($_l_DataType=Is picture:K8:10)
												//$_t_ColumnFormula:="LB_CalculatedColumnPICT("+Char(34)+$_t_VariableName+Char(34)+";"+String($_l_ColumnNumber)+";"+Char(34)+$_t_LevelID+Char(34)+";"+Char(34)+$_t_Base64Blob+Char(34)+")"
												
												
										End case 
									End if 
								End if 
								
							End if 
							
						End if 
						$_l_FooterType:=$_ptr_ArrayofColumnFooters->{$_l_ColumnNumber}
						If (($_l_FooterType)>1)
							//TRACE
							Case of 
								: ($_l_FooterType=2)  //custom string-COUNT-use a numeric for the footer
									$_t_FooterObjectName:="oFOT_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
									$_t_FooterTypeString:="FOT_R_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
									$_ptr_FooterVariable:=Get pointer:C304($_t_FooterTypeString)
									$_Ptr_ThisColumnFooter:=Get pointer:C304($_t_FooterObjectName)
									LISTBOX INSERT COLUMN FORMULA:C970($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_t_ColumnFormula; $_l_DataType; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->)
									//LISTBOX ERRORRRORORORORO
									//;$_Ptr_ThisColumnFooter->;$_ptr_FooterVariable->)
									
								Else 
									//type is numeric...
									$_t_FooterObjectName:="oFOT_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
									
									$_t_FooterTypeString:="FOT_R_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
									
									$_ptr_FooterVariable:=Get pointer:C304($_t_FooterTypeString)
									$_Ptr_ThisColumnFooter:=Get pointer:C304($_t_FooterObjectName)
									
									//  LISTBOX INSERT COLUMN FORMULA($_ptr_ListboxArea->;$_l_ColumnNumber;$_t_ColumnName;$_t_ColumnFormula;$_l_DataType;$_t_HeaderName;$_ptr_ThisColumnHeaderButton->)
									//LISTBOX ERROR-ACI BUG ACI0079508: Listbox footers ;$_Ptr_ThisColumnFooter->;$_ptr_FooterVariable->)
									LISTBOX INSERT COLUMN FORMULA:C970($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_t_ColumnFormula; $_l_DataType; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->; $_t_FooterObjectName; $_ptr_FooterVariable->)
									//LISTBOX INSERT COLUMN($_ptr_ListboxArea->;$_l_ColumnNumber;$_t_ColumnName;$_ptr_FIeld->;$_t_HeaderName;$_ptr_ThisColumnHeaderButton->;$_t_FooterObjectName;$_ptr_FooterVariable->)
							End case 
						Else 
							LISTBOX INSERT COLUMN FORMULA:C970($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_t_ColumnFormula; $_l_DataType; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->)
						End if   //``
						//$_t_ColumnFormula:=""
						
					Else 
						$_l_NumberofColumns:=$_l_NumberofColumns-1
					End if 
					
				Else 
					$_l_NumberofColumns:=$_l_NumberofColumns-1
				End if   //``
				//Get number of listbox columns({*;}object)? Longint
			Else 
				$_ptr_FIeld:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
				$_l_TableofThisField:=Table:C252($_ptr_ArrayFieldPointers->{$_l_ColumnNumber})
				
				If ($_l_TableofThisField#$_l_KeyTableNumber)
					
					//This column is in a different table. so insert a column..need to work out if also need to add into the arrays..think we do
					$_t_ColumnFormula:="LB_GetRelation("+String:C10($_l_KeyTableNumber)+";"+String:C10($_l_TableofThisField)+")"
					$_Ptr_ArrayofColumnFormulas:=$_ptr_ListboxAreaSetup->{6}
					$_l_FormulaRow:=Find in array:C230($_Ptr_ArrayofColumnFormulas->; $_t_ColumnFormula+"@")
					
					If (($_l_FormulaRow<0))
						$_l_DataType:=Is longint:K8:6
						If (Not:C34($_bo_PointersInited))
							//``
							$_ptr_ArrayFieldPointers:=$_ptr_ListboxAreaSetup->{2}
							$_ptr_ArrayofArrayPointers:=$_ptr_ListboxAreaSetup->{3}
							$_ptr_ArrayOfArrayNames:=$_ptr_ListboxAreaSetup->{4}
							$_ptr_ArrayOfColumFormats:=$_ptr_ListboxAreaSetup->{5}
							
							$_ptr_ArrayofColumnLabels:=$_ptr_ListboxAreaSetup->{12}
							$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxAreaSetup->{13}
							$_ptr_EnterabilityArray:=$_ptr_ListboxAreaSetup->{14}
							$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxAreaSetup->{15}
							$_ptr_ArrayofColumnFonts:=$_ptr_ListboxAreaSetup->{16}
							$_ptr_ArrayofColumnColors:=$_ptr_ListboxAreaSetup->{17}
							$_ptr_ArrayofColumnFooters:=$_ptr_ListboxAreaSetup->{18}
							$_ptr_ArrayofRollovers:=$_ptr_ListboxAreaSetup->{21}
							$_bo_PointersInited:=True:C214
						End if 
						//``
						
						
						INSERT IN ARRAY:C227($_ptr_ArrayFieldPointers->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayOfArrayNames->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofArrayPointers->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayOfColumFormats->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_Ptr_ArrayofColumnFormulas->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLabels->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnWIdths->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLockFlags->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFonts->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnColors->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFooters->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayofRollovers->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_EnterabilityArray->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayFontName->; $_l_ColumnNumber; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayFontStyle->; $_l_ColumnNumber; 1)
						//$_ptr_ArrayFontName:=Get pointer("a"+$_t_LevelID+"FontName")
						//$_ptr_ArrayFontStyle:=Get pointer("a"+$_t_LevelID+"FontStyle")
						
						$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber+1}
						$_ptr_ArrayOfArrayNames->{$_l_ColumnNumber}:=$_ptr_ArrayOfArrayNames->{$_l_ColumnNumber+1}
						$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber+1}
						$_ptr_ArrayOfColumFormats->{$_l_ColumnNumber}:=$_ptr_ArrayOfColumFormats->{$_l_ColumnNumber+1}
						$_Ptr_ArrayofColumnFormulas->{$_l_ColumnNumber}:=$_t_ColumnFormula
						$_ptr_ArrayofColumnLabels->{$_l_ColumnNumber}:=$_ptr_ArrayofColumnLabels->{$_l_ColumnNumber+1}
						$_ptr_ArrayofColumnWIdths->{$_l_ColumnNumber}:=0
						$_ptr_ArrayofColumnLockFlags->{$_l_ColumnNumber}:=False:C215
						$_ptr_ArrayofColumnFonts->{$_l_ColumnNumber}:=$_ptr_ArrayofColumnFonts->{$_l_ColumnNumber+1}
						$_ptr_ArrayFontName->{$_l_ColumnNumber}:=$_ptr_ArrayFontName->{$_l_ColumnNumber+1}
						$_ptr_ArrayFontStyle->{$_l_ColumnNumber}:=$_ptr_ArrayFontStyle->{$_l_ColumnNumber+1}
						$_ptr_ArrayofColumnColors->{$_l_ColumnNumber}:=$_ptr_ArrayofColumnColors->{$_l_ColumnNumber+1}
						$_ptr_ArrayofColumnFooters->{$_l_ColumnNumber}:=$_ptr_ArrayofColumnFooters->{$_l_ColumnNumber+1}
						$_ptr_EnterabilityArray->{$_l_ColumnNumber}:=False:C215
						LISTBOX INSERT COLUMN FORMULA:C970($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_t_ColumnFormula; $_l_DataType; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->)
						$_l_ColumnNumber:=$_l_ColumnNumber+1
						$_l_NumberofColumns:=$_l_NumberofColumns+1
						$_t_ColumnName:=$_t_ColumnPrefix+String:C10($_l_ColumnNumber)
						$_t_HeaderName:=$_t_HeaderPrefix+String:C10($_l_ColumnNumber)
						$_ptr_ThisColumnArray:=Get pointer:C304($_ptr_ArrayOfArrayNames->{$_l_ColumnNumber})
						$_ptr_ThisColumnHeaderButton:=Get pointer:C304($_t_ButtonPrefix+String:C10($_l_ColumnNumber))
					End if 
				End if 
				$_l_FooterType:=$_ptr_ArrayofColumnFooters->{$_l_ColumnNumber}
				If (($_l_FooterType)>1)
					
					Case of 
						: ($_l_FooterType=2)  //custom string-Count-use numeric for the footer
							$_t_FooterObjectName:="oFOT_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
							$_t_FooterTypeString:="FOT_r_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
							$_ptr_FooterVariable:=Get pointer:C304($_t_FooterTypeString)
							LISTBOX INSERT COLUMN:C829($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_ptr_FIeld->; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->; $_t_FooterObjectName; $_ptr_FooterVariable->)
						Else 
							//type is numeric...
							$_t_FooterObjectName:="oFOT_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
							$_t_FooterTypeString:="FOT_R_0"+$_t_LevelNumber+String:C10($_l_ColumnNumber)
							$_ptr_FooterVariable:=Get pointer:C304($_t_FooterTypeString)
							LISTBOX INSERT COLUMN:C829($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_ptr_FIeld->; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->; $_t_FooterObjectName; $_ptr_FooterVariable->)
					End case 
				Else 
					LISTBOX INSERT COLUMN:C829($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_ColumnName; $_ptr_FIeld->; $_t_HeaderName; $_ptr_ThisColumnHeaderButton->)
				End if 
				//LISTBOX INSERT COLUMN($_ptr_ListboxArea->;$_l_ColumnNumber;$_t_ColumnName;$_ptr_FIeld->;$_t_HeaderName;$_ptr_ThisColumnHeaderButton->)
			End if 
		End if 
		OBJECT SET TITLE:C194($_ptr_ThisColumnHeaderButton->; $_ptr_ArrayofColumnLabels->{$_l_ColumnNumber})
		//SET LISTBOX COLUMN WIDTH(*;$_t_ColumnName;$_ptr_ArrayofColumnWIdths->{$_l_ColumnNumber})
		//get listbox column width
		//all this repetitive stuff is in the name of max effic (!!??)
		//cos one AL external call is better than 15 etc
		//they're in reverse order to give advantage to the otherwise slower ones
		//End if
		//End for
	End if 
Until ($_l_ColumnNumber>=Size of array:C274($_ptr_ArrayOfArrayNames->))

$_l_TotalWidth:=0

For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
	$_l_TotalWidth:=$_l_TotalWidth+$_ptr_ArrayofColumnWIdths->{$_l_ColumnNumber}
	LB_SetColumnWidths($_ptr_ListboxArea; $_t_ObjectPrefix; $_l_ColumnNumber; $_ptr_ArrayofColumnWIdths->{$_l_ColumnNumber})
End for 
//TRACE
LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles)


//all this repetitive stuff is in the name of max effic (!!??)
//cos one AL external call is better than 15 etc
//they're in reverse order to give advantage to the otherwise slower ones
$_bo_HideLastColumn:=False:C215
If ($_l_Error=0)
	If ($_Ptr_KeyField=$_ptr_ArrayFieldPointers->{$_l_NumberofColumns}) & (Not:C34(LAY_bo_ShowLastColumn))  //if key field is the last col
		LB_SetColumnWidths($_ptr_ListboxArea; $_t_ObjectPrefix; $_l_NumberofColumns; 0)
		$_l_NumberofColumns:=$_l_NumberofColumns-1  //don't do any other settings for the hidden column
	Else 
		
	End if   //
	$_l_Size9:=0
	LB_Setdividers($_ptr_ListboxArea; 0; 4)  //Both on
	//TRACE
	$_ptr_ArrayFieldPointers:=$_ptr_ListboxAreaSetup->{2}
	If (Not:C34(DB_bo_FontsInited))
		DB_SetDefaultFonts
	End if 
	OBJECT SET FONT SIZE:C165($_ptr_ListboxArea->; 14)
	LB_StyleSettings($_ptr_ListboxArea; $_ptr_ArrayReferences->{2}; $_ptr_ArrayofColumnFonts->{1}; $_t_ObjectPrefix; $_ptr_LBParentTable)  // set colours, fonts etc. 29/06/06 pb
	$_bo_FooterUsed:=False:C215
	$_l_Footer9Ptr:=1
	
	For ($_l_ColumnIndex; 1; $_l_NumberofColumns)
		$_l_DataType:=Type:C295(($_ptr_ArrayFieldPointers->{$_l_ColumnIndex})->)
		$_ptr_FIeld:=$_ptr_ArrayFieldPointers->{$_l_ColumnIndex}
		
		
		$_t_Format:=$_ptr_ArrayOfColumFormats->{$_l_ColumnIndex}
		LB_SetFormat($_ptr_ListboxArea; 1; ""; $_l_ColumnIndex; $_l_ColumnIndex; 3)
		
		Case of 
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTACTS:1]Deleted:32) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTACTS:1]x_ID:33) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES:2]Size:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES:2]Deleted:61) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES:2]Record_State:62) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES:2]x_ID:63) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES:2]x_Longitude:71) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES:2]x_Latitude:72) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES:2]x_Employees:73) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[AREAS:3]Tax_Rate:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########%"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SOURCES:6]Target_Leads:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DOCUMENTS:7]Document_Font_Size:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DOCUMENTS:7]Table_Number:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DOCUMENTS:7]Document_Class:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DOCUMENTS:7]Document_Status:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DOCUMENTS:7]X_Template_Type:30) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Minimum:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Maximum:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Weight:26) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "###,###,###0.00"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Issues_Number:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Every_Number:28) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Unit_Number:29) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Start_Number:30) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Start_Days:31) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]First_Day_Month:33) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Bundle_Show:37) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Price_Per:40) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]X_ID:43) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Default_Price_Currency_ID:45) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]x_Supplier_Update_Option:47) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]x_Previous_Product_ID:50) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]x_Derivitave_Grouping:51) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]x_Picture_Exists:53) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]x_Product_No_longer_Available:54) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]x_Product_Entry_Class:55) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS:9]Product_Build_Format_ID:57) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]Sales_Rate:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]Startup_Diary:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]Cost_Rate:30) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "###,###,###0.00"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]Functionality:33) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]PersonDeleted:38) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]UserGroupIDs:39) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]Personnel_ID:48) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]SD_openNewWindow:49) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]CCM_L_DisplayFullCard:50) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL:11]HomeTable:52) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Units:20) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Charge_Rate:22) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Email_ID:41) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Deleted:43) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Date_Time_Stamp:45) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Date_Stamp:46) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Original_Date_Time_Stamp:47) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Alarm_Timeframe:48) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Data_Source_Table:49) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]x_ID:50) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]PersonID:56) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]AGFillColourRed:57) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]AGFillColourGreen:58) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]AGFillColourBlue:59) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]AGAccentColourRed:60) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]AGAccentColourGreen:61) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]AGAccentColourBlue:62) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]ThreadID:64) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]xDiaryClass:65) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]x_Open_Parent:69) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]Budget_Units:70) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY:12]x_Close_Options:71) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACTIONS:13]ADD_toDiaryID:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACTIONS:13]xActionTypeID:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACTIONS:13]xID:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Word Processor:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]AD 1:34) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]AD 2:35) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]AD 3:36) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]User_Processes:63) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Capitalisation:67) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Order Req:69) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Repeat Delay:74) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Palette Delay:80) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Co Code Chars:88) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]DOWNLOADS:94) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Title Size:103) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Text Size:104) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Data Size:105) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Form Method:134) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Purch Price2:153) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]BWB Doc No F:166) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]BWB Doc No T:167) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Mailsort Size:171) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]QA Uppers:185) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Waiting Proc:194) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Time Day:198) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Decimal Price:206) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Tel IPActual:209) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]ScreenSaverMin:210) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Fax Mode:215) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Fax Retries:216) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Fax Retry Secs:217) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Fax Server Addr:223) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Fax Cover Page:224) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Window x:230) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]Window y:231) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]CalenderColor:242) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]CalenderStyle:243) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]CalenderWeekStartDay:244) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER:15]XdataOwnerID:251) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[IDENTIFIERS:16]Table_Number:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[IDENTIFIERS:16]Number:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[IDENTIFIERS:16]Leading_Zeros:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[IDENTIFIERS:16]XRef_FIELD:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTRACTS:17]Contract_Cost:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTRACTS:17]x_ID:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTRACTS:17]xOpenEndedStatus:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_GROUPS:18]PriceGroupClass:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTRACT_TYPES:19]Days:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTRACT_TYPES:19]xOpenEndedStatus:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]Value:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]CallTypeID:26) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]x_ID:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]xRelatedJobID:28) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]x_ProblemTypeID:30) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]xServiceLocation:32) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]xIncomingDeliveryMethod:34) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS:20]xReturntoClientmethodID:36) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROBLEMS:22]ProblemTypeID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
				
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]Total_Margin_PC:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########%"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]Forecast_PC:22) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########%"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]Sort_Number:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]Tax_Rate:34) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########%"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]Export_Batch_Number:45) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]Export_Document_Number:46) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]x_ID:58) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDERS:24]X_DeliveryAddressID:59) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Quantity:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "###,###,###0.000"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Sales_Price:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Margin:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########%"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Sort_Order:26) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Item_Number:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Allocated:28) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
				
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Discount:37) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########%"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Standard_Margin:43) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########%"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Component_Level:47) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Level_Up_Item_Number:48) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Price_Per:50) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "###,###,###0.00"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Delivered:51) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Purchase_Ordered:52) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Invoiced:53) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]WT_Tag1:54) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]WT_Tag2:55) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]WT_Tag3:56) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]WT_Tag4:57) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]x_ID:58) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]x_AssemblyReference:62) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]x_ReturnQuantity:63) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]AT_Actual_Units:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JT_Budget_Units:20) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]Sort_No:22) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JS_Actual_Margin:39) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JS_Actual_Margin_PC:40) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JS_Budget_Margin:41) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JS_Bud_Margin_PC:42) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]x_ID:49) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]x_RecordClass:50) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JT_WIP_Units:51) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JS_WIP_Margin:55) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JS_WIP_MarginPC:56) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]x_JobDivision:61) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]Job_alert:62) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]Job_PublishedState:63) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]JOB_xCompanyEmployees:66) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOBS:26]Job_RecruitmentFee:73) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Item_Number:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Quantity:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "###,###,###0.000"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]x_ID:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_unallocate:25) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]xRecordUpdateStamp:46) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENT_ITEMS:27]xnonlinkedCopiedFromID:47) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_TABLE:28]Price_Discount:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_TABLE:28]Quantity_From:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_TABLE:28]Quantity_To:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_TABLE:28]x_CatalogueID:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_TABLE:28]x_ID:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_TABLE:28]x_TableClassID:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRICE_TABLE:28]Pricing_Basis:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTIONS:29]Batch_Number:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTIONS:29]BatchItem_X_ID:30) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTIONS:29]Transaction_ID:31) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTIONS:29]Transaction_OtherSideID:32) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCHES:30]Batch_Number:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCHES:30]Zero:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCHES:30]State:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCHES:30]X_ValidationStatus:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACCOUNTS:32]Multicurrency_Valuation:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERIODS:33]x_ID:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERIODS:33]X_FinancialYearID:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACCOUNT_BALANCES:34]x_ID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACCOUNT_BALANCES:34]NoBalanceCheck:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TAX_CODES:35]Tax_Rate:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ANALYSES:36]Record_Number_Start:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICES:37]Total_Invoiced:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICES:37]Tax_Rate:20) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICES:37]State:24) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICES:37]x_ID:35) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[RECURRING_JOURNALS:38]Copy_Batch:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[RECURRING_JOURNALS:38]x_ID:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]Total_Invoiced:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]ITEMS:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]State:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]Tax_Rate:28) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]ALLOCATIONS:33) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]X_DepositRelatedTable:44) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]X_DepositRelatedRecordID:45) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]X_Reversed:47) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]x_DeliveryAddressID:48) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES:39]X_ID:49) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]Assembly_Qty:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]MovementSourceTable:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]MovementSourceField:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]x_ThreadID:21) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]x_ID:22) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]TimeDateStamp:23) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]x_MovementFunction:24) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_MOVEMENTS:40]xCompanyFromID:25) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SYS_RELATEDSequences:44]SEQUENCE_LASTNUMBER:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STAGES:45]Default_Client_Rate:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STAGES:45]Default_Applicant_Rate:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STAGES:45]Model_PC:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STAGES:45]Client_PC:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STAGES:45]Allowance_PC:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TIME_BILLING_CATEGORIES:46]Sales_Rate:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TIME_BILLING_CATEGORIES:46]Cost_Rate:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JT_Budget_Units:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]AT_Actual_Units:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JS_Actual_Margin:39) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JS_Actual_Margin_PC:40) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JS_Budget_Margin:41) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JS_Budget_Margin_PC:42) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JS_Quoted_Qty:46) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]X_Actual_Hours_Entry:51) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]X_actual_Minutes:53) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]x_ID:54) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JT_WIP_Units:55) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JS_WIP_Margin:59) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_STAGES:47]JS_WIP_MarginPC:60) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB PERSONNEL:48]JT_Budget_Units:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB PERSONNEL:48]JT_Actual_Units:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB PERSONNEL:48]JT_Act_Sales_Amount:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB PERSONNEL:48]X_JobPersonnelContactID:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB PERSONNEL:48]X_ID:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB PERSONNEL:48]x_Job_Role_ID:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB PERSONNEL:48]JT_WIP_Units:21) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TIME_BUDGETS:49]Budget_Units:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TIME_BUDGETS:49]Start_Week:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TIME_BUDGETS:49]Total_Weeks:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TIME_BUDGETS:49]X_ID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[POSTAL_CODES:50]xRec_ID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WORKFLOW_CONTROL:51]Days:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WORKFLOW_CONTROL:51]Display:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WORKFLOW_CONTROL:51]Hours:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WORKFLOW_CONTROL:51]Minutes:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WORKFLOW_CONTROL:51]TimeNeededDAYS:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WORKFLOW_CONTROL:51]TimeNeededHours:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WORKFLOW_CONTROL:51]TimeNeededMinutes:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PUBLICATIONS:52]Circulation:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CREDIT_STAGES:54]Letter_Days:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]Information_Level:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]Year:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]Deleted:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]RelatedTableNumber:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]RelatedTableFieldNum:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]RelateTableRecordNumber:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]QualityID:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]QualityGroupID:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INFORMATION:55]QualityRecordID:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[QUALITY_GROUPS:56]x_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS:57]State:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS:57]x_DeliveryAddressID:20) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS:57]x_ID:21) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_LEVELS:58]Free_Level:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_LEVELS:58]Allocated_Level:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[STOCK_LEVELS:58]X_ID:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MOVEMENT_TYPES:60]Number:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MOVEMENT_TYPES:60]MN_Identifier_Number:24) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MOVEMENT_TYPES:60]ResultingStockStatus:25) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MOVEMENT_TYPES:60]Usage:26) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LOCATIONS:61]ParentLocationID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LOCATIONS:61]LocationID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LOCATIONS:61]Sub_LocationCodingPref:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENT_STOCK:62]Quantity:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENT_STOCK:62]Item_Number:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENT_STOCK:62]Cost_Price:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENT_STOCK:62]Stock_Number:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENT_STOCK:62]Total_Cost:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENT_STOCK:62]X_ID:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENT_STOCK:62]x_Stock_Level_ID:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SYS_ManualSequences:64]SEQUENCE_LASTNUMBER:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_TYPES:65]Default_Tax:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_TYPES:65]Default_Allow:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_TYPES:65]ProjectedSaleTypeID:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_TYPES:65]TypeClass:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[JOB_TYPES:65]xAgencyDivision:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DELETIONS:66]xRec_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENCIES:71]X_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENCIES:71]Parent_Conversion_RateID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENCY_RATES:72]Rate:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENCY_RATES:72]X_ID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CURRENCY_RATES:72]x_PeriodID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_A:77]x_ID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_B:78]No:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_B:78]X_ID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_C:79]x_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SCRIPTS:80]Table_Number:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SCRIPTS:80]Script_Class:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SCRIPTS:80]Script_Checked:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SCRIPTS:80]Script_status:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SCRIPTS:80]ModifiedStamp:23) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SCRIPTS:80]ParsedStamp:24) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_D5:81]X_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_D6:82]X_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_MAIL:83]Record_Number:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_MAIL:83]Residue:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_MAIL:83]Area_Order:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_MAIL:83]Count:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[MAILSORT_MAIL:83]Bags:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[HEADINGS:84]Heading_Level:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[HEADINGS:84]EnforceRange:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PICTURES:85]x_ID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PICTURES:85]LinkedTableID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PICTURES:85]LinkedRecordID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPONENTS:86]Quantity:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPONENTS:86]X_ProductNoLongeravailable:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPONENTS:86]Component_Type:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPONENTS:86]Catalogue_ID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPONENTS:86]X_Build_Code_Section_ID:18) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPONENTS:86]ComponentSelectionOrderSequence:19) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPONENTS:86]X_ComponentID:21) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTRACT_RECORD_ANALYSIS:88]xRecordDeleted:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROJECTS:89]X_ID:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TABLE_RECORD_STATES:90]Table_number:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TABLE_RECORD_STATES:90]xPipeStateID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TABLE_RECORD_STATES:90]xStateClass:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TABLE_RECORD_STATES:90]xSortOrder:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CODE_USES:91]Use:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL_GROUPS:92]x_ID:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL_GROUPS:92]Home_View:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SUBSCRIPTIONS:93]Order_Item_Number:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SUBSCRIPTIONS:93]After_Number:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SUBSCRIPTIONS:93]Unit_Number:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SUBSCRIPTIONS:93]x_ID:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[IDENTIFIERS_MULTI_NUMBERS:94]Table_Number:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[IDENTIFIERS_MULTI_NUMBERS:94]Number:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[IDENTIFIERS_MULTI_NUMBERS:94]X_Reference_Field:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_ITEMS:95]X_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_ITEMS:95]X_ListID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_ITEMS:95]X_Item_Status:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]Table_Number:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]Field_Number:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]Width:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]Order:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]Font_Size:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]Footer:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]X_Related_Table:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LIST_LAYOUTS:96]X_Related_Field:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LICENCE_UPDATES:97]Version_Number:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[LICENCE_UPDATES:97]X_ID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CUSTOM_FIELDS:98]Real_or_Integer:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CUSTOM_FIELDS:98]Deleted:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CUSTOM_FIELD_DEFINITiONS:99]Sort_Order:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CUSTOM_FIELD_DEFINITiONS:99]x_ListID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DATA_AUDITS:102]X_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DATA_AUDITS:102]TABLE_NUMBER:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EMAIL_ATTACHMENTS:103]Email_ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EMAIL_ATTACHMENTS:103]FileNo:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EMAIL_RECIPIENTS:104]Person_ID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EMAIL_RECIPIENTS:104]SentStatus:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER_SETS:105]x_RecID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER_SETS:105]SET_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[USER_SETS:105]Set_Table:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[DIARY_ITEMOWNERS:106]xStatus:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SD_Settings:107]x_OwnerID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SD_Settings:107]EventDefaultTimeFrame:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SD_Settings:107]TimePopUpSetting:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SD_Settings:107]ScheduleSetting:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CATALOGUE:108]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CATALOGUE:108]Image_Source:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CATALOGUE:108]Image_NamePref:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CATALOGUE:108]EW_Family:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CATALOGUE:108]xPriceModel:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CATALOGUE:108]xDataModel:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CATALOGUE:108]xCatalogueClass:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_ProductLink:109]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_ProductLink:109]X_CatalogueID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_ProductLink:109]x_ProductID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_ProductLink:109]Status:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_ProductLink:109]TimeDateStamp:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_Availability:110]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_Availability:110]Person_Or_GroupID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Catalogue_Availability:110]Catalogue_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_LISTS:111]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_LISTS:111]X_ListVersion:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_ListUsage:112]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_ListUsage:112]x_ListID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_ListUsage:112]x_TableID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_ListUsage:112]x_FieldID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]Class_ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]Forcast_LevelID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]PersonnelOwnerID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]PersonnelGroupID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]CompanyID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]ContactID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]RelatedSaleTableID:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]RelatedSaleRecordID:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]CurrencyID:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]GrossValue:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]GrossCosts:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]GrossMargin:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]Probability:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]CalculatedProbableValue:18) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]ConvertedSaleValue:19) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]Status:20) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]ProjectionDatesSort:24) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]ProjectionPeriodID:25) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_PROJECTION:113]RelatedDiaryID:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_ProjectionLinks:114]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_ProjectionLinks:114]ProjectionPeriodDates:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_ProjectionLinks:114]SalesProjectionParentID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SALES_ProjectionLinks:114]SalesProjectionSubID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROCESSES_TO_HANDLE:115]TableNumber:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROCESSES_TO_HANDLE:115]Status:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROCESSES_TO_HANDLE:115]RecordNumber:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROCESSES_TO_HANDLE:115]Data1Longint:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROCESSES_TO_HANDLE:115]Data2Longint:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PROCESSES_TO_HANDLE:115]Data3Longint:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PREFERENCES:116]IDNumber:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PREFERENCES:116]Pref_OwnerTable:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PREFERENCES:116]Pref_OwnerID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]RecordNumber:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]AutoRunPeriod:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]recorddelimiterChar:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]BKServerPort:23) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]NonFatalErrorsAllowed:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]BKTimeout:30) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]BKMaxDuration:31) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]BKCatalogueID:37) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportProjects:117]LastRunDateTimeStamp:38) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportSteps:118]ProjectNumber:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportSteps:118]Order:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportSteps:118]BaseTablenumber:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportSteps:118]RecordNumber:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]StepTableRecordNumber:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]RecordNumber:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]ActionOrder:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]FieldNumber:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]CalculationPercent:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]TableNumber:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]SubfieldNumber:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]RelatedFieldNumber:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_StepActions:119]StepOrder:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]ExportStepNumber:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]RecordNumber:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]TableNumber:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]Order:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]ParentTableNumber:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]SubFieldNumber:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]RelatedOnefieldNumber:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_ExportTables:120]RelatedManyfieldNumber:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BK_FieldMap:121]DayBookTableNumber:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BK_FieldMap:121]DayBookFieldNumber:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BK_FieldMap:121]DaybookFieldType:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BK_FieldMap:121]x_MapSetID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BK_FieldMap:121]x_DestinationContext:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BK_FieldMap:121]x_RecID:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BKFields:122]Type:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[EW_BKFields:122]FieldLength:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CLIENT_SERVERMESSAGES:123]USER_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SMS_Log:124]CreditsUsed:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SMS_Log:124]X_ID:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[AddressRecords:125]X_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[AddressRecords:125]AddressClassID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[AddressRecords:125]X_OwnerTableID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[AddressRecords:125]X_OwnerRecordID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[AddressRecords:125]X_AddressAreaID:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XInvoiceAllocation:126]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XInvoiceAllocation:126]xAmount:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XOrder_revisions:127]X_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XOrder_revisions:127]X_RevisionNumber:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XOrder_revisions:127]X_OrderID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XOrder_revisions:127]x_OrderFieldCount:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XOrder_revisions:127]x_OrderItemFieldCount:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANS_MULTI:128]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANS_MULTI:128]X_OneTransID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANS_MULTI:128]x_OneBatchItemID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANS_MULTI:128]x_ManyBatchItemID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANS_MULTI:128]x_ManyTransID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]Handlers:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]Multiple:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]CheckInterval:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]Webport:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]OracleTimeout:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]MaxHandlers:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]MasterDelay:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]LoadInformerPause:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]RemoteLogPort:19) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]WatchdogPort:24) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]LoadInformerPort:32) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEBSETUP_4D:129]sWebPort:34) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEB_ACCESS:130]Hits:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEB_ACCESS:130]Contact_ID:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEB_ACCESS:130]Personnel_ID:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEB_ACCESS:130]x_ID:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]CardHolderClass:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]CardClass:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]Card_TypeNUM:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]RelatedTableNumber:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]RelatedRecordIdent:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]SortOrder:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]AddedBy:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xCreditCardDetails:132]xDeleted:18) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CC_OrderAuths:133]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CC_OrderAuths:133]Order_ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CC_OrderAuths:133]CC_RecordID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CC_OrderAuths:133]xAuthStatus:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CC_OrderAuths:133]TransactionID:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_QUERY_PARAMETERS:134]X_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_QUERY_PARAMETERS:134]X_OwnerID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_QUERY_PARAMETERS:134]X_ContextID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[XReportsExecutor:135]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CCM_PSPTransaction:136]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CCM_PSPTransaction:136]x_CCID:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CCM_PSPTransaction:136]xContactID:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CCM_PSPTransaction:136]xOrderID:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CCM_PSPTransaction:136]XPSPID:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CCM_PSPTransaction:136]XTransactionStatus:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xDiaryRelations:137]xDiaryID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xDiaryRelations:137]XRelationNUM:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xDiaryRelations:137]xTableNUM:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xDiaryRelations:137]xRecordID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xOtherRelations:138]xOneTableNUm:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xOtherRelations:138]xOneTableFieldNum:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xOtherRelations:138]xManyTableNum:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xOtherRelations:138]xManyTableFieldNum:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xOtherRelations:138]xOneTableLONGref:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xOtherRelations:138]xManyTableLONGref:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xSynch:139]x_SynchID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xSynch:139]X_RecordSourceID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xSynch:139]xSynchRecordID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xSynch:139]xSynchClass:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xBatchItemRelations:140]xBatchItemID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xBatchItemRelations:140]xRelationNUM:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xBatchItemRelations:140]xTableNUM:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xBatchItemRelations:140]xRecordID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]x_DiaryViewRecordID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xDiaryInstanceUID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xDiaryRecordID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]XInstanceUserID:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xFillColourRed:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xFillColourGreen:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xFillColourBlue:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xAccentColourRed:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xAccentColourGreen:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[X_DIaryDisplay:142]xAccentColourBlue:18) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]Thread_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]Thread_Number:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]Stock_MovementID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]Stock_movementItemID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]From_MovementID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]CurrentStock_ID:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]From_CurrentStockID:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]Stock_Type:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]Stock_LevelID:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]From_StockLevelID:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]Quantity:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]SalesOrderID:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]SalesOrderItemID:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]PurchaseOrderID:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]PurchaseOrderItemID:18) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Stock_Thread:143]ProductID:19) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTACTS_RECORD_ANALYSIS:144]ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTACTS_COMPANIES:145]ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES_RECORD_ANALYSIS:146]ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[COMPANIES_RECORD_ANALYSIS:146]Company_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS_SUPPLIERS:148]Margin:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS_SUPPLIERS:148]Lead_Days:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS_SUPPLIERS:148]ID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL_DIARY_ACCESS:149]xAccessType:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PERSONNEL_DIARY_ACCESS:149]ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CONTRACTS_CONTACTS:151]ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]SCProductXID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]ID:7) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xIdentifiedsympton:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xPartRequiredStatus:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xProductWarrentyStatus:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xRelatedOrderItemNumber:13) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]Xproductinvolvedid:14) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xStorageLocationID:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xNonInvolvedComponentID:20) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xSeverityID:22) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[SERVICE_CALLS_PRODUCTS:152]xRepairStatus:23) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCH_ITEMS:155]CreditTransID:26) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCH_ITEMS:155]DebitTransID:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCH_ITEMS:155]xIgnoreMismatchCred:28) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCH_ITEMS:155]xignoreMismatchDeb:29) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCH_ITEMS:155]ID:30) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACCOUNTS_LAYERS:156]ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACCOUNTS_ANALYSES:157]ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICE_ITEMS:158]Quantity:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICE_ITEMS:158]Price_Per:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICE_ITEMS:158]Item_Number:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICE_ITEMS:158]Sales_Price:15) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICE_ITEMS:158]ID:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[REC_JOURNALS_DATES:160]ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[REC_JOURNALS_DATES:160]REC_JOURNALS_CODE:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ITEMS:161]Quantity:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ITEMS:161]Sales_Price:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ITEMS:161]Item_Number:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ITEMS:161]Price_Per:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ITEMS:161]ID:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ITEMS:161]xReferredtoitemid:19) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ALLOCATIONS:162]xTransferred:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[INVOICES_ALLOCATIONS:162]ID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS_ITEMS:169]Quantity:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS_ITEMS:169]Item_Number:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS_ITEMS:169]Discount:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS_ITEMS:169]Price_Per:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS_ITEMS:169]POitemID:16) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS_ITEMS:169]ID:17) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PURCHASE_ORDERS_ITEMS:169]PurchaseInvoiceItemID:20) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[x_ProductLocations:185]x_ProductID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xServiceSalesItemLink:186]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xServiceSalesItemLink:186]SalesOrderItemNumber:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xServiceSalesItemLink:186]SalesOrderItemID:4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xServiceSalesItemLink:186]PurchaseOrderItemID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[xServiceSalesItemLink:186]SC_ProductInvolvedID:6) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[BUILT_CODE_FORMAT_SECTION:188]FORMAT_ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[BUILT_CODE_FORMAT_SECTION:188]SECTION_NUMBER:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[BUILT_CODE_FORMAT_SECTION:188]SECTION_LENGTH:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CALCULATED DATA:190]X_RECORD_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CALCULATED DATA:190]RELATED_RECORD_ID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CALCULATED DATA:190]LIST_LAYOUT_ID:3) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[CALCULATED DATA:190]Real_Data:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEB_CONNECTIONS:197]xConnectionID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[WEB_CONNECTIONS:197]TimeStamp:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACC_Bank_Statements:198]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACC_Bank_Statements:198]Bank_DebitAmount:8) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACC_Bank_Statements:198]Bank_CreditAmount:9) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACC_Bank_Statements:198]Bank_Balance:10) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACC_Bank_Statements:198]Bank_ReconciledAmount:11) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ACC_Bank_Statements:198]Bank_TransactionTimeStamp:12) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Bank_Reconcile:199]x_ID:1) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Bank_Reconcile:199]Bank_RecordID:2) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[Bank_Reconcile:199]Reconciled_TransactionID:5) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
				
			: ($_ptr_ArrayFieldPointers->{$_l_ColumnIndex}=->[ORDER_ITEMS:25]Item_Number:27) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "########"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: (($_l_DataType=1)) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "|AccountsNZ"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: (($_l_DataType=8)) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "|integers"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
			: (($_l_DataType=9)) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; "|Longint"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
				
			: ($_l_DataType=Is time:K8:8) & ($_t_Format="")  // 26/06/06
				LB_SetFormat($_ptr_ListboxArea; 2; "&/5"; $_l_ColumnIndex; $_l_ColumnIndex; 4)
				LB_SetFilter($_ptr_ListboxArea; 2; "!0&9##:##"; $_l_ColumnIndex; $_l_ColumnIndex)  //added 08/02/07 -kmw
				
			: ($_l_DataType=4) & ($_t_Format="")
				LB_SetFormat($_ptr_ListboxArea; 2; ""; $_l_ColumnIndex; $_l_ColumnIndex; 2)
				
			Else 
				If ($_t_Format#"")  //only use if there is a format - will be defaults anyway otherwise
					LB_SetFormat($_ptr_ListboxArea; 2; $_t_Format; $_l_ColumnIndex; $_l_ColumnIndex; 0)
				End if 
		End case 
		
		
		If (Size of array:C274($_ptr_ArrayFontName->)<$_l_ColumnIndex)
			Repeat 
				INSERT IN ARRAY:C227($_ptr_ArrayFontName->; $_l_ColumnIndex; 1)
			Until (Size of array:C274($_ptr_ArrayFontName->)=$_l_ColumnIndex)
		End if 
		If (Size of array:C274($_ptr_ArrayFontStyle->)<$_l_ColumnIndex)
			//APPEND TO ARRAY($_ptr_ArrayFontStyle->;1)
			Repeat 
				INSERT IN ARRAY:C227($_ptr_ArrayFontStyle->; $_l_ColumnIndex; 1)
			Until (Size of array:C274($_ptr_ArrayFontStyle->)=$_l_ColumnIndex)
		End if 
		$_t_FontName:=$_ptr_ArrayFontName->{$_l_ColumnIndex}
		$_l_FontSize:=$_ptr_ArrayofColumnFonts->{$_l_ColumnIndex}
		$_l_FontStyle:=$_ptr_ArrayFontStyle->{$_l_ColumnIndex}
		If ($_l_FontStyle=0)
			$_l_FontStyle:=Plain:K14:1
		End if 
		If (Table:C252($_ptr_FIeld)#Table:C252($_ptr_LBTable))
			$_l_HeaderFontStyle:=Italic:K14:3
		Else 
			$_l_HeaderFontStyle:=$_l_FontStyle
		End if 
		
		If (Not:C34(LAY_bo_Fontinited))
			ARRAY TEXT:C222(LAy_at_FontList; 0)
			FONT LIST:C460(LAy_at_FontList)
			LAY_bo_Fontinited:=True:C214
		End if 
		If ($_t_FontName#"")
			$_l_FontNamePosition:=Find in array:C230(LAy_at_FontList; $_t_FontName)
			If ($_l_FontNamePosition<0)
				$_t_FontName:=""
			End if 
		End if 
		If ($_t_FontName="")
			$_t_FontName:=<>SYS_t_DefaultFontPlain
			
		End if 
		//$_l_FontSize:=11
		If ($_l_FontSize=0)
			$_l_FontSize:=<>SYS_l_DefaultPlainFontSize
			If ($_l_FontSize<12)
				$_l_FontSize:=12
			End if 
		End if 
		If ($_l_FontSize>$_l_MaxFontSize)
			$_l_MaxFontSize:=$_l_FontSize
		End if 
		If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnIndex}))  //Enterable=true
			//$_ptr_ArrayofColumnWIdths
			//INSERT IN ARRAY($_ptr_ArrayFontName->;$_l_ColumnNumber;1)
			//INSERT IN ARRAY($_ptr_ArrayFontStyle->;$_l_ColumnNumber;1)
			
			If ($_ptr_ArrayofColumnFonts->{$_l_ColumnIndex}=9) | (Is Windows:C1573)  //Font Size = 9
				If ($_bo_FontDef9=False:C215)  //don't change it if already defaulted
					If ($_t_FontName#<>SYS_t_DefaultFontPlain) | ($_l_FontSize#<>SYS_l_DefaultPlainFontSize)
						If ($_l_ColumnIndex=1)
							$_l_LastFontStyle:=$_l_FontStyle
							$_t_LastFonName:=$_t_FontName
							
							LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;9)" 05/04/07 -kmw
						Else 
							If ($_l_LastFontStyle#$_l_FontStyle) | ($_t_LastFonName#$_t_FontName)
								LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;9)" 05/04/07 -kmw
								
							End if 
						End if 
					End if 
					LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; $_l_ColumnIndex; $_l_ColumnIndex; <>SYS_l_DefaultBoldFontSize; $_l_HeaderFontStyle)  //changed from ";0;0;9)" 05/04/07 -kmw
				End if 
				If ($_ptr_ArrayofColumnFooters->{$_l_ColumnIndex}>1)
					If ($_bo_FontDef9=False:C215)
						//AL_SetFtrStyle ($_ptr_ListboxArea->;$_l_ColumnIndex;◊FontPlain;9;0)
					End if 
					$_bo_FooterUsed:=True:C214
				End if 
				$_l_Size9:=$_l_Size9+1
			Else   //Font Size = 10
				
				If ($_t_FontName#<>SYS_t_DefaultFontPlain) | ($_l_FontSize#<>SYS_l_DefaultPlainFontSize)
					If ($_l_ColumnIndex=1)
						$_l_LastFontStyle:=$_l_FontStyle
						$_t_LastFonName:=$_t_FontName
						
						LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;10)" 05/04/07 -kmw
					Else 
						If ($_l_LastFontStyle#$_l_FontStyle) | ($_t_LastFonName#$_t_FontName)
							LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;10)" 05/04/07 -kmw
						End if 
					End if 
				End if 
				If ($_ptr_ArrayofColumnFooters->{$_l_ColumnIndex}>1)
					If ($_bo_FontDef9)
						//AL_SetFtrStyle ($_ptr_ListboxArea->;$_l_ColumnIndex;◊FontPlain;10;0)
					End if 
					$_l_Footer9Ptr:=0
					$_bo_FooterUsed:=True:C214
				End if 
				LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; $_l_ColumnIndex; $_l_ColumnIndex; <>SYS_l_DefaultBoldFontSize; $_l_HeaderFontStyle)  //changed from ";0;0;10)" 05/04/07 -kmw
				
			End if 
		Else 
			If ($_l_FontSize=9)  //| (is windows )  //Font Size = 9
				If ($_t_FontName#<>SYS_t_DefaultFontPlain) | ($_l_FontSize#<>SYS_l_DefaultPlainFontSize)
					If ($_l_ColumnIndex=1)
						$_l_LastFontStyle:=$_l_FontStyle
						$_t_LastFonName:=$_t_FontName
						
						LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;9)" 05/04/07 -kmw
					Else 
						If ($_l_LastFontStyle#$_l_FontStyle) | ($_t_LastFonName#$_t_FontName)
							LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;9)" 05/04/07 -kmw
						End if 
						
						
					End if 
				End if 
				If ($_ptr_ArrayofColumnFooters->{$_l_ColumnIndex}>1)
					If ($_bo_FontDef9=False:C215)
						//LB_SETFONT ($_ptr_ListboxArea;$_t_ObjectPrefix;2;<>SYS_t_DefaultFontPlain;$_l_ColumnIndex;$_l_ColumnIndex;<>SYS_l_DefaultPlainFontSize)  //changed from ";0;0;9)" 05/04/07 -kmw
					End if 
					$_bo_FooterUsed:=True:C214
				End if 
				LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; $_l_ColumnIndex; $_l_ColumnIndex; <>SYS_l_DefaultBoldFontSize; $_l_HeaderFontStyle)  //changed from ";0;0;9)" 05/04/07 -kmw
				
				$_l_Size9:=$_l_Size9+1
			Else 
				If ($_t_FontName#<>SYS_t_DefaultFontPlain) | ($_l_FontSize#<>SYS_l_DefaultPlainFontSize)
					If ($_l_ColumnIndex=1)
						$_l_LastFontStyle:=$_l_FontStyle
						$_t_LastFonName:=$_t_FontName
						
						
						LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;10)" 05/04/07 -kmw
					Else 
						If ($_l_LastFontStyle#$_l_FontStyle) | ($_t_LastFonName#$_t_FontName)
							LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; $_t_FontName; $_l_ColumnIndex; $_l_ColumnIndex; $_l_FontSize; $_l_FontStyle)  //changed from ";0;0;10)" 05/04/07 -kmw
						End if 
						
					End if 
				End if 
				
				If ($_ptr_ArrayofColumnFooters->{$_l_ColumnIndex}>1)
					If ($_bo_FontDef9)
						//AL_SetFtrStyle ($_ptr_ListboxArea->;$_l_ColumnIndex;◊FontPlain;10;0)
					End if 
					$_l_Footer9Ptr:=0
					$_bo_FooterUsed:=True:C214
				End if 
			End if 
			LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; $_l_ColumnIndex; $_l_ColumnIndex; <>SYS_l_DefaultBoldFontSize; $_l_HeaderFontStyle)  //changed from ";0;0;9)" 05/04/07 -kmw
			
			//AL_SetEnterable ($_ptr_ListboxArea->;$_l_ColumnIndex;0)
		End if 
		If ($_ptr_ArrayofColumnLockFlags->{$_l_ColumnIndex})  //Locked = true
			//AL_SetColLock ($_ptr_ListboxArea->;$_l_ColumnIndex)
		End if 
		$_t_ColumnColour:=$_ptr_ArrayofColumnColors->{$_l_ColumnIndex}
		LB_l_FontColor:=White:K11:1
		//LB_SetColours ($_ptr_ListboxArea;Black ;Grey ;Black ;Light Grey )
		If (($_t_ColumnColour#"Black") & ($_t_ColumnColour#""))
			//LB_ColorNameToRGB
			//LB_l_FontColor:=1
			//OBJECT SET COLOR(
			//LB_l_FontColor:=Choose([Companies]ID;Default background color; Default light shadow color;Default foreground color; Default dark shadow color)
			//LB_SetColours 
			If (True:C214)
				//AL_SetForeColor ($_ptr_ListboxArea->;$_l_ColumnIndex;$_t_ColourName;0;$_t_ColumnColour;16;$_t_ColumnColour;16)
			Else 
				//AL_SetForeColor ($_ptr_ListboxArea->;$_l_ColumnIndex;"";$colour;$_t_ColumnColour;16;$_t_ColumnColour;16)
			End if 
		End if 
		
	End for 
	//OBJECT SET FONT SIZE($_ptr_ListboxArea->;28)
	
	If (($_ptr_ArrayReferences->{4}="2@") | (<>vALMode=2))
		
		
		
		//3=entry on double click
		//select on single click....but because there is a form for entry the double click does nothing other than open a subscreen
		//AL_SetEntryOpts ($_ptr_ListboxArea->;3;0;0;0;1)
		For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
			//at the moment the out form non enterable!
			$_Ptr_ThisColumnField:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
			OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnField->; False:C215)
		End for 
		
		
	Else 
		//AL_SetEntryOpts ($_ptr_ListboxArea->;2;0;0;0;1)
		For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
			
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}  // 23/06/06 pb
			If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber})) & ($_ptr_areaTypeVariable-><3)  //Enterable=true
				OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; True:C214)
			Else 
				OBJECT SET ENTERABLE:C238($_Ptr_ThisColumnArray->; False:C215)
			End if 
			
		End for 
	End if 
	
Else 
	$_l_EntryOptionNumber:=Num:C11(Substring:C12($_ptr_ArrayReferences->{4}; 1; 1))
	If ($_l_EntryOptionNumber=2) & (<>ALselectinEntryMode=1)
		//AL_SetEntryOpts ($_ptr_ListboxArea->;3;0;0;0;0)
		For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
			OBJECT SET ENTERABLE:C238($_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}->; False:C215)
		End for 
	Else 
		For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
			If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))  //Enterable=true
				$_ptr_ListboxColumn:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
				
				OBJECT SET ENTERABLE:C238($_ptr_ListboxColumn->; True:C214)
			Else 
				$_ptr_ListboxColumn:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
				
				OBJECT SET ENTERABLE:C238($_ptr_ListboxColumn->; False:C215)
			End if 
			
		End for 
	End if 
End if 
OBJECT GET COORDINATES:C663($_ptr_ListboxArea->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObjectWIdth:=$_l_ObjectRight-$_l_ObjectLeft
$_l_ObjectHeight:=$_l_ObjectBottom-$_l_ObjectTop

If ($_ptr_areaTypeVariable-><3) | ($_l_KeyTableNumber=0)
	LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles)
	If (Size of array:C274($_aptr_ColumnVars)>0)
		$_Ptr_ThisColumnField:=$_aptr_ColumnVars{1}
		If (Is a variable:C294($_Ptr_ThisColumnField))
			
			$_l_TotalHeight:=((Size of array:C274($_aptr_ColumnVars{1}->))*16.5)+18
		Else 
			$_l_RecordCount:=99
			For ($_l_FIndTableIndex; 1; Size of array:C274($_aptr_ColumnVars))
				$_l_TableNumber:=Table:C252($_aptr_ColumnVars{$_l_FIndTableIndex})
				If ($_l_TableNumber>0)
					$_l_RecordCount:=Records in selection:C76(Table:C252($_l_TableNumber)->)
					$_l_FIndTableIndex:=Size of array:C274($_aptr_ColumnVars)
				End if 
			End for 
			$_l_TotalHeight:=($_l_RecordCount*16.5)+18
		End if 
	Else 
		$_l_TotalHeight:=0
	End if 
Else 
	$_l_RecordCount:=Records in selection:C76(Table:C252($_l_KeyTableNumber)->)
	$_l_TotalHeight:=($_l_RecordCount*16.5)+18
End if 

If ($_l_ObjectWIdth<($_l_TotalWidth+10))
	If ($_l_ObjectHeight<($_l_TotalHeight+10))
		LB_SetScroll($_ptr_ListboxArea; -2; -2)
	Else 
		LB_SetScroll($_ptr_ListboxArea; -2; -3)
	End if 
Else 
	If ($_l_ObjectHeight<($_l_TotalHeight+10))
		LB_SetScroll($_ptr_ListboxArea; -3; -2)
	Else 
		LB_SetScroll($_ptr_ListboxArea; -3; -3)
	End if 
	
End if 

If (True:C214)
	If ($_bo_HideLastColumn)
		If ($_l_NumberofColumns>0)
			$_l_VisibleObjectWIdth:=0
			For ($_l_Width; 1; $_l_NumberofColumns-1)
				$_l_VisibleObjectWIdth:=$_l_VisibleObjectWIdth+$_ptr_ArrayofColumnWIdths->{$_l_Width}
			End for 
			$_l_IncreaseWidth:=$_l_ObjectWIdth-$_l_VisibleObjectWIdth
			If ($_l_IncreaseWidth>0)
				//inc 50
				//tot 100
				//tot/100*inc
				
				$_l_MultipleWidth:=$_l_ObjectWIdth/$_l_VisibleObjectWIdth
				For ($_l_Width; 1; $_l_NumberofColumns-1)
					$_ptr_ArrayofColumnWIdths->{$_l_Width}:=$_ptr_ArrayofColumnWIdths->{$_l_Width}*$_l_MultipleWidth
					LB_SetColumnWidths($_ptr_ListboxArea; $_t_ObjectPrefix; $_l_Width; $_ptr_ArrayofColumnWIdths->{$_l_Width})
				End for 
			End if 
			$_ptr_ArrayofColumnWIdths->{$_l_NumberofColumns}:=1
			LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles)
			
			LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{Size of array:C274($_at_ColumnNames)}; 1)
			$_l_FontHeight:=Int:C8($_l_MaxFontSize+(($_l_MaxFontSize/100)*45))
			LISTBOX SET ROWS HEIGHT:C835($_ptr_ListboxArea->; $_l_FontHeight)
			
			//LB_SetColumnWidths ($_ptr_ListboxArea;$_t_ObjectPrefix;$_l_NumberofColumns;1)
		End if 
	End if 
	
	$_l_FontHeight:=Int:C8($_l_MaxFontSize+(($_l_MaxFontSize/100)*45))
	LISTBOX SET ROWS HEIGHT:C835($_ptr_ListboxArea->; $_l_FontHeight)
	LB_Setdividers($_ptr_ListboxArea; -Grey:K11:15; 32)  //Both on
	
End if 
ERR_MethodTrackerReturn("LBi_inclSetup"; $_t_oldMethodName)
