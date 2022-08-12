//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SchedSetupMiniCal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/01/2010 19:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(aD;0)
	//ARRAY LONGINT(CAL_al_DiaryDays;0)
	C_BOOLEAN:C305(<>SaturdayoN; <>SundayoN; $_bo_Expanded)
	C_DATE:C307(<>DB_d_CurrentDate; CAL_D_CUrrentViewDate)
	C_LONGINT:C283($_l_ItemReference; $_l_ListIndex; $_l_ListReference; $_l_MonthOf; $_l_MonthsIndex; $_l_NewItemReference; $_l_SublistID; $_l_Year; $_l_Yearx; HL_l_MonthsList; HL_l_MonthsYears)
	C_LONGINT:C283(vCalActions)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_ItemText; $_t_monthString; $_t_oldMethodName; vd1; vd10; vd11; vd12; vd13; vd14; vd15; vd16)
	C_TEXT:C284(vd17; vd18; vd19; vd2; vd20; vd21; vd22; vd23; vd24; vd25; vd26)
	C_TEXT:C284(vd27; vd28; vd29; vd3; vd30; vd31; vd32; vd33; vd34; vd35; vd36)
	C_TEXT:C284(vd37; vd4; vd5; vd6; vd7; vd8; vd9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SchedSetupMiniCal")



For ($_l_MonthsIndex; 1; 37)
	$_ptr_Variable:=Get pointer:C304("VD"+String:C10($_l_MonthsIndex))
	$_ptr_Variable->:=""
	$_ptr_Variable:=Get pointer:C304("bD"+String:C10($_l_MonthsIndex))
	OBJECT SET ENABLED:C1123($_ptr_Variable->; False:C215)
End for 
ARRAY INTEGER:C220(SD_ai_Days; 37)
ARRAY LONGINT:C221(CAL_al_DiaryDays; 37)
If (vCalActions=0)
	vCalActions:=1
	ARRAY INTEGER:C220(SD_ai_Days; 37)
	ARRAY LONGINT:C221(CAL_al_DiaryDays; 37)
End if 

vCalPeriod:=Diary_CalPer(<>DB_d_CurrentDate; CAL_D_CurrentViewDate; ->vCalF; ->VCalT; ->vPeriod; ->SD_t_Periodstr; ->SD_pic_Picture)
If (CAL_D_CUrrentViewDate=!00-00-00!)
	$_l_Year:=Year of:C25(Current date:C33(*))
	$_l_MonthOf:=Month of:C24(Current date:C33(*))
Else 
	$_l_Year:=Year of:C25(CAL_D_CurrentViewDate)
	$_l_MonthOf:=Month of:C24(CAL_D_CurrentViewDate)
End if 
$_l_Yearx:=$_l_Year+5

HL_l_MonthsYears:=New list:C375
HL_l_MonthsList:=New list:C375

For ($_l_MonthsIndex; 1; 12)
	$_t_monthString:=DB_GetIndexedString(14001; $_l_MonthsIndex)
	
	APPEND TO LIST:C376(HL_l_MonthsList; $_t_monthString; $_l_MonthsIndex)
End for 
For ($_l_MonthsIndex; 1; 10)
	$_l_ListReference:=Copy list:C626(HL_l_MonthsList)
	For ($_l_ListIndex; 1; Count list items:C380($_l_ListReference))
		GET LIST ITEM:C378($_l_ListReference; $_l_ListIndex; $_l_ItemReference; $_t_ItemText)
		$_l_NewItemReference:=Num:C11(String:C10($_l_Yearx)+String:C10($_l_ItemReference))
		SET LIST ITEM:C385($_l_ListReference; $_l_ItemReference; $_t_ItemText; $_l_NewItemReference)
	End for 
	
	APPEND TO LIST:C376(HL_l_MonthsYears; String:C10($_l_Yearx); $_l_Yearx; $_l_ListReference; True:C214)
	GET LIST ITEM:C378(HL_l_MonthsYears; 1; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	$_l_Yearx:=$_l_Yearx-1
End for 
ERR_MethodTrackerReturn("SD_SchedSetupMiniCal"; $_t_oldMethodName)