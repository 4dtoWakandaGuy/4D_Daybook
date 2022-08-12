//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_EPeriodDates;0)
	//ARRAY TEXT(ACC_at_EPeriodCodes;0)
	C_BOOLEAN:C305($_bo_More; ACC_bo_DataChange)
	C_DATE:C307($_d_PeriodDate; ACC_D_eDate)
	C_LONGINT:C283(ACC_l_EPeriodCode)
	C_TEXT:C284($_t_oldMethodName; ACC_t_EPeriodCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_PreferencesSetup.Pop-up/Drop-down List1"; Form event code:C388)
If (ACC_at_EPeriodCodes>0)
	If (ACC_at_EPeriodCodes{ACC_at_EPeriodCodes}#"Later periods...")
		ACC_t_EPeriodCode:=ACC_at_EPeriodCodes{ACC_at_EPeriodCodes}
		ACC_D_eDate:=ACC_ad_EPeriodDates{ACC_at_EPeriodCodes}
		ACC_bo_DataChange:=True:C214
		ACC_l_EPeriodCode:=0
		OBJECT SET ENTERABLE:C238(ACC_D_eDate; False:C215)
		ACC_at_EPeriodCodes{0}:=ACC_t_EPeriodCode
		ACC_at_EPeriodCodes:=0
	Else 
		$_d_PeriodDate:=ACC_ad_EPeriodDates{ACC_at_EPeriodCodes-1}
		QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=$_d_PeriodDate)
		ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3)
		$_bo_More:=(Records in selection:C76([PERIODS:33])>12)
		REDUCE SELECTION:C351([PERIODS:33]; 12)
		SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; ACC_at_EPeriodCodes; [PERIODS:33]From_Date:3; ACC_ad_EPeriodDates)
		If ($_bo_More)
			INSERT IN ARRAY:C227(ACC_at_EPeriodCodes; Size of array:C274(ACC_at_EPeriodCodes)+1; 1)
			INSERT IN ARRAY:C227(ACC_ad_EPeriodDates; Size of array:C274(ACC_ad_EPeriodDates)+1; 1)
			
			ACC_at_EPeriodCodes{Size of array:C274(ACC_at_EPeriodCodes)}:="Later Periods..."
		End if 
		ACC_l_EPeriodCode:=0
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_PreferencesSetup.Pop-up/Drop-down List1"; $_t_oldMethodName)
