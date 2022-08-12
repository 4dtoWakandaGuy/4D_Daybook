If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable34
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
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
	//ARRAY TEXT(CO_at_FormattedAddress;0)
	//ARRAY TEXT(CO_at_PostalCode;0)
	//ARRAY TEXT(CO_at_Town;0)
	C_LONGINT:C283($_l_AddressRow; $_l_AddressTypesRow; $_l_event; CUR_l_SelectedAddressTypeRow)
	C_TEXT:C284($_t_oldMethodName; COM_t_AddressLine1; COM_t_AddressLine2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable34"; Form event code:C388)
//SCRIPT : COM_t_AddressLine1
//FORM Company_In
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (CUR_l_SelectedAddressTypeRow=0)
				//has to be the mailing address
				[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
				Companies_InLPD
				COM_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
			: (CUR_l_SelectedAddressTypeRow>0)  //1.2. OR 3
				//editing a record
				$_l_AddressTypesRow:=Find in array:C230(CO_al_AddressTypes; CO_al_AddressType{Abs:C99(CUR_l_SelectedAddressTypeRow)})
				//1 or 2 or 3
				If ($_l_AddressTypesRow>0)
					//it should be
					Case of 
						: (CO_at_AddressTypes{$_l_AddressTypesRow}="Shipping Address")
							//editing the mailing address
							[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
							Companies_InLPD
							COM_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
							
						: (CO_at_AddressTypes{$_l_AddressTypesRow}="Invoice Address")
							[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
							Companies_InLPD
							COM_t_AddressLine1:=[COMPANIES:2]Invoice_Address_Line_One:18
							
						Else 
							//editing another address type
							
					End case 
				End if 
				
			: (CUR_l_SelectedAddressTypeRow<0)  //-1 or -2 or -3
				If (Find in array:C230(CO_al_AddressTypes; Abs:C99(CUR_l_SelectedAddressTypeRow))>0)
					$_l_AddressTypesRow:=Find in array:C230(CO_al_AddressTypes; Abs:C99(CUR_l_SelectedAddressTypeRow))
				Else 
					$_l_AddressTypesRow:=Abs:C99(CUR_l_SelectedAddressTypeRow)
					$_l_AddressTypesRow:=Find in array:C230(CO_al_AddressTypes; CO_al_ExistingAddressTypes{Find in array:C230(CO_al_ExistingAddressReference; CUR_l_SelectedAddressTypeRow)})
					$_l_AddressRow:=Find in array:C230(CO_al_AddressType; (CO_al_AddressTypes{$_l_AddressTypesRow}))
					If ($_l_AddressRow<0)
						INSERT IN ARRAY:C227(CO_al_AddressRecordIDs; Size of array:C274(CO_al_AddressRecordIDs)+1; 1)
						INSERT IN ARRAY:C227(CO_at_AddressLine1; Size of array:C274(CO_at_AddressLine1)+1; 1)
						INSERT IN ARRAY:C227(CO_at_AddressLine2; Size of array:C274(CO_at_AddressLine2)+1; 1)
						INSERT IN ARRAY:C227(CO_at_Town; Size of array:C274(CO_at_Town)+1; 1)
						INSERT IN ARRAY:C227(CO_at_County; Size of array:C274(CO_at_County)+1; 1)
						INSERT IN ARRAY:C227(CO_at_PostalCode; Size of array:C274(CO_at_PostalCode)+1; 1)
						INSERT IN ARRAY:C227(CO_at_Country; Size of array:C274(CO_at_Country)+1; 1)
						INSERT IN ARRAY:C227(CO_al_AddressType; Size of array:C274(CO_al_AddressType)+1; 1)
						INSERT IN ARRAY:C227(CO_at_AddressType; Size of array:C274(CO_al_AddressType)+1; 1)
						INSERT IN ARRAY:C227(CO_at_FormattedAddress; Size of array:C274(CO_at_FormattedAddress)+1; 1)
						CO_at_AddressLine1{Size of array:C274(CO_at_AddressLine1)}:=COM_t_AddressLine1
						CO_al_AddressType{Size of array:C274(CO_at_AddressLine1)}:=CO_al_AddressTypes{$_l_AddressTypesRow}
						CO_at_AddressType{Size of array:C274(CO_at_AddressLine1)}:=CO_at_AddressTypes{$_l_AddressTypesRow}
						CO_al_AddressRecordIDs{Size of array:C274(CO_at_AddressLine1)}:=-(AA_GetNextIDinMethod(->[AddressRecords:125]X_ID:1))
						CO_at_FormattedAddress{Size of array:C274(CO_at_FormattedAddress)}:=WS_BUILDADDRESS([COMPANIES:2]Invoice_Address_Line_One:18; [COMPANIES:2]Invoice_Address_Line_Two:19; [COMPANIES:2]Invoice_Town:20; [COMPANIES:2]Invoice_County:21; [COMPANIES:2]Invoice_Postcode:22; [COMPANIES:2]Invoice_Country:23)
						CUR_l_SelectedAddressTypeRow:=Size of array:C274(CO_al_AddressType)  // 1 or 2 or 3
						
					End if 
					
				End if 
				
				If ($_l_AddressTypesRow>0)
					//it should be
					Case of 
						: (CO_at_AddressTypes{$_l_AddressTypesRow}="Shipping Address")
							//editing the mailing address
							[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
							Companies_InLPD
							COM_t_AddressLine1:=[COMPANIES:2]Address_Line_one:3
						: (CO_at_AddressTypes{$_l_AddressTypesRow}="Invoice Address")
							[COMPANIES:2]Invoice_Address_Line_One:18:=COM_t_AddressLine1
							Companies_InLPD
							COM_t_AddressLine1:=[COMPANIES:2]Invoice_Address_Line_One:18
						Else 
							//editing another address type
							
					End case 
				End if 
			Else 
				[COMPANIES:2]Address_Line_one:3:=COM_t_AddressLine1
		End case 
		
		
		CO_AddressManager(CUR_l_SelectedAddressTypeRow)
		
		GOTO OBJECT:C206(COM_t_AddressLine2)
End case 
ERR_MethodTrackerReturn("OBJ:Company_In,COM_t_AddressLine1"; $_t_oldMethodName)
