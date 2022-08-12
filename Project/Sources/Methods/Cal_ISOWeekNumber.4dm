//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal_ISOWeekNumber
	//------------------ Method Notes ------------------
	//based on code Written by Charles Vass-5/9/2009, 06:20
	////
	////  Purpose: The ISO8601 defines how to calculate the week number from a gregorian date.
	////  The week number is used in industry or any important organisations to manage projects and ressources.
	////  In [ISO8601], the week number is defined by:
	////    *weeks start on a monday
	////    *week 1 of a given year is the one that includes the first Thursday of that year.
	////    (or, equivalently, week 1 is the week that includes 4 January.)
	////    This means that the days before week 1 in a given year are attributed to the last
	////    week of the previous year. Also the days that come after the last week of a given
	////    year are attributed to the first week of the next year.
	////
	////  Complete ISO 8601 definitions and links can be found at:
	////  http://www.uic.edu/depts/accc/software/isodates/datefmt.html
	////
	////  Guided on the algorithm by Jan Stout, "Calculating the ISO week number" found at
	////  <http://www.proesite.com/timex/wkcalc.htm>. However it is without his maddening week number
	////  formula ( DOW( y, 1, 1 ) < 4 ) + 4 * (m-1) + ( 2 * (m-1) + (d-1) + dow0101 - dow + 6 ) * 36 / 256;
	////  Which I could not get to work in 4D.  So I reasoned out my own, simpler and accurate.
	////
	////  The methed depends on a 4D plug-in that contains constants for day numers.
	////  The constants can be replaced with vars representing Monday = 0 thru Sunday = 6.
	////
	////  $1 - Date - Date to calculate the week of
	////  $0 - Longint - The ISO week number to return
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 11:23`Method: Cal_ISOWeekNumber
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Finished)
	C_DATE:C307($_d_Date; $_d_TempDate; $_d_TempDate2; $1)
	C_LONGINT:C283($_l_Dayof; $_l_ISO1stDayofYear; $_l_ISODayNumber; $_l_ISODayNumber2; $_l_ISODayNumber3; $_l_MonthOf; $_l_OrdinalDay; $_l_Year)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal_ISOWeekNumber")
If (Count parameters:C259>=1)
	$_d_Date:=$1
	$_l_Year:=Year of:C25($_d_Date)
	$_l_MonthOf:=Month of:C24($_d_Date)
	$_l_Dayof:=Day of:C23($_d_Date)
	$_bo_Finished:=False:C215
	$_l_OrdinalDay:=Cal4D_Cal_DateToOrdinal($_d_Date)%1000
	
	////  So that the math will workout without gymnastics
	////  Though ISO number day as Monday = 1, Sunday = 7,
	////  this method uses day numbers, Monday = 0, Sunday = 6 for easier and more
	////  efficient math.
	
	$_l_ISODayNumber:=Cal_ISODayNo($_d_Date)
	$_l_ISO1stDayofYear:=Cal_ISODayNo(Date:C102("1/1/"+String:C10($_l_Year)))
	
	//========================    Method Actions    ==================================
	
	////  Calculate target week, handling dates near December 31 and January 1
	////
	
	//{
	Case of 
		: ($_l_MonthOf=January:K10:1)
			If ((CAL_ISODayConstant(Thursday:K10:16)<$_l_ISO1stDayofYear) & ($_l_ISO1stDayofYear<(7-($_l_Dayof-1))))
				If (($_l_Dayof=1) & ($_l_ISODayNumber=CAL_ISODayConstant(Sunday:K10:19)))
					$0:=1
					$_bo_Finished:=True:C214
				Else 
					////  Determine if we are analysing the week that contains 12/31/Year_L-1
					////  and if 12/31 is before Thursday or not...
					//{
					$_d_TempDate:=(Date:C102("01/01/"+String:C10($_l_Year)))-1
					//$_l_ISO1stDayofYear-1  `This gets the last day of the previous year
					//$_d_TempDate:=Date("12/31/"+String($_l_Year-1)) `This used US format
					$_l_Dayof:=Day of:C23($_d_TempDate)
					$_l_ISODayNumber2:=Cal_ISODayNo($_d_TempDate)
					If (((30-($_l_Dayof-1))<$_l_ISODayNumber2) & ($_l_ISODayNumber2<CAL_ISODayConstant(Thursday:K10:16)))
						//// days after the last week of the current year have the same week number as
						//// the first day of the next year, (i.e. 1)
						//{
						$0:=1
						$_bo_Finished:=True:C214
						//}
						
					Else 
						////  days before week 1 of the current year have the same week number as
						////  the last day of the last week of the previous year...
						////  Get the ISO day number of 12/1/Year_L-1 and adjust our date from 12/31
						////  to be the same day number and then let Cal_ISOWeekNumber calculate it's
						////  ISO week number
						//{
						$_l_ISODayNumber2:=Cal_ISODayNo($_d_TempDate)
						//$Idx:=Cal_ISODayNo (Date("12/1/"+String($_l_Year-1))) `This is using us date to get the 1st of december
						$_d_TempDate2:=$_d_TempDate-30  //This will be the 1st of December in any format
						$_l_ISODayNumber3:=Cal_ISODayNo($_d_TempDate2)
						$_d_TempDate:=Add to date:C393($_d_TempDate; 0; 0; -Abs:C99($_l_ISODayNumber2-$_l_ISODayNumber3))
						$0:=Cal_ISOWeekNumber($_d_TempDate)
						$_bo_Finished:=True:C214
						//}
					End if 
					//}
					
				End if 
				
			End if 
			
		: ($_l_MonthOf=December:K10:12)
			////  Determine if we are analysing the week that contains 1/1/Year_L+1
			////  and if 12/31 is before Thursday or not...
			//{
			$_l_ISODayNumber2:=Cal_ISODayNo(Date:C102("1/1/"+String:C10($_l_Year+1)))
			If (((30-$_l_Dayof)<$_l_ISODayNumber2) & ($_l_ISODayNumber2<CAL_ISODayConstant(Friday:K10:17)))
				
				//// days after the last week of the current year have the same week number as
				//// the first day of the next year, (i.e. 1)
				//{
				$0:=1
				$_bo_Finished:=True:C214
				//}
			End if 
			
	End case 
	//}
	
	If (Not:C34($_bo_Finished))
		////  Handle all other dates using the Ordinal day of the year (0-366).
		////  Since Ordinal dates are returned in the format of YYYYDDD use %1000 to strip off the
		////  year. Then adjust how many Ordinal days to apply to 01/01 for mod 7 to be consistent,
		////  and then do modulo divison by 7.  Last add 1 for inclusion if 01/01/ contains
		////  Thursday since product of ordDate\7 in that case will be zero.
		//{
		$_l_OrdinalDay:=Cal4D_Cal_DateToOrdinal($_d_Date)%1000
		$0:=(($_l_OrdinalDay+$_l_ISO1stDayofYear)\7)+Num:C11($_l_ISO1stDayofYear<CAL_ISODayConstant(Friday:K10:17))
		//}
		
	End if 
	
End if 
ERR_MethodTrackerReturn("Cal_ISOWeekNumber"; $_t_oldMethodName)