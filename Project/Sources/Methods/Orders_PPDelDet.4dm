//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPDelDet
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
	C_TEXT:C284($_t_oldMethodName; Vdetails)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPDelDet")
Case of 
	: ([ORDERS:24]X_DeliveryAddressID:59>0)
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[ORDERS:24]X_DeliveryAddressID:59)
		Vdetails:=[AddressRecords:125]FormattedAddress:12
	: ([ORDERS:24]Deliver_To:31#"")
		vDetails:=[ORDERS:24]Deliver_To:31
	Else 
		If ([ORDERS:24]Delivery_Company:29#"")
			RELATE ONE:C42([ORDERS:24]Delivery_Company:29)
			RELATE ONE:C42([ORDERS:24]Delivery_Contact:30)
		Else 
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		End if 
		Letter_Details
End case 
ERR_MethodTrackerReturn("Orders_PPDelDet"; $_t_oldMethodName)