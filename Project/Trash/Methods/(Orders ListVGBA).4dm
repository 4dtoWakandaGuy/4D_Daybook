//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_ListVGBA
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Index; $_l_OK; vNo1; vNo2)
	C_REAL:C285(vSubtotal; vTotal)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6; vTitle7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGBA")
//Orders_ListVGBA with arrays

Gen_Confirm("Are you ready to print the General Control Sheet?"; "Yes"; "No")
If (OK=1)
	
	Orders_ListVGB4
	If (OK=1)
		$_l_OK:=PRINT_SetSIZE("A4"; "P"; "GeneralControlSheet")
		// PAGE SETUP([ORDERS];"GB GenCon Hdr")
		//PRINT SETTINGS
		If ($_l_OK>=0)
			//  START TRANSACTION
			StartTransaction  // 13/05/02 pb
			
			READ WRITE:C146([ORDER_ITEMS:25])
			MESSAGES OFF:C175
			vTitle1:="General Control Sheet"
			Print form:C5([ORDERS:24]; "GB GenCon Hdr")
			
			RELATE MANY SELECTION:C340([ORDER_ITEMS:25]Order_Code:1)
			QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_ListVGB7)
			
			ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2; >)
			vTotal:=0
			vSubtotal:=0
			FIRST RECORD:C50([ORDER_ITEMS:25])
			
			While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
				$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
				$_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
				
				CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$OISel")
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_ProductCode; *)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1#$_t_OrderCode)
				vNo2:=Records in selection:C76([ORDER_ITEMS:25])
				vSubtotal:=vSubtotal+vNo2
				QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Received_Date:21=!00-00-00!)
				vNo1:=Records in selection:C76([ORDER_ITEMS:25])
				If (vNo1>0)
					vTotal:=vTotal+vNo1
					If (Not:C34(In transaction:C397))
						DB_lockFile(->[ORDER_ITEMS:25])
						APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Received_Date:21:=<>DB_d_CurrentDate)
						
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					Else 
						FIRST RECORD:C50([ORDER_ITEMS:25])
						For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
							[ORDER_ITEMS:25]Received_Date:21:=<>DB_d_CurrentDate
							DB_SaveRecord(->[ORDER_ITEMS:25])
							AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
							NEXT RECORD:C51([ORDER_ITEMS:25])
						End for 
					End if 
					
					USE NAMED SELECTION:C332("$OISel")
					
					RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
					vTitle4:=[PRODUCTS:9]Model_Code:5
					vTitle5:=[ORDER_ITEMS:25]Product_Name:13
					vTitle6:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4
					RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
					RELATE ONE:C42([ORDERS:24]Company_Code:1)
					vTitle3:=[COMPANIES:2]Their_Account_Number:48
					vTitle2:=[COMPANIES:2]Company_Name:2
					RELATE ONE:C42([ORDERS:24]Contact_Code:2)
					vTitle7:=CON_BuildContactNameandJobTitle
					
					Print form:C5([ORDERS:24]; "GB GenCon Det")
				Else 
					USE NAMED SELECTION:C332("$OISel")
				End if 
				
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End while 
			
			Print form:C5([ORDERS:24]; "GB GenCon Ftr")
			PAGE BREAK:C6
			PRT_SetPrinterPaperOptions("GeneralControlSheet")  //NG June 2005
			If ((OK=1) & (<>SYS_l_CancelProcess#Current process:C322))
				Gen_Confirm("Do you want to update these Order Items as printed?"; "Yes"; "No")
				Transact_End
			End if 
			MESSAGES ON:C181
			UNLOAD RECORD:C212([ORDER_ITEMS:25])
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Orders_ListVGBA"; $_t_oldMethodName)
