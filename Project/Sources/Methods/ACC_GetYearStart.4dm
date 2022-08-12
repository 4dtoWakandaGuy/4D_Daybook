//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_GetYearStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 09:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(ACC_ad_FinancialYearFrom;0)
	//ARRAY DATE(ACC_ad_FinancialYearTo;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_YearFound)
	C_DATE:C307($_d_Date2; $_d_Date3; $_d_PeriodFromDate; $_d_PeriodtoDate; $1)
	C_LONGINT:C283($_l_AsciiCode; $_l_Day; $_l_DayTo; $_l_Index; $_l_Index2; $_l_Month; $_l_Month2; $_l_MonthTo; $_l_SlashPosition; $_l_Year; $_l_Year2)
	C_LONGINT:C283($_l_YearTo)
	C_TEXT:C284(<>YrPerF; <>YrPerT; $_t_oldMethodName; $_t_PeriodCode; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_GetYearStart")
//We need to return the START of the year that the accounts are being run to($1)
$0:=""  //bsw 12/08/04
If (<>YrPerF="")
	// ALERT("The Year start is not defined")
	Gen_Alert("The Year start is not defined.")
	$0:=""
Else 
	
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerF)
	$_d_PeriodFromDate:=[PERIODS:33]From_Date:3
	$_l_Month:=Month of:C24($_d_PeriodFromDate)
	$_l_Year:=Year of:C25($_d_PeriodFromDate)
	$_l_Day:=Day of:C23($_d_PeriodFromDate)  //NG/BSW 10/03/04
	
	//bsw/ng 20/04/04
	QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=<>YrPerT)
	$_d_PeriodtoDate:=[PERIODS:33]To_Date:4
	$_l_MonthTo:=Month of:C24($_d_PeriodtoDate)
	$_l_YearTo:=Year of:C25($_d_PeriodtoDate)
	$_l_DayTo:=Day of:C23($_d_PeriodtoDate)
	If ($_d_PeriodtoDate<$_d_PeriodFromDate)
		$_d_PeriodtoDate:=$_d_PeriodFromDate+365
	End if 
	If (False:C215)
		//NG/BSW 10/03/04
		
		//this is the date of the currently set year
		//this is often inconsistent as
		//people may not have closed the year
		//so
		//we want to check whether the current period
		//is in the same financial year
		QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$1; *)
		QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$1)
		If (Records in selection:C76([PERIODS:33])>0)
			$_l_Month2:=Month of:C24([PERIODS:33]From_Date:3)
			$_l_Year2:=Year of:C25([PERIODS:33]From_Date:3)
			$_bo_OK:=False:C215
			Repeat 
				
				If ($_l_Month2=$_l_Month)
					//this is the same month
					
					//the year and and start are in the same month. ie not the last day of the month
					//start date of the current year is one day after the end of the last end
					$_d_Date2:=$_d_PeriodtoDate+1
					If (Year of:C25($_d_Date2)#$_l_Year2)
						//this is not the current year!!!!
						$_d_Date3:=$_d_Date2+365
						Case of 
							: (Month of:C24($_d_Date2))<Month of:C24($_d_Date3)
								Repeat 
									$_d_Date3:=$_d_Date3-1
								Until (Month of:C24($_d_Date2))=Month of:C24($_d_Date3)
							: (Month of:C24($_d_Date2))>Month of:C24($_d_Date3)
								Repeat 
									$_d_Date3:=$_d_Date3+1
								Until (Month of:C24($_d_Date2))=Month of:C24($_d_Date3)
						End case 
						Case of 
							: (Day of:C23($_d_Date2)>Day of:C23($_d_Date3))
								Repeat 
									$_d_Date3:=$_d_Date3+1
								Until (Day of:C23($_d_Date2)=Day of:C23($_d_Date3))
							: (Day of:C23($_d_Date2)<Day of:C23($_d_Date3))
								Repeat 
									$_d_Date3:=$_d_Date3-1
								Until (Day of:C23($_d_Date2)=Day of:C23($_d_Date3))
						End case 
					End if 
					
					
					If (False:C215)
						$_d_Date2:=Date:C102(String:C10($_l_Day)+"/"+String:C10($_l_Month2)+"/"+String:C10($_l_Year2))  //NG/BSW 10/03/04
					End if 
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$_d_Date2; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$_d_Date2)
					$_bo_OK:=True:C214
					$0:=[PERIODS:33]Period_Code:1
					
				Else 
					If ($_l_Month2>1)
						$_l_Month2:=$_l_Month2-1
					Else 
						$_l_Month2:=12
						$_l_Year2:=$_l_Year2-1
					End if 
				End if 
				If (Not:C34($_bo_OK))
					DelayTicks(2)
				End if 
				
			Until ($_bo_OK)
		Else 
			//cant test anything
			$0:=<>YrPerF
		End if 
	Else 
		If (False:C215)
			
			//Change to methodology NG June 2004
			//This is the year we want the start date of
			QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=$1; *)
			QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=$1)
			If (Records in selection:C76([PERIODS:33])>0)
				$_l_Month2:=Month of:C24([PERIODS:33]From_Date:3)
				$_l_Year2:=Year of:C25([PERIODS:33]From_Date:3)
				$_t_PeriodCode:=[PERIODS:33]Period_Code:1
				$_l_SlashPosition:=Position:C15("/"; $_t_PeriodCode)
				If ($_l_SlashPosition=0)
					//must be some other delimiter??
					For ($_l_Index2; 1; Length:C16($_t_PeriodCode))
						$_l_AsciiCode:=Character code:C91($_t_PeriodCode[[$_l_Index2]])
						If ($_l_AsciiCode<48) | ($_l_AsciiCode>57)
							$_t_PeriodCode:=Substring:C12($_t_PeriodCode; 1; $_l_Index2-1)
							$_l_Index2:=Length:C16($_t_PeriodCode)
						End if 
					End for 
				Else 
					$_t_PeriodCode:=Substring:C12($_t_PeriodCode; 1; $_l_SlashPosition-1)
				End if 
				If ($_t_PeriodCode#"")
					If (Character code:C91($_t_PeriodCode[[1]])=57)
						//this person has never done a y2K update!!!!!
					End if 
					QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode+"@")
					ORDER BY:C49([PERIODS:33]; [PERIODS:33]From_Date:3; >)
					$0:=[PERIODS:33]Period_Code:1
				End if 
			Else   //??? do something about it
			End if 
			
			If ($_d_PeriodtoDate<Current date:C33(*))
				
			End if 
			
		Else 
			//Another change Feb 2005
			ACC_LoadFinancialYears(True:C214)  //Added NG 2004
			$_bo_YearFound:=False:C215
			For ($_l_Index; 1; Size of array:C274(ACC_ad_FinancialYearFrom))
				If (ACC_ad_FinancialYearFrom{$_l_Index}<=$1) & (ACC_ad_FinancialYearTo{$_l_Index}>=$1)
					//that is the year
					QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=ACC_ad_FinancialYearFrom{$_l_Index}; *)
					QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=ACC_ad_FinancialYearFrom{$_l_Index})
					
					$0:=[PERIODS:33]Period_Code:1
					$_bo_YearFound:=True:C214
					$_l_Index:=Size of array:C274(ACC_ad_FinancialYearFrom)
				End if 
			End for 
			If (Not:C34($_bo_YearFound))
				Repeat 
					Gen_Confirm("The Financial year in which"+String:C10($1; 4)+"appears, is unknown. Set it up? "; "Yes"; "No")
					If (ok=1)
						Periods_Mod(False:C215)
						ACC_LoadFinancialYears(True:C214)  //Added NG 2004
						$_bo_YearFound:=False:C215
						For ($_l_Index; 1; Size of array:C274(ACC_ad_FinancialYearFrom))
							If (ACC_ad_FinancialYearFrom{$_l_Index}<=$1) & (ACC_ad_FinancialYearTo{$_l_Index}>=$1)
								//that is the year
								QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<=ACC_ad_FinancialYearFrom{$_l_Index}; *)
								QUERY:C277([PERIODS:33];  & ; [PERIODS:33]To_Date:4>=ACC_ad_FinancialYearFrom{$_l_Index})
								
								$0:=[PERIODS:33]Period_Code:1
								
								$_bo_YearFound:=True:C214
								$_l_Index:=Size of array:C274(ACC_ad_FinancialYearFrom)
							End if 
						End for 
					End if 
					
				Until ($_bo_YearFound)
			End if 
			
			
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("ACC_GetYearStart"; $_t_oldMethodName)
