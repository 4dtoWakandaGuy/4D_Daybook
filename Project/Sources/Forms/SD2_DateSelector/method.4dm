If (False:C215)
	//Project Form Method Name: SD2_DateSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_Select;0)
	//ARRAY BOOLEAN(SD2_lb_PickDates;0)
	//ARRAY DATE(SD2_ad_Dates;0)
	//ARRAY LONGINT(SD2_al_DiaryIDS;0)
	//ARRAY TEXT(SD2_at_DDiaryCodes;0)
	//ARRAY TEXT(SD2_At_Subject;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_FormWidth; $_l_SizeofArray; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8)
	C_LONGINT:C283(SD2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9; SD2_t_HED1)
	C_TEXT:C284(SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM SD2_DateSelector"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; SD2_at_DDiaryCodes; [DIARY:12]x_ID:50; SD2_al_DiaryIDS; [DIARY:12]Subject:63; SD2_At_Subject; [DIARY:12]Date_Do_From:4; SD2_ad_Dates)
		ARRAY BOOLEAN:C223(SD2_abo_Select; 0)
		$_l_SizeofArray:=Size of array:C274(SD2_at_DDiaryCodes)
		ARRAY BOOLEAN:C223(SD2_abo_Select; $_l_SizeofArray)
		SORT ARRAY:C229(SD2_ad_Dates; SD2_at_DDiaryCodes; SD2_al_DiaryIDS; SD2_At_Subject; SD2_abo_Select)
		LB_SetupListbox(->SD2_lb_PickDates; "SD2_t"; "SD2_L"; 1; ->SD2_abo_Select; ->SD2_ad_Dates; ->SD2_At_Subject; ->SD2_al_DiaryIDS; ->SD2_at_DDiaryCodes)
		LB_SetColumnHeaders(->SD2_lb_PickDates; "SD2_L"; 1; "Select"; "Date"; "Detail"; "ID"; "CODE")
		LB_SetColumnWidths(->SD2_lb_PickDates; "SD2_t"; 1; 40; 60; 120; 0; 0)
		LB_SetScroll(->SD2_lb_PickDates; -3; -2)
		LB_SetEnterable(->SD2_lb_PickDates; False:C215; 0)
		LB_SetEnterable(->SD2_lb_PickDates; True:C214; 1)
		LB_StyleSettings(->SD2_lb_PickDates; "Black"; 9; "SD2_t"; ->[DIARY:12])
		$_l_SizeofArray:=22+($_l_SizeofArray*14)
		$_l_FormWidth:=40+60+120+10
		If ($_l_SizeofArray<160)
			$_l_SizeofArray:=160
		End if 
		WS_AutoscreenSize(2; $_l_SizeofArray; $_l_FormWidth)
		
		
End case 
ERR_MethodTrackerReturn("FM SD2_DateSelector"; $_t_oldMethodName)
