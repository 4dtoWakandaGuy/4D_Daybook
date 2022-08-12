//%attributes = {}
If (False:C215)
	//Project Method Name:      OI_UpdateSubscriptions
	//------------------ Method Notes ------------------
	//This is a re-write of OrderI_SubSubs
	
	//------------------ Revision Control ----------------
	//Date Created: 24/04/2011 10:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_SubsCreatedDates; 0)
	ARRAY DATE:C224($_ad_SubscriptionDates; 0)
	ARRAY INTEGER:C220($_ai_AfterNumbers; 0)
	ARRAY INTEGER:C220($_ai_UnitNumbers; 0)
	ARRAY REAL:C219($_ar_SubscriptionAmounts; 0)
	ARRAY TEXT:C222($_at_ProductNames; 0)
	ARRAY TEXT:C222($_at_PublicationCodes; 0)
	ARRAY TEXT:C222($_at_SubscriptionTypes; 0)
	C_BOOLEAN:C305($_bo_SubscriptionExists; $_bo_UseOldStyleCalc)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_StartDate; $_d_StrartDate2)
	C_LONGINT:C283($_l_AfterNumber; $_l_DateRow; $_l_DayNumber; $_l_IssueNumberIndex; $_l_Month; $_l_RecordsinSelection; $_l_Year; $1)
	C_REAL:C285($_l_WeekNumber; $_r_Total)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OI_UpdateSubscriptions")


If (Count parameters:C259>=1)
	If ([ORDER_ITEMS:25]Item_Number:27#$1)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$1)
	End if 
	If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1)
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=[ORDER_ITEMS:25]Order_Code:1)
	End if 
	
	
	
	If ([ORDER_ITEMS:25]Product_Code:2#"")
		If ([ORDER_ITEMS:25]Item_Locked:16=False:C215)
			
			If ([ORDER_ITEMS:25]Product_Code:2#[PRODUCTS:9]Product_Code:1)
				RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			End if 
			
			//Check for existing Subs
			$_bo_SubscriptionExists:=True:C214
			QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Order_Item_Number:4=[ORDER_ITEMS:25]Item_Number:27)
			If (Records in selection:C76([SUBSCRIPTIONS:93])>0)
				//[ORDER ITEMS]Invoice No:="CAN"
				//SAVE RECORD([ORDER ITEMS])
				//if there are existing subs then this is a renewal.
				//DUPLICATE RECORD([ORDER ITEMS])
				[ORDER_ITEMS:25]Invoice_Number:17:="SUBS"
				//[ORDER ITEMS]x_ID:=AA_GetNextID (->[ORDER ITEMS]x_ID)
				[ORDER_ITEMS:25]Required_Date:10:=[ORDERS:24]Order_Date:4
				//OrderI_No
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				
				
				Gen_Confirm("You have changed the Item details.  Do you want to delete existing Subscription"+" details, and create new ones if appropriate?"; "Yes"; "No")
				If (OK=1)
					UNLOAD RECORD:C212([SUBSCRIPTIONS:93])
					READ WRITE:C146([SUBSCRIPTIONS:93])
					DELETE SELECTION:C66([SUBSCRIPTIONS:93])
				Else 
					$_bo_SubscriptionExists:=False:C215
					[ORDER_ITEMS:25]Invoice_Number:17:="SUBS"
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				End if 
				
			End if 
			
			If ($_bo_SubscriptionExists)
				//This part will change to use the publication dates of the products-either the linked products or the direct product dates
				If ([PRODUCTS:9]Issues_Number:27>0)
					$_d_StartDate:=[ORDERS:24]Order_Date:4
					If ($_d_StartDate=!00-00-00!)
						$_d_StartDate:=[ORDERS:24]Quotation_Date:26
					End if 
					If ($_d_StartDate=!00-00-00!)
						$_d_StartDate:=[ORDERS:24]Enquiry_Date:25
					End if 
					If ($_d_StartDate=!00-00-00!)
						$_d_StartDate:=<>DB_d_CurrentDate
					End if 
					$_d_StartDate:=$_d_StartDate+[PRODUCTS:9]Start_Days:31
					$_bo_UseOldStyleCalc:=False:C215
					Case of 
						: ([PRODUCTS:9]x_Product_Entry_Class:55=4) & (False:C215)
							If (Records in selection:C76([COMPONENTS:86])>=1)
								//if there are multiple publications subscribed in this package one will need to set as the 'master' from which the subscription is calculated
								SELECTION TO ARRAY:C260([COMPONENTS:86]Component_Code:2; $_at_PublicationCodes)
								QUERY WITH ARRAY:C644([DIARY:12]Product_Code:13; $_at_PublicationCodes)
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9="PDT")
								
								QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>$_d_StartDate)
								ARRAY DATE:C224($_ad_SubsCreatedDates; 0)
								//We create iss records for each issue date-note 2 pubs ONE Subs
								If (Records in selection:C76([DIARY:12])>=[PRODUCTS:9]Issues_Number:27)
									ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
									//the  newest ones first-be careful...we may had
									REDUCE SELECTION:C351([DIARY:12]; [PRODUCTS:9]Issues_Number:27)
									ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
									
									For ($_l_IssueNumberIndex; 1; [PRODUCTS:9]Issues_Number:27)
										$_l_DateRow:=Find in array:C230($_ad_SubsCreatedDates; [DIARY:12]Date_Do_From:4)
										If ($_l_DateRow<0)
											CREATE RECORD:C68([SUBSCRIPTIONS:93])
											[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
											[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
											If ([PRODUCTS:9]Append_Month:34)
												[SUBSCRIPTIONS:93]Product_Name:2:="+ "+MonthName($_d_StartDate)
											End if 
											If ([PRODUCTS:9]Append_Issue:35)
												If ([PRODUCTS:9]Append_Month:34)
													[SUBSCRIPTIONS:93]Product_Name:2:=[SUBSCRIPTIONS:93]Product_Name:2+", Issue No "+String:C10($_l_IssueNumberIndex)
												Else 
													[SUBSCRIPTIONS:93]Product_Name:2:="+ Issue No "+String:C10($_l_IssueNumberIndex)
												End if 
											End if 
											[SUBSCRIPTIONS:93]Type:7:="ISS"
											[SUBSCRIPTIONS:93]Subscription_Date:3:=[DIARY:12]Date_Do_From:4
											[SUBSCRIPTIONS:93]After_Number:5:=$_l_IssueNumberIndex
											$_l_IssueNumberIndex:=$_l_IssueNumberIndex+[PRODUCTS:9]Every_Number:28
											[SUBSCRIPTIONS:93]Unit_Number:6:=[PRODUCTS:9]Unit_Number:29
											//$_d_StartDate:=Subscript_SDate ($_d_StartDate)
											DB_SaveRecord(->[SUBSCRIPTIONS:93])
											AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
										End if 
										CREATE RECORD:C68([xDiaryRelations:137])
										[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[SUBSCRIPTIONS:93])
										[xDiaryRelations:137]xRecordID:4:=[SUBSCRIPTIONS:93]x_ID:11
										[xDiaryRelations:137]XRecord_Code:5:=[ORDER_ITEMS:25]Order_Code:1
										[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
										SAVE RECORD:C53([xDiaryRelations:137])
										NEXT RECORD:C51([DIARY:12])
									End for 
									
								Else 
									//there are not enough recorded iterations to work this out
									$_bo_UseOldStyleCalc:=True:C214
								End if 
							Else 
								$_bo_UseOldStyleCalc:=True:C214
								//`even though this product has been set as this class it has not been linked to publications
							End if 
						: ([PRODUCTS:9]x_Product_Entry_Class:55=5) & (False:C215)
							QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
							QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9="PDT")
							QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>$_d_StartDate)
							ARRAY DATE:C224($_ad_SubsCreatedDates; 0)
							//We create iss records for each issue date-note 2 pubs ONE Subs
							If (Records in selection:C76([DIARY:12])<[PRODUCTS:9]Issues_Number:27)
								//create new dates...
								
							End if 
							If (Records in selection:C76([DIARY:12])>=[PRODUCTS:9]Issues_Number:27)
								ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
								//the  newest ones first-be careful...we may had
								REDUCE SELECTION:C351([DIARY:12]; [PRODUCTS:9]Issues_Number:27)
								ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
								For ($_l_IssueNumberIndex; 1; [PRODUCTS:9]Issues_Number:27)
									$_l_DateRow:=Find in array:C230($_ad_SubsCreatedDates; [DIARY:12]Date_Do_From:4)
									If ($_l_DateRow<0)
										CREATE RECORD:C68([SUBSCRIPTIONS:93])
										[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
										[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
										If ([PRODUCTS:9]Append_Month:34)
											[SUBSCRIPTIONS:93]Product_Name:2:="+ "+MonthName($_d_StartDate)
										End if 
										If ([PRODUCTS:9]Append_Issue:35)
											If ([PRODUCTS:9]Append_Month:34)
												[SUBSCRIPTIONS:93]Product_Name:2:=[SUBSCRIPTIONS:93]Product_Name:2+", Issue No "+String:C10($_l_IssueNumberIndex)
											Else 
												[SUBSCRIPTIONS:93]Product_Name:2:="+ Issue No "+String:C10($_l_IssueNumberIndex)
											End if 
										End if 
										[SUBSCRIPTIONS:93]Type:7:="ISS"
										[SUBSCRIPTIONS:93]Subscription_Date:3:=[DIARY:12]Date_Do_From:4
										[SUBSCRIPTIONS:93]After_Number:5:=$_l_IssueNumberIndex
										$_l_IssueNumberIndex:=$_l_IssueNumberIndex+[PRODUCTS:9]Every_Number:28
										[SUBSCRIPTIONS:93]Unit_Number:6:=[PRODUCTS:9]Unit_Number:29
										//$_d_StartDate:=Subscript_SDate ($_d_StartDate)
										DB_SaveRecord(->[SUBSCRIPTIONS:93])
										AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
									End if 
									CREATE RECORD:C68([xDiaryRelations:137])
									[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[SUBSCRIPTIONS:93])
									[xDiaryRelations:137]xRecordID:4:=[SUBSCRIPTIONS:93]x_ID:11
									[xDiaryRelations:137]XRecord_Code:5:=[ORDER_ITEMS:25]Order_Code:1
									[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
									SAVE RECORD:C53([xDiaryRelations:137])
									NEXT RECORD:C51([DIARY:12])
								End for 
								
							Else 
								//there are not enough recorded iterations to work this out
								$_bo_UseOldStyleCalc:=True:C214
							End if 
						Else 
							$_bo_UseOldStyleCalc:=True:C214
							
					End case 
					If ($_bo_UseOldStyleCalc)
						Case of 
							: ([PRODUCTS:9]Unit_Number:29=1)
								//Do nothing
								
							: ([PRODUCTS:9]Unit_Number:29=7)
								
								$_l_DayNumber:=Day number:C114([PRODUCTS:9]First_Issue_Date:32)
								While (Day number:C114($_d_StartDate)#$_l_DayNumber)
									IDLE:C311  // 7/04/03 pb
									$_d_StartDate:=$_d_StartDate+1
								End while 
								If (([PRODUCTS:9]Every_Number:28>1) & ($_d_StartDate>[PRODUCTS:9]First_Issue_Date:32))  //Get the weeks in synch
									$_l_DayNumber:=($_d_StartDate-[PRODUCTS:9]First_Issue_Date:32)/7
									$_l_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
									While ($_l_WeekNumber#Int:C8($_l_DayNumber/[PRODUCTS:9]Every_Number:28))
										$_d_StartDate:=$_d_StartDate+7
										$_l_DayNumber:=($_d_StartDate-[PRODUCTS:9]First_Issue_Date:32)/7
										$_l_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
									End while 
								End if 
								
							: ([PRODUCTS:9]Unit_Number:29>8)
								
								$_l_Month:=Month of:C24($_d_StartDate)
								$_l_DayNumber:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
								$_d_StartDate:=Date_Proper($_l_DayNumber; $_l_Month; Year of:C25($_d_StartDate))
								If (([PRODUCTS:9]Every_Number:28>1) & ($_d_StartDate>[PRODUCTS:9]First_Issue_Date:32))  //Get the months in synch
									$_l_DayNumber:=Date_MthCount($_d_StartDate; [PRODUCTS:9]First_Issue_Date:32)
									$_l_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
									While ($_l_WeekNumber#Int:C8($_l_DayNumber/[PRODUCTS:9]Every_Number:28))
										$_l_Year:=Year of:C25($_d_StartDate)
										$_l_Month:=Month of:C24($_d_StartDate)+1
										If ($_l_Month>12)
											$_l_Year:=$_l_Year+1
											$_l_Month:=1
										End if 
										$_l_DayNumber:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
										$_d_StartDate:=Date_Proper($_l_DayNumber; $_l_Month; $_l_Year)
										$_l_DayNumber:=Date_MthCount($_d_StartDate; [PRODUCTS:9]First_Issue_Date:32)
										$_l_WeekNumber:=Round:C94(($_l_DayNumber/[PRODUCTS:9]Every_Number:28); 2)
									End while 
								End if 
								If ([PRODUCTS:9]Start_Number:30=7)  //if week day -based, adjust the day to fit
									$_d_StartDate:=Date_SameDayNo($_d_StartDate; [PRODUCTS:9]First_Issue_Date:32)
								End if 
								
						End case 
						
						
						$_d_StrartDate2:=$_d_StartDate
						If ([PRODUCTS:9]First_Day_Month:33=1)
							$_d_StartDate:=[PRODUCTS:9]First_Issue_Date:32
						End if 
						
						If ([PRODUCTS:9]Every_Number:28>0)  //Only create these if 'Every' No is defined
							$_l_AfterNumber:=0
							For ($_l_IssueNumberIndex; 1; [PRODUCTS:9]Issues_Number:27)
								CREATE RECORD:C68([SUBSCRIPTIONS:93])
								[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
								[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
								If ([PRODUCTS:9]Append_Month:34)
									[SUBSCRIPTIONS:93]Product_Name:2:="+ "+MonthName($_d_StartDate)
								End if 
								If ([PRODUCTS:9]Append_Issue:35)
									If ([PRODUCTS:9]Append_Month:34)
										[SUBSCRIPTIONS:93]Product_Name:2:=[SUBSCRIPTIONS:93]Product_Name:2+", Issue No "+String:C10($_l_IssueNumberIndex)
									Else 
										[SUBSCRIPTIONS:93]Product_Name:2:="+ Issue No "+String:C10($_l_IssueNumberIndex)
									End if 
								End if 
								[SUBSCRIPTIONS:93]Type:7:="ISS"
								[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_StartDate
								[SUBSCRIPTIONS:93]After_Number:5:=$_l_AfterNumber
								$_l_AfterNumber:=$_l_AfterNumber+[PRODUCTS:9]Every_Number:28
								[SUBSCRIPTIONS:93]Unit_Number:6:=[PRODUCTS:9]Unit_Number:29
								$_d_StartDate:=Subscript_SDate($_d_StartDate)
								DB_SaveRecord(->[SUBSCRIPTIONS:93])
								AA_CheckFileUnlocked(->[SUBSCRIPTIONS:93]x_ID:11)
							End for 
						End if 
						
						$_d_StartDate:=$_d_StrartDate2
					End if 
					
					//These 'b' Subscriptions are linked ONLY to the product and are used to create billings-so on the product screen must include these..the rules for this code will change though
					//this will ALSO pick up the REN items-it only does a total on the BILLING..It also picks up issue dates..that bit WILL change because there wont be issue dates
					//I dont think the renewal should have a price..it should get the price from the product at the time of the renewal?
					//the significant change will be that we wont be using the after no in the same way. here it was used with the units to work out when to send the renewal.
					//in the modified soluton the after will mean send after the 'n'th issue-same as before.. but WHEN after that issue
					//What is WRONG here is that the DATE is a FIXED date. so that must mean that
					QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[ORDER_ITEMS:25]Product_Code:2; *)
					QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
					$_l_RecordsinSelection:=Records in selection:C76([SUBSCRIPTIONS:93])
					$_r_Total:=0
					If ($_l_RecordsinSelection>0)
						SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Product_Name:2; $_at_ProductNames; [SUBSCRIPTIONS:93]Subscription_Date:3; $_ad_SubscriptionDates; [SUBSCRIPTIONS:93]After_Number:5; $_ai_AfterNumbers; [SUBSCRIPTIONS:93]Unit_Number:6; $_ai_UnitNumbers; [SUBSCRIPTIONS:93]Type:7; $_at_SubscriptionTypes; [SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; $_ar_SubscriptionAmounts)
						For ($_l_IssueNumberIndex; 1; $_l_RecordsinSelection)
							If ($_at_SubscriptionTypes{$_l_IssueNumberIndex}="B@")
								$_r_Total:=Round:C94(($_r_Total+$_ar_SubscriptionAmounts{$_l_IssueNumberIndex}); 2)
							End if 
						End for 
						For ($_l_IssueNumberIndex; 1; $_l_RecordsinSelection)
							If (($_ad_SubscriptionDates{$_l_IssueNumberIndex}#!00-00-00!) | ($_ai_UnitNumbers{$_l_IssueNumberIndex}#0))
								CREATE RECORD:C68([SUBSCRIPTIONS:93])
								[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
								[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
								[SUBSCRIPTIONS:93]Product_Name:2:=$_at_ProductNames{$_l_IssueNumberIndex}
								If ($_ad_SubscriptionDates{$_l_IssueNumberIndex}#!00-00-00!)
									[SUBSCRIPTIONS:93]Subscription_Date:3:=$_ad_SubscriptionDates{$_l_IssueNumberIndex}
								Else 
									If ([PRODUCTS:9]Subscription_Perpetual:41)  //perpetual always starts on same date as Issue 1
										[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_StartDate
									Else 
										Case of 
											: ($_ai_UnitNumbers{$_l_IssueNumberIndex}=31)
												$_l_Month:=Month of:C24($_d_StartDate)+$_ai_AfterNumbers{$_l_IssueNumberIndex}
												$_l_Year:=Year of:C25($_d_StartDate)
												If ($_l_Month>12)
													If ($_l_Month>24)
														If ($_l_Month>36)
															$_l_Month:=$_l_Month-36
															$_l_Year:=$_l_Year+3
														Else 
															$_l_Month:=$_l_Month-24
															$_l_Year:=$_l_Year+2
														End if 
													Else 
														$_l_Month:=$_l_Month-12
														$_l_Year:=$_l_Year+1
													End if 
												Else 
													If ($_l_Month<1)
														$_l_Month:=$_l_Month+12
														$_l_Year:=$_l_Year-1
													End if 
												End if 
												[SUBSCRIPTIONS:93]Subscription_Date:3:=Date_Proper(Day of:C23($_d_StartDate); $_l_Month; $_l_Year)
											: ($_ai_UnitNumbers{$_l_IssueNumberIndex}=365)
												$_l_Year:=Year of:C25($_d_StartDate)+$_ai_AfterNumbers{$_l_IssueNumberIndex}
												[SUBSCRIPTIONS:93]Subscription_Date:3:=Date_Proper(Day of:C23($_d_StartDate); Month of:C24($_d_StartDate); $_l_Year)
											Else 
												[SUBSCRIPTIONS:93]Subscription_Date:3:=$_d_StartDate+($_ai_AfterNumbers{$_l_IssueNumberIndex}*$_ai_UnitNumbers{$_l_IssueNumberIndex})
										End case 
									End if 
								End if 
								[SUBSCRIPTIONS:93]After_Number:5:=$_ai_AfterNumbers{$_l_IssueNumberIndex}
								[SUBSCRIPTIONS:93]Unit_Number:6:=$_ai_UnitNumbers{$_l_IssueNumberIndex}
								[SUBSCRIPTIONS:93]Type:7:=$_at_SubscriptionTypes{$_l_IssueNumberIndex}
								If (($_r_Total=[ORDER_ITEMS:25]Sales_Amount:7) | ($_r_Total=0) | ($_at_SubscriptionTypes{$_l_IssueNumberIndex}#"B@"))
									[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8:=$_ar_SubscriptionAmounts{$_l_IssueNumberIndex}
								Else 
									[SUBSCRIPTIONS:93]Amount_Excluding_Tax:8:=Round:C94(([ORDER_ITEMS:25]Sales_Amount:7*($_ar_SubscriptionAmounts{$_l_IssueNumberIndex}/$_r_Total)); 2)
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
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OI_UpdateSubscriptions"; $_t_oldMethodName)