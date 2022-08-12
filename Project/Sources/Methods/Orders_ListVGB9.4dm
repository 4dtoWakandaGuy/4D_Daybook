//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ListVGB9
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_OK; vNo)
	C_REAL:C285(vSubtotal)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGB9")

Gen_Confirm("Are you ready to print the Master Control Sheet?"; "Yes"; "No")
If (OK=1)
	
	Orders_ListVGB4
	If (OK=1)
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "MasterControlSheet")
		
		//  PAGE SETUP([ORDERS];"GB_MasCon_Hdr")
		//PRINT SETTINGS
		If ($_l_OK>=0)
			vTitle1:="Master Control Sheet"
			Print form:C5([ORDERS:24]; "GB_MasCon_Hdr")
			
			RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
			QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_ListVGB7)
			
			ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2; >)
			vSubtotal:=0
			FIRST RECORD:C50([ORDER_ITEMS:25])
			While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
				$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
				$_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
				RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
				vTitle4:=[PRODUCTS:9]Model_Code:5
				vTitle5:=[ORDER_ITEMS:25]Product_Name:13
				vTitle6:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4
				RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
				vTitle3:=[COMPANIES:2]Their_Account_Number:48
				vTitle2:=[COMPANIES:2]Company_Name:2
				
				CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$OISel")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_ProductCode; *)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1#$_t_OrderCode)
				vNo:=Records in selection:C76([ORDER_ITEMS:25])
				vSubtotal:=vSubtotal+vNo
				Print form:C5([ORDERS:24]; "GB_MasCon_Det")
				USE NAMED SELECTION:C332("$OISel")
				
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End while 
			Print form:C5([ORDERS:24]; "GB_MasCon_Ftr")
			PAGE BREAK:C6
			PRT_SetPrinterPaperOptions("MasterControlSheet")
			//NG June 2005
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Orders_ListVGB9"; $_t_oldMethodName)
