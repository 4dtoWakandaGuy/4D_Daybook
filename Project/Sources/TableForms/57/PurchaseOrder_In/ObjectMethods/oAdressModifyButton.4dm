If (False:C215)
	//object Name: [PURCHASE_ORDERS]PurchaseOrder_In.Variable26
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 20:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(baddressModify; PO_l_AdhocMod)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName; PO_t_AddressLine1; PO_t_AddressLine1OLD; PO_t_AddressLine2; PO_t_AddressLine2OLD)
	C_TEXT:C284(PO_t_Country; PO_t_CountryOLD; PO_t_County; PO_t_CountyOLD; PO_t_PostalCode; PO_t_PostalCodeOLD; PO_t_Town; PO_t_TownOLD; PO_t_DeliveryAddress)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.Variable26"; Form event code:C388)
Gen_Confirm("Are you sure you want to edit the delivery address for this Purchase order. Note "+"this will"+" not updat"+"e the address for the contact or company"; "Yes"; "No")
If (OK=1)
	OBJECT SET VISIBLE:C603(PO_t_DeliveryAddress; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; False:C215)
	PO_l_AdhocMod:=1
	PO_t_AddressLine1:=""
	PO_t_AddressLine2:=""
	PO_t_Town:=""
	PO_t_County:=""
	PO_t_PostalCode:=""
	PO_t_Country:=""
	DB_t_Address1Label:=<>DB_t_Address1Label
	DB_t_Address2Label:=<>DB_t_Address2Label
	DB_t_TownLabel:=<>DB_t_TownLabel
	DB_t_CountyLabel:=<>DB_t_CountyLabel
	DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
	DB_t_CountryLabel:=<>DB_t_CountryLabel
	OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; True:C214)
	OBJECT SET VISIBLE:C603(baddressModify; False:C215)
	If ([ORDERS:24]X_DeliveryAddressID:59>0)
		//Modify
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[ORDERS:24]X_DeliveryAddressID:59)
		If (Records in selection:C76([AddressRecords:125])>0)
			PO_t_AddressLine1:=[AddressRecords:125]AddressLine1:6
			PO_t_AddressLine2:=[AddressRecords:125]AddressLine2:7
			PO_t_Town:=[AddressRecords:125]Town_City:8
			PO_t_County:=[AddressRecords:125]County_State:9
			PO_t_PostalCode:=[AddressRecords:125]Postal_Code:10
			PO_t_Country:=[AddressRecords:125]Country:11
		Else 
			
			PO_t_AddressLine1:=PO_t_AddressLine1OLD
			PO_t_AddressLine2:=PO_t_AddressLine2OLD
			PO_t_Town:=PO_t_TownOLD
			PO_t_County:=PO_t_CountyOLD
			PO_t_PostalCode:=PO_t_PostalCodeOLD
			PO_t_Country:=PO_t_CountryOLD
			
		End if 
		GOTO OBJECT:C206(PO_t_AddressLine1)
		
	Else 
		PO_t_AddressLine1:=""
		PO_t_AddressLine2:=""
		PO_t_Town:=""
		PO_t_County:=""
		PO_t_PostalCode:=""
		PO_t_Country:=""
		If ([COMPANIES:2]Company_Code:1#[PURCHASE_ORDERS:57]Deliver_to_Company:6)
			RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
		End if 
		
		PO_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
		PO_t_AddressLine2:=[COMPANIES:2]Address_Line_two:4
		PO_t_Town:=[COMPANIES:2]Town_or_City:5
		PO_t_County:=[COMPANIES:2]County_or_State:6
		PO_t_PostalCode:=[COMPANIES:2]Postal_Code:7
		PO_t_Country:=[COMPANIES:2]Country:8
		GOTO OBJECT:C206(PO_t_AddressLine1)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].PurchaseOrder_In.Variable26"; $_t_oldMethodName)
