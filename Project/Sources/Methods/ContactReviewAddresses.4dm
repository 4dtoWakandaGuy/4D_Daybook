//%attributes = {}

If (False:C215)
	//Project Method Name:      ContactReviewAddresses
	//------------------ Method Notes ------------------
	//The purpose fo this is to allow addresses on a contact to be reviewed;
	//$1 is an address type for example home-this will allow you to only display associated address of a given type. Pass blank for all types
	
	//$2 is the contact code
	//$2 is an Company code you are trying to add.(optional)
	
	
	
	//------------------ Revision Control ----------------
	//Date Created:  20/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	ARRAY BOOLEAN:C223($_abo_CompanyPrivate; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_CompanyAddresses; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	ARRAY TEXT:C222($_at_DeletedCodes; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	C_BOOLEAN:C305($_bo_AddAddress)
	C_COLLECTION:C1488($_col_CompanyAddresses; $_col_CompanyCodes; $_col_CompanyPrivate)
	C_LONGINT:C283($_l_windowLeft; $_l_WindowTop; $4; $5; WIN_l_CurrentWinRef)
	C_OBJECT:C1216($_obj_Address; $_obj_AddressI)
	C_TEXT:C284($_t_addAddress; $_t_AddressType; $_t_AddressType_; $_t_ContactCode; $1; $2; $3)
End if 
//Code Starts Here
If (Count parameters:C259>=2)
	$_t_AddressType:=$1
	$_t_ContactCode:=$2
	If (Count parameters:C259>=3)
		$_t_addAddress:=$3
	End if 
	If (Count parameters:C259>=5)
		$_l_windowLeft:=$4
		$_l_WindowTop:=$5
	Else 
		$_l_windowLeft:=Screen width:C187/2
		$_l_WindowTop:=Screen height:C188/2
	End if 
	$_bo_AddAddress:=True:C214
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=$_t_ContactCode; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	If ($_t_AddressType#"")
		If ($_t_AddressType="Work")
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Type:2=$_t_AddressType; *)
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145];  | ; [CONTACTS_COMPANIES:145]Address_Type:2="")
		Else 
			QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Type:2=$_t_AddressType)
		End if 
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
	$_obj_Address.ContactName:=[CONTACTS:1]Contact_Name:31
	$_col_CompanyCodes:=New collection:C1472
	$_col_CompanyPrivate:=New collection:C1472
	$_col_CompanyAddresses:=New collection:C1472
	
	ARRAY TO COLLECTION:C1563($_col_CompanyCodes; $_at_CompanyCodes)
	ARRAY TO COLLECTION:C1563($_col_CompanyPrivate; $_abo_CompanyPrivate)
	ARRAY TO COLLECTION:C1563($_col_CompanyAddresses; $_at_CompanyAddresses)
	
	//OB SET ARRAY($_obj_Address;"CompanyCodes";$_at_CompanyCodes)
	$_obj_Address.contactCode:=$_t_ContactCode
	$_obj_Address.CompanyCodes:=$_col_CompanyCodes
	$_obj_Address.CompanyPrivate:=$_col_CompanyPrivate
	//OB SET ARRAY($_obj_Address;"CompanyPrivate";$_abo_CompanyPrivate)
	
	$_obj_Address.CompanyAddresses:=$_col_CompanyAddresses
	//OB SET ARRAY($_obj_Address;"CompanyAddresses";$_at_CompanyAddresses)
	
	WIN_l_CurrentWinRef:=Open window:C153($_l_windowLeft; $_l_windowTop; $_l_windowLeft; $_l_windowTop; Modal dialog box:K34:2)
	DIALOG:C40("DB_ManageAddresses"; $_obj_Address)
	If ($_obj_Address.selectedAddress#"")
		OB GET PROPERTY NAMES:C1232($_obj_Address; $_at_Properties; $_al_PropertyTypes)
		If (Find in array:C230($_at_Properties; "DeletedAddress")>0)  //$_t_addAddress
			//we have deleted some records
			COLLECTION TO ARRAY:C1562($_obj_Address.DeletedAddress; $_at_DeletedCodes)
			//all we want to do here is IF there
			If (Find in array:C230($_at_DeletedCodes; $_t_addAddress)>0)
				//we did not 'delete' the new address from the range..so now we can create it
				$_bo_AddAddress:=False:C215
				
			End if 
		End if 
	End if 
	CLOSE WINDOW:C154(WIN_l_CurrentWinRef)
	$0:=$_bo_AddAddress
	
	
End if 
