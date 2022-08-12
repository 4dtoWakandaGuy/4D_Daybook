//%attributes = {}

If (False:C215)
	//Project Method Name:      CO_addressManager2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_AddressRecordIDs;0)
	//ARRAY LONGINT(CO_al_AddressType;0)
	//ARRAY LONGINT(CO_al_AddressTypes;0)
	//ARRAY LONGINT(CO_al_ExistingAddressReference;0)
	//ARRAY LONGINT(CO_al_ExistingAddressTypes;0)
	//ARRAY TEXT(CO_at_AddressLine1;0)
	//ARRAY TEXT(CO_at_AddressLine2;0)
	//ARRAY TEXT(CO_at_AddressType;0)
	//ARRAY TEXT(CO_at_AddressTypes;0)
	//ARRAY TEXT(CO_at_Country;0)
	//ARRAY TEXT(CO_at_County;0)
	//ARRAY TEXT(CO_at_EXISTINGADDRESSTYPES;0)
	//ARRAY TEXT(CO_at_FormattedAddress;0)
	//ARRAY TEXT(CO_at_PostalCode;0)
	//ARRAY TEXT(CO_at_Town;0)
	C_BOOLEAN:C305($_bo_Create; $_bo_Edit)
	C_LONGINT:C283($_l_Index; $1; $2; $3; B_ClipboardButton; cb_Edit; CUR_l_SelectedAddressTypeRow)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_TEXT:C284($_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country; COM_t_Country_; COM_t_County; COM_t_DisplayAddress; COM_t_PostalCode; COM_t_Town; DB_t_Address1Label; DB_t_Address2Label)
	C_TEXT:C284(DB_t_CountryLabel; DB_t_CountyLabel; DB_t_PostcodeLabel; DB_t_TownLabel; OM_t_AddressLine2; vATAdd11)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_addressManager2")

//method CO_addressManager2

$_t_oldMethodName:=ERR_MethodTracker("CO_addressManager2")
Case of 
	: ($1>0) & ($1<9990)  //trust me if we have 10000 addresses for one company we are in trouble!
		
		Case of 
			: (CUR_l_SelectedAddressTypeRow>0)  //1 or 2 or 3
				CO_at_AddressLine1{CUR_l_SelectedAddressTypeRow}:=COM_t_AddressLine1
				CO_at_AddressLine2{CUR_l_SelectedAddressTypeRow}:=COM_t_AddressLine2
				CO_at_Town{CUR_l_SelectedAddressTypeRow}:=COM_t_Town
				CO_at_County{CUR_l_SelectedAddressTypeRow}:=COM_t_County
				CO_at_PostalCode{CUR_l_SelectedAddressTypeRow}:=COM_t_PostalCode
				CO_at_Country{CUR_l_SelectedAddressTypeRow}:=COM_t_Country
				CO_at_FormattedAddress{CUR_l_SelectedAddressTypeRow}:=WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country)
				CO_al_ExistingAddressReference{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})}:=Find in array:C230(CO_al_AddressType; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})
				
				Case of 
					: (CO_al_AddressType{CUR_l_SelectedAddressTypeRow}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping address")})
						//this is the mailing address
						//store in the fields as well
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						[COMPANIES:2]Town_or_City:5:=COM_t_Town
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country)
						
					: (CO_al_AddressType{CUR_l_SelectedAddressTypeRow}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice address")})
						//this is the invoice address
						//store in the fields as well
						[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
						[COMPANIES:2]Invoice_Address_Line_Two:19:=COM_t_AddressLine2
						[COMPANIES:2]Invoice_Town:20:=COM_t_Town
						[COMPANIES:2]Invoice_County:21:=COM_t_County
						[COMPANIES:2]Invoice_Postcode:22:=COM_t_PostalCode
						[COMPANIES:2]Invoice_Country:23:=COM_t_Country
						
						
				End case 
				
			: (CUR_l_SelectedAddressTypeRow<0)  //-1 or -2 or -3
				//``
				//INSERT IN ARRAY(CO_al_AddressRecordIDs;Size of array(CO_al_AddressRecordIDs)+1;1)
				//INSERT IN ARRAY(CO_at_AddressLine1;Size of array(CO_at_AddressLine1)+1;1)
				//INSERT IN ARRAY(CO_at_AddressLine2;Size of array(CO_at_AddressLine2)+1;1)
				//INSERT IN ARRAY(CO_at_Town;Size of array(CO_at_Town)+1;1)
				//INSERT IN ARRAY(CO_at_County;Size of array(CO_at_County)+1;1)
				//INSERT IN ARRAY(CO_at_PostalCode;Size of array(CO_at_PostalCode)+1;1)
				//INSERT IN ARRAY(CO_at_Country;Size of array(CO_at_Country)+1;1)
				//INSERT IN ARRAY(CO_al_AddressType;Size of array(CO_al_AddressType)+1;1)
				//INSERT IN ARRAY(CO_at_AddressType;Size of array(CO_al_AddressType)+1;1)
				//INSERT IN ARRAY(CO_at_FormattedAddress;Size of array(CO_at_FormattedAddress)+1;1)
				APPEND TO ARRAY:C911(CO_al_AddressRecordIDs; 0)
				APPEND TO ARRAY:C911(CO_at_AddressLine1; COM_t_AddressLine1)
				APPEND TO ARRAY:C911(CO_at_AddressLine2; OM_t_AddressLine2)
				APPEND TO ARRAY:C911(CO_at_Town; COM_t_Town)
				APPEND TO ARRAY:C911(CO_at_County; COM_t_County)
				APPEND TO ARRAY:C911(CO_at_PostalCode; COM_t_PostalCode)
				APPEND TO ARRAY:C911(CO_at_Country; COM_t_Country)
				If (Find in array:C230(CO_al_AddressTypes; Abs:C99(CUR_l_SelectedAddressTypeRow))>0)
					APPEND TO ARRAY:C911(CO_al_AddressType; Abs:C99(CUR_l_SelectedAddressTypeRow))
				Else 
					APPEND TO ARRAY:C911(CO_al_AddressType; CO_al_AddressTypes{Abs:C99(CUR_l_SelectedAddressTypeRow)})
				End if 
				CUR_l_SelectedAddressTypeRow:=Size of array:C274(CO_at_Country)
				CO_al_ExistingAddressReference{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})}:=Find in array:C230(CO_al_AddressType; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})
				
				APPEND TO ARRAY:C911(CO_at_AddressType; CO_at_AddressTypes{Find in array:C230(CO_al_AddressTypes; CO_al_AddressType{Size of array:C274(CO_at_AddressType)})})
				
				APPEND TO ARRAY:C911(CO_at_FormattedAddress; WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country))
				
				Case of 
					: (CO_al_AddressType{Size of array:C274(CO_at_FormattedAddress)}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping address")})
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						[COMPANIES:2]Town_or_City:5:=COM_t_Town
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country)
					: (CO_al_AddressType{Size of array:C274(CO_at_FormattedAddress)}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice address")})
						[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
						[COMPANIES:2]Invoice_Address_Line_Two:19:=COM_t_AddressLine2
						[COMPANIES:2]Invoice_Town:20:=COM_t_Town
						[COMPANIES:2]Invoice_County:21:=COM_t_County
						[COMPANIES:2]Invoice_Postcode:22:=COM_t_PostalCode
						[COMPANIES:2]Invoice_Country:23:=COM_t_Country
				End case 
			Else 
				CUR_l_SelectedAddressTypeRow:=$1
				
		End case 
		COM_t_AddressLine1:=CO_at_AddressLine1{CUR_l_SelectedAddressTypeRow}
		COM_t_AddressLine2:=CO_at_AddressLine2{CUR_l_SelectedAddressTypeRow}
		COM_t_Town:=CO_at_Town{CUR_l_SelectedAddressTypeRow}
		COM_t_County:=CO_at_County{CUR_l_SelectedAddressTypeRow}
		COM_t_PostalCode:=CO_at_PostalCode{CUR_l_SelectedAddressTypeRow}
		COM_t_Country:=CO_at_Country{CUR_l_SelectedAddressTypeRow}
		COM_t_DisplayAddress:=CO_at_FormattedAddress{CUR_l_SelectedAddressTypeRow}
		
		DB_t_Address1Label:=CO_at_EXISTINGADDRESSTYPES{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{$1})}
		OBJECT SET VISIBLE:C603(*; "oAddressLine1Label@"; (cb_Edit=1) & (DB_t_Address1Label#""))
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Label@"; (cb_Edit=1) & (DB_t_Address2Label#""))
		OBJECT SET VISIBLE:C603(*; "oTownLabel@"; (cb_Edit=1) & (DB_t_TownLabel#""))
		OBJECT SET VISIBLE:C603(*; "oCountyLabel@"; (cb_Edit=1) & (DB_t_CountyLabel#""))
		OBJECT SET VISIBLE:C603(*; "oPostcodeLabel@"; (cb_Edit=1) & (DB_t_PostcodeLabel#""))
		OBJECT SET VISIBLE:C603(*; "oCountryLabel"; (cb_Edit=1) & (DB_t_CountryLabel#""))
		OBJECT SET VISIBLE:C603(*; "oAddressLine@"; (cb_Edit=1))
		OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; (cb_Edit=1))
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; (cb_Edit=1))
		//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
		//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
		OBJECT SET VISIBLE:C603(*; "oTown@"; (cb_Edit=1))
		OBJECT SET VISIBLE:C603(*; "oCounty@"; (cb_Edit=1))
		OBJECT SET VISIBLE:C603(*; "oPostalCode@"; (cb_Edit=1))
		OBJECT SET VISIBLE:C603(*; "oCountry@"; (cb_Edit=1))
		OBJECT SET ENTERABLE:C238(*; "oCompanyName@"; (cb_Edit=1))
		OBJECT SET ENTERABLE:C238(*; "oAddressLine@"; (cb_Edit=1))
		//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
		//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
		OBJECT SET ENTERABLE:C238(*; "oTown@"; (cb_Edit=1))
		OBJECT SET ENTERABLE:C238(*; "oCounty@"; (cb_Edit=1))
		OBJECT SET ENTERABLE:C238(*; "oPostalCode@"; (cb_Edit=1))
		OBJECT SET ENTERABLE:C238(*; "oCountry@"; (cb_Edit=1))
		//
		OBJECT SET ENTERABLE:C238(*; "oAddressLine1Label@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oAddressLine2Label@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oTownLabel@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oCountyLabel@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oPostcodeLabel@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oCountryLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oCompanyAddress@"; (Not:C34(cb_Edit=1)))
		OBJECT SET VISIBLE:C603(*; "oAddressClipBoard@"; (Not:C34(cb_Edit=1)))
		OBJECT SET VISIBLE:C603(*; "oAddressClipBoardPicture@"; (Not:C34(cb_Edit=1)))
		OBJECT SET ENABLED:C1123(*; "oAddressClipBoardButton@"; (Not:C34(cb_Edit=1)))
		
		
	: ($1=9990)
		//add an address type
	: ($1=9998)  //save the data
		Case of 
			: (CUR_l_SelectedAddressTypeRow>0)
				CO_at_AddressLine1{CUR_l_SelectedAddressTypeRow}:=COM_t_AddressLine1
				CO_at_AddressLine2{CUR_l_SelectedAddressTypeRow}:=COM_t_AddressLine2
				CO_at_Town{CUR_l_SelectedAddressTypeRow}:=COM_t_Town
				CO_at_County{CUR_l_SelectedAddressTypeRow}:=COM_t_County
				CO_at_PostalCode{CUR_l_SelectedAddressTypeRow}:=COM_t_PostalCode
				CO_at_Country{CUR_l_SelectedAddressTypeRow}:=COM_t_Country
				CO_al_ExistingAddressReference{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})}:=Find in array:C230(CO_al_AddressType; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})
				
				Case of 
					: (CO_al_AddressType{CUR_l_SelectedAddressTypeRow}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping address")})
						//this is the mailing address
						//store in the fields as well
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						[COMPANIES:2]Town_or_City:5:=COM_t_Town
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country)
					: (CO_al_AddressType{CUR_l_SelectedAddressTypeRow}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice address")})
						//this is the invoice address
						//store in the fields as well
						[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
						[COMPANIES:2]Invoice_Address_Line_Two:19:=COM_t_AddressLine2
						[COMPANIES:2]Invoice_Town:20:=COM_t_Town
						[COMPANIES:2]Invoice_County:21:=COM_t_County
						[COMPANIES:2]Invoice_Postcode:22:=COM_t_PostalCode
						[COMPANIES:2]Invoice_Country:23:=COM_t_Country
						
						
				End case 
				
			: (CUR_l_SelectedAddressTypeRow<0)
				//``
				//INSERT IN ARRAY(CO_al_AddressRecordIDs;Size of array(CO_al_AddressRecordIDs)+1;1)
				//INSERT IN ARRAY(CO_at_AddressLine1;Size of array(CO_at_AddressLine1)+1;1)
				//INSERT IN ARRAY(CO_at_AddressLine2;Size of array(CO_at_AddressLine2)+1;1)
				//INSERT IN ARRAY(CO_at_Town;Size of array(CO_at_Town)+1;1)
				//INSERT IN ARRAY(CO_at_County;Size of array(CO_at_County)+1;1)
				//INSERT IN ARRAY(CO_at_PostalCode;Size of array(CO_at_PostalCode)+1;1)
				//INSERT IN ARRAY(CO_at_Country;Size of array(CO_at_Country)+1;1)
				//INSERT IN ARRAY(CO_al_AddressType;Size of array(CO_al_AddressType)+1;1)
				//INSERT IN ARRAY(CO_at_AddressType;Size of array(CO_al_AddressType)+1;1)
				//INSERT IN ARRAY(CO_at_FormattedAddress;Size of array(CO_at_FormattedAddress)+1;1)
				//``
				APPEND TO ARRAY:C911(CO_al_AddressRecordIDs; 0)
				APPEND TO ARRAY:C911(CO_at_AddressLine1; COM_t_AddressLine1)
				APPEND TO ARRAY:C911(CO_at_AddressLine2; COM_t_AddressLine2)
				APPEND TO ARRAY:C911(CO_at_Town; COM_t_Town)
				APPEND TO ARRAY:C911(CO_at_County; COM_t_County)
				APPEND TO ARRAY:C911(CO_at_PostalCode; COM_t_PostalCode)
				APPEND TO ARRAY:C911(CO_at_Country; COM_t_Country)
				If (Find in array:C230(CO_al_AddressTypes; Abs:C99(CUR_l_SelectedAddressTypeRow))>0)
					APPEND TO ARRAY:C911(CO_al_AddressType; Abs:C99(CUR_l_SelectedAddressTypeRow))
				Else 
					APPEND TO ARRAY:C911(CO_al_AddressType; CO_al_AddressTypes{Abs:C99(CUR_l_SelectedAddressTypeRow)})
					
				End if 
				CUR_l_SelectedAddressTypeRow:=Size of array:C274(CO_at_AddressType)
				CO_al_ExistingAddressReference{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})}:=Find in array:C230(CO_al_AddressType; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})
				
				APPEND TO ARRAY:C911(CO_at_AddressType; CO_at_AddressTypes{Find in array:C230(CO_al_AddressTypes; CO_al_AddressType{Size of array:C274(CO_at_AddressType)})})
				APPEND TO ARRAY:C911(CO_at_FormattedAddress; WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country))
				
				Case of 
					: (CO_al_AddressType{Size of array:C274(CO_at_FormattedAddress)}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping address")})
						//this is the mailing address
						//store in the fields as well
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						[COMPANIES:2]Town_or_City:5:=COM_t_Town
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country)
					: (CO_al_AddressType{Size of array:C274(CO_at_FormattedAddress)}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice address")})
						//this is the invoice address
						//store in the fields as well
						[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
						[COMPANIES:2]Invoice_Address_Line_Two:19:=COM_t_AddressLine2
						[COMPANIES:2]Invoice_Town:20:=COM_t_Town
						[COMPANIES:2]Invoice_County:21:=COM_t_County
						[COMPANIES:2]Invoice_Postcode:22:=COM_t_PostalCode
						[COMPANIES:2]Invoice_Country:23:=COM_t_Country
				End case 
		End case 
		For ($_l_Index; 1; Size of array:C274(CO_at_AddressLine1))
			If (CO_at_AddressLine1{$_l_Index}#"") | (CO_at_AddressLine2{$_l_Index}#"") | (CO_at_Town{$_l_Index}#"") | (CO_at_County{$_l_Index}#"") | (CO_at_PostalCode{$_l_Index}#"") | (CO_at_Country{$_l_Index}#"")
				Case of 
					: (CO_al_AddressType{$_l_Index}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping address")})
						If (CO_al_AddressRecordIDs{$_l_Index}=0)
							//no record exists this is the mailing address-currently not creating records
							$_bo_Edit:=False:C215
							$_bo_Create:=False:C215
						Else 
							//if record exists
							$_bo_Create:=True:C214
							$_bo_Edit:=True:C214
						End if 
					: (CO_al_AddressType{$_l_Index}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice address")})
						If (CO_al_AddressRecordIDs{$_l_Index}=0)
							//no record exists this is the mailing address-currently not creating records
							$_bo_Edit:=False:C215
							$_bo_Create:=False:C215
						Else 
							//if record exists
							$_bo_Edit:=True:C214
							$_bo_Create:=False:C215
						End if 
					Else 
						If (CO_al_AddressRecordIDs{$_l_Index}=0)
							//no record exists
							$_bo_Edit:=False:C215
							$_bo_Create:=True:C214
						Else 
							//if record exists
							$_bo_Edit:=True:C214
							$_bo_Create:=False:C215
						End if 
						If ($_bo_Edit) | ($_bo_Create)
							READ WRITE:C146([AddressRecords:125])
							Case of 
								: ($_bo_Edit)
									QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=CO_al_AddressRecordIDs{$_l_Index})
								: ($_bo_Create)
									CREATE RECORD:C68([AddressRecords:125])
									[AddressRecords:125]AddressClassID:2:=CO_al_AddressType{$_l_Index}
									[AddressRecords:125]AddressClass:3:=CO_at_AddressType{$_l_Index}
							End case 
							[AddressRecords:125]AddressLine1:6:=CO_at_AddressLine1{$_l_Index}
							[AddressRecords:125]AddressLine2:7:=CO_at_AddressLine2{$_l_Index}
							[AddressRecords:125]Town_City:8:=CO_at_Town{$_l_Index}
							[AddressRecords:125]County_State:9:=CO_at_County{$_l_Index}
							If (Length:C16(CO_at_PostalCode{$_l_Index})>20)  //Postal_Code field is alpha 20
								[AddressRecords:125]Postal_Code:10:=Substring:C12(CO_at_PostalCode{$_l_Index}; 1; 20)
							Else 
								[AddressRecords:125]Postal_Code:10:=CO_at_PostalCode{$_l_Index}
							End if 
							[AddressRecords:125]Country:11:=CO_at_Country{$_l_Index}
							[AddressRecords:125]FormattedAddress:12:=CO_at_FormattedAddress{$_l_Index}
							[AddressRecords:125]X_OwnerTableID:4:=$2
							[AddressRecords:125]X_OwnerRecordID:5:=$3
							DB_SaveRecord(->[AddressRecords:125])
							AA_CheckFileUnlocked(->[AddressRecords:125]X_ID:1)
							UNLOAD RECORD:C212([AddressRecords:125])
						End if 
						READ ONLY:C145([AddressRecords:125])
				End case 
			End if 
		End for 
	: ($1<0)  //adding address type(invoice or mailing)
		Case of 
			: (CUR_l_SelectedAddressTypeRow>0)
				CO_at_AddressLine1{CUR_l_SelectedAddressTypeRow}:=COM_t_AddressLine1
				CO_at_AddressLine2{CUR_l_SelectedAddressTypeRow}:=COM_t_AddressLine2
				CO_at_Town{CUR_l_SelectedAddressTypeRow}:=COM_t_Town
				CO_at_County{CUR_l_SelectedAddressTypeRow}:=COM_t_County
				CO_at_PostalCode{CUR_l_SelectedAddressTypeRow}:=COM_t_PostalCode
				CO_at_Country{CUR_l_SelectedAddressTypeRow}:=COM_t_Country
				CO_al_ExistingAddressReference{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})}:=Find in array:C230(CO_al_AddressType; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})
				
				
				Case of 
					: (CO_al_AddressType{CUR_l_SelectedAddressTypeRow}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping address")})
						//this is the mailing address
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						[COMPANIES:2]Town_or_City:5:=COM_t_Town
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country)
					: (CO_al_AddressType{CUR_l_SelectedAddressTypeRow}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice address")})
						//this is the invoice address
						//store in the fields as well
						[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
						[COMPANIES:2]Invoice_Address_Line_Two:19:=COM_t_AddressLine2
						[COMPANIES:2]Invoice_Town:20:=COM_t_Town
						[COMPANIES:2]Invoice_County:21:=COM_t_County
						[COMPANIES:2]Invoice_Postcode:22:=COM_t_PostalCode
						[COMPANIES:2]Invoice_Country:23:=COM_t_Country
						
						
				End case 
				
			: (CUR_l_SelectedAddressTypeRow<0)
				//``
				
				
				//``
				APPEND TO ARRAY:C911(CO_al_AddressRecordIDs; 0)
				APPEND TO ARRAY:C911(CO_at_AddressLine1; COM_t_AddressLine1)
				APPEND TO ARRAY:C911(CO_at_AddressLine2; COM_t_AddressLine2)
				APPEND TO ARRAY:C911(CO_at_Town; COM_t_Town)
				APPEND TO ARRAY:C911(CO_at_County; COM_t_County)
				APPEND TO ARRAY:C911(CO_at_PostalCode; COM_t_PostalCode)
				APPEND TO ARRAY:C911(CO_at_Country; COM_t_Country)
				If (Find in array:C230(CO_al_AddressTypes; Abs:C99(CUR_l_SelectedAddressTypeRow))>0)
					APPEND TO ARRAY:C911(CO_al_AddressType; Abs:C99(CUR_l_SelectedAddressTypeRow))
				Else 
					APPEND TO ARRAY:C911(CO_al_AddressType; CO_al_AddressTypes{Abs:C99(CUR_l_SelectedAddressTypeRow)})
				End if 
				APPEND TO ARRAY:C911(CO_at_AddressType; CO_at_AddressTypes{Find in array:C230(CO_al_AddressTypes; CO_al_AddressType{Size of array:C274(CO_at_AddressType)})})
				APPEND TO ARRAY:C911(CO_at_FormattedAddress; WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country))
				
				Case of 
					: (CO_al_AddressType{Size of array:C274(CO_at_FormattedAddress)}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Shipping address")})
						[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
						[COMPANIES:2]Address_Line_two:4:=COM_t_AddressLine2
						[COMPANIES:2]Town_or_City:5:=COM_t_Town
						[COMPANIES:2]County_or_State:6:=COM_t_County
						[COMPANIES:2]Postal_Code:7:=COM_t_PostalCode
						[COMPANIES:2]Country:8:=COM_t_Country
						[COMPANIES:2]ADDRESS:60:=WS_BUILDADDRESS(COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Town; COM_t_County; COM_t_PostalCode; COM_t_Country)
					: (CO_al_AddressType{Size of array:C274(CO_at_FormattedAddress)}=CO_al_AddressTypes{Find in array:C230(CO_at_AddressTypes; "Invoice address")})
						[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
						[COMPANIES:2]Invoice_Address_Line_Two:19:=COM_t_AddressLine2
						[COMPANIES:2]Invoice_Town:20:=COM_t_Town
						[COMPANIES:2]Invoice_County:21:=COM_t_County
						[COMPANIES:2]Invoice_Postcode:22:=COM_t_PostalCode
						[COMPANIES:2]Invoice_Country:23:=COM_t_Country
				End case 
				CUR_l_SelectedAddressTypeRow:=Size of array:C274(CO_at_FormattedAddress)
				CO_al_ExistingAddressReference{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})}:=Find in array:C230(CO_al_AddressType; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})
				
		End case 
		COM_t_AddressLine1:=""
		COM_t_AddressLine2:=""
		COM_t_Town:=""
		COM_t_County:=""
		COM_t_PostalCode:=""
		COM_t_Country:=""
		DB_t_Address1Label:=CO_at_EXISTINGADDRESSTYPES{Find in array:C230(CO_al_ExistingAddressTypes; CO_al_AddressType{CUR_l_SelectedAddressTypeRow})}
		OBJECT SET VISIBLE:C603(*; "oAddressLine1Label@"; (DB_t_Address1Label#""))
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Label@"; (DB_t_Address2Label#""))
		OBJECT SET VISIBLE:C603(*; "oTownLabel@"; (DB_t_TownLabel#""))
		OBJECT SET VISIBLE:C603(*; "oCountyLabel@"; (DB_t_CountyLabel#""))
		OBJECT SET VISIBLE:C603(*; "oPostcodeLabel@"; (DB_t_PostcodeLabel#""))
		OBJECT SET VISIBLE:C603(*; "oCountryLabel"; (DB_t_CountryLabel#""))
		
		OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; True:C214)
		//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
		//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
		OBJECT SET VISIBLE:C603(*; "oTown@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCounty@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oPostalCode@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCountry@"; True:C214)
		
		OBJECT SET VISIBLE:C603(vATAdd11; False:C215)
		//oCompanyAddress2
		OBJECT SET VISIBLE:C603(*; "oCompanyAddress@"; False:C215)
		//OBJECT SET VISIBLE(COM_pic_ClipBoardPICT;False)
		OBJECT SET VISIBLE:C603(*; "oAddressClipBoardPicture@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oAddressClipBoardButton@"; False:C215)
		
		OBJECT SET ENABLED:C1123(*; "oAddressClipBoardButton@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oCompanyName@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; True:C214)
		
		OBJECT SET ENTERABLE:C238(*; "oTown@"; True:C214)
		OBJECT SET ENTERABLE:C238(*; "oCounty@"; True:C214)
		OBJECT SET ENTERABLE:C238(*; "oPostalCode@"; True:C214)
		OBJECT SET ENTERABLE:C238(*; "oCountry@"; True:C214)
		cb_Edit:=1
		Case of 
			: (FORM Get current page:C276=1)
				GOTO OBJECT:C206(*; "oAddressLine1")
			: (FORM Get current page:C276=2)
				GOTO OBJECT:C206(*; "oAddressLine2")
			: (FORM Get current page:C276=3)
				GOTO OBJECT:C206(*; "oAddressLine3")
			: (FORM Get current page:C276=4)
				GOTO OBJECT:C206(*; "oAddressLine4")
		End case 
		OBJECT SET FONT STYLE:C166(*; "oAddressLine1Label"; 33)
		
		//here set the editable mode
		
		
		
End case 



ERR_MethodTrackerReturn("CO_addressManager2"; $_t_oldMethodName)
