//%attributes = {}

If (False:C215)
	//Database Method Name:      AA_JUNK6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/07/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CompanyAddresses)
	//C_UNKNOWN(CompanyCodes)
	//C_UNKNOWN(CompanyPrivate)
	//C_UNKNOWN(contactCode)
	//C_UNKNOWN(ContactName)
	ARRAY BOOLEAN:C223($_abo_CompanyPrivate; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_CompanyAddresses; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_ValidPicTypes; 0)
	C_COLLECTION:C1488($_col_CompanyAddresses; $_col_CompanyCodes; $_col_CompanyPrivate)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_OBJECT:C1216($_obj_Address)
	C_TEXT:C284($_t_addAddress; $_t_AddressType; $_t_ContactCode; $_t_oldMethodName)
End if 
//Code Starts Here
If (False:C215)  // ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 28/02/2013 00:58
	//Method Name: AA_JUNK6
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	
	//End Project method Amendments
End if 
$_t_oldMethodName:=ERR_MethodTracker("AA_JUNK6")
//Next stage
//1) apply this to all records
//2 Get Daybook data and test on there-what about phantom and VAT accounts?
//3 validate against  the whole data base
//4)  //set a live profit from preference -only apply the live profit calculation to that data and in reality only populate the transactions from that data
//5  // -make sure we can create and keep editing a batch of the correct type-this need to be hidden from the user-post to a dummy layer until closed
//6  //do the same for the profit brought forward

//POItemsReceived

//Point 4 is done
//The following code compares the Profit Posted accounts with transaction for the same period(without putting the filler on)
QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2="1189")
$_t_ContactCode:=[CONTACTS:1]Contact_Code:2
$_t_AddressType:=""
QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=$_t_ContactCode; *)
QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
If ($_t_AddressType#"")
	QUERY SELECTION:C341([CONTACTS_COMPANIES:145]Address_Type:2=$_t_AddressType)
End if 
SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Company_Code:1; $_at_CompanyCodes)

QUERY WITH ARRAY:C644([COMPANIES:2]Company_Code:1; $_at_CompanyCodes)
SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; $_at_CompanyCodes; [COMPANIES:2]Private:37; $_abo_CompanyPrivate; [COMPANIES:2]ADDRESS:60; $_at_CompanyAddresses)
If ($_t_addAddress#"")
	If (Find in array:C230($_at_CompanyCodes; $_t_addAddress)<0)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_addAddress)
		If (Records in selection:C76([COMPANIES:2])>0)
			APPEND TO ARRAY:C911($_at_CompanyCodes; [COMPANIES:2]Company_Code:1)
			APPEND TO ARRAY:C911($_abo_CompanyPrivate; [COMPANIES:2]Private:37)
			APPEND TO ARRAY:C911($_at_CompanyAddresses; [COMPANIES:2]ADDRESS:60)
		End if 
	End if 
End if 


$_obj_Address:=New object:C1471
C_COLLECTION:C1488($_col_CompanyCodes; $_col_CompanyPrivate; $_col_CompanyAddresses)
$_Obj_address.ContactName:=[CONTACTS:1]Contact_Name:31
$_col_CompanyCodes:=New collection:C1472
$_col_CompanyPrivate:=New collection:C1472
$_col_CompanyAddresses:=New collection:C1472

ARRAY TO COLLECTION:C1563($_col_CompanyCodes; $_at_CompanyCodes)
ARRAY TO COLLECTION:C1563($_col_CompanyPrivate; $_abo_CompanyPrivate)
ARRAY TO COLLECTION:C1563($_col_CompanyAddresses; $_at_CompanyAddresses)

//OB SET ARRAY($_Obj_address;"CompanyCodes";$_at_CompanyCodes)
$_obj_Address.contactCode:=$_t_ContactCode
$_obj_address.CompanyCodes:=$_col_CompanyCodes
$_obj_address.CompanyPrivate:=$_col_CompanyPrivate
//OB SET ARRAY($_Obj_address;"CompanyPrivate";$_abo_CompanyPrivate)

$_obj_Address.CompanyAddresses:=$_col_CompanyAddresses
//OB SET ARRAY($_Obj_address;"CompanyAddresses";$_at_CompanyAddresses)

WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
DIALOG:C40("DB_ManageAddresses"; $_obj_Address)
CLOSE WINDOW:C154(WIN_l_CurrentWinRef)
OB GET PROPERTY NAMES:C1232($_obj_Address; $_at_Properties; $_al_PropertyTypes)

TRACE:C157


ERR_MethodTrackerReturn("AA_JUNK6"; $_t_oldMethodName)
