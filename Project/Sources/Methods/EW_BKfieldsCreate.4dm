//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_BKfieldsCreate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($i)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_BKfieldsCreate")
// EW_BKFieldsCreate
// Creates one record for each of the BK fields
// that data can be imported into
// 03/10/02 pb


// item related
For ($i; 1; 3)  // only 3 'cos C04 is reserved for daybook product code
	If ($i=1)
		//   [EW_BKFields]Description:="Unique item Code"
		// skip this dude
	Else 
		CREATE RECORD:C68([EW_BKFields:122])
		[EW_BKFields:122]FieldName:1:="C0"+String:C10($i)
		[EW_BKFields:122]Description:2:="Code "+String:C10($i)
		[EW_BKFields:122]Type:3:=Is alpha field:K8:1  //"Alpha"
		[EW_BKFields:122]FieldLength:5:=30
		[EW_BKFields:122]Group:4:="Items"
		DB_SaveRecord(->[EW_BKFields:122])
	End if 
End for 
For ($i; 1; 16)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="T0"+String:C10($i)
	[EW_BKFields:122]Description:2:="Text "+String:C10($i)
	[EW_BKFields:122]Type:3:=Is alpha field:K8:1  //"Alpha"
	[EW_BKFields:122]FieldLength:5:=80
	[EW_BKFields:122]Group:4:="Items"
	DB_SaveRecord(->[EW_BKFields:122])
End for 
For ($i; 1; 5)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="B0"+String:C10($i)
	[EW_BKFields:122]Description:2:="Boolean "+String:C10($i)
	[EW_BKFields:122]Type:3:=Is boolean:K8:9  //"Boolean"
	[EW_BKFields:122]Group:4:="Items"
	DB_SaveRecord(->[EW_BKFields:122])
End for 

If (False:C215)  // not using them here 26/08/03 pb
	For ($i; 1; 5)
		CREATE RECORD:C68([EW_BKFields:122])
		[EW_BKFields:122]FieldName:1:="L0"+String:C10($i)  // Family codes
		[EW_BKFields:122]Description:2:="Family Code "+String:C10($i)
		[EW_BKFields:122]Type:3:=Is alpha field:K8:1  //"Alpha"
		[EW_BKFields:122]FieldLength:5:=30
		[EW_BKFields:122]Group:4:="Items"
		DB_SaveRecord(->[EW_BKFields:122])
	End for 
	For ($i; 1; 5)
		CREATE RECORD:C68([EW_BKFields:122])
		[EW_BKFields:122]FieldName:1:="L0"+String:C10($i)+"_"  // Family label
		[EW_BKFields:122]Description:2:="Family Label "+String:C10($i)
		[EW_BKFields:122]Type:3:=Is alpha field:K8:1  //"Alpha"
		[EW_BKFields:122]FieldLength:5:=80
		[EW_BKFields:122]Group:4:="Items"
		DB_SaveRecord(->[EW_BKFields:122])
	End for 
End if 

For ($i; 1; 5)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="D0"+String:C10($i)  // Dates
	[EW_BKFields:122]Description:2:="Date "+String:C10($i)
	[EW_BKFields:122]Type:3:=Is date:K8:7  //"Date"
	[EW_BKFields:122]Group:4:="Items"
	DB_SaveRecord(->[EW_BKFields:122])
End for 
For ($i; 1; 5)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="R0"+String:C10($i)  // Dates
	[EW_BKFields:122]Description:2:="Real "+String:C10($i)
	[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
	[EW_BKFields:122]Group:4:="Items"
	DB_SaveRecord(->[EW_BKFields:122])
End for 
For ($i; 1; 5)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="M0"+String:C10($i)  // multiple data
	[EW_BKFields:122]Description:2:="Multiple Data "+String:C10($i)
	[EW_BKFields:122]Type:3:=Is text:K8:3
	[EW_BKFields:122]Group:4:="Items"
	DB_SaveRecord(->[EW_BKFields:122])
End for 
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="StNew"
[EW_BKFields:122]Description:2:="New status"
[EW_BKFields:122]Type:3:=Is boolean:K8:9  //"Boolean"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="StActive"
[EW_BKFields:122]Description:2:="Active status"
[EW_BKFields:122]Type:3:=Is boolean:K8:9  //"Boolean"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="WgItem"
[EW_BKFields:122]Description:2:="Item weight"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="VlItem"
[EW_BKFields:122]Description:2:="Item volume"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="QtStock"
[EW_BKFields:122]Description:2:="Quantity in stock"
[EW_BKFields:122]Type:3:=Is longint:K8:6  //"LongInt"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
For ($i; 1; 3)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="Text"+String:C10($i)
	[EW_BKFields:122]Description:2:="Description "+String:C10($i)
	[EW_BKFields:122]Type:3:=Is text:K8:3
	[EW_BKFields:122]Group:4:="Items"
	DB_SaveRecord(->[EW_BKFields:122])
End for 
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="PcItemVATRate"
[EW_BKFields:122]Description:2:="VAT percentage of item price"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="PrItemEXV"
[EW_BKFields:122]Description:2:="Item price without VAT"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="PrItemVAT"
[EW_BKFields:122]Description:2:="VAT amount of item price"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="PrItemINV"
[EW_BKFields:122]Description:2:="Total item price"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="PrSpecialEXV"
[EW_BKFields:122]Description:2:="Special offer price of item without VAT"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="PrSpecialVAT"
[EW_BKFields:122]Description:2:="VAT amount of special offer item price"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="PrSpecialINV"
[EW_BKFields:122]Description:2:="Total price of special offer item"
[EW_BKFields:122]Type:3:=Is real:K8:4  //"Real"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="StSpecialPrice"
[EW_BKFields:122]Description:2:="Special offer status"
[EW_BKFields:122]Type:3:=Is boolean:K8:9  //"Boolean"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="StStatus1"
[EW_BKFields:122]Description:2:="Status 1"
[EW_BKFields:122]Type:3:=Is boolean:K8:9  //"Boolean"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="StStatus2"
[EW_BKFields:122]Description:2:="Status 2"
[EW_BKFields:122]Type:3:=Is boolean:K8:9  //"Boolean"
[EW_BKFields:122]Group:4:="Items"
DB_SaveRecord(->[EW_BKFields:122])

If (False:C215)  // 26/08/03 pb
	For ($i; 1; 20)
		CREATE RECORD:C68([EW_BKFields:122])
		[EW_BKFields:122]FieldName:1:="Picture"+String:C10($i)
		[EW_BKFields:122]Description:2:="View "+String:C10($i)
		[EW_BKFields:122]Type:3:=Is alpha field:K8:1  //"Alpha"  ` File name.jpg in the Pictures sub-folder
		[EW_BKFields:122]FieldLength:5:=30
		[EW_BKFields:122]Group:4:="Items"
		DB_SaveRecord(->[EW_BKFields:122])
	End for 
End if 

For ($i; 1; 20)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="TextFile"+String:C10($i)
	[EW_BKFields:122]Description:2:="Text view "+String:C10($i)
	[EW_BKFields:122]Type:3:=Is text:K8:3  //"Text"  ` Text or File name.txt in the Pictures sub-folder
	[EW_BKFields:122]Group:4:="Items"
	DB_SaveRecord(->[EW_BKFields:122])
End for 

// Customer related
//CREATE RECORD([EW_BKFields])
//[EW_BKFields]FieldName:="CusCode"
//[EW_BKFields]Description:="login for the identified customer"  ` key field?????
//[EW_BKFields]Type:=Is Alpha Field
//[EW_BKFields]FieldLength:=80
//[EW_BKFields]Group:="Customers"
//DB_SaveRecord(->[EW_BKFields])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusPassword"
[EW_BKFields:122]Description:2:="Password"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=16
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusPasswordInfo"
[EW_BKFields:122]Description:2:="Password information label"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=60
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusLabel"
[EW_BKFields:122]Description:2:="Customer name"  // company name
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=80
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusTitle"
[EW_BKFields:122]Description:2:="Customer title (ex: Mr., Mrs.)"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=12
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusFirstName"
[EW_BKFields:122]Description:2:="Customer's first name"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=40
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusLastName"
[EW_BKFields:122]Description:2:="Customer's last name"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=60
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusPhone"
[EW_BKFields:122]Description:2:="Customer's telephone"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusFax"
[EW_BKFields:122]Description:2:="Customer's fax"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusMobile"
[EW_BKFields:122]Description:2:="Customer's mobile phone"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusEmail"
[EW_BKFields:122]Description:2:="Customer's email address"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=80
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusBirthDate"
[EW_BKFields:122]Description:2:="Customer's birth date"
[EW_BKFields:122]Type:3:=Is date:K8:7
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusStreetMain"
[EW_BKFields:122]Description:2:="Customer's street address"
[EW_BKFields:122]Type:3:=Is text:K8:3
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusZIPMain"
[EW_BKFields:122]Description:2:="Customer's main post code"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=12
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCityMain"
[EW_BKFields:122]Description:2:="Customer's main address city"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=60
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusStateMain"
[EW_BKFields:122]Description:2:="Customer's main address state/county"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCountryMain"
[EW_BKFields:122]Description:2:="Customer's main address country"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=45  // could not verify this
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusLabelShip"
[EW_BKFields:122]Description:2:="Receiver's name for delivery address"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=80
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusStreetShip"
[EW_BKFields:122]Description:2:="Delivery address"
[EW_BKFields:122]Type:3:=Is text:K8:3
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusZIPShip"
[EW_BKFields:122]Description:2:="Delivery address post code"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=12
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCityShip"
[EW_BKFields:122]Description:2:="Delivery address city"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=60
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusStateShip"
[EW_BKFields:122]Description:2:="Delivery address state/county"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCountryShip"
[EW_BKFields:122]Description:2:="Delivery address country"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=45  // not verified
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusLabelInvo"
[EW_BKFields:122]Description:2:="Label of billing address (ex: company name)"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=80
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusStreetInvo"
[EW_BKFields:122]Description:2:="Billing address"
[EW_BKFields:122]Type:3:=Is text:K8:3
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusZIPInvo"
[EW_BKFields:122]Description:2:="Billing address post code"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=12
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCityInvo"
[EW_BKFields:122]Description:2:="Billing address city"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=60
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusStateInvo"
[EW_BKFields:122]Description:2:="Billing address county/state"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20  //
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCountryInvo"
[EW_BKFields:122]Description:2:="Billing address country"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=45  // not verified
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusNuVAT"
[EW_BKFields:122]Description:2:="Customer's VAT number"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=40
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
For ($i; 1; 5)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="CusPersoA"+String:C10($i)
	[EW_BKFields:122]Description:2:="Personal field ("+String:C10($i)+")"
	[EW_BKFields:122]Type:3:=Is alpha field:K8:1
	[EW_BKFields:122]FieldLength:5:=80
	[EW_BKFields:122]Group:4:="Customers"
	DB_SaveRecord(->[EW_BKFields:122])
End for 
For ($i; 1; 5)
	CREATE RECORD:C68([EW_BKFields:122])
	[EW_BKFields:122]FieldName:1:="CusPersoN"+String:C10($i)
	[EW_BKFields:122]Description:2:="Personal field ("+String:C10($i)+")"
	[EW_BKFields:122]Type:3:=Is real:K8:4
	[EW_BKFields:122]Group:4:="Customers"
	DB_SaveRecord(->[EW_BKFields:122])
End for 
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCCKey"
[EW_BKFields:122]Description:2:="Credit card information (encrypted)"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCCExpDate"
[EW_BKFields:122]Description:2:="Credit card exp. date (encrypted)"
[EW_BKFields:122]Type:3:=Is text:K8:3
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCCNameOnCard"
[EW_BKFields:122]Description:2:="Name on credit card (encrypted)"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=80  // actually seems to be a text field but that seems stupid
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCCZipCode"
[EW_BKFields:122]Description:2:="Credit card post code (encrypted)"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20  // also appears to be a text field in the BK
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
CREATE RECORD:C68([EW_BKFields:122])
[EW_BKFields:122]FieldName:1:="CusCCType"
[EW_BKFields:122]Description:2:="Credit card type (encrypted)"
[EW_BKFields:122]Type:3:=Is alpha field:K8:1
[EW_BKFields:122]FieldLength:5:=20  // also seems ot be a text field
[EW_BKFields:122]Group:4:="Customers"
DB_SaveRecord(->[EW_BKFields:122])
ERR_MethodTrackerReturn("EW_BKfieldsCreate"; $_t_oldMethodName)