//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_LBSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 10:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY BOOLEAN(QV_LB_Items;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	ARRAY TEXT:C222($_at_LevelValues; 0)
	ARRAY TEXT:C222($_at_SearchOptions; 0)
	ARRAY TEXT:C222($_at_YearValues; 0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityYears;0)
	//ARRAY TEXT(QV_at_Values;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	C_LONGINT:C283($_l_Index; APPL_l_BUT1; APPL_l_BUT2; APPL_l_BUT3; APPL_l_BUT4; APPL_l_BUT5; APPL_l_BUT6; APPL_l_BUT7; APPL_l_BUT8; APPL_l_BUT9; QV_l_WithLevel)
	C_LONGINT:C283(QV_l_WithYear)
	C_TEXT:C284($_t_oldMethodName; oApplicants_COL1; oApplicants_COL2; oApplicants_COL3; oApplicants_COL4; oApplicants_COL5; oApplicants_COL6; oApplicants_COL7; oApplicants_COL8; oApplicants_COL9; oApplicants_HED1)
	C_TEXT:C284(oApplicants_HED2; oApplicants_HED3; oApplicants_HED4; oApplicants_HED5; oApplicants_HED6; oApplicants_HED7; oApplicants_HED8; oApplicants_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_LBSetup")
// QV_LBSetup
// 10/07/06 pb
// this sets up the listbox stuff for the applicants/qualities search palette, which is used on two forms
SET QUERY DESTINATION:C396(Into variable:K19:4; QV_l_WithLevel)
QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Level:4>0)
SET QUERY DESTINATION:C396(Into variable:K19:4; QV_l_WithYear)
QUERY:C277([INFORMATION:55]; [INFORMATION:55]Year:5>0)
SET QUERY DESTINATION:C396(Into current selection:K19:1)
ARRAY TEXT:C222($_at_SearchOptions; 6)
$_at_SearchOptions{1}:="="
$_at_SearchOptions{2}:=">"
$_at_SearchOptions{3}:=">="
$_at_SearchOptions{4}:="<"
$_at_SearchOptions{5}:="<="
$_at_SearchOptions{6}:="#"
ARRAY TEXT:C222($_at_LevelValues; 6)
For ($_l_Index; 1; 6)
	$_at_LevelValues{$_l_Index}:=String:C10($_l_Index-1)
End for 

ARRAY TEXT:C222($_at_YearValues; 6)
$_at_YearValues{1}:=String:C10(Year of:C25(Current date:C33(*)))
$_at_YearValues{2}:=String:C10(Year of:C25(Current date:C33(*))-1)
$_at_YearValues{3}:=String:C10(Year of:C25(Current date:C33(*))-2)
$_at_YearValues{4}:=String:C10(Year of:C25(Current date:C33(*))-3)
$_at_YearValues{5}:=String:C10(Year of:C25(Current date:C33(*))-4)
$_at_YearValues{6}:=String:C10(Year of:C25(Current date:C33(*))-5)
//TRACE
Case of 
	: (QV_l_WithLevel>0)
		If (QV_l_WithYear>0)
			LB_SetupListbox(->QV_LB_Items; "oApplicants"; "APPL_L"; 1; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_at_LevelOptions; ->QV_al_QualityLevelLevels; ->QV_at_YearOptions; ->QV_al_QualityQualityYears)  //NG Checked April 2020
			LB_SetColumnHeaders(->QV_LB_Items; "APPL_L"; 1; "Include"; "Exclude"; "Category"; "Item"; "Option"; "Level"; "Option"; "Year")
			LB_SetColumnWidths(->QV_LB_Items; "oApplicants"; 1; 45; 45; 240; 240; 40*(Num:C11(QV_l_WithLevel>0)); 40*(Num:C11(QV_l_WithLevel>0)); 40*(Num:C11(QV_l_WithYear>0)); 50*(Num:C11(QV_l_WithYear>0)))
			LB_SetChoiceList("QV_at_YearsOptions"; ->$_at_SearchOptions; ->QV_at_YearOptions)
			LB_SetChoiceList("QV_al_QualityYears"; ->$_at_YearValues; ->QV_al_QualityQualityYears)  //NG CHecked April 2020-QV_al_QualityYears is not correct
		Else 
			LB_SetupListbox(->QV_LB_Items; "oApplicants"; "APPL_L"; 1; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_at_LevelOptions; ->QV_al_QualityLevelLevels)
			LB_SetColumnHeaders(->QV_LB_Items; "APPL_L"; 1; "Include"; "Exclude"; "Category"; "Item"; "Option"; "Level")
			LB_SetColumnWidths(->QV_LB_Items; "oApplicants"; 1; 45; 45; 100; 100; 40*(Num:C11(QV_l_WithLevel>0)); 40*(Num:C11(QV_l_WithLevel>0)))
		End if 
		LB_SetChoiceList("QV_at_LevelsOptions"; ->$_at_SearchOptions; ->QV_at_LevelOptions)
		LB_SetChoiceList("QV_al_Levels"; ->$_at_LevelValues; ->QV_al_QualityLevelLevels)
	: (QV_l_WithYear>0)
		LB_SetupListbox(->QV_LB_Items; "oApplicants"; "APPL_L"; 1; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_GroupNames; ->QV_at_QualityNames; ->QV_at_YearOptions; ->QV_al_QualityQualityYears)  //NG Checked April 2020
		LB_SetColumnHeaders(->QV_LB_Items; "APPL_L"; 1; "Include"; "Exclude"; "Category"; "Item"; "Option"; "Year")
		LB_SetColumnWidths(->QV_LB_Items; "oApplicants"; 1; 45; 45; 100; 100; 40*(Num:C11(QV_l_WithYear>0)); 50*(Num:C11(QV_l_WithYear>0)))
		LB_SetChoiceList("QV_at_YearsOptions"; ->$_at_SearchOptions; ->QV_at_YearOptions)
		LB_SetChoiceList("QV_al_QualityYears"; ->$_at_YearValues; ->QV_al_QualityQualityYears)  //NG April 2020 QV_al_QualityYears is not correct
	Else 
		LB_SetupListbox(->QV_LB_Items; "oApplicants"; "APPL_L"; 1; ->QV_abo_include; ->QV_abo_Exclude; ->QV_at_GroupNames; ->QV_at_QualityNames)
		LB_SetColumnHeaders(->QV_LB_Items; "APPL_L"; 1; "Include"; "Exclude"; "Category"; "Item")
		LB_SetColumnWidths(->QV_LB_Items; "oApplicants"; 1; 45; 45; 100; 100)
End case 
LB_SetScroll(->QV_LB_Items; -2; -3)
LB_SETENTRYOPTIONS  // doesn't actually do anything ...
LB_StyleSettings(->QV_LB_Items; "blue"; 9; "oApplicants"; ->[CONTACTS:1])
LB_SetScroll(->QV_LB_Items; -3; -2)
LB_SetEnterable(->QV_LB_Items; False:C215; 0)
LB_SetSortOptions(->QV_LB_Items; 0)
OBJECT SET FORMAT:C236(QV_abo_include; " ")  // display as checkboxes
OBJECT SET FORMAT:C236(QV_abo_Exclude; " ")
ERR_MethodTrackerReturn("QV_LBSetup"; $_t_oldMethodName)
