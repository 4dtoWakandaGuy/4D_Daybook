If (False:C215)
	//object Name: [INVOICES]Invoices_In.oStdAddressModButton
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
	C_LONGINT:C283(baddressModify; INV_l_AdhocMod)
	C_TEXT:C284($_t_oldMethodName; INV_t_AddressLine1; INV_t_AddressLine1_OLD; INV_t_AddressLine2; INV_t_AddressLine2_OLD; INV_t_Country; INV_t_Country_OLD; INV_t_County; INV_t_County_OLD; INV_t_PostalCode; INV_t_PostalCode_OLD)
	C_TEXT:C284(INV_t_Town; INV_t_Town_OLD)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.oStdAddressModButton"; Form event code:C388)

Gen_Confirm("Are you sure you want to edit the delivery address for this Invoice. Note this wi"+"ll"+" not updat"+"e the address for the contact or company"; "Yes"; "No")
If (OK=1)
	OBJECT SET VISIBLE:C603([INVOICES:39]Deliver_To:32; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; False:C215)
	
	INV_l_AdhocMod:=1
	INV_t_AddressLine1:=""
	INV_t_AddressLine2:=""
	INV_t_Town:=""
	INV_t_County:=""
	INV_t_PostalCode:=""
	INV_t_Country:=""
	OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; True:C214)
	OBJECT SET VISIBLE:C603(baddressModify; False:C215)
	If ([INVOICES:39]x_DeliveryAddressID:48>0)
		//Modify
		QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[INVOICES:39]x_DeliveryAddressID:48)
		If (Records in selection:C76([AddressRecords:125])>0)
			INV_t_AddressLine1:=[AddressRecords:125]AddressLine1:6
			INV_t_AddressLine2:=[AddressRecords:125]AddressLine2:7
			INV_t_Town:=[AddressRecords:125]Town_City:8
			INV_t_County:=[AddressRecords:125]County_State:9
			INV_t_PostalCode:=[AddressRecords:125]Postal_Code:10
			INV_t_Country:=[AddressRecords:125]Country:11
		Else 
			
			INV_t_AddressLine1:=INV_t_AddressLine1_OLD
			INV_t_AddressLine2:=INV_t_AddressLine2_OLD
			INV_t_Town:=INV_t_Town_OLD
			INV_t_County:=INV_t_County_OLD
			INV_t_PostalCode:=INV_t_PostalCode_OLD
			INV_t_Country:=INV_t_Country_OLD
			
		End if 
		GOTO OBJECT:C206(INV_t_AddressLine1)
		
	Else 
		INV_t_AddressLine1:=""
		INV_t_AddressLine2:=""
		INV_t_Town:=""
		INV_t_County:=""
		INV_t_PostalCode:=""
		INV_t_Country:=""
		GOTO OBJECT:C206(INV_t_AddressLine1)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Orders_In,baddressModify"; $_t_oldMethodName)
