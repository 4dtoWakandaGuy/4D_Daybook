If (False:C215)
	//object Name: [ORDERS]Orders_In.Variable26
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(baddressModify; ORD_l_AdhocMod)
	C_TEXT:C284($_t_oldMethodName; ORD_t_AddressLine1; ORD_t_AddressLine1_OLD; ORD_t_AddressLine2; ORD_t_AddressLine2_OLD; ORD_t_Country; ORD_t_Country_OLD; ORD_t_County; ORD_t_County_OLD; ORD_t_PostalCode; ORD_t_PostalCode_OLD)
	C_TEXT:C284(ORD_t_Town; ORD_t_Town_OLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.Variable26"; Form event code:C388)

Gen_Confirm("Are you sure you want to edit the delivery address for this order. Note this will"+" not updat"+"e the address for the contact or company"; "Yes"; "No")
If (OK=1)
	OBJECT SET VISIBLE:C603([ORDERS:24]Deliver_To:31; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; False:C215)
	ORD_l_AdhocMod:=1
	ORD_t_AddressLine1:=""
	ORD_t_AddressLine2:=""
	ORD_t_Town:=""
	ORD_t_County:=""
	ORD_t_PostalCode:=""
	ORD_t_Country:=""
	OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; True:C214)
	OBJECT SET VISIBLE:C603(baddressModify; False:C215)
	If ([ORDERS:24]X_DeliveryAddressID:59>0)
		//Modify
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[ORDERS:24]X_DeliveryAddressID:59)
		If (Records in selection:C76([AddressRecords:125])>0)
			ORD_t_AddressLine1:=[AddressRecords:125]AddressLine1:6
			ORD_t_AddressLine2:=[AddressRecords:125]AddressLine2:7
			ORD_t_Town:=[AddressRecords:125]Town_City:8
			ORD_t_County:=[AddressRecords:125]County_State:9
			ORD_t_PostalCode:=[AddressRecords:125]Postal_Code:10
			ORD_t_Country:=[AddressRecords:125]Country:11
		Else 
			
			ORD_t_AddressLine1:=ORD_t_AddressLine1_OLD
			ORD_t_AddressLine2:=ORD_t_AddressLine2_OLD
			ORD_t_Town:=ORD_t_Town_OLD
			ORD_t_County:=ORD_t_County_OLD
			ORD_t_PostalCode:=ORD_t_PostalCode_OLD
			ORD_t_Country:=ORD_t_Country_OLD
			
		End if 
		GOTO OBJECT:C206(ORD_t_AddressLine1)
		
	Else 
		ORD_t_AddressLine1:=""
		ORD_t_AddressLine2:=""
		ORD_t_Town:=""
		ORD_t_County:=""
		ORD_t_PostalCode:=""
		ORD_t_Country:=""
		GOTO OBJECT:C206(ORD_t_AddressLine1)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDERS].Orders_In.Variable26"; $_t_oldMethodName)
