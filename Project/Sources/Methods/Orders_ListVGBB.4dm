//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ListVGBB
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
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_RecordsinSelection; s3; vNo)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; vDetails; vRec; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ListVGBB")
//Orders_ListVGBB

Gen_Confirm("Are you ready to export the Past Enquiries?"; "Yes"; "No")
If (OK=1)
	
	Orders_ListVGB4
	If (OK=1)
		SET CHANNEL:C77(12; "")
		If (OK=1)
			vRec:=Char:C90(13)
			
			CREATE EMPTY SET:C140([ORDERS:24]; "OrMaster")
			FIRST RECORD:C50([ORDERS:24])
			While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
				$_t_OrderCode:=[ORDERS:24]Order_Code:3
				CUT NAMED SELECTION:C334([ORDERS:24]; "$ORSel")  //inserted
				
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)
				QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Orders_ListVGB7)
				$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
				vAmount:=[ORDERS:24]Total_Amount:6/$_l_RecordsinSelection
				ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2; >)
				
				FIRST RECORD:C50([ORDER_ITEMS:25])
				While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
					
					$_t_ProductCode:=[ORDER_ITEMS:25]Product_Code:2
					//  RELATE ONE([ORDER ITEMS]Product Code)
					
					CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$OISel")
					//cut
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_ProductCode; *)
					QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Order_Code:1#$_t_OrderCode)
					
					FIRST RECORD:C50([ORDER_ITEMS:25])
					While ((Not:C34(End selection:C36([ORDER_ITEMS:25]))) & (<>SYS_l_CancelProcess#Current process:C322))
						
						RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
						If (s3=1)
							If ([ORDERS:24]Comments:14#"")
								ADD TO SET:C119([ORDERS:24]; "OrMaster")
							End if 
						Else 
							ADD TO SET:C119([ORDERS:24]; "OrMaster")
						End if 
						
						NEXT RECORD:C51([ORDER_ITEMS:25])
					End while 
					
					USE NAMED SELECTION:C332("$OISel")
					//Cut
					
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End while 
				USE NAMED SELECTION:C332("$ORSel")  //inserted
				NEXT RECORD:C51([ORDERS:24])
			End while 
			
			USE SET:C118("OrMaster")
			ORDER BY:C49([ORDERS:24]; [ORDERS:24]Company_Code:1; >; [ORDERS:24]Order_Code:3; >)
			FIRST RECORD:C50([ORDERS:24])
			While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#Current process:C322))
				RELATE ONE:C42([ORDERS:24]Company_Code:1)
				RELATE ONE:C42([ORDERS:24]Contact_Code:2)
				
				Letter_Details
				SEND PACKET:C103(vDetails)
				If (Substring:C12(vDetails; Length:C16(vDetails); 1)#vRec)
					SEND PACKET:C103(vRec)
				End if 
				If ([CONTACTS:1]Status:14#"")
					RELATE ONE:C42([CONTACTS:1]Status:14)
				Else 
					RELATE ONE:C42([COMPANIES:2]Status:12)
				End if 
				If ([STATUS:4]Status_Name:2#"")
					vType:=[STATUS:4]Status_Name:2
				Else 
					vType:=[COMPANIES:2]Status:12
				End if 
				SEND PACKET:C103("Type of Business: "+vType+vRec)
				If ([ORDERS:24]Comments:14#"")
					SEND PACKET:C103("Current Projects: "+[ORDERS:24]Comments:14)
					If ((Substring:C12([ORDERS:24]Comments:14; Length:C16([ORDERS:24]Comments:14); 1))#vRec)
						SEND PACKET:C103(vRec)
					End if 
				End if 
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
				vNo:=Records in selection:C76([ORDER_ITEMS:25])
				If (vNo=1)
					SEND PACKET:C103("Only enquiry on card"+vRec)
				Else 
					If (vNo<6)
						SEND PACKET:C103(String:C10(vNo)+" enquiries on card"+vRec)
					End if 
				End if 
				If ([ORDER_ITEMS:25]Purchase_Order_Number:18="R@")
					SEND PACKET:C103("Representative to call"+vRec)
				End if 
				SEND PACKET:C103(vRec)
				NEXT RECORD:C51([ORDERS:24])
			End while 
			
		End if 
		SET CHANNEL:C77(11)
	End if 
End if 
CLEAR SET:C117("OrMaster")
ERR_MethodTrackerReturn("Orders_ListVGBB"; $_t_oldMethodName)
