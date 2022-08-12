//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_LBI_Setup
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
	//ARRAY LONGINT(EW_al_ProjectNumbers;0)
	//ARRAY TEXT(EW_at_ProjectsNames;0)
	C_BOOLEAN:C305(DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_CountParameters; $_l_SizeofArray; $3; err; EW_l_BUT1; EW_l_BUT2; EXW_l_But1; EXW_l_BUt2; EXW_l_BUt3)
	C_LONGINT:C283(EXW_l_BUT4; EXW_l_BUT5; EXW_l_BUT6; EXW_l_BUT7; EXW_l_BUT8; EXW_l_BUT9; rselect; textsize)
	C_POINTER:C301($1; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_oldMethodName; $_t_Prefix; $2; oEW_COL1; oEW_COL2; oEW_HED1; oEW_HED2; oExportWiz_COL1; oExportWiz_COL2)
	C_TEXT:C284(oExportWiz_COL3; oExportWiz_COL4; oExportWiz_COL5; oExportWiz_COL6; oExportWiz_COL7; oExportWiz_COL8; oExportWiz_COL9; oExportWiz_HED1; oExportWiz_HED2; oExportWiz_HED3; oExportWiz_HED4)
	C_TEXT:C284(oExportWiz_HED5; oExportWiz_HED6; oExportWiz_HED7; oExportWiz_HED8; oExportWiz_HED9)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("EW_LBI_Setup")

//NG THis method replaces Area Listsetup

//NG THIS METHOD IS NOW REPLACED WITH EW_LBI_SETUP
// AreaListSetUp - sets up AreaList areas, PB 05/07/02
// $1=Name of the area to set up
// $2=Area type (personnel, memos, etc.)
// $3=No. of columns (to be formatted, not total no. being used)
// $4...$x=ptr to array name


$_l_CountParameters:=Count parameters:C259-3
textsize:=10


$_l_SizeofArray:=Size of array:C274($4->)

//AL_RemoveArrays ($1;1;$_l_CountParameters)  ` ESSENTIAL!!! 21.11.97 pb
$_t_Prefix:=""
$_t_Prefix:="EXW"
Case of 
	: ($2="BK")  // BK Field List
		LB_SetupListbox($1; "oExportWiz"; "EXW_L"; 1; $4; $5; $6; $7; $8)
		LB_SetColumnHeaders($1; "EXW_L"; 1; "Field Name"; "Description"; "Type"; "Length")
		LB_SetColumnWidths($1; "oExportWiz"; 1; 65; 80; 40; 30)
		
		//AL_SetColOpts ($1;1;0;0;1;0;0;0)  `dont display last column/cols resizable
		//AL_SetDrgSrc ($1;1;"bkfields")  ` allow  row drag from details list
		//AL_SetDrgDst (eALFieldMap;1;"bkfields")  ` allow row drag to details list
		
		
		
		
		
		
	: ($2="EWDetails")  // Export Wizard list of Step Details
		LB_SetupListbox($1; "oExportWiz"; "EXW_L"; 1; $4; $5; $6; $7; $8; $9)
		LB_SetColumnHeaders($1; "EXW_L"; 1; "Source Data"; "Output Label"; "Action")
		LB_SetColumnWidths($1; "oExportWiz"; 1; 100; 100; 100)
		LB_SetEnterable($1; False:C215; 1)
		//AL_SetColOpts ($1;1;0;0;3;0;0;0)  `don't display last 3 columns/cols resizable
		//AL_SetSortOpts ($1;0;0;0;"";0;0)  ` no user sort
		
		If (rselect=1)  // lines should be selectable
			//AL_SetRowOpts ($1;1;1;4;1;0;0)  ` multi-line select; allow drag within
			LB_SetEnterable($1; False:C215; 1)
			LB_SetEnterable($1; False:C215; 2)
			LB_SetEnterable($1; False:C215; 3)
			
			//AL_SetEntryOpts ($1;0;0;0;0;0)  ` allow no data entry
		Else   // enterable
			LB_SetEnterable($1; False:C215; 1)
			LB_SetEnterable($1; True:C214; 2)
			LB_SetEnterable($1; False:C215; 3)
			
			//AL_SetEntryOpts ($1;2;0;0;2;0)  ` allow data entry in col. 2 -- single-cli
		End if 
		
		
	: ($2="EWFieldMap")  // BK field map setup
		LB_SetupListbox($1; "oExportWiz"; "EXW_L"; 1; $4; $5; $6; $7; $8)
		LB_SetColumnHeaders($1; "EXW_L"; 1; "DayBook Field"; "ecommerce Field"; "Field Type")
		LB_SetColumnWidths($1; "oExportWiz"; 1; 100; 110; 30; 0; 0)
		OBJECT SET VISIBLE:C603($7->; False:C215)
		OBJECT SET VISIBLE:C603($8->; False:C215)
		//AL_SetDrgSrc ($1;1;"bkfields")  ` allow  row drag from bkfields list
		//     AL_SetSortOpts ($1;0;0;0;"";0;0)  ` no user sort
		
		
		
	: ($2="EWfields")  // Export Wizard list of fields
		LB_SetupListbox($1; "oExportWiz"; "EXW_L"; 1; $4; $5; $6; $7)
		LB_SetColumnHeaders($1; "EXW_L"; 1; "Fields"; ""; "")
		LB_SetColumnWidths($1; "oExportWiz"; 1; 200; 0; 0; 0)
		OBJECT SET VISIBLE:C603($5->; False:C215)
		OBJECT SET VISIBLE:C603($6->; False:C215)
		
		//AL_SetColOpts ($1;1;0;0;3;0;0;0)  `don't display last 3 columns/cols resizable
		//AL_SetRowOpts ($1;0;0;4;0;0)
		//AL_SetDrgSrc ($1;1;"fields")  ` allow  row drag from details list
		//AL_SetDrgDst (eALStepdetails;1;"fields")  ` allow row drag to details list
		//AL_SetDrgOpts ($1;0;30;1;0)  ` allow multiple row drag; insertion arrow
		//AL_SetSortOpts ($1;0;0;0;"";0;0)  ` no user sort
		
		
	: ($2="EWPrefs")  // Export project list on Prefs screen 31/10/02 pb
		//err:=AL_SetArraysNam ($1;1;$_l_CountParameters;VarToName ($4);VarToName ($5))
		If (err=0)
			//AL_SetHeaders ($1;1;1;"Project Name")
			//AL_SetWidths ($1;1;1;260)
			//AL_SetColOpts ($1;1;0;0;1;0;0;0)  `dont display last column/cols resizable
		End if 
		LB_SetupListbox($1; "oEW"; "EW_L"; 1; ->EW_at_ProjectsNames; ->EW_al_ProjectNumbers)
		LB_SetColumnHeaders($1; "EW_L"; 1; "Project Name")
		LB_SetColumnWidths($1; "oEW"; 1; 260)  // dont need to worry about the invisible ones
		OBJECT SET VISIBLE:C603(EW_al_ProjectNumbers; False:C215)
		$_t_Prefix:="EW"
		
	: ($2="EWrelatedTables")  // Export Wizard list of related table names
		LB_SetupListbox($1; "oExportWiz"; "EXW_L"; 1; $4; $5; $6; $7; $8)
		LB_SetColumnHeaders($1; "EXW_L"; 1; "Tables"; ""; ""; "")
		LB_SetColumnWidths($1; "oExportWiz"; 1; 200; 0; 0; 0; 0)
		OBJECT SET VISIBLE:C603($5; False:C215)
		OBJECT SET VISIBLE:C603($6; False:C215)
		OBJECT SET VISIBLE:C603($7; False:C215)
		OBJECT SET VISIBLE:C603($8; False:C215)
		If (err=0)
			//AL_SetColOpts ($1;1;0;0;4;0;0;0)  `don't display last 4 columns/cols resizable
			//AL_SetRowOpts ($1;0;0;0;0;0)
			//AL_SetSortOpts ($1;0;0;0;"";0;0)  ` no user sort
		End if 
	: ($2="EW@")  // Export Wizard list of Actions
		LB_SetupListbox($1; "oExportWiz"; "EXW_L"; 1; $4; $5; $6; $7)
		LB_SetColumnHeaders($1; "EXW_L"; 1; "Order"; "Table"; "")
		LB_SetColumnWidths($1; "oExportWiz"; 1; 60; 135; 100)
		//AL_SetColOpts ($1;1;0;0;2;0;0;0)  `dont display last column/cols resizable
		
End case 
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 
LB_SETFONT($1; $_t_Prefix; 0; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
LB_SETFONT($1; $_t_Prefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)

ERR_MethodTrackerReturn("EW_LBI_Setup"; $_t_oldMethodName)
