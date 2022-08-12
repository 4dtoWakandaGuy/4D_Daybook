//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_FillHistoryBytype
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 21:22`Method: STK_FillHistoryBytype
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_SalesStats;0)
	ARRAY DATE:C224($_ad_DatesEnd; 0)
	ARRAY DATE:C224($_ad_DatesStart; 0)
	//ARRAY DATE(STK_ad_Date;0)
	ARRAY REAL:C219($_ar_Divisions; 0)
	ARRAY REAL:C219($_ar_Quantities; 0)
	//ARRAY REAL(STK_ar_Quantity;0)
	ARRAY TEXT:C222($_at_DateStrings; 0)
	//ARRAY TEXT(STK_at_DatesRange;0)
	C_DATE:C307($_d_CurrentQuarterStartDate; $_d_Date; $_d_Dateis; $_d_DateLine; $_d_DateofSale; $_d_DateTEST; $_d_EndDate; $_d_EndofMonth; $_d_EndofQuarter; $_d_EndofYear; $_d_MonthDate)
	C_DATE:C307($_d_MonthEndDate; $_d_MonthStartDate; $_d_ProspectiveEndDate; $_d_QuarterDate; $_d_QuarterEnd; $_d_QuarterStart; $_d_StartAtDate; $_d_StartDate; $_d_Startof1StQuarter; $_d_Startof2ndQuarter; $_d_Startof3rdQuarter)
	C_DATE:C307($_d_Startof4thQuarter; $_d_StartofMonth; $_d_StartofQuarter; $_d_StartofYear; $_d_YearDate; STK_d_FilterDateend; STK_d_FilterDateStart)
	C_LONGINT:C283($_l_DateLineRow; $_l_DateRange; $_l_DifferenceDays; $_l_Divisions; $_l_DivisionsIndex; $_l_MonthCount; $_l_MonthNumber; $_l_Monthof; $_l_Monthof2; $_l_MonthofStart; $_l_NumberofDates)
	C_LONGINT:C283($_l_NumberofMonths; $_l_QuantityCount; $_l_QuarterCount; $_l_QuarterDifference; $_l_QuarterNumber; $_l_SaleIndex; $_l_Subtract; $_l_Year; $_l_YearCount; $_l_YearNumber; $_l_YearofStart)
	C_REAL:C285($_r_DivideBy; $1; $2; $3)
	C_TEXT:C284($_t_DateString; $_t_MonthName; $_t_oldMethodName; $_t_QuarterName; $_t_QuarterString; $_t_YearString)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_FillHistoryBytype")
//This method is only forarrays associated with  filling a list box on the form [USER];"STK_SalesHistory"
//it is passed 2 parameters

//C_LONGINT($1;$2)
If (STK_d_FilterDateStart=!00-00-00!)
	STK_d_FilterDateStart:=[PRODUCTS:9]Available_From_Date:21
	If (STK_d_FilterDateStart=!00-00-00!)
		//We dont really know so use the date of the first sale
		USE SET:C118("ProductSalesOrders")
		ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
		STK_d_FilterDateStart:=[ORDERS:24]SORT_Date:57
	End if 
End if 
If (STK_d_FilterDateend=!00-00-00!)
	If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
		STK_d_FilterDateend:=[PRODUCTS:9]Actual_End_Date:49
	Else 
		STK_d_FilterDateend:=Current date:C33(*)
	End if 
End if 

//Set $1 to 1 for no data..arrays empty
//2= quantities sold
//3=average sold
//Set ($2 to 1 for daily 2  for monehtly 3 for quartley and 4 for annual
ARRAY DATE:C224(STK_ad_Date; 0)  //the date or the 1st day of a year quarter, month
ARRAY TEXT:C222(STK_at_DatesRange; 0)
ARRAY REAL:C219(STK_ar_Quantity; 0)

If (Count parameters:C259>=2)
	
	Case of 
		: ($1<=1) | ($2=0)
			Case of 
				: ($1=2)
				: ($1=3)
				: ($1<=1)
					
			End case 
		: ($1=2)
			LB_SetFormat(->STK_lb_SalesStats; 2; "#######0.000;-#######0.000;"; 2; 2; Align center:K42:3)
			
			If ($2=0)  //set to daily
				$2:=1
			End if 
			Case of 
				: ($2=1)  //Daily
					If ($3=0)
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=2)  //Current Year
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofYear)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofYear)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							
						: ($3=3)  //Current Quarter
							//This could be changed to look up the financial quarter....
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							$_d_Startof1StQuarter:=$_d_StartofYear
							$_d_Startof2ndQuarter:=$_d_StartofYear+90
							$_d_Startof3rdQuarter:=$_d_StartofYear+180
							$_d_Startof4thQuarter:=$_d_StartofYear+270
							If (Current date:C33>$_d_Startof4thQuarter)
								$_d_StartofQuarter:=$_d_Startof4thQuarter
							Else 
								If (Current date:C33>$_d_Startof3rdQuarter)
									$_d_StartofQuarter:=$_d_Startof3rdQuarter
								Else 
									If (Current date:C33(*)>$_d_Startof2ndQuarter)
										$_d_StartofQuarter:=$_d_Startof2ndQuarter
									Else 
										$_d_StartofQuarter:=$_d_Startof1StQuarter
									End if 
								End if 
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofQuarter)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofQuarter)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=4)  //Current Month
							$_d_ProspectiveEndDate:=Current date:C33(*)
							$_l_MonthNumber:=Month of:C24(Current date:C33(*))
							$_d_StartofMonth:=Current date:C33(*)
							Repeat 
								$_d_StartofMonth:=$_d_StartofMonth-1
							Until (Month of:C24($_d_StartofMonth)#$_l_MonthNumber)
							$_d_StartofMonth:=$_d_StartofMonth+1
							If ($_d_StartofMonth=Current date:C33(*))
								//then do last month
								
								$_d_StartofMonth:=$_d_StartofMonth-1
								$_d_ProspectiveEndDate:=$_d_StartofMonth
								$_l_MonthNumber:=Month of:C24($_d_StartofMonth)
								Repeat 
									$_d_StartofMonth:=$_d_StartofMonth-1
								Until (Month of:C24($_d_StartofMonth)#$_l_MonthNumber)
								$_d_StartofMonth:=$_d_StartofMonth+1
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofMonth)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofMonth)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<$_d_ProspectiveEndDate)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=$_d_ProspectiveEndDate
							End if 
							
						: ($3=5)  //Date range
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>STK_d_FilterDateStart)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>STK_d_FilterDateStart)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<STK_d_FilterDateEnd)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=STK_d_FilterDateEnd
							End if 
							
					End case 
					If ($_d_StartDate#!00-00-00!)
						$_l_NumberofDates:=$_d_EndDate-$_d_StartDate
						ARRAY DATE:C224(STK_ad_Date; $_l_NumberofDates)  //the date or the 1st day of a year quarter, month
						ARRAY TEXT:C222(STK_at_DatesRange; $_l_NumberofDates)
						ARRAY REAL:C219(STK_ar_Quantity; $_l_NumberofDates)
						$_d_StartAtDate:=$_d_StartDate
						For ($_l_DivisionsIndex; 1; Size of array:C274(STK_ad_Date))
							STK_ad_Date{$_l_DivisionsIndex}:=$_d_StartAtDate
							$_d_Dateis:=STK_ad_Date{$_l_DivisionsIndex}
							STK_at_DatesRange{$_l_DivisionsIndex}:=String:C10($_d_Dateis; "Short")
							$_d_StartAtDate:=$_d_StartAtDate+1
						End for 
						USE SET:C118("ProductSalesOrders")
						USE SET:C118("ProductSales")
						For ($_l_DivisionsIndex; 1; Records in set:C195("ProductSales"))
							If ([ORDER_ITEMS:25]Order_Code:1#"")
								USE SET:C118("ProductSalesOrders")
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
								If (Records in selection:C76([ORDERS:24])=0)
									QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
									$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
								Else 
									$_d_DateofSale:=[ORDERS:24]SORT_Date:57
								End if 
								If ($_d_DateofSale#!00-00-00!)
									$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateofSale)
									If ($_l_DateLineRow>0)
										If ([ORDER_ITEMS:25]Sales_Price:4>=0)
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER_ITEMS:25]Quantity:3
										Else 
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER_ITEMS:25]Quantity:3
										End if 
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					Else 
						Gen_Alert("The start of sales for this product is not set, so sales may not be calculated")
						$_l_NumberofDates:=0
						ARRAY DATE:C224(STK_ad_Date; 0)  //the date or the 1st day of a year quarter, month
						ARRAY TEXT:C222(STK_at_DatesRange; 0)
						ARRAY REAL:C219(STK_ar_Quantity; 0)
					End if 
				: ($2=2)  //Montly
					If ($3=0)
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=2)  //Current Year
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofYear)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofYear)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							
						: ($3=3)  //Current Quarter
							//This could be changed to look up the financial quarter....
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							$_d_Startof1StQuarter:=$_d_StartofYear
							$_d_Startof2ndQuarter:=$_d_StartofYear+90
							$_d_Startof3rdQuarter:=$_d_StartofYear+180
							$_d_Startof4thQuarter:=$_d_StartofYear+270
							If (Current date:C33(*)>$_d_Startof4thQuarter)
								$_d_StartofQuarter:=$_d_Startof4thQuarter
							Else 
								If (Current date:C33(*)>$_d_Startof3rdQuarter)
									$_d_StartofQuarter:=$_d_Startof3rdQuarter
								Else 
									If (Current date:C33(*)>$_d_Startof2ndQuarter)
										$_d_StartofQuarter:=$_d_Startof2ndQuarter
									Else 
										$_d_StartofQuarter:=$_d_Startof1StQuarter
									End if 
								End if 
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofQuarter)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofQuarter)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=4)  //Current Month
							$_d_ProspectiveEndDate:=Current date:C33(*)
							$_l_Monthof:=Month of:C24(Current date:C33(*))
							$_d_StartofMonth:=Current date:C33(*)
							Repeat 
								$_d_StartofMonth:=$_d_StartofMonth-1
							Until (Month of:C24($_d_StartofMonth)#$_l_Monthof)
							$_d_StartofMonth:=$_d_StartofMonth+1
							If ($_d_StartofMonth=Current date:C33(*))
								//then do last month
								
								$_d_StartofMonth:=$_d_StartofMonth-1
								$_d_ProspectiveEndDate:=$_d_StartofMonth
								$_l_MonthNumber:=Month of:C24($_d_StartofMonth)
								Repeat 
									$_d_StartofMonth:=$_d_StartofMonth-1
								Until (Month of:C24($_d_StartofMonth)#$_l_MonthNumber)
								$_d_StartofMonth:=$_d_StartofMonth+1
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofMonth)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofMonth)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<$_d_ProspectiveEndDate)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=$_d_ProspectiveEndDate
							End if 
							
						: ($3=5)  //Date range
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>STK_d_FilterDateStart)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>STK_d_FilterDateStart)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<STK_d_FilterDateEnd)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=STK_d_FilterDateEnd
							End if 
							
					End case 
					If ($_d_StartDate#!00-00-00!)
						
						$_l_NumberofDates:=$_d_EndDate-$_d_StartDate
						$_l_NumberofMonths:=1
						$_l_Monthof2:=Month of:C24($_d_StartDate)
						$_l_Subtract:=1
						Repeat 
							$_l_Monthof2:=Month of:C24($_d_StartDate-$_l_Subtract)
							$_l_Subtract:=$_l_Subtract+1
						Until ($_l_Monthof2#Month of:C24($_d_StartDate))
						$_d_MonthStartDate:=($_d_StartDate-$_l_Subtract)+2
						$_d_MonthEndDate:=$_d_MonthStartDate+32
						Repeat 
							$_d_MonthEndDate:=$_d_MonthEndDate-1
						Until (Month of:C24($_d_MonthEndDate)=Month of:C24($_d_MonthStartDate))
						
						APPEND TO ARRAY:C911(STK_ad_Date; $_d_MonthStartDate)
						APPEND TO ARRAY:C911(STK_at_DatesRange; String:C10($_d_MonthStartDate; "Short")+"-"+String:C10($_d_MonthEndDate; "Short"))
						APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
						$_l_YearofStart:=Year of:C25($_d_StartDate)
						$_l_MonthofStart:=Month of:C24($_d_StartDate)
						For ($_l_DivisionsIndex; 1; $_l_NumberofDates)
							$_d_DateTEST:=$_d_StartDate+($_l_DivisionsIndex-1)
							If (Month of:C24($_d_DateTEST)#$_l_MonthofStart)  //& ($_l_YearofStart=  `we have reached the next month..this has to be day one of the month
								$_l_NumberofMonths:=$_l_NumberofMonths+1
								//APPEND TO ARRAY(STK_ad_Date;$_d_DateTEST)
								$_d_MonthEndDate:=$_d_DateTEST+32
								Repeat 
									$_d_MonthEndDate:=$_d_MonthEndDate-1
								Until (Month of:C24($_d_MonthEndDate)=Month of:C24($_d_DateTEST))
								$_l_DifferenceDays:=$_d_MonthEndDate-$_d_DateTEST
								$_l_DivisionsIndex:=$_l_DivisionsIndex+$_l_DifferenceDays
								APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateTEST)
								APPEND TO ARRAY:C911(STK_at_DatesRange; String:C10($_d_DateTEST; "Short")+"-"+String:C10($_d_MonthEndDate; "Short"))
								APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
								
							End if 
						End for 
						
						USE SET:C118("ProductSalesOrders")
						USE SET:C118("ProductSales")
						For ($_l_DivisionsIndex; 1; Records in set:C195("ProductSales"))
							If ([ORDER_ITEMS:25]Order_Code:1#"")
								USE SET:C118("ProductSalesOrders")
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
								If (Records in selection:C76([ORDERS:24])=0)
									QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
									$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
								Else 
									$_d_DateofSale:=[ORDERS:24]SORT_Date:57
									If ($_d_DateofSale=!00-00-00!)
										$_d_DateofSale:=[ORDERS:24]Order_Date:4
									End if 
								End if 
								If ($_d_DateofSale#!00-00-00!)
									$_l_Monthof:=Month of:C24($_d_DateofSale)
									$_d_MonthDate:=$_d_DateofSale
									Repeat 
										$_d_MonthDate:=$_d_MonthDate-1
									Until (Month of:C24($_d_MonthDate)#$_l_Monthof)
									$_d_MonthDate:=$_d_MonthDate+1
									$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_MonthDate)
									If ($_l_DateLineRow>0)
										If ([ORDER_ITEMS:25]Sales_Price:4>=0)
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER_ITEMS:25]Quantity:3
										Else 
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER_ITEMS:25]Quantity:3
										End if 
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					Else 
						Gen_Alert("The start of sales for this product is not set, so sales may not be calculated")
						$_l_NumberofDates:=0
						ARRAY DATE:C224(STK_ad_Date; 0)  //the date or the 1st day of a year quarter, month
						ARRAY TEXT:C222(STK_at_DatesRange; 0)
						ARRAY REAL:C219(STK_ar_Quantity; 0)
					End if 
					
				: ($2=3)  //Quarterly
					If ($3=0)
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=2)  //Current Year
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofYear)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofYear)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							
						: ($3=3)  //Current Quarter
							//This could be changed to look up the financial quarter....
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							$_d_Startof1StQuarter:=$_d_StartofYear
							$_d_Startof2ndQuarter:=$_d_StartofYear+90
							$_d_Startof3rdQuarter:=$_d_StartofYear+180
							$_d_Startof4thQuarter:=$_d_StartofYear+270
							If (Current date:C33(*)>$_d_Startof4thQuarter)
								$_d_StartofQuarter:=$_d_Startof4thQuarter
							Else 
								
								If (Current date:C33(*)>$_d_Startof3rdQuarter)
									$_d_StartofQuarter:=$_d_Startof3rdQuarter
								Else 
									If (Current date:C33(*)>$_d_Startof2ndQuarter)
										$_d_StartofQuarter:=$_d_Startof2ndQuarter
									Else 
										$_d_StartofQuarter:=$_d_Startof1StQuarter
									End if 
								End if 
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofQuarter)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofQuarter)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=4)  //Current Month
							$_d_ProspectiveEndDate:=Current date:C33(*)
							$_l_Monthof:=Month of:C24(Current date:C33(*))
							$_d_StartofMonth:=Current date:C33(*)
							Repeat 
								$_d_StartofMonth:=$_d_StartofMonth-1
							Until (Month of:C24($_d_StartofMonth)#$_l_Monthof)
							$_d_StartofMonth:=$_d_StartofMonth+1
							If ($_d_StartofMonth=Current date:C33(*))
								//then do last month
								
								$_d_StartofMonth:=$_d_StartofMonth-1
								$_d_ProspectiveEndDate:=$_d_StartofMonth
								$_l_MonthNumber:=Month of:C24($_d_StartofMonth)
								Repeat 
									$_d_StartofMonth:=$_d_StartofMonth-1
								Until (Month of:C24($_d_StartofMonth)#$_l_MonthNumber)
								$_d_StartofMonth:=$_d_StartofMonth+1
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofMonth)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofMonth)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<$_d_ProspectiveEndDate)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=$_d_ProspectiveEndDate
							End if 
							
						: ($3=5)  //Date range
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>STK_d_FilterDateStart)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>STK_d_FilterDateStart)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<STK_d_FilterDateEnd)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=STK_d_FilterDateEnd
							End if 
							
					End case 
					//have to work out the start date of each quarter between the dates
					$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_StartDate)))
					$_d_Startof1StQuarter:=$_d_StartofYear
					$_d_Startof2ndQuarter:=$_d_StartofYear+90
					$_d_Startof3rdQuarter:=$_d_StartofYear+180
					$_d_Startof4thQuarter:=$_d_StartofYear+270
					If ($_d_StartDate>$_d_Startof4thQuarter)
						$_d_StartofQuarter:=$_d_Startof4thQuarter
					Else 
						If ($_d_StartDate>$_d_Startof3rdQuarter)
							$_d_StartofQuarter:=$_d_Startof3rdQuarter
						Else 
							If ($_d_StartDate>$_d_Startof2ndQuarter)
								$_d_StartofQuarter:=$_d_Startof2ndQuarter
							Else 
								$_d_StartofQuarter:=$_d_Startof1StQuarter
							End if 
						End if 
					End if 
					If ($_d_StartDate#!00-00-00!)
						$_l_NumberofDates:=$_d_EndDate-$_d_StartDate
						For ($_l_DivisionsIndex; 1; $_l_NumberofDates)
							$_d_Date:=$_d_StartDate+($_l_DivisionsIndex-1)
							If ($_d_Date>$_d_Startof4thQuarter)
								If (Year of:C25($_d_Date)>Year of:C25($_d_Startof3rdQuarter))
									//Recalce the quarters
									$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_Date)))
									$_d_Startof1StQuarter:=$_d_StartofYear
									$_d_Startof2ndQuarter:=$_d_StartofYear+90
									$_d_Startof3rdQuarter:=$_d_StartofYear+180
									$_d_Startof4thQuarter:=$_d_StartofYear+270
									$_d_StartofQuarter:=$_d_Startof1StQuarter  //has to be in the 1st quarter!
								Else 
									$_d_StartofQuarter:=$_d_Startof4thQuarter
								End if 
							Else 
								If ($_d_Date>$_d_Startof3rdQuarter)
									$_d_StartofQuarter:=$_d_Startof3rdQuarter
								Else 
									If ($_d_Date>$_d_Startof2ndQuarter)
										$_d_StartofQuarter:=$_d_Startof2ndQuarter
									Else 
										$_d_StartofQuarter:=$_d_Startof1StQuarter
									End if 
								End if 
							End if 
							$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_StartofQuarter)
							$_l_QuarterDifference:=0
							
							If ($_l_DateLineRow<0)
								$_t_QuarterString:="'"
								Case of 
									: ($_d_StartofQuarter=$_d_Startof3rdQuarter)
										$_d_EndofQuarter:=$_d_Startof4thQuarter-1
										$_t_QuarterString:=String:C10($_d_StartofQuarter; "Short")+"-"+String:C10($_d_EndofQuarter; "Short")
										$_l_QuarterDifference:=$_d_EndofQuarter-$_d_StartofQuarter
									: ($_d_StartofQuarter=$_d_Startof4thQuarter)
										$_d_EndofQuarter:=$_d_Startof3rdQuarter+90
										Repeat 
											$_d_EndofQuarter:=$_d_EndofQuarter+1
										Until (Year of:C25($_d_EndofQuarter)#Year of:C25($_d_Startof4thQuarter))
										$_d_EndofQuarter:=$_d_EndofQuarter-1
										$_t_QuarterString:=String:C10($_d_Startof3rdQuarter; "Short")+"-"+String:C10($_d_EndofQuarter; "Short")
										$_l_QuarterDifference:=$_d_EndofQuarter-$_d_StartofQuarter
									: ($_d_StartofQuarter=$_d_Startof2ndQuarter)
										$_d_EndofQuarter:=$_d_Startof3rdQuarter-1
										$_t_QuarterString:=String:C10($_d_Startof2ndQuarter; "Short")+"-"+String:C10($_d_EndofQuarter; "Short")
										$_l_QuarterDifference:=$_d_EndofQuarter-$_d_StartofQuarter
									: ($_d_StartofQuarter=$_d_Startof1StQuarter)
										$_d_EndofQuarter:=$_d_Startof2ndQuarter-1
										$_t_QuarterString:=String:C10($_d_Startof1StQuarter; "Short")+"-"+String:C10($_d_EndofQuarter; "Short")
										$_l_QuarterDifference:=$_d_EndofQuarter-$_d_StartofQuarter
								End case 
								$_l_DivisionsIndex:=$_l_DivisionsIndex+$_l_QuarterDifference
								APPEND TO ARRAY:C911(STK_ad_Date; $_d_StartofQuarter)
								APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_QuarterString)
								APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
							End if 
							
						End for 
						USE SET:C118("ProductSalesOrders")
						USE SET:C118("ProductSales")
						FIRST RECORD:C50([ORDER_ITEMS:25])
						For ($_l_DivisionsIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
							If ([ORDER_ITEMS:25]Order_Code:1#"")
								USE SET:C118("ProductSalesOrders")
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
								If (Records in selection:C76([ORDERS:24])=0)
									QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
									$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
								Else 
									$_d_DateofSale:=[ORDERS:24]SORT_Date:57
								End if 
								If ($_d_DateofSale#!00-00-00!)
									$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_DateofSale)))
									$_d_Startof1StQuarter:=$_d_StartofYear
									$_d_Startof2ndQuarter:=$_d_StartofYear+90
									$_d_Startof3rdQuarter:=$_d_StartofYear+180
									$_d_Startof4thQuarter:=$_d_StartofYear+270
									Case of 
										: ($_d_DateofSale>=$_d_Startof4thQuarter)
											$_d_QuarterDate:=$_d_Startof4thQuarter
										: ($_d_DateofSale>=$_d_Startof3rdQuarter)
											$_d_QuarterDate:=$_d_Startof3rdQuarter
										: ($_d_DateofSale>=$_d_Startof2ndQuarter)
											$_d_QuarterDate:=$_d_Startof2ndQuarter
										: ($_d_DateofSale>=$_d_Startof1StQuarter)
											$_d_QuarterDate:=$_d_Startof1StQuarter
									End case 
									$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_QuarterDate)
									If ($_l_DateLineRow>0)
										If ([ORDER_ITEMS:25]Sales_Price:4>=0)
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER_ITEMS:25]Quantity:3
										Else 
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER_ITEMS:25]Quantity:3
										End if 
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					Else 
						Gen_Alert("The start of sales for this product is not set, so sales may not be calculated")
						$_l_NumberofDates:=0
						ARRAY DATE:C224(STK_ad_Date; 0)  //the date or the 1st day of a year quarter, month
						ARRAY TEXT:C222(STK_at_DatesRange; 0)
						ARRAY REAL:C219(STK_ar_Quantity; 0)
					End if 
				: ($2=4)  //Annual
					If ($3=0)
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=2)  //Current Year
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofYear)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofYear)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofYear
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							
						: ($3=3)  //Current Quarter
							//This could be changed to look up the financial quarter....
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25(Current date:C33(*))))
							$_d_Startof1StQuarter:=$_d_StartofYear
							$_d_Startof2ndQuarter:=$_d_StartofYear+90
							$_d_Startof3rdQuarter:=$_d_StartofYear+180
							$_d_Startof4thQuarter:=$_d_StartofYear+270
							If (Current date:C33(*)>$_d_Startof4thQuarter)
								$_d_StartofQuarter:=$_d_Startof4thQuarter
							Else 
								If (Current date:C33(*)>$_d_Startof3rdQuarter)
									$_d_StartofQuarter:=$_d_Startof3rdQuarter
								Else 
									If (Current date:C33(*)>$_d_Startof2ndQuarter)
										$_d_StartofQuarter:=$_d_Startof2ndQuarter
									Else 
										$_d_StartofQuarter:=$_d_Startof1StQuarter
									End if 
								End if 
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofQuarter)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofQuarter)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofQuarter
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
						: ($3=4)  //Current Month
							$_d_ProspectiveEndDate:=Current date:C33(*)
							$_l_Monthof:=Month of:C24(Current date:C33(*))
							$_d_StartofMonth:=Current date:C33(*)
							Repeat 
								$_d_StartofMonth:=$_d_StartofMonth-1
							Until (Month of:C24($_d_StartofMonth)#$_l_Monthof)
							$_d_StartofMonth:=$_d_StartofMonth+1
							If ($_d_StartofMonth=Current date:C33(*))
								//then do last month
								
								$_d_StartofMonth:=$_d_StartofMonth-1
								$_d_ProspectiveEndDate:=$_d_StartofMonth
								$_l_MonthNumber:=Month of:C24($_d_StartofMonth)
								Repeat 
									$_d_StartofMonth:=$_d_StartofMonth-1
								Until (Month of:C24($_d_StartofMonth)#$_l_MonthNumber)
								$_d_StartofMonth:=$_d_StartofMonth+1
							End if 
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>$_d_StartofMonth)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>$_d_StartofMonth)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=$_d_StartofMonth
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<$_d_ProspectiveEndDate)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=$_d_ProspectiveEndDate
							End if 
							
						: ($3=5)  //Date range
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								If ([ORDERS:24]SORT_Date:57>STK_d_FilterDateStart)
									$_d_StartDate:=[ORDERS:24]SORT_Date:57
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							Else 
								If ([PRODUCTS:9]Available_From_Date:21>STK_d_FilterDateStart)
									$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
								Else 
									$_d_StartDate:=STK_d_FilterDateStart
								End if 
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<STK_d_FilterDateEnd)
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=STK_d_FilterDateEnd
							End if 
							
					End case 
					If ($_d_StartDate#!00-00-00!)
						$_l_NumberofDates:=$_d_EndDate-$_d_StartDate
						For ($_l_DivisionsIndex; 1; $_l_NumberofDates)
							$_d_Date:=$_d_StartDate+($_l_DivisionsIndex-1)
							$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_Date)))
							
							$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_StartofYear)
							If ($_l_DateLineRow<0)
								$_t_YearString:=String:C10(Year of:C25($_d_StartofYear))
								APPEND TO ARRAY:C911(STK_ad_Date; $_d_StartofYear)
								APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_YearString)
								APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
							End if 
							
						End for 
						
						
						USE SET:C118("ProductSalesOrders")
						USE SET:C118("ProductSales")
						For ($_l_DivisionsIndex; 1; Records in set:C195("ProductSales"))
							If ([ORDER_ITEMS:25]Order_Code:1#"")
								USE SET:C118("ProductSalesOrders")
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
								If (Records in selection:C76([ORDERS:24])=0)
									QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
									$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
								Else 
									$_d_DateofSale:=[ORDERS:24]SORT_Date:57
								End if 
								If ($_d_DateofSale#!00-00-00!)
									$_l_Year:=Year of:C25($_d_DateofSale)
									$_d_YearDate:=Date:C102("01/01/"+String:C10(Year of:C25($_d_DateofSale)))
									
									
									$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_YearDate)
									If ($_l_DateLineRow>0)
										If ([ORDER_ITEMS:25]Sales_Price:4>=0)
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER_ITEMS:25]Quantity:3
										Else 
											STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER_ITEMS:25]Quantity:3
										End if 
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					Else 
						Gen_Alert("The start of sales for this product is not set, so sales may not be calculated")
						$_l_NumberofDates:=0
						ARRAY DATE:C224(STK_ad_Date; 0)  //the date or the 1st day of a year quarter, month
						ARRAY TEXT:C222(STK_at_DatesRange; 0)
						ARRAY REAL:C219(STK_ar_Quantity; 0)
					End if 
					
			End case 
			
		: ($1=3)  //average
			LB_SetFormat(->STK_lb_SalesStats; 2; "#######0.000000;-#######0.000000;"; 2; 2; Align center:K42:3)
			
			ARRAY TEXT:C222($_at_DateStrings; 0)
			ARRAY DATE:C224($_ad_DatesStart; 0)
			ARRAY DATE:C224($_ad_DatesEnd; 0)
			ARRAY REAL:C219($_ar_Divisions; 0)
			ARRAY REAL:C219($_ar_Quantities; 0)
			If ($2=0)  //set to daily
				$2:=1
			End if 
			Case of 
				: ($2=1)  //Daily
					If ($3=0)  //Product lifetime
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...) average daily sale is one line
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							$_t_DateString:="Average Daily Sales"
							$_l_Divisions:=$_d_EndDate-$_d_StartDate
							APPEND TO ARRAY:C911($_at_DateStrings; $_t_DateString)
							APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartDate)
							APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndDate)
							APPEND TO ARRAY:C911($_ar_Quantities; 0)
						: ($3=2)  //Daily sales per year need one line per year
							
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								$_l_Year:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
								$_d_StartofYear:=Date:C102("01/01/"+String:C10($_l_Year))
								$_d_EndofYear:=$_d_StartofYear+360
								Repeat 
									$_d_EndofYear:=$_d_EndofYear+1
								Until (Year of:C25($_d_EndofYear)#$_l_Year)
								$_d_EndofYear:=$_d_EndofYear-1
								If ($_d_StartofYear<$_d_StartDate)
									$_d_StartofYear:=$_d_StartDate
								End if 
								If ($_d_EndofYear>$_d_EndDate)
									$_d_EndofYear:=$_d_EndDate
								End if 
								$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_StartofYear)
								
								If ($_l_DateLineRow<0)
									APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartofYear)
									APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndofYear)
									APPEND TO ARRAY:C911($_at_DateStrings; String:C10($_l_Year))
									APPEND TO ARRAY:C911($_ar_Quantities; 0)
								End if 
							End for 
							
							
						: ($3=3)  //Per quarter
							//This could be changed to look up the financial quarter....
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))))
								$_d_Startof1StQuarter:=$_d_StartofYear
								$_d_Startof2ndQuarter:=$_d_StartofYear+90
								$_d_Startof3rdQuarter:=$_d_StartofYear+180
								$_d_Startof4thQuarter:=$_d_StartofYear+270
								$_l_Year:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
								$_d_StartofYear:=Date:C102("01/01/"+String:C10($_l_Year))
								$_d_EndofYear:=$_d_StartofYear+360
								If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof4thQuarter)
									$_t_QuarterName:="4th Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
									$_d_QuarterStart:=$_d_Startof4thQuarter
									$_l_Year:=Year of:C25($_d_QuarterStart)
									$_d_QuarterEnd:=$_d_QuarterStart+80
									Repeat 
										$_d_QuarterEnd:=$_d_QuarterEnd+1
									Until (Year of:C25($_d_QuarterEnd)#$_l_Year)
									$_d_QuarterEnd:=$_d_QuarterEnd-1
								Else 
									If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof3rdQuarter)
										$_t_QuarterName:="3rd Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
										$_d_QuarterStart:=$_d_Startof3rdQuarter
										$_d_QuarterEnd:=$_d_Startof4thQuarter-1
									Else 
										If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof2ndQuarter)
											$_t_QuarterName:="2nd Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
											$_d_QuarterStart:=$_d_Startof2ndQuarter
											$_d_QuarterEnd:=$_d_Startof3rdQuarter-1
										Else 
											//Has to be 1st quarter
											$_t_QuarterName:="1st Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
											$_d_QuarterStart:=$_d_Startof1StQuarter
											$_d_QuarterEnd:=$_d_Startof2ndQuarter-1
										End if 
									End if 
								End if 
								If ($_d_QuarterStart<$_d_StartDate)
									$_d_QuarterStart:=$_d_StartDate
								End if 
								If ($_d_QuarterEnd>$_d_EndDate)
									$_d_QuarterEnd:=$_d_EndDate
								End if 
								$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_QuarterStart)
								
								If ($_l_DateLineRow<0)
									APPEND TO ARRAY:C911($_ad_DatesStart; $_d_QuarterStart)
									APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_QuarterEnd)
									APPEND TO ARRAY:C911($_at_DateStrings; $_t_QuarterName)
									APPEND TO ARRAY:C911($_ar_Quantities; 0)
								End if 
							End for 
							
						: ($3=4)  //Per month
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							$_l_MonthNumber:=0
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								If (Month of:C24($_d_StartDate+($_l_DivisionsIndex-1))#$_l_MonthNumber)
									$_l_MonthNumber:=Month of:C24($_d_StartDate+($_l_DivisionsIndex-1))
									$_d_StartofMonth:=($_d_StartDate+($_l_DivisionsIndex-1))
									Repeat 
										$_d_StartofMonth:=$_d_StartofMonth-1
									Until (Month of:C24($_d_StartofMonth)#$_l_MonthNumber)
									
									$_d_StartofMonth:=$_d_StartofMonth+1
									
									
									$_d_EndofMonth:=$_d_StartofMonth+28
									Repeat 
										$_d_EndofMonth:=$_d_EndofMonth+1
									Until (Month of:C24($_d_EndofMonth)#$_l_MonthNumber)
									$_d_EndofMonth:=$_d_EndofMonth-1
									
									If ($_d_StartofMonth<$_d_StartDate)
										$_d_StartofMonth:=$_d_StartDate
									End if 
									If ($_d_EndofMonth>$_d_EndDate)
										$_d_EndofMonth:=$_d_EndDate
									End if 
									$_t_MonthName:=Get indexed string:C510(11; 12+$_l_MonthNumber)+" "+String:C10(Year of:C25($_d_StartofMonth))
									
									$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_StartofMonth)
									
									If ($_l_DateLineRow<0)
										APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartofMonth)
										APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndofMonth)
										APPEND TO ARRAY:C911($_at_DateStrings; $_t_MonthName)
										APPEND TO ARRAY:C911($_ar_Quantities; 0)
									End if 
								End if 
							End for 
							
							
					End case 
					USE SET:C118("ProductSalesOrders")
					USE SET:C118("ProductSales")
					For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
						
						$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
						$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
						$_l_QuantityCount:=$_l_SaleIndex
						$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
						If ($_l_DateLineRow<0)
							APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
							APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
							APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
							$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
							
						End if 
					End for 
					
					
					
					For ($_l_DivisionsIndex; 1; Records in set:C195("ProductSales"))
						If ([ORDER_ITEMS:25]Order_Code:1#"")
							USE SET:C118("ProductSalesOrders")
							QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
							If (Records in selection:C76([ORDERS:24])=0)
								QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
								$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
							Else 
								$_d_DateofSale:=[ORDERS:24]SORT_Date:57
							End if 
							If ($_d_DateofSale#!00-00-00!)
								$_d_DateLine:=!00-00-00!
								For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
									If ($_d_DateofSale>=$_ad_DatesStart{$_l_SaleIndex}) & ($_d_DateofSale<=$_ad_DatesEnd{$_l_SaleIndex})
										$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
										$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
										$_l_QuantityCount:=$_l_SaleIndex
										$_l_SaleIndex:=Size of array:C274($_ad_DatesStart)
									End if 
								End for 
								If ($_d_DateLine#!00-00-00!)
									$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
									If ($_l_DateLineRow<0)
										APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
										APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
										APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
										$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
									End if 
									If ($_l_DateLineRow>0)
										
										If ([ORDER_ITEMS:25]Sales_Price:4>=0)
											$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
											//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER ITEMS]Quantity
										Else 
											$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
											//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER ITEMS]Quantity
										End if 
										$_r_DivideBy:=$_ad_DatesEnd{$_l_QuantityCount}-$_ad_DatesStart{$_l_QuantityCount}  //We want average DAILY sales in the period of this line.
										STK_ar_Quantity{$_l_DateLineRow}:=$_ar_Quantities{$_l_QuantityCount}/$_r_DivideBy
									End if 
								End if 
							End if 
						End if 
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End for 
					
				: ($2=2)  //Montly
					If ($3=0)  //Product lifetime
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...) average Monthly sale is one line
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							$_t_DateString:="Average Monthly Sales"
							$_l_Divisions:=$_d_EndDate-$_d_StartDate
							APPEND TO ARRAY:C911($_at_DateStrings; $_t_DateString)
							APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartDate)
							APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndDate)
							APPEND TO ARRAY:C911($_ar_Quantities; 0)
							$_l_MonthCount:=0
							$_l_MonthNumber:=0
							For ($_l_DivisionsIndex; 1; $_l_Divisions)
								If ($_l_MonthNumber#Month of:C24($_d_StartDate+($_l_DivisionsIndex-1)))
									
									$_l_MonthNumber:=Month of:C24($_d_StartDate+($_l_DivisionsIndex-1))
									$_l_MonthCount:=$_l_MonthCount+1
								End if 
								
							End for 
						: ($3=2)  //Monthly per year need one line per year
							
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								$_l_Year:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
								$_d_StartofYear:=Date:C102("01/01/"+String:C10($_l_Year))
								$_d_EndofYear:=$_d_StartofYear+360
								Repeat 
									$_d_EndofYear:=$_d_EndofYear+1
								Until (Year of:C25($_d_EndofYear)#$_l_Year)
								$_d_EndofYear:=$_d_EndofYear-1
								If ($_d_StartofYear<$_d_StartDate)
									$_d_StartofYear:=$_d_StartDate
								End if 
								If ($_d_EndofYear>$_d_EndDate)
									$_d_EndofYear:=$_d_EndDate
								End if 
								$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_StartofYear)
								
								If ($_l_DateLineRow<0)
									APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartofYear)
									APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndofYear)
									APPEND TO ARRAY:C911($_at_DateStrings; String:C10($_l_Year))
									APPEND TO ARRAY:C911($_ar_Quantities; 0)
								End if 
							End for 
							$_l_MonthCount:=12  //Thats easy!
							
						: ($3=3)  //Per quarter
							//This could be changed to look up the financial quarter....
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))))
								$_d_Startof1StQuarter:=$_d_StartofYear
								$_d_Startof2ndQuarter:=$_d_StartofYear+90
								$_d_Startof3rdQuarter:=$_d_StartofYear+180
								$_d_Startof4thQuarter:=$_d_StartofYear+270
								$_l_Year:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
								$_d_StartofYear:=Date:C102("01/01/"+String:C10($_l_Year))
								$_d_EndofYear:=$_d_StartofYear+360
								If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof4thQuarter)
									$_t_QuarterName:="4th Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
									$_d_QuarterStart:=$_d_Startof4thQuarter
									$_l_Year:=Year of:C25($_d_QuarterStart)
									$_d_QuarterEnd:=$_d_QuarterStart+80
									Repeat 
										$_d_QuarterEnd:=$_d_QuarterEnd+1
									Until (Year of:C25($_d_QuarterEnd)#$_l_Year)
									$_d_QuarterEnd:=$_d_QuarterEnd-1
								Else 
									If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof3rdQuarter)
										$_t_QuarterName:="3rd Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
										$_d_QuarterStart:=$_d_Startof3rdQuarter
										$_d_QuarterEnd:=$_d_Startof4thQuarter-1
									Else 
										If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof2ndQuarter)
											$_t_QuarterName:="2nd Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
											$_d_QuarterStart:=$_d_Startof2ndQuarter
											$_d_QuarterEnd:=$_d_Startof3rdQuarter-1
										Else 
											//Has to be 1st quarter
											$_t_QuarterName:="1st Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
											$_d_QuarterStart:=$_d_Startof1StQuarter
											$_d_QuarterEnd:=$_d_Startof2ndQuarter-1
										End if 
									End if 
								End if 
								If ($_d_QuarterStart<$_d_StartDate)
									$_d_QuarterStart:=$_d_StartDate
								End if 
								If ($_d_QuarterEnd>$_d_EndDate)
									$_d_QuarterEnd:=$_d_EndDate
								End if 
								$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_QuarterStart)
								
								If ($_l_DateLineRow<0)
									APPEND TO ARRAY:C911($_ad_DatesStart; $_d_QuarterStart)
									APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_QuarterEnd)
									APPEND TO ARRAY:C911($_at_DateStrings; $_t_QuarterName)
									APPEND TO ARRAY:C911($_ar_Quantities; 0)
								End if 
							End for 
							$_l_MonthCount:=3  //Thats easy!
						: ($3=4)  //Per month daft for someone to pull this up..its the total sales for the month
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							$_l_MonthNumber:=0
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								If (Month of:C24($_d_StartDate+($_l_DivisionsIndex-1))#$_l_MonthNumber)
									$_l_MonthNumber:=Month of:C24($_d_StartDate+($_l_DivisionsIndex-1))
									$_d_StartofMonth:=($_d_StartDate+($_l_DivisionsIndex-1))
									Repeat 
										$_d_StartofMonth:=$_d_StartofMonth-1
									Until (Month of:C24($_d_StartofMonth)#$_l_MonthNumber)
									
									$_d_StartofMonth:=$_d_StartofMonth+1
									
									
									$_d_EndofMonth:=$_d_StartofMonth+28
									Repeat 
										$_d_EndofMonth:=$_d_EndofMonth+1
									Until (Month of:C24($_d_EndofMonth)#$_l_MonthNumber)
									$_d_EndofMonth:=$_d_EndofMonth-1
									
									If ($_d_StartofMonth<$_d_StartDate)
										$_d_StartofMonth:=$_d_StartDate
									End if 
									If ($_d_EndofMonth>$_d_EndDate)
										$_d_EndofMonth:=$_d_EndDate
									End if 
									$_t_MonthName:=Get indexed string:C510(11; 12+$_l_MonthNumber)+" "+String:C10(Year of:C25($_d_StartofMonth))
									
									$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_StartofMonth)
									
									If ($_l_DateLineRow<0)
										APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartofMonth)
										APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndofMonth)
										APPEND TO ARRAY:C911($_at_DateStrings; $_t_MonthName)
										APPEND TO ARRAY:C911($_ar_Quantities; 0)
									End if 
								End if 
							End for 
							
							$_l_MonthCount:=1  //Thats easy!
					End case 
					USE SET:C118("ProductSalesOrders")
					USE SET:C118("ProductSales")
					For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
						
						$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
						$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
						$_l_QuantityCount:=$_l_SaleIndex
						$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
						If ($_l_DateLineRow<0)
							APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
							APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
							APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
							$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
						End if 
					End for 
					For ($_l_DivisionsIndex; 1; Records in set:C195("ProductSales"))
						If ([ORDER_ITEMS:25]Order_Code:1#"")
							USE SET:C118("ProductSalesOrders")
							QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
							If (Records in selection:C76([ORDERS:24])=0)
								QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
								$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
							Else 
								$_d_DateofSale:=[ORDERS:24]SORT_Date:57
							End if 
							If ($_d_DateofSale#!00-00-00!)
								
								$_d_DateLine:=!00-00-00!
								For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
									If ($_d_DateofSale>=$_ad_DatesStart{$_l_SaleIndex}) & ($_d_DateofSale<=$_ad_DatesEnd{$_l_SaleIndex})
										$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
										$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
										$_l_QuantityCount:=$_l_SaleIndex
										$_l_SaleIndex:=Size of array:C274($_ad_DatesStart)
									End if 
								End for 
								If ($_d_DateLine#!00-00-00!)
									$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
									If ($_l_DateLineRow<0)
										APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
										APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
										APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
										$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
									End if 
									If ($_l_DateLineRow>0)
										
										If ([ORDER_ITEMS:25]Sales_Price:4>=0)
											$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
											//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER ITEMS]Quantity
										Else 
											$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
											//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER ITEMS]Quantity
										End if 
										If ($_l_MonthCount>1)
											$_r_DivideBy:=($_ad_DatesEnd{$_l_QuantityCount}-$_ad_DatesStart{$_l_QuantityCount})/$_l_MonthCount  //We want average Monthly sales in the period of this line.
											STK_ar_Quantity{$_l_DateLineRow}:=$_ar_Quantities{$_l_QuantityCount}/$_r_DivideBy
										Else 
											STK_ar_Quantity{$_l_DateLineRow}:=$_ar_Quantities{$_l_QuantityCount}
										End if 
									End if 
								End if 
							End if 
						End if 
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End for 
					
					
				: ($2=3)  //Quarterly
					If ($3=0)  //Product lifetime
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...) average Monthly sale is one line
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							$_t_DateString:="Average Monthly Sales"
							$_l_Divisions:=$_d_EndDate-$_d_StartDate
							APPEND TO ARRAY:C911($_at_DateStrings; $_t_DateString)
							APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartDate)
							APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndDate)
							APPEND TO ARRAY:C911($_ar_Quantities; 0)
							$_l_QuarterCount:=0
							$_l_QuarterNumber:=0
							$_l_MonthNumber:=0
							$_d_CurrentQuarterStartDate:=!00-00-00!
							For ($_l_DivisionsIndex; 1; $_l_Divisions)
								If ($_l_MonthNumber#Month of:C24($_d_StartDate+($_l_DivisionsIndex-1)))
									//So we only check per month
									$_l_MonthNumber:=Month of:C24($_d_StartDate+($_l_DivisionsIndex-1))
									$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))))
									$_d_Startof1StQuarter:=$_d_StartofYear
									$_d_Startof2ndQuarter:=$_d_StartofYear+90
									$_d_Startof3rdQuarter:=$_d_StartofYear+180
									$_d_Startof4thQuarter:=$_d_StartofYear+270
									Case of 
										: ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof4thQuarter)
											$_d_QuarterStart:=$_d_Startof4thQuarter
										: ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof3rdQuarter)
											$_d_QuarterStart:=$_d_Startof3rdQuarter
										: ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof2ndQuarter)
											$_d_QuarterStart:=$_d_Startof2ndQuarter
										Else 
											$_d_QuarterStart:=$_d_Startof1StQuarter
									End case 
									If ($_d_QuarterStart#$_d_CurrentQuarterStartDate)
										$_d_CurrentQuarterStartDate:=$_d_QuarterStart
										$_l_QuarterCount:=$_l_QuarterCount+1
									End if 
								End if 
							End for 
						: ($3=2)  //Monthly per year need one line per year
							
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale          USE SET("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								$_l_Year:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
								$_d_StartofYear:=Date:C102("01/01/"+String:C10($_l_Year))
								$_d_EndofYear:=$_d_StartofYear+360
								Repeat 
									$_d_EndofYear:=$_d_EndofYear+1
								Until (Year of:C25($_d_EndofYear)#$_l_Year)
								$_d_EndofYear:=$_d_EndofYear-1
								If ($_d_StartofYear<$_d_StartDate)
									$_d_StartofYear:=$_d_StartDate
								End if 
								If ($_d_EndofYear>$_d_EndDate)
									$_d_EndofYear:=$_d_EndDate
								End if 
								$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_StartofYear)
								
								If ($_l_DateLineRow<0)
									APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartofYear)
									APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndofYear)
									APPEND TO ARRAY:C911($_at_DateStrings; String:C10($_l_Year))
									APPEND TO ARRAY:C911($_ar_Quantities; 0)
								End if 
							End for 
							$_l_QuarterCount:=4  //Thats easy!
							
						: ($3=3)  //Per quarter
							//This could be changed to look up the financial quarter....
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								$_d_StartofYear:=Date:C102("01/01/"+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))))
								$_d_Startof1StQuarter:=$_d_StartofYear
								$_d_Startof2ndQuarter:=$_d_StartofYear+90
								$_d_Startof3rdQuarter:=$_d_StartofYear+180
								$_d_Startof4thQuarter:=$_d_StartofYear+270
								$_l_Year:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
								$_d_StartofYear:=Date:C102("01/01/"+String:C10($_l_Year))
								$_d_EndofYear:=$_d_StartofYear+360
								If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof4thQuarter)
									$_t_QuarterName:="4th Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
									$_d_QuarterStart:=$_d_Startof4thQuarter
									$_l_Year:=Year of:C25($_d_QuarterStart)
									$_d_QuarterEnd:=$_d_QuarterStart+80
									Repeat 
										$_d_QuarterEnd:=$_d_QuarterEnd+1
									Until (Year of:C25($_d_QuarterEnd)#$_l_Year)
									$_d_QuarterEnd:=$_d_QuarterEnd-1
								Else 
									If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof3rdQuarter)
										$_t_QuarterName:="3rd Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
										$_d_QuarterStart:=$_d_Startof3rdQuarter
										$_d_QuarterEnd:=$_d_Startof4thQuarter-1
									Else 
										If ($_d_StartDate+($_l_DivisionsIndex-1)>=$_d_Startof2ndQuarter)
											$_t_QuarterName:="2nd Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
											$_d_QuarterStart:=$_d_Startof2ndQuarter
											$_d_QuarterEnd:=$_d_Startof3rdQuarter-1
										Else 
											//Has to be 1st quarter
											$_t_QuarterName:="1st Quarter "+String:C10(Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))
											$_d_QuarterStart:=$_d_Startof1StQuarter
											$_d_QuarterEnd:=$_d_Startof2ndQuarter-1
										End if 
									End if 
								End if 
								If ($_d_QuarterStart<$_d_StartDate)
									$_d_QuarterStart:=$_d_StartDate
								End if 
								If ($_d_QuarterEnd>$_d_EndDate)
									$_d_QuarterEnd:=$_d_EndDate
								End if 
								$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_QuarterStart)
								
								If ($_l_DateLineRow<0)
									APPEND TO ARRAY:C911($_ad_DatesStart; $_d_QuarterStart)
									APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_QuarterEnd)
									APPEND TO ARRAY:C911($_at_DateStrings; $_t_QuarterName)
									APPEND TO ARRAY:C911($_ar_Quantities; 0)
								End if 
							End for 
							$_l_QuarterCount:=1  //Thats easy!
						: ($3=4)  //Per month daft for someone to pull this up..its the total sales for the month
							Gen_Alert("Sorry, Cannot calculate quartely sales per month")
							$_l_QuarterCount:=0  //Thats easy!
					End case 
					If ($_l_QuarterCount>0)
						USE SET:C118("ProductSalesOrders")
						USE SET:C118("ProductSales")
						For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
							
							$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
							$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
							$_l_QuantityCount:=$_l_SaleIndex
							$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
							If ($_l_DateLineRow<0)
								APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
								APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
								APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
								$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
							End if 
						End for 
						For ($_l_DivisionsIndex; 1; Records in set:C195("ProductSales"))
							If ([ORDER_ITEMS:25]Order_Code:1#"")
								USE SET:C118("ProductSalesOrders")
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
								If (Records in selection:C76([ORDERS:24])=0)
									QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
									$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
								Else 
									$_d_DateofSale:=[ORDERS:24]SORT_Date:57
								End if 
								If ($_d_DateofSale#!00-00-00!)
									$_d_DateLine:=!00-00-00!
									For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
										If ($_d_DateofSale>=$_ad_DatesStart{$_l_SaleIndex}) & ($_d_DateofSale<=$_ad_DatesEnd{$_l_SaleIndex})
											$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
											$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
											$_l_QuantityCount:=$_l_SaleIndex
											$_l_SaleIndex:=Size of array:C274($_ad_DatesStart)
										End if 
									End for 
									If ($_d_DateLine#!00-00-00!)
										$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
										If ($_l_DateLineRow<0)
											APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
											APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
											APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
											$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
										End if 
										If ($_l_DateLineRow>0)
											
											If ([ORDER_ITEMS:25]Sales_Price:4>=0)
												$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
												//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER ITEMS]Quantity
											Else 
												$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
												//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER ITEMS]Quantity
											End if 
											If ($_l_QuarterCount>1)
												$_r_DivideBy:=($_ad_DatesEnd{$_l_QuantityCount}-$_ad_DatesStart{$_l_QuantityCount})/$_l_QuarterCount  //We want average Monthly sales in the period of this line.
												STK_ar_Quantity{$_l_DateLineRow}:=$_ar_Quantities{$_l_QuantityCount}/$_r_DivideBy
											Else 
												STK_ar_Quantity{$_l_DateLineRow}:=$_ar_Quantities{$_l_QuantityCount}
											End if 
										End if 
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					End if 
					
					
				: ($2=4)  //Annual
					If ($3=0)  //Product lifetime
						$3:=1
					End if 
					Case of 
						: ($3=1)  //product lifetime(to current date or end of product...) average Monthly sale is one line
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							$_t_DateString:="Average Monthly Sales"
							$_l_Divisions:=$_d_EndDate-$_d_StartDate
							APPEND TO ARRAY:C911($_at_DateStrings; $_t_DateString)
							APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartDate)
							APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndDate)
							APPEND TO ARRAY:C911($_ar_Quantities; 0)
							$_l_YearCount:=0
							$_l_YearNumber:=0
							For ($_l_DivisionsIndex; 1; $_l_Divisions)
								If ($_l_YearNumber#Year of:C25($_d_StartDate+($_l_DivisionsIndex-1)))  //So we only check per month
									$_l_YearNumber:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
									$_l_YearCount:=$_l_YearCount+1
								End if 
							End for 
						: ($3=2)  //Monthly per year need one line per year
							
							If ([PRODUCTS:9]Available_From_Date:21=!00-00-00!)
								
								//We dont really know so use the date of the first sale
								USE SET:C118("ProductSalesOrders")
								ORDER BY:C49([ORDERS:24]; [ORDERS:24]SORT_Date:57; >)
								$_d_StartDate:=[ORDERS:24]SORT_Date:57
								
								
							Else 
								$_d_StartDate:=[PRODUCTS:9]Available_From_Date:21
							End if 
							If ([PRODUCTS:9]Actual_End_Date:49>!00-00-00!) & ([PRODUCTS:9]Actual_End_Date:49<Current date:C33(*))
								$_d_EndDate:=[PRODUCTS:9]Actual_End_Date:49
							Else 
								$_d_EndDate:=Current date:C33(*)
							End if 
							
							$_l_DateRange:=$_d_EndDate-$_d_StartDate
							For ($_l_DivisionsIndex; 1; $_l_DateRange)
								$_l_Year:=Year of:C25($_d_StartDate+($_l_DivisionsIndex-1))
								$_d_StartofYear:=Date:C102("01/01/"+String:C10($_l_Year))
								$_d_EndofYear:=$_d_StartofYear+360
								Repeat 
									$_d_EndofYear:=$_d_EndofYear+1
								Until (Year of:C25($_d_EndofYear)#$_l_Year)
								$_d_EndofYear:=$_d_EndofYear-1
								If ($_d_StartofYear<$_d_StartDate)
									$_d_StartofYear:=$_d_StartDate
								End if 
								If ($_d_EndofYear>$_d_EndDate)
									$_d_EndofYear:=$_d_EndDate
								End if 
								$_l_DateLineRow:=Find in array:C230($_ad_DatesStart; $_d_StartofYear)
								
								If ($_l_DateLineRow<0)
									APPEND TO ARRAY:C911($_ad_DatesStart; $_d_StartofYear)
									APPEND TO ARRAY:C911($_ad_DatesEnd; $_d_EndofYear)
									APPEND TO ARRAY:C911($_at_DateStrings; String:C10($_l_Year))
									APPEND TO ARRAY:C911($_ar_Quantities; 0)
								End if 
							End for 
							$_l_YearCount:=1  //Thats easy!(number of years per line
							
						: ($3=3)  //not possible
							//This could be changed to look up the financial quarter....
							$_l_YearCount:=0
							Gen_Alert("We can not calculate average annual sales per quarter")
							//Thats easy!
						: ($3=4)  //Per month daft for someone to pull this up..its the total sales for the month
							Gen_Alert("Sorry, Cannot calculate average annual  sales per month")
							$_l_YearCount:=0  //Thats easy!
					End case 
					If ($_l_YearCount>0)
						USE SET:C118("ProductSalesOrders")
						USE SET:C118("ProductSales")
						For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
							
							$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
							$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
							$_l_QuantityCount:=$_l_SaleIndex
							$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
							If ($_l_DateLineRow<0)
								APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
								APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
								APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
								$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
							End if 
						End for 
						For ($_l_DivisionsIndex; 1; Records in set:C195("ProductSales"))
							If ([ORDER_ITEMS:25]Order_Code:1#"")
								USE SET:C118("ProductSalesOrders")
								QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
								If (Records in selection:C76([ORDERS:24])=0)
									QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=[ORDER_ITEMS:25]Order_Code:1)
									$_d_DateofSale:=[SERVICE_CALLS:20]Call_Date:5
								Else 
									$_d_DateofSale:=[ORDERS:24]SORT_Date:57
								End if 
								If ($_d_DateofSale#!00-00-00!)
									$_d_DateLine:=!00-00-00!
									For ($_l_SaleIndex; 1; Size of array:C274($_ad_DatesStart))
										If ($_d_DateofSale>=$_ad_DatesStart{$_l_SaleIndex}) & ($_d_DateofSale<=$_ad_DatesEnd{$_l_SaleIndex})
											$_d_DateLine:=$_ad_DatesStart{$_l_SaleIndex}
											$_t_DateString:=$_at_DateStrings{$_l_SaleIndex}
											$_l_QuantityCount:=$_l_SaleIndex
											$_l_SaleIndex:=Size of array:C274($_ad_DatesStart)
										End if 
									End for 
									If ($_d_DateLine#!00-00-00!)
										$_l_DateLineRow:=Find in array:C230(STK_ad_Date; $_d_DateLine)
										If ($_l_DateLineRow<0)
											APPEND TO ARRAY:C911(STK_ar_Quantity; 0)
											APPEND TO ARRAY:C911(STK_ad_Date; $_d_DateLine)
											APPEND TO ARRAY:C911(STK_at_DatesRange; $_t_DateString)
											$_l_DateLineRow:=Size of array:C274(STK_ar_Quantity)
										End if 
										If ($_l_DateLineRow>0)
											
											If ([ORDER_ITEMS:25]Sales_Price:4>=0)
												$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
												//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}+[ORDER ITEMS]Quantity
											Else 
												$_ar_Quantities{$_l_QuantityCount}:=$_ar_Quantities{$_l_QuantityCount}+[ORDER_ITEMS:25]Quantity:3
												//STK_ar_Quantity{$_l_DateLineRow}:=STK_ar_Quantity{$_l_DateLineRow}-[ORDER ITEMS]Quantity
											End if 
											If ($_l_YearCount>1)
												$_r_DivideBy:=($_ad_DatesEnd{$_l_QuantityCount}-$_ad_DatesStart{$_l_QuantityCount})/$_l_YearCount  //We want average Monthly sales in the period of this line.
												STK_ar_Quantity{$_l_DateLineRow}:=$_ar_Quantities{$_l_QuantityCount}/$_r_DivideBy
											Else 
												STK_ar_Quantity{$_l_DateLineRow}:=$_ar_Quantities{$_l_QuantityCount}
											End if 
										End if 
									End if 
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					End if 
					
					
					
			End case 
			
			
			
	End case 
	
End if 
ERR_MethodTrackerReturn("STK_FillHistoryBytype"; $_t_oldMethodName)