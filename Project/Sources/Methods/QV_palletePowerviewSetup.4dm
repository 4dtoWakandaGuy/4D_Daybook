//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_palletePowerviewSetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/03/2010 06:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY BOOLEAN(QV_LB_Items;0)
	//ARRAY INTEGER(QV_ai_include;0)
	ARRAY LONGINT:C221($_al_LevelValues; 0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	ARRAY TEXT:C222($_at_LevelValues; 0)
	ARRAY TEXT:C222($_at_YearValues; 0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	C_BOOLEAN:C305(QV_bo_AlPopulated)
	C_LONGINT:C283($_l_Index; QV_l_WithLevel; QV_l_WithYear; QVb_l_BUT1; QVb_l_But2; QVb_l_BUT3; QVb_l_BUT4; QVb_l_BUT5; QVb_l_BUT6; QVb_LBUT_7; QVb_LBUT_8)
	C_LONGINT:C283(QVb_LBUT_9)
	C_PICTURE:C286(QV_pic_PopupIcon)
	C_TEXT:C284($_t_oldMethodName; QV_t_Values_COL1; QV_t_Values_COL2; QV_t_Values_COL3; QV_t_Values_COL4; QV_t_Values_COL5; QV_t_Values_COL6; QV_t_Values_COL7; QV_t_Values_COL8; QV_t_Values_COL9; QV_t_Values_HED1)
	C_TEXT:C284(QV_t_Values_HED2; QV_t_Values_HED3; QV_t_Values_HED4; QV_t_Values_HED5; QV_t_Values_HED6; QV_t_Values_HED7; QV_t_Values_HED8; QV_t_Values_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_palletePowerviewSetup")
//C_LONGINT(QV_l_Powerview)
SET QUERY DESTINATION:C396(Into variable:K19:4; QV_l_WithLevel)
QUERY:C277([INFORMATION:55]; [INFORMATION:55]Information_Level:4>0)
SET QUERY DESTINATION:C396(Into variable:K19:4; QV_l_WithYear)
QUERY:C277([INFORMATION:55]; [INFORMATION:55]Year:5>0)
SET QUERY DESTINATION:C396(Into current selection:K19:1)

ARRAY TEXT:C222(QV_at_QualityNames; 0)
ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)  //NG Checked April 2020
ARRAY INTEGER:C220(QV_ai_include; 0)
ARRAY BOOLEAN:C223(QV_abo_include; 0)
//ARRAY INTEGER(QVTest;Size of array(QV_ai_include))
ARRAY LONGINT:C221($_al_LevelValues; 6)

$_al_LevelValues{1}:=0
$_al_LevelValues{2}:=1
$_al_LevelValues{3}:=2
$_al_LevelValues{4}:=3
$_al_LevelValues{5}:=4
$_al_LevelValues{6}:=5
//GET PICTURE FROM LIBRARY(15514; QV_pic_PopupIcon)
QV_pic_PopupIcon:=Get_Picture(15514)

QV_pic_PopupIcon:=QV_pic_PopupIcon*0.95  //makes it smaller
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
LB_SetChoiceList("QV_al_Years"; ->$_at_YearValues; ->QV_al_QualityQualityYears)  //NG This on here is wrong April 2020
Case of 
	: (QV_l_WithLevel>0)
		If (QV_l_WithYear>0)
			//April 2020 line below is correct
			LB_SetupListbox(->QV_LB_Items; "QV_t_Values"; "QVb_L"; 1; ->QV_abo_include; ->QV_at_QualityNames; ->QV_al_QualityLevelLevels; ->QV_al_QualityQualityYears)
			
			LB_SetColumnHeaders(->QV_LB_Items; "QVb_L"; 1; "Include"; "Quality"; "Level"; "Year")
			LB_SetColumnWidths(->QV_LB_Items; "QV_t_Values"; 1; 35; 120; 40; 60)
			
			LB_SetChoiceList("QV_al_QualityYears"; ->$_at_YearValues; ->QV_al_QualityQualityYears)  //NG April 2020 CHECK THIS ONE AGAINST OTHERS
		Else 
			LB_SetupListbox(->QV_LB_Items; "QV_t_Values"; "QVb_L"; 1; ->QV_abo_include; ->QV_at_QualityNames; ->QV_al_QualityLevelLevels)
			LB_SetColumnHeaders(->QV_LB_Items; "QVb_L"; 1; "Include"; "Quality"; "Level")
			LB_SetColumnWidths(->QV_LB_Items; "QV_t_Values"; 1; 35; 120; 40)
		End if 
		LB_SetChoiceList("QV_al_QualityLevelLevels"; ->$_at_LevelValues; ->QV_al_QualityLevelLevels)
	: (QV_l_WithYear>0)
		//April 2020 line below is correct
		LB_SetupListbox(->QV_LB_Items; "QV_t_Values"; "QVb_L"; 1; ->QV_abo_include; ->QV_at_QualityNames; ->QV_al_QualityQualityYears)  //NG Checked April 2020
		LB_SetColumnHeaders(->QV_LB_Items; "QVb_L"; 1; "Include"; "Quality"; "Year")
		LB_SetColumnWidths(->QV_LB_Items; "QV_t_Values"; 1; 35; 120; 60)
		
		LB_SetChoiceList("QV_al_Years"; ->$_at_YearValues; ->QV_al_QualityQualityYears)  //NG Checked April 2020
	Else 
		LB_SetupListbox(->QV_LB_Items; "QV_t_Values"; "QVb_L"; 1; ->QV_abo_include; ->QV_at_QualityNames)
		LB_SetColumnHeaders(->QV_LB_Items; "QVb_L"; 1; "Include"; "Quality")
		LB_SetColumnWidths(->QV_LB_Items; "QV_t_Values"; 1; 35; 120)
		
		
End case 
LB_SetScroll(->QV_LB_Items; -2; -2)
LB_SetEnterable(->QV_LB_Items; True:C214; 0; "")  // make all columns enterable
LB_SetEnterable(->QV_LB_Items; False:C215; 2)
LB_SetEnterable(->QV_LB_Items; True:C214; 1)

OBJECT SET FORMAT:C236(QV_al_QualityQualityYears; "####")  //NG Checked April 2020

LB_StyleSettings(->QV_LB_Items; "Black"; 9; "QV_t_Values"; ->[INFORMATION:55])
QV_bo_AlPopulated:=False:C215
ERR_MethodTrackerReturn("QV_palletePowerviewSetup"; $_t_oldMethodName)
