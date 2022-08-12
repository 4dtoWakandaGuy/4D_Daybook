//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_ListVGB6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 15:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_OK; $_l_RecordsinSelection; vNo)
	C_REAL:C285(vAmount; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_CompanyCode; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; vTitle7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB6")

Gen_Confirm("Are you ready to print the Cost per Enquiry Report?"; "Yes"; "No")
If (OK=1)
	
	Orders_ListVGB4
	If (OK=1)
		$_l_OK:=PRINT_SetSIZE("A4"; "L"; "CostEnquiry")
		// PAGE SETUP([ORDERS];"GB EnqCost Hdr")
		//   PRINT SETTINGS
		If ($_l_OK>=0)
			ORDER BY:C49([ORDERS:24]; [ORDERS:24]Company_Code:1; >; [ORDERS:24]Order_Code:3; >)
			
			FIRST RECORD:C50([ORDERS:24])
			While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
				$_t_CompanyCode:=[ORDERS:24]Company_Code:1
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
				vTitle1:=[COMPANIES:2]Company_Name:2+" - Advertisements placed with Specifier Review"
				Print form:C5([ORDERS:24]; "GB EnqCost Hdr")
				vTotal:=0
				vSubtotal:=0
				
				While ((Not:C34(End selection:C36([ORDERS:24]))) & ($_t_CompanyCode=[ORDERS:24]Company_Code:1) & (<>SYS_l_CancelProcess#Current process:C322))
					$_t_OrderCode:=[ORDERS:24]Order_Code:3
					
					COPY NAMED SELECTION:C331([ORDERS:24]; "$OSel")
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
					QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_ListVGB8)
					RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
					vTitle7:=[PRODUCTS:9]Model_Code:5
					
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
					QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_ListVGB7)
					$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
					vAmount:=[ORDERS:24]Total_Amount:6/$_l_RecordsinSelection
					ORDER BY:C49([ORDER_ITEMS:25]Product_Code:2; >)
					
					FIRST RECORD:C50([ORDER_ITEMS:25])
					While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
						
						$_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
						RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
						vTitle2:=[ORDER_ITEMS:25]Product_Name:13
						vTitle3:=[PRODUCTS:9]Model_Code:5
						RELATE ONE:C42([PRODUCTS:9]Group_Code:3)
						vTitle4:=[PRODUCT_GROUPS:10]Group_Name:2
						RELATE ONE:C42([PRODUCTS:9]Brand_Code:4)
						vTitle5:=vTitle4+" "+[PRODUCT_BRANDS:8]Brand_Name:2
						vDate:=[ORDERS:24]Order_Date:4
						
						CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$OISel")
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_ProductCode; *)
						QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1#$_t_OrderCode)
						vNo:=Records in selection:C76([ORDER_ITEMS:25])
						vSubtotal:=vSubtotal+vNo
						vTotal:=vTotal+vAmount
						
						Print form:C5([ORDERS:24]; "GB EnqCost Det")
						
						USE NAMED SELECTION:C332("$OISel")
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End while 
					
					USE NAMED SELECTION:C332("$OSel")
					NEXT RECORD:C51([ORDERS:24])
				End while 
				
				vVAT:=vTotal/vSubtotal
				Print form:C5([ORDERS:24]; "GB EnqCost Ftr")
				PAGE BREAK:C6
				PRT_SetPrinterPaperOptions("CostEnquiry")
				//NG June 2005
			End while 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Orders_ListVGB6"; $_t_oldMethodName)
