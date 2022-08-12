//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI SubSubs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/04/2011 05:30
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_SubscriptionDates; 0)
	ARRAY INTEGER:C220($_ai_AfterNumber; 0)
	ARRAY INTEGER:C220($_ai_UnitNumber; 0)
	ARRAY REAL:C219($_ar_SubsAmount; 0)
	ARRAY TEXT:C222($_at_ProductNames; 0)
	ARRAY TEXT:C222($_at_SubscriptionNumber; 0)
	C_BOOLEAN:C305($_bo_Change)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_SDate; $_d_SDate2)
	C_LONGINT:C283($_bo_Changer; $_l_AfterNumber; $_l_CountRecords; $_l_DayNumber; $_l_issuesIndex; $_l_MonthNumber)
	C_REAL:C285($_r_Total; $_r_WeekNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI SubSubs")
//OrderI SubSubs - criptions

If ([ORDER_ITEMS:25]Product_Code:2#"")
	If ([ORDER_ITEMS:25]Item_Locked:16=False:C215)
		
		//  If ([ORDER ITEMS]Product Code#[PRODUCTS]Product Code)
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		//  End if
		
		//Check for existing Subs
		$_bo_Change:=True:C214
		QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
		If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
			//     If ([ORDER ITEMS]Product Code=Old([ORDER ITEMS]Product Code))
			//      $_bo_Change:=False
			//     Else
			Gen_Confirm("You have changed the Item details.  Do you want to delete existing Subscription"+" details, and create new ones if appropriate?"; "Yes"; "No")
			If (OK=1)
				DELETE SELECTION:C66([SUBSCRIPTIONS:93])
			Else 
				$_bo_Change:=False:C215
				[ORDER_ITEMS:25]Invoice_Number:17:="SUBS"
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End if 
			// End if
		End if 
		
		If ($_bo_Change)
			//This part will change to use the publication dates of the products-either the linked products or the direct product dates
			If ([PRODUCTS:9]Issues_Number:27>0)
				//  If ([ORDER ITEMS]Quantity=1)
				//       Gen_Confirm ("This is a Subscriptions Product.  Do you want to create rel
				//Subscription de"+"tails?";"Yes";"No")
				// If (OK=1)
				
				$_d_SDate:=[ORDERS:24]Order_Date:4
				If ($_d_SDate=!00-00-00!)
					$_d_SDate:=[ORDERS:24]Quotation_Date:26
				End if 
				If ($_d_SDate=!00-00-00!)
					$_d_SDate:=[ORDERS:24]Enquiry_Date:25
				End if 
				If ($_d_SDate=!00-00-00!)
					$_d_SDate:=<>DB_d_CurrentDate
				End if 
				$_d_SDate:=$_d_SDate+[PRODUCTS:9]Start_Days:31
				
				Case of 
					: ([PRODUCTS:9]Unit_Number:29=1)
						//Do nothing
						
					: ([PRODUCTS:9]Unit_Number:29=7)
						
						$_l_DayNumber:=Day number:C114([PRODUCTS:9]First_Issue_Date:32)
						While (Day number:C114($_d_SDate)#$_l_DayNumber)
							IDLE:C311  // 7/04/03 pb
							$_d_SDate:=$_d_SDate+1
						End while 
						If (([PRODUCTS:9]Every_Number:28>1) & ($_d_SDate>[PRODUCTS:9]First_Issue_Date:32))  //Get the weeks in synch
							$_l_DayNumber:=($_d_SDate-[PRODUCTS:9]First_Issue_Date:32)/7
							$_r_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
							While ($_r_WeekNumber#Int:C8($_l_DayNumber/[PRODUCTS:9]Every_Number:28))
								$_d_SDate:=$_d_SDate+7
								$_l_DayNumber:=($_d_SDate-[PRODUCTS:9]First_Issue_Date:32)/7
								$_r_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
							End while 
						End if 
						
					: ([PRODUCTS:9]Unit_Number:29>8)
						
						$_l_MonthNumber:=Month of:C24($_d_SDate)
						$_l_DayNumber:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
						$_d_SDate:=Date_Proper($_l_DayNumber; $_l_MonthNumber; Year of:C25($_d_SDate))
						If (([PRODUCTS:9]Every_Number:28>1) & ($_d_SDate>[PRODUCTS:9]First_Issue_Date:32))  //Get the months in synch
							$_l_DayNumber:=Date_MthCount($_d_SDate; [PRODUCTS:9]First_Issue_Date:32)
							$_r_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
							While ($_r_WeekNumber#Int:C8($_l_DayNumber/[PRODUCTS:9]Every_Number:28))
								$_bo_Changer:=Year of:C25($_d_SDate)
								$_l_MonthNumber:=Month of:C24($_d_SDate)+1
								If ($_l_MonthNumber>12)
									$_bo_Changer:=$_bo_Changer+1
									$_l_MonthNumber:=1
								End if 
								$_l_DayNumber:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
								$_d_SDate:=Date_Proper($_l_DayNumber; $_l_MonthNumber; $_bo_Changer)
								$_l_DayNumber:=Date_MthCount($_d_SDate; [PRODUCTS:9]First_Issue_Date:32)
								$_r_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
							End while 
						End if 
						If ([PRODUCTS:9]Start_Number:30=7)  //if week day -based, adjust the day to fit
							$_d_SDate:=Date_SameDayNo($_d_SDate; [PRODUCTS:9]First_Issue_Date:32)
						End if 
						
				End case 
				
				$_d_SDate2:=$_d_SDate
				If ([PRODUCTS:9]First_Day_Month:33=1)
					$_d_SDate:=[PRODUCTS:9]First_Issue_Date:32
				End if 
				
				If ([PRODUCTS:9]Every_Number:28>0)  //Only create these if 'Every' No is defined
					$_l_AfterNumber:=0
					For ($_l_issuesIndex; 1; [PRODUCTS:9]Issues_Number:27)
						CREATE RECORD:C68([SUBSCRIPTIONS:93])
						[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
						[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
						If ([PRODUCTS:9]Append_Month:34)
							[SUBSCRIPTIONS:93]Product_Name:2:="+ "+MonthName($_d_SDate)
						End if 
						If ([PRODUCTS:9]Append_Issue:35)
							If ([PRODUCTS:9]Append_Month:34)
								[SUBSCRIPTIONS:93]Product_Name:2:=[SUBSCRIPTIONS:93]Product_Name:2+", Issue No "+String:C10($_l_issuesIndex)
							Else 
								[SUBSCRIPTIONS:93]Product_Name:2:="+ Issue No "+String:C10($_l_issuesIndex)
							End if 
						End if 
						[SUBSCRIPTIONS:93]Type:7:="ISS"
						[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_SDate
						[SUBSCRIPTIONS:93]After_Number:5:=$_l_AfterNumber
						$_l_AfterNumber:=$_l_AfterNumber+[PRODUCTS:9]Every_Number:28
						[SUBSCRIPTIONS:93]Unit_Number:6:=[PRODUCTS:9]Unit_Number:29
						$_d_SDate:=Subscript_SDate($_d_SDate)
						DB_SaveRecord(->[SUBSCRIPTIONS:93])
						AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
					End for 
				End if 
				
				$_d_SDate:=$_d_SDate2
				//These 'b' Subscriptions are linked ONLY to the product and are used to create billings-so on the product screen must include these..the rules for this code will change though
				//this will ALSO pick up the REN items-it only does a total on the BILLING..It also picks up issue dates..that bit WILL change because there wont be issue dates
				//I dont think the renewal should have a price..it should get the price from the product at the time of the renewal?
				//the significant change will be that we wont be using the after no in the same way. here it was used with the units to work out when to send the renewal.
				//in the modified soluton the after will mean send after the 'n'th issue-same as before.. but WHEN after that issue
				//What is WRONG here is that the DATE is a FIXED date. so that must mean that
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
				$_l_CountRecords:=Records in selection:C76([SUBSCRIPTIONS:93])
				$_r_Total:=0
				If ($_l_CountRecords>0)
					SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Product_Name:2; $_at_ProductNames; [SUBSCRIPTIONS:93]Subscription_Date:3; $_ad_SubscriptionDates; [SUBSCRIPTIONS:93]After_Number:5; $_ai_AfterNumber; [SUBSCRIPTIONS:93]Unit_Number:6; $_ai_UnitNumber; [SUBSCRIPTIONS:93]Type:7; $_at_SubscriptionNumber; [SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; $_ar_SubsAmount)
					For ($_l_issuesIndex; 1; $_l_CountRecords)
						If ($_at_SubscriptionNumber{$_l_issuesIndex}="B@")
							$_r_Total:=Round:C94(($_r_Total+$_ar_SubsAmount{$_l_issuesIndex}); 2)
						End if 
					End for 
					For ($_l_issuesIndex; 1; $_l_CountRecords)
						If (($_ad_SubscriptionDates{$_l_issuesIndex}#!00-00-00!) | ($_ai_UnitNumber{$_l_issuesIndex}#0))
							CREATE RECORD:C68([SUBSCRIPTIONS:93])
							[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
							[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
							[SUBSCRIPTIONS:93]Product_Name:2:=$_at_ProductNames{$_l_issuesIndex}
							If ($_ad_SubscriptionDates{$_l_issuesIndex}#!00-00-00!)
								[SUBSCRIPTIONS:93]Subscription_Date:3:=$_ad_SubscriptionDates{$_l_issuesIndex}
							Else 
								If ([PRODUCTS:9]Subscription_Perpetual:41)  //perpetual always starts on same date as Issue 1
									[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_SDate
								Else 
									Case of 
										: ($_ai_UnitNumber{$_l_issuesIndex}=31)
											$_l_MonthNumber:=Month of:C24($_d_SDate)+$_ai_AfterNumber{$_l_issuesIndex}
											$_bo_Changer:=Year of:C25($_d_SDate)
											If ($_l_MonthNumber>12)
												If ($_l_MonthNumber>24)
													If ($_l_MonthNumber>36)
														$_l_MonthNumber:=$_l_MonthNumber-36
														$_bo_Changer:=$_bo_Changer+3
													Else 
														$_l_MonthNumber:=$_l_MonthNumber-24
														$_bo_Changer:=$_bo_Changer+2
													End if 
												Else 
													$_l_MonthNumber:=$_l_MonthNumber-12
													$_bo_Changer:=$_bo_Changer+1
												End if 
											Else 
												If ($_l_MonthNumber<1)
													$_l_MonthNumber:=$_l_MonthNumber+12
													$_bo_Changer:=$_bo_Changer-1
												End if 
											End if 
											[SUBSCRIPTIONS:93]Subscription_Date:3:=Date_Proper(Day of:C23($_d_SDate); $_l_MonthNumber; $_bo_Changer)
										: ($_ai_UnitNumber{$_l_issuesIndex}=365)
											$_bo_Changer:=Year of:C25($_d_SDate)+$_ai_AfterNumber{$_l_issuesIndex}
											[SUBSCRIPTIONS:93]Subscription_Date:3:=Date_Proper(Day of:C23($_d_SDate); Month of:C24($_d_SDate); $_bo_Changer)
										Else 
											[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_SDate+($_ai_AfterNumber{$_l_issuesIndex}*$_ai_UnitNumber{$_l_issuesIndex})
									End case 
								End if 
							End if 
							[SUBSCRIPTIONS:93]After_Number:5:=$_ai_AfterNumber{$_l_issuesIndex}
							[SUBSCRIPTIONS:93]Unit_Number:6:=$_ai_UnitNumber{$_l_issuesIndex}
							[SUBSCRIPTIONS:93]Type:7:=$_at_SubscriptionNumber{$_l_issuesIndex}
							If (($_r_Total=[ORDER_ITEMS:25]Sales_Amount:7) | ($_r_Total=0) | ($_at_SubscriptionNumber{$_l_issuesIndex}#"B@"))
								[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8:=$_ar_SubsAmount{$_l_issuesIndex}
							Else 
								[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8:=Round:C94(([ORDER_ITEMS:25]Sales_Amount:7*($_ar_SubsAmount{$_l_issuesIndex}/$_r_Total)); 2)
							End if 
							DB_SaveRecord(->[SUBSCRIPTIONS:93])
							AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
						End if 
					End for 
				End if 
				
				[ORDER_ITEMS:25]Invoice_Number:17:="SUBS"
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			End if 
			//   Else
			//     Gen_Alert ("NB: Subscriptions cannot be created where the Quantity is not 1
			//    End if
			//End if
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI SubSubs"; $_t_oldMethodName)