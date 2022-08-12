//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_PopCalendar_BTN
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 16:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Cal4D_d_Date; Cal4D_d_Date)
	C_LONGINT:C283($_l_MonthNumber; $_l_MonthOfDate; $_l_MonthSelected; $_l_YearofDate; Btn_NextMos; Btn_NextYrs; Btn_PrevMos; Btn_PrevYrs)
	C_PICTURE:C286(vCal4D_PopMonth; vCal4D_PopWeekNo)
	C_POINTER:C301($_ptr_Self; $1)
	C_TEXT:C284($_t_MenuValues; $_t_MethodName; $_t_oldMethodName; CAl_t_BannerText; Cal4D_t_MouseOverSVGref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_PopCalendar_BTN")


$_ptr_Self:=$1
$_l_MonthSelected:=0

//========================    Method Actions    ==================================

Case of 
	: ($_ptr_Self=(->Btn_PrevYrs))
		
		$_t_MenuValues:=""
		$_l_YearofDate:=Year of:C25(Cal4D_d_Date)
		For ($_l_MonthSelected; 1; 12)
			$_t_MenuValues:=$_t_MenuValues+String:C10($_l_YearofDate-$_l_MonthSelected)+Choose:C955($_l_MonthSelected<12; ";"; "")
		End for 
		$_l_MonthSelected:=Pop up menu:C542($_t_MenuValues)
		If ($_l_MonthSelected>0)
			Cal4D_d_Date:=Add to date:C393(Cal4D_d_Date; -$_l_MonthSelected; 0; 0)
		End if 
		
	: ($_ptr_Self=(->Btn_PrevMos))
		$_t_MenuValues:="Jan;Feb;Mar;Apr;May;Jun;Jul;Aug;Sep;Oct;Nov;Dec"
		$_l_MonthSelected:=Pop up menu:C542($_t_MenuValues; Month of:C24(Cal4D_d_Date))
		If ($_l_MonthSelected>0)
			$_l_MonthNumber:=Month of:C24(Cal4D_d_Date)
			If ($_l_MonthSelected>$_l_MonthNumber)
				$_l_MonthSelected:=$_l_MonthSelected-12
			End if 
			$_l_MonthNumber:=$_l_MonthSelected-$_l_MonthNumber
			Cal4D_d_Date:=Add to date:C393(Cal4D_d_Date; 0; $_l_MonthNumber; 0)
		End if 
		
	: ($_ptr_Self=(->Btn_NextMos))
		$_t_MenuValues:="Jan;Feb;Mar;Apr;May;Jun;Jul;Aug;Sep;Oct;Nov;Dec"
		$_l_MonthSelected:=Pop up menu:C542($_t_MenuValues; Month of:C24(Cal4D_d_Date))
		If ($_l_MonthSelected>0)
			$_l_MonthOfDate:=Month of:C24(Cal4D_d_Date)
			If ($_l_MonthSelected<$_l_MonthOfDate)
				$_l_MonthSelected:=$_l_MonthSelected+12
			End if 
			$_l_MonthOfDate:=$_l_MonthSelected-$_l_MonthOfDate
			Cal4D_d_Date:=Add to date:C393(Cal4D_d_Date; 0; $_l_MonthOfDate; 0)
		End if 
		
	: ($_ptr_Self=(->Btn_NextYrs))
		$_t_MenuValues:=""
		$_l_YearofDate:=Year of:C25(Cal4D_d_Date)
		For ($_l_MonthSelected; 1; 12)
			$_t_MenuValues:=$_t_MenuValues+String:C10($_l_YearofDate+$_l_MonthSelected)+Choose:C955($_l_MonthSelected<12; ";"; "")
		End for 
		$_l_MonthSelected:=Pop up menu:C542($_t_MenuValues)
		If ($_l_MonthSelected>0)
			Cal4D_d_Date:=Add to date:C393(Cal4D_d_Date; $_l_MonthSelected; 0; 0)
		End if 
		
	Else   //// Today
		Cal4D_d_Date:=Current date:C33
		$_l_MonthSelected:=1
		//Cal4D_Cal_GetPopCalendar (->vCal4D_PopMonth;Cal4D_d_Date)
		
End case 

If ($_l_MonthSelected>0)
	Cal4D_t_MouseOverSVGref:=""
	Cal4D_Cal_GetPopCalendar(->vCal4D_PopMonth; Cal4D_d_Date)
	Cal4D_Cal_GetPopCalendar_WkNos(->vCal4D_PopWeekNo; Cal4D_d_Date)
End if 

//========================    Clean up and Exit    =================================

CAl_t_BannerText:=DB_GetIndexedString(14001; Month of:C24(Cal4D_d_Date))+", "+String:C10(Year of:C25(Cal4D_d_Date))
ERR_MethodTrackerReturn("Cal4D_OM_PopCalendar_BTN"; $_t_oldMethodName)