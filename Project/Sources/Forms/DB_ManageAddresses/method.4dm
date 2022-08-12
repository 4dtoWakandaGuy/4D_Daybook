
If (False:C215)
	//Project Method Name:      DB_ManageAddresses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  20/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CompanyAddresses)
	//C_UNKNOWN(CompanyCodes)
	//C_UNKNOWN(CompanyPrivate)
	//ARRAY BOOLEAN(ACC_Lb_StatementMap;0)
	//ARRAY BOOLEAN(CON_abo_CompanyPrivates;0)
	//ARRAY BOOLEAN(CON_lb_Addresses;0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	//ARRAY TEXT(ACC_at_FieldNames;0)
	//ARRAY TEXT(ACC_at_StatementFields;0)
	//ARRAY TEXT(CON_at_addresses;0)
	//ARRAY TEXT(CON_at_CoCodes;0)
	//ARRAY TEXT(CON_at_DeletedAddresses;0)
	C_COLLECTION:C1488($_col_Addresses; $_col_CoCodes; $_col_Private)
	C_LONGINT:C283($_l_FormEvent)
	C_OBJECT:C1216($_obj_FormObject)
End if 
//Code Starts Here
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		TRACE:C157
		ARRAY TEXT:C222(CON_at_DeletedAddresses; 0)
		ARRAY TEXT:C222(CON_at_addresses; 0)
		ARRAY TEXT:C222(CON_at_CoCodes; 0)
		ARRAY BOOLEAN:C223(CON_abo_CompanyPrivates; 0)
		COLLECTION TO ARRAY:C1562(Form:C1466.CompanyAddresses; CON_at_addresses)
		COLLECTION TO ARRAY:C1562(Form:C1466.CompanyCodes; CON_at_CoCodes)
		COLLECTION TO ARRAY:C1562(Form:C1466.CompanyPrivate; CON_abo_CompanyPrivates)
		LB_SetupListbox(->CON_lb_Addresses; "oConAdd"; "Con_L"; 1; ->CON_at_CoCodes; ->CON_at_addresses; ->CON_abo_CompanyPrivates)
		LB_SetColumnHeaders(->CON_lb_Addresses; "oConAdd"; 1; "Address Code"; "Address"; "Private")
		LB_SetColumnWidths(->CON_lb_Addresses; "oConAdd"; 1; 60; 0; 0)
		OBJECT SET ENABLED:C1123(*; "oDelete"; False:C215)
End case 

