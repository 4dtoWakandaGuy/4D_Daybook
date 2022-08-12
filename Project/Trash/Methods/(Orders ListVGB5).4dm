//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_ListVGB5
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
	ARRAY LONGINT:C221($_al_CompaniesStatusCount; 0)
	ARRAY LONGINT:C221($_al_JobTitlesCount; 0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_CompaniesStatus; 0)
	ARRAY TEXT:C222($_at_JobTitles; 0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_JobTitlesIndex; $_l_NumOfJobTitles; $_l_OK; $_l_RecordsinSelection; $_l_RowsIndex; $_l_StatusIndex; vNo; vNo1; vNo2; vSNo)
	C_POINTER:C301($_ptr_ToVariable)
	C_REAL:C285(vT1; vT2; vT3; vT4; vT5)
	C_TEXT:C284($_t_CompanyStatus; $_t_JobTitle; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; vCompName; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5)
	C_TEXT:C284(vTitle6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB5")

Gen_Confirm("Are you ready to print Enquiry Analysis Details?"; "Yes"; "No")
If (OK=1)
	
	
	Orders_ListVGB4
	If (OK=1)
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "EnquiryAnalysis")
		// PAGE SETUP([ORDERS];"GB EnqAn Hdr")
		// PRINT SETTINGS
		If ($_l_OK>=0)
			READ ONLY:C145([STATUS:4])
			ARRAY TEXT:C222($_at_CompaniesStatus; 0)
			ARRAY LONGINT:C221($_al_CompaniesStatusCount; 0)
			ARRAY TEXT:C222($_at_JobTitles; 0)
			ARRAY LONGINT:C221($_al_JobTitlesCount; 0)
			
			FIRST RECORD:C50([ORDERS:24])
			While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
				
				$_t_OrderCode:=[ORDERS:24]Order_Code:3
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
				vCompName:=[COMPANIES:2]Company_Name:2
				vDate:=[ORDERS:24]Order_Date:4
				
				COPY NAMED SELECTION:C331([ORDERS:24]; "$OSel")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
				
				FIRST RECORD:C50([ORDER_ITEMS:25])
				While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
					
					$_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
					RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
					RELATE ONE:C42([PRODUCTS:9]Brand_Code:4)
					RELATE ONE:C42([PRODUCTS:9]Group_Code:3)
					vTitle1:=[PRODUCT_BRANDS:8]Brand_Name:2+" "+[PRODUCT_GROUPS:10]Group_Name:2
					vTitle2:=[PRODUCTS:9]Model_Code:5
					If ([PRODUCTS:9]Price_List:8=False:C215)
						
						CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$OISel")
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_ProductCode; *)
						QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1#$_t_OrderCode)
						vNo:=Records in selection:C76([ORDER_ITEMS:25])
						vSNo:=0
						
						$_l_RecordsinSelection:=1
						While ($_l_RecordsinSelection<=12)
							IDLE:C311  // 7/04/03 pb
							$_ptr_ToVariable:=Get pointer:C304("bd"+String:C10($_l_RecordsinSelection))
							$_ptr_ToVariable->:=0
							$_l_RecordsinSelection:=$_l_RecordsinSelection+1
						End while 
						vNo2:=0
						If (Not:C34(<>StatesLoaded))
							States_Load
						End if 
						FIRST RECORD:C50([ORDER_ITEMS:25])
						While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
							RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
							If ([ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{1})
								RELATE ONE:C42([ORDERS:24]Company_Code:1)
								RELATE ONE:C42([ORDERS:24]Contact_Code:2)
								If ([COMPANIES:2]Status:12="")
									$_t_CompanyStatus:="•UNSP"
								Else 
									$_t_CompanyStatus:=[COMPANIES:2]Status:12
								End if 
								If (Size of array:C274($_at_CompaniesStatus)>0)
									$_l_RecordsinSelection:=Find in array:C230($_at_CompaniesStatus; $_t_CompanyStatus)
								Else 
									$_l_RecordsinSelection:=0
								End if 
								If ($_l_RecordsinSelection<1)
									INSERT IN ARRAY:C227($_at_CompaniesStatus; 1; 1)
									INSERT IN ARRAY:C227($_al_CompaniesStatusCount; 1; 1)
									$_l_RecordsinSelection:=1
									$_at_CompaniesStatus{$_l_RecordsinSelection}:=$_t_CompanyStatus
									$_al_CompaniesStatusCount{$_l_RecordsinSelection}:=1
								Else 
									$_al_CompaniesStatusCount{$_l_RecordsinSelection}:=$_al_CompaniesStatusCount{$_l_RecordsinSelection}+1
								End if 
								
								If ([CONTACTS:1]Status:14="")
									$_t_JobTitle:="•UNSP"
								Else 
									$_t_JobTitle:=[CONTACTS:1]Status:14
								End if 
								If (Size of array:C274($_at_JobTitles)>0)
									$_l_RecordsinSelection:=Find in array:C230($_at_JobTitles; $_t_JobTitle)
								Else 
									$_l_RecordsinSelection:=0
								End if 
								If ($_l_RecordsinSelection<1)
									INSERT IN ARRAY:C227($_at_JobTitles; 1; 1)
									INSERT IN ARRAY:C227($_al_JobTitlesCount; 1; 1)
									$_l_RecordsinSelection:=1
									$_at_JobTitles{$_l_RecordsinSelection}:=$_t_JobTitle
									$_al_JobTitlesCount{$_l_RecordsinSelection}:=1
								Else 
									$_al_JobTitlesCount{$_l_RecordsinSelection}:=$_al_JobTitlesCount{$_l_RecordsinSelection}+1
								End if 
								
								$_l_RecordsinSelection:=Month of:C24([ORDERS:24]Enquiry_Date:25)
								If ($_l_RecordsinSelection>0)
									$_ptr_ToVariable:=Get pointer:C304("bd"+String:C10($_l_RecordsinSelection))
									$_ptr_ToVariable->:=$_ptr_ToVariable->+1
								End if 
								If ([ORDERS:24]Comments:14#"")
									vSNo:=vSNo+1
								End if 
								If ([ORDER_ITEMS:25]Purchase_Order_Number:18="R@")
									vNo2:=vNo2+1
								End if 
							End if 
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End while 
						
						If (vNo2=0)
							vTitle3:=""
						Else 
							vTitle3:="Representative to Call:"
						End if 
						Print form:C5("GB EnqAn Hdr")
						vTitle3:="TYPES OF PROFESSION:"
						vTitle4:="TYPES OF BUSINESS:"
						Print form:C5("GB EnqAn DtH")
						$_l_RecordsinSelection:=Size of array:C274($_at_CompaniesStatus)
						$_l_NumOfJobTitles:=Size of array:C274($_at_JobTitles)
						SORT ARRAY:C229($_at_CompaniesStatus; $_al_CompaniesStatusCount; >)
						SORT ARRAY:C229($_at_JobTitles; $_al_JobTitlesCount; >)
						$_l_StatusIndex:=1
						$_l_JobTitlesIndex:=1
						$_l_RowsIndex:=1
						While ((($_l_StatusIndex<=$_l_RecordsinSelection) | ($_l_JobTitlesIndex<=$_l_NumOfJobTitles)) & ($_l_RowsIndex<30))
							IDLE:C311  // 7/04/03 pb
							If ($_l_JobTitlesIndex<=$_l_NumOfJobTitles)
								If ($_at_JobTitles{$_l_JobTitlesIndex}#"")
									If ($_at_JobTitles{$_l_StatusIndex}="•UNSP")
										vTitle5:="Unspecified"
									Else 
										QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=$_at_JobTitles{$_l_StatusIndex})
										If ([STATUS:4]Status_Name:2="")
											vTitle5:=$_at_JobTitles{$_l_StatusIndex}
										Else 
											vTitle5:=[STATUS:4]Status_Name:2
										End if 
									End if 
									vNo1:=$_al_JobTitlesCount{$_l_JobTitlesIndex}
								Else 
									vTitle5:=""
									vNo1:=0
								End if 
							Else 
								vTitle5:=""
								vNo1:=0
							End if 
							$_l_JobTitlesIndex:=$_l_JobTitlesIndex+1
							If ($_l_StatusIndex<=$_l_RecordsinSelection)
								While (($_l_StatusIndex<$_l_RecordsinSelection) & ($_al_CompaniesStatusCount{$_l_StatusIndex}=0))
									IDLE:C311  // 7/04/03 pb
									$_l_StatusIndex:=$_l_StatusIndex+1
								End while 
								If ($_l_StatusIndex<=$_l_RecordsinSelection)
									If ($_al_CompaniesStatusCount{$_l_StatusIndex}#0)
										If ($_at_CompaniesStatus{$_l_StatusIndex}#"")
											If ($_at_CompaniesStatus{$_l_StatusIndex}="•UNSP")
												vTitle6:="Unspecified"
											Else 
												QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=$_at_CompaniesStatus{$_l_StatusIndex})
												If ([STATUS:4]Status_Name:2="")
													vTitle6:=$_at_CompaniesStatus{$_l_StatusIndex}
												Else 
													vTitle6:=[STATUS:4]Status_Name:2
												End if 
											End if 
											vNo2:=$_al_CompaniesStatusCount{$_l_StatusIndex}
										Else 
											vTitle6:=""
											vNo2:=0
										End if 
									Else 
										vTitle6:=""
										vNo2:=0
									End if 
								Else 
									vTitle6:=""
									vNo2:=0
								End if 
							Else 
								vTitle6:=""
								vNo2:=0
							End if 
							$_l_StatusIndex:=$_l_StatusIndex+1
							Print form:C5("GB EnqAn Det")
							$_l_RowsIndex:=$_l_RowsIndex+1
						End while 
						
						//Nos by month
						Print form:C5("GB EnqAn Mth")
						
						//Nos requesting x enquiry nos
						Join_SelFast(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3)
						QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=-3)
						FIRST RECORD:C50([ORDERS:24])
						vT1:=0
						vT2:=0
						vT3:=0
						vT4:=0
						vT5:=0
						While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
							Case of 
								: ($_l_RecordsinSelection=1)
									vT1:=vT1+1
								: ($_l_RecordsinSelection=2)
									vT2:=vT2+1
								: ($_l_RecordsinSelection=3)
									vT3:=vT3+1
								: ($_l_RecordsinSelection=4)
									vT4:=vT4+1
								: ($_l_RecordsinSelection=5)
									vT5:=vT5+1
							End case 
							NEXT RECORD:C51([ORDERS:24])
						End while 
						Print form:C5("GB EnqAn NoC")
						
						PAGE BREAK:C6
						USE NAMED SELECTION:C332("$OISel")
					End if 
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End while 
				
				USE NAMED SELECTION:C332("$OSel")
				NEXT RECORD:C51([ORDERS:24])
			End while 
			PRT_SetPrinterPaperOptions("EnquiryAnalysis")  //NG June 2005
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Orders_ListVGB5"; $_t_oldMethodName)
