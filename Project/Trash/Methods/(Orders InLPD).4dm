//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 16:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ORD_bo_ItemsModified; ORD_bo_OrderModified)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber; vALLevels)
	C_POINTER:C301($_ptr_FocusObject; $1)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vStPrev; vStPrevOLD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPD")
//Orders_InLPD
Gen_ChkMod2
If (Count parameters:C259>=1)
	$_ptr_FocusObject:=$1
	
Else 
	$_ptr_FocusObject:=Focus object:C278
	
End if 
RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
If ($_l_TableNumber>0)
	//$_ptr_Field:=Field($_l_TableNumber;$_l_FieldNumber)
Else 
	
	//$_ptr_Field:=Nil
End if 
If (False:C215)
	
Else 
	Case of 
		: ($_l_TableNumber=Table:C252(->[ORDERS:24]))
			
			Case of 
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Comments:14))
					
					Orders_InLPX(->[ORDERS:24]Comments:14)
					ORD_bo_OrderModified:=True:C214
					
					
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Contact_Code:2))
					Orders_InLPX(->[ORDERS:24]Contact_Code:2)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Order_Code:3))
					Orders_InLPX(->[ORDERS:24]Order_Code:3)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Company_Code:1))
					
					Orders_InLPX(->[ORDERS:24]Company_Code:1)
					
					If ([ORDERS:24]Company_Code:1#"")
						Orders_InLPX(->[ORDERS:24]Contact_Code:2)
					End if 
					
					
					
					
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Enquiry_Date:25))
					Orders_InLPX(->[ORDERS:24]Enquiry_Date:25)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Quotation_Date:26))
					Orders_InLPX(->[ORDERS:24]Quotation_Date:26)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Order_Date:4))
					Orders_InLPX(->[ORDERS:24]Order_Date:4)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Order_Period:42))
					Orders_InLPX(->[ORDERS:24]Order_Period:42)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Source:18))
					Orders_InLPX(->[ORDERS:24]Source:18)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Order_Type:43))
					Orders_InLPX(->[ORDERS:24]Order_Type:43)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Person:5))
					Orders_InLPX(->[ORDERS:24]Person:5)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Taken_By:17))
					Orders_InLPX(->[ORDERS:24]Taken_By:17)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Comments:14))
					Orders_InLPX(->[ORDERS:24]Comments:14)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Your_Order_Number:10))
					Orders_InLPX(->[ORDERS:24]Your_Order_Number:10)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Delivery_Company:29))
					Orders_InLPX(->[ORDERS:24]Delivery_Company:29)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Delivery_Contact:30))
					Orders_InLPX(->[ORDERS:24]Delivery_Contact:30)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Deliver_To:31))
					Orders_InLPX(->[ORDERS:24]Deliver_To:31)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Currency_Code:32))
					Orders_InLPX(->[ORDERS:24]Currency_Code:32)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Delivery_Terms:52))
					Orders_InLPX(->[ORDERS:24]Delivery_Terms:52)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Shipping_Agent:41))
					Orders_InLPX(->[ORDERS:24]Shipping_Agent:41)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Analysis_Code:33))
					Orders_InLPX(->[ORDERS:24]Analysis_Code:33)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Area_Code:35))
					Orders_InLPX(->[ORDERS:24]Area_Code:35)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Tax_Rate:34))
					Orders_InLPX(->[ORDERS:24]Tax_Rate:34)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Layer_Code:47))
					Orders_InLPX(->[ORDERS:24]Layer_Code:47)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Credit_Card_No:49))
					Orders_InLPX(->[ORDERS:24]Credit_Card_No:49)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]CC_Expiry:50))
					Orders_InLPX(->[ORDERS:24]CC_Expiry:50)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]CC_Valid_From:53))
					Orders_InLPX(->[ORDERS:24]CC_Valid_From:53)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]CC_Issue_No:54))
					Orders_InLPX(->[ORDERS:24]CC_Issue_No:54)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]CC_Address:51))
					Orders_InLPX(->[ORDERS:24]CC_Address:51)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]State:15))
					If (vStPrev<[ORDERS:24]State:15) & (DB_t_CurrentFormUsage#"NONE")
						Order_TitCheck(vStPrev)
					End if 
					Orders_InLPX(->[ORDERS:24]State:15)
					vStPrev:=[ORDERS:24]State:15
					vStPrevOLD:=[ORDERS:24]State:15
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Delivery_Method:19))
					Orders_InLPX(->[ORDERS:24]Delivery_Method:19)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Terms:16))
					Orders_InLPX(->[ORDERS:24]Terms:16)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Required_Date:9))
					Orders_InLPX(->[ORDERS:24]Required_Date:9)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Forecast_Date:23))
					Orders_InLPX(->[ORDERS:24]Forecast_Date:23)
					ORD_bo_OrderModified:=True:C214
				: ($_l_FieldNumber=Field:C253(->[ORDERS:24]Forecast_PC:22))
					Orders_InLPX(->[ORDERS:24]Forecast_PC:22)
					ORD_bo_OrderModified:=True:C214
			End case 
		Else 
			Case of 
				: (vTot=1)
					vTot:=0
					If (vALLevels#0)
						Orders_InLPOI  //this is here for the AL Pro method only
						ORD_bo_OrderModified:=True:C214
					Else 
						Orders_InLPTot  //this is done within the above
						ORD_bo_OrderModified:=True:C214
					End if 
					If ([ORDERS:24]Credit_Card_No:49#"")
						[ORDERS:24]CC_Auth:56:="Required"
						ORD_bo_OrderModified:=True:C214
					End if 
				: (vTot=2)
					vTot:=0
					REDRAW:C174([ORDER_ITEMS:25])
			End case 
	End case 
End if 
ERR_MethodTrackerReturn("Orders_InLPD"; $_t_oldMethodName)