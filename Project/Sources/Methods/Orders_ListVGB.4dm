//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ListVGB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(<>StatesLoaded; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vFDateF)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_CurrentRow; $_l_OK; $_l_PrintPosition; $_l_RecordsinSelection; $_l_WindowReferenceRow; ADR_l_UseQualifications; ch0; ch1; ch2; ch3)
	C_LONGINT:C283(ch4; ch5; ch6; cNAA; r1; s1; s2; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName; $_t_ProductName; DB_t_CurrentFormUsage2; vComments; vDesc1; vDesc2; vDesc3; vDesc4; vDetails; vDetails1; vDetails2)
	C_TEXT:C284(vDetails3; vDetails4; vOrderCode; vProdCode; vSubGroup1; vSubGroup2; vSubGroup3; vSubGroup4; vText; vTitle1; vTitle2)
	C_TEXT:C284(vTitle3; vTitle4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB")
//Orders_ListVGB
READ ONLY:C145([PRODUCTS:9])
READ ONLY:C145([PRODUCT_GROUPS:10])
READ ONLY:C145([PRODUCT_BRANDS:8])
READ ONLY:C145([COMPANIES:2])
READ ONLY:C145([CONTACTS:1])
READ ONLY:C145([STATUS:4])
ADR_l_UseQualifications:=1
cNAA:=1
vOrderCode:=""
Open_AnyTypeWindow(323; 483; 5; "Report Requirements")
DIALOG:C40([ORDERS:24]; "dAsk_GBReport")
CLOSE WINDOW:C154
$_l_OK:=OK
OK:=1
If (WIN_bo_TrackerInited)
	$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
	If ($_l_WindowReferenceRow>0)
		WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
	End if 
End if 

If (($_l_OK=1) & (r1=1))
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	If (Size of array:C274(<>SYS_at_RecStateCodes{24})<3)
		Gen_Alert("Please define at least 3 Record States for use with Orders"; "Cancel")
	Else 
		Open_Pro_Window("GB Reports")
		
		If ((vProdCode#"") | (vComments#""))
			vProdCode:=Sel_AtSign(vProdCode)
			vComments:=Sel_AtSign(vComments)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1>=vProdCode; *)
			QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1<=vComments)
		Else 
			ALL RECORDS:C47([PRODUCTS:9])
		End if 
		ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1; >)
		
		If (ch0=1)
			Gen_Confirm("Are you ready to print Advertiser Enquiry Labels?"; "Yes"; "No")
			If (OK=1)
				vDate:=<>DB_d_CurrentDate
				Letter_Date
				READ WRITE:C146([ORDERS:24])
				CREATE EMPTY SET:C140([ORDERS:24]; "Apply")
				
				$_l_PrintPosition:=0
				Orders_ListVGB4
				If (OK=1)
					$_l_OK:=PRINT_SetSIZE("A4"; "P"; "AdvertiserEnquiry")
					//PAGE SETUP([ORDERS];"GB_AdEnq_Hdr")
					// PRINT SETTINGS
					If ($_l_OK>=0)
						
						FIRST RECORD:C50([ORDERS:24])
						While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
							
							COPY NAMED SELECTION:C331([ORDERS:24]; "$Sel")
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])+1
								ARRAY TEXT:C222($_at_ProductCodes; $_l_RecordsinSelection-1)
								SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
								
								If ($_l_RecordsinSelection>2)
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_at_ProductCodes{1}; *)
									If ($_l_RecordsinSelection>3)
										$_l_CurrentRow:=1
										While (($_l_CurrentRow<($_l_RecordsinSelection-1)) & (<>SYS_l_CancelProcess#Current process:C322))
											QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Product_Code:2=$_at_ProductCodes{$_l_CurrentRow}; *)
											$_l_CurrentRow:=$_l_CurrentRow+1
										End while 
										QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Product_Code:2=$_at_ProductCodes{$_l_RecordsinSelection-1})
									Else 
										QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Product_Code:2=$_at_ProductCodes{2})
									End if 
								Else 
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_at_ProductCodes{1})
								End if 
								Join_SelFast(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3)
								
								If (ch6=1)
									QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Forecast_Date:23=vFDateF; *)
									QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{1})
								Else 
									QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{1})
								End if 
								
								If (Records in selection:C76([ORDERS:24])>0)
									COPY NAMED SELECTION:C331([ORDERS:24]; "$Sel2")
									USE NAMED SELECTION:C332("$Sel")
									
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
									Array_LCx(Records in selection:C76([ORDER_ITEMS:25]))
									FIRST RECORD:C50([ORDER_ITEMS:25])
									$_l_RecordsinSelection:=1
									$_t_ProductName:=""
									vTitle3:="Reader Enquiry No(s): "
									While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
										RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
										If ([PRODUCTS:9]Price_List:8=False:C215)
											vTitle3:=vTitle3+[PRODUCTS:9]Model_Code:5+", "
											If ($_t_ProductName="")
												$_t_ProductName:=[ORDER_ITEMS:25]Product_Name:13
											End if 
										End if 
										GEN_at_Identity{$_l_RecordsinSelection}:=[ORDER_ITEMS:25]Product_Code:2
										GEN_at_RecordCode{$_l_RecordsinSelection}:=[PRODUCTS:9]Model_Code:5
										$_l_RecordsinSelection:=$_l_RecordsinSelection+1
										NEXT RECORD:C51([ORDER_ITEMS:25])
									End while 
									vTitle3:=Substring:C12(vTitle3; 1; Length:C16(vTitle3)-2)
									
									If (($_l_PrintPosition<3) & ($_l_PrintPosition#0))
										vDetails:=""
										vTitle1:=""
										vTitle2:=""
										vTitle4:=vTitle3
										vTitle3:=""
										//vLetterDate:=""
										While ($_l_PrintPosition<3)
											IDLE:C311  // 7/04/03 pb
											//   PRINT LAYOUT([ORDERS];"GB_AdEnq_Hdr")
											//  FORM FEED
											$_l_PrintPosition:=$_l_PrintPosition+1
										End while 
										vTitle3:=vTitle4
									End if 
									
									RELATE ONE:C42([ORDERS:24]Company_Code:1)
									RELATE ONE:C42([ORDERS:24]Contact_Code:2)
									MCont_Add("")
									
									vTitle1:=[ORDERS:24]Company_Code:1+" - "+[ORDERS:24]Contact_Code:2
									RELATE ONE:C42([PRODUCTS:9]Group_Code:3)
									RELATE ONE:C42([PRODUCTS:9]Brand_Code:4)
									
									//*************START
									vTitle2:="The following enquirers have written to us requesting further details "
									vTitle2:=vTitle2+"of your product; "+$_t_ProductName+" in issue number "
									vTitle2:=vTitle2+[PRODUCT_BRANDS:8]Brand_Name:2+" "+[PRODUCT_GROUPS:10]Group_Name:2+" of "
									vTitle2:=vTitle2+"Specifier Review under reader enquiry "
									vTitle4:=Delete string:C232(vTitle3; 1; 22)
									If (Length:C16(vTitle4)>=5)
										vTitle2:=vTitle2+"numbers "+vTitle4+"."
									Else 
										vTitle2:=vTitle2+"number "+vTitle4+"."
									End if 
									
									
									Print form:C5([ORDERS:24]; "GB_AdEnq_Hdr")
									If (ch3=1)
										PAGE BREAK:C6  //(*)
									End if 
									//*************END
									$_l_PrintPosition:=1
									
									USE NAMED SELECTION:C332("$Sel2")
									CLEAR NAMED SELECTION:C333("$Sel2")
									
									FIRST RECORD:C50([ORDERS:24])
									While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
										
										Orders_ListVGB2
										vDetails1:=vDetails
										vTitle1:=vText
										NEXT RECORD:C51([ORDERS:24])
										If ([ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{1})
											Orders_ListVGB2
											vDetails2:=vDetails
											vTitle2:=vText
											NEXT RECORD:C51([ORDERS:24])
										Else 
											vDetails2:=""
											vTitle2:=""
										End if 
										//****** START
										Print form:C5([ORDERS:24]; "GB_AdEnq_Label")
										If (ch3=1)
											PAGE BREAK:C6  //(*;>)
										End if 
										//****** END
										$_l_PrintPosition:=$_l_PrintPosition+1
										If ($_l_PrintPosition=4)
											//  FORM FEED
											$_l_PrintPosition:=1
										End if 
										
									End while 
								End if 
							End if 
							USE NAMED SELECTION:C332("$Sel")
							CLEAR NAMED SELECTION:C333("$Sel")
							NEXT RECORD:C51([ORDERS:24])
						End while 
						
						If (ch3=0)
							PAGE BREAK:C6
						End if 
						// FORM FEED(*)
						PRT_SetPrinterPaperOptions("AdvertiserEnquiry")
						//NG June 2005
						If ((OK=1) & (Records in set:C195("Apply")>0) & (vFDateF=!00-00-00!))
							Gen_Confirm("Were the Labels printed OK?"; "Yes"; "No")
							If (OK=1)
								USE SET:C118("Apply")
								DB_lockFile(->[ORDERS:24])
								APPLY TO SELECTION:C70([ORDERS:24]; [ORDERS:24]Forecast_Date:23:=<>DB_d_CurrentDate)
								
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDERS:24]))
								vFDateF:=<>DB_d_CurrentDate
							End if 
						End if 
						
					End if 
					CLEAR SET:C117("Apply")
					UNLOAD RECORD:C212([ORDERS:24])
					READ ONLY:C145([ORDERS:24])
					
				End if 
			End if 
		End if 
		
		//***************  $PRS START  ************************
		If (vProdCode#"")
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1>=vProdCode; *)
			QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Product_Code:1<=vComments)
		Else 
			ALL RECORDS:C47([PRODUCTS:9])
		End if 
		ORDER BY:C49([PRODUCTS:9]Product_Code:1; >)
		
		If (ch1=1)
			Gen_Confirm("Are you ready to print Enquiry Address Labels?"; "Yes"; "No")
			If (OK=1)
				$_l_PrintPosition:=0
				Orders_ListVGB4
				If (OK=1)
					Gen_Confirm("Print 1 across labels or 4 across 13in labels?"; "1"; "4")
					If (OK=1)
						DB_t_CurrentFormUsage2:="1"
						PRINT_SetSIZE("A4"; "P")
						//PAGE SETUP([ORDERS];"GB_Enq_Label")
					Else 
						DB_t_CurrentFormUsage2:="4"
						PRINT_SetSIZE("A4"; "L")
						//  PAGE SETUP([DOCUMENTS];"Mail_Label4/13")
					End if 
					//  PRINT SETTINGS
					If (OK=1)
						
						FIRST RECORD:C50([ORDERS:24])
						While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
							
							COPY NAMED SELECTION:C331([ORDERS:24]; "$Sel")
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								Array_LCx(Records in selection:C76([ORDER_ITEMS:25]))
								FIRST RECORD:C50([ORDER_ITEMS:25])
								$_l_RecordsinSelection:=1
								While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
									GEN_at_Identity{$_l_RecordsinSelection}:=[ORDER_ITEMS:25]Product_Code:2
									$_l_RecordsinSelection:=$_l_RecordsinSelection+1
									NEXT RECORD:C51([ORDER_ITEMS:25])
								End while 
								
								If ($_l_RecordsinSelection>2)
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=GEN_at_Identity{1}; *)
									If ($_l_RecordsinSelection>3)
										$_l_CurrentRow:=1
										While (($_l_CurrentRow<($_l_RecordsinSelection-1)) & (<>SYS_l_CancelProcess#Current process:C322))
											QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Product_Code:2=GEN_at_Identity{$_l_CurrentRow}; *)
											$_l_CurrentRow:=$_l_CurrentRow+1
										End while 
										QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Product_Code:2=GEN_at_Identity{$_l_RecordsinSelection-1})
									Else 
										QUERY:C277([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Product_Code:2=GEN_at_Identity{2})
									End if 
								Else 
									QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=GEN_at_Identity{1})
								End if 
								Join_SelFast(->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1; ->[ORDERS:24]; ->[ORDERS:24]Order_Code:3)
								If (ch6=1)
									QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Forecast_Date:23=vFDateF; *)
									QUERY SELECTION:C341([ORDERS:24];  & ; [ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{1})
								Else 
									QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]State:15=<>SYS_at_RecStateCodes{24}{1})
								End if 
								
								If (Records in selection:C76([ORDERS:24])>0)
									FIRST RECORD:C50([ORDERS:24])
									While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
										
										RELATE ONE:C42([ORDERS:24]Company_Code:1)
										RELATE ONE:C42([ORDERS:24]Contact_Code:2)
										MCont_Add("")
										vDetails1:=vDetails
										MailP_LabCC(->vDesc1; ->vSubGroup1)
										// vTitle1:=[PRODUCTS]Model Code
										vTitle1:=Orders_ListVGB3
										NEXT RECORD:C51([ORDERS:24])
										If (DB_t_CurrentFormUsage2="1")
											Print form:C5([ORDERS:24]; "GB_Enq_Label")
											If (ch3=1)
												PAGE BREAK:C6
											End if 
										Else 
											If ([ORDERS:24]Company_Code:1#"")
												RELATE ONE:C42([ORDERS:24]Company_Code:1)
												RELATE ONE:C42([ORDERS:24]Contact_Code:2)
												MCont_Add("L")
												vDetails2:=vDetails
												MailP_LabCC(->vDesc2; ->vSubGroup2)
												vTitle2:=Orders_ListVGB3
												NEXT RECORD:C51([ORDERS:24])
												If ([ORDERS:24]Company_Code:1#"")
													RELATE ONE:C42([ORDERS:24]Company_Code:1)
													RELATE ONE:C42([ORDERS:24]Contact_Code:2)
													MCont_Add("L")
													vDetails3:=vDetails
													MailP_LabCC(->vDesc3; ->vSubGroup3)
													vTitle3:=Orders_ListVGB3
													NEXT RECORD:C51([ORDERS:24])
													If ([ORDERS:24]Company_Code:1#"")
														RELATE ONE:C42([ORDERS:24]Company_Code:1)
														RELATE ONE:C42([ORDERS:24]Contact_Code:2)
														MCont_Add("L")
														vDetails4:=vDetails
														MailP_LabCC(->vDesc4; ->vSubGroup4)
														vTitle4:=Orders_ListVGB3
														NEXT RECORD:C51([ORDERS:24])
													Else 
														vDetails4:=""
														vTitle4:=""
														vSubGroup4:=""
														vDesc4:=""
													End if 
												Else 
													vDetails3:=""
													vTitle3:=""
													vSubGroup3:=""
													vDesc3:=""
													vDetails4:=""
													vTitle4:=""
													vSubGroup4:=""
													vDesc4:=""
												End if 
											Else 
												vDetails2:=""
												vTitle2:=""
												vSubGroup2:=""
												vDesc2:=""
												vDetails3:=""
												vTitle3:=""
												vSubGroup3:=""
												vDesc3:=""
												vDetails4:=""
												vTitle4:=""
												vSubGroup4:=""
												vDesc4:=""
											End if 
											Print form:C5([DOCUMENTS:7]; "Mail_Label4/13")
											If (ch3=1)
												PAGE BREAK:C6
											End if 
										End if 
									End while 
									
								End if 
							End if 
							USE NAMED SELECTION:C332("$Sel")
							CLEAR NAMED SELECTION:C333("$Sel")
							NEXT RECORD:C51([ORDERS:24])
						End while 
						
						If (ch3=0)
							PAGE BREAK:C6
						End if 
					End if 
					
					UNLOAD RECORD:C212([ORDERS:24])
					READ ONLY:C145([ORDERS:24])
					
				End if 
			End if 
		End if 
		//****************  END $PRS  ********************
		
		If (ch2=1)
			Orders_ListVGB5
		End if 
		If (ch5=1)
			Orders_ListVGB6
		End if 
		If (ch4=1)
			Orders_ListVGB9
		End if 
		If (s1=1)
			Orders_ListVGBA
		End if 
		If (s2=1)
			Orders_ListVGBB
		End if 
		
		Close_ProWin
		
	End if 
End if 
ADR_l_UseQualifications:=0
ERR_MethodTrackerReturn("Orders_ListVGB"; $_t_oldMethodName)
