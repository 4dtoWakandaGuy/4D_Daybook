//%attributes = {}
If (False:C215)
	//Project Method Name:      Period_FindI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	//C_UNKNOWN($1)
	//ARRAY INTEGER(ACC_ad_FinancialYearFrom;0)
	//ARRAY INTEGER(ACC_ad_FinancialYearTo;0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_YearFound)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_DateFrom; $_d_DateTo; vDate)
	C_LONGINT:C283($_l_Index; $_l_PeriodID)
	C_TEXT:C284($_t_oldMethodName; $_t_PeriodCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Period_FindI")
//Period_Find Invoices
$_bo_Exit:=False:C215
$_d_DateFrom:=[PERIODS:33]From_Date:3
$_d_DateTo:=[PERIODS:33]To_Date:4
vDate:=$_d_DateTo+1
$_l_PeriodID:=Check_Period
If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]SL_Closed:7))
	vDate:=$_d_DateFrom-1
	$_l_PeriodID:=Check_Period
	If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]SL_Closed:7))
		vDate:=$_d_DateTo+32
		$_l_PeriodID:=Check_Period
		If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]SL_Closed:7))
			vDate:=$_d_DateFrom-32
			$_l_PeriodID:=Check_Period
			If (([PERIODS:33]NL_Closed:5) | ([PERIODS:33]SL_Closed:7))
				QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=<>DB_d_CurrentDate; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]NL_Closed:5=False:C215; *)
				QUERY:C277([PERIODS:33];  & ; [PERIODS:33]SL_Closed:7=False:C215)
				If (Records in selection:C76([PERIODS:33])=0)
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=<>DB_d_CurrentDate; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]NL_Closed:5=False:C215; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]SL_Closed:7=False:C215)
					ORDER BY:C49([PERIODS:33]; [PERIODS:33]To_Date:4; <)
					If (Records in selection:C76([PERIODS:33])>1)
						REDUCE SELECTION:C351([PERIODS:33]; 1)
					End if 
					If (Records in selection:C76([PERIODS:33])=0)
						Gen_Confirm("There are no open accounting periods to post to. Do you want to update the Periods?"; "Yes"; "No")
						
						If (OK=0)
							$_bo_Exit:=True:C214
						Else 
							Periods_Mod(False:C215)
							ACC_LoadFinancialYears(True:C214)  //Added NG 2004
							$_bo_YearFound:=False:C215
							For ($_l_Index; 1; Size of array:C274(ACC_ad_FinancialYearFrom))
								If (ACC_ad_FinancialYearFrom{$_l_Index}<=$1) & (ACC_ad_FinancialYearTo{$_l_Index}>=$1)
									//that is the year
									QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=ACC_ad_FinancialYearFrom{$_l_Index}; *)
									QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=ACC_ad_FinancialYearFrom{$_l_Index})
									
									$_t_PeriodCode:=[PERIODS:33]Period_Code:1
									
									$_bo_YearFound:=True:C214
									$_l_Index:=Size of array:C274(ACC_ad_FinancialYearFrom)
									QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
								End if 
							End for 
							
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
$0:=$_bo_Exit
ERR_MethodTrackerReturn("Period_FindI"; $_t_oldMethodName)

