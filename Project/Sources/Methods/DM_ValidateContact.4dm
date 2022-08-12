//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ValidateContact
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
	//ARRAY LONGINT(aa_al_TitleIds;0)
	//ARRAY LONGINT(DM_al_OrderTerms;0)
	//ARRAY TEXT(AA_at_TitleNames;0)
	//ARRAY TEXT(DM_at_OrderTerms;0)
	//ARRAY TEXT(DM_at_OrdSPMacro;0)
	//ARRAY TEXT(DM_at_StateFunction;0)
	C_BOOLEAN:C305($0; DM_bo_allocateStock; DM_bo_AutoInvoice; DM_bo_OrdPrintSet)
	C_LONGINT:C283($_l_ArraySize; $_l_DataPosition; $_l_DestinationDataType; $_l_index; $_l_index2; $_l_ListID; $_l_RecordIndex; $_l_SourceDataType; $1; $2; $3)
	C_LONGINT:C283(DM_l_Options; DM_l_Validity; DM_l_ValidityCheck)
	C_POINTER:C301($_ptr_DataArray; $_ptr_DataField; $_ptr_DataString; $_Ptr_DestinationFieldArray; $_ptr_SourceData; $_ptr_SourceDataType; $_ptr_SourceFieldArray; $6; $7)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_DetailString; $_t_HeaderString; $_t_oldMethodName; $_t_Vat; $4; $5; DM_t_State)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateContact")

//this will be the method that validates a contact record received from outside

If (Count parameters:C259>=5)
	$_ptr_SourceFieldArray:=Get pointer:C304("CUS_at_"+$4+"_Sfield")
	$_ptr_SourceDataType:=Get pointer:C304("CUS_al_"+$4+"_SfieldType")
	$_Ptr_DestinationFieldArray:=Get pointer:C304("CUS_al_"+$4+"_Fields")
	$_t_HeaderString:=$4
	$_t_DetailString:=$5
	//this section Just validates that received data is compliant
	//this is generic for orders-not source type dependent
	//special handling is placed into specific fields in relation to specific
	//data sources.
	//TRACE
	For ($_l_index; 1; Size of array:C274($_ptr_SourceFieldArray->))
		$_l_SourceDataType:=$_ptr_SourceDataType->{$_l_index}
		$_ptr_DataField:=Field:C253(Table:C252(->[COMPANIES:2]); $_Ptr_DestinationFieldArray->{$_l_index})
		$_l_DestinationDataType:=Type:C295($_ptr_DataField->)
		If ($_l_SourceDataType#$_l_DestinationDataType)
			DM_ConvertTypes("CUS"; $_l_SourceDataType; $_l_DestinationDataType; $_t_HeaderString; $_l_index)
		End if 
		
		//the data is now in the correct format
		Case of 
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Company_Code:1))
				//Company Code
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				$_t_CompanyCode:=DM_ValidateCompanyCode($2; $1; $_ptr_SourceData->{$_l_index})
				$_ptr_SourceData->{$_l_index}:=$_t_CompanyCode
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Country:8))  //Contact Code
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([COUNTRIES:73])=0)
					$_ptr_SourceData->{$_l_index}:=""
				Else 
					$_t_Vat:=[COUNTRIES:73]Default_TAX:4
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Area:11))
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([AREAS:3]; [AREAS:3]Area_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([AREAS:3])=0)
					//handle error
					QUERY:C277([AREAS:3]; [AREAS:3]Area_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([AREAS:3])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[AREAS:3]Area_Code:1
					End if 
					
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Status:12))
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([STATUS:4])=0)
					QUERY:C277([STATUS:4]; [STATUS:4]Status_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([STATUS:4])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[STATUS:4]Status_Code:1
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Company_Type:13))
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([TYPES:5]; [TYPES:5]Type_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([TYPES:5])=0)
					QUERY:C277([TYPES:5]; [TYPES:5]Type_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([TYPES:5])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[TYPES:5]Type_Code:1
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Source:14))  //
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([SOURCES:6])=0)
					$_ptr_SourceData->{$_l_index}:=""
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Taken_By:26))  //Taken by
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				//person
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([PERSONNEL:11])=0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[PERSONNEL:11]Initials:1
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Sales_Person:29))
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				//person
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([PERSONNEL:11])=0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[PERSONNEL:11]Initials:1
					End if 
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Superior:34))  //
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]SL_Terms:40))
				ARRAY TEXT:C222(DM_at_OrderTerms; 0)
				ARRAY LONGINT:C221(DM_al_OrderTerms; 0)
				$_l_ListID:=AA_LoadListByName("Terms"; ->DM_at_OrderTerms; ->DM_al_OrderTerms; False:C215)
				$_l_DataPosition:=Find in array:C230(DM_at_OrderTerms; $_ptr_SourceData->{$_l_index})
				If ($_l_DataPosition<0)
					$_ptr_SourceData->{$_l_index}:=""
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Default_TAX:41))  //vat code`
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([TAX_CODES:35])=0)
					QUERY:C277([TAX_CODES:35]; [TAX_CODES:35]Tax_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([TAX_CODES:35])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[TAX_CODES:35]Tax_Code:1
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Default_Credit_Stage:42))  //
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([STAGES:45])=0)
					QUERY:C277([STAGES:45]; [STAGES:45]Stage_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([STAGES:45])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[STAGES:45]Stage_Code:1
					End if 
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]SO_Price_Group:44))  //
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([PRICE_GROUPS:18])=0)
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([STAGES:45])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[PRICE_GROUPS:18]Price_Code:1
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Default_Layer:51))  //
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([LAYERS:76])=0)
					QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([LAYERS:76])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[LAYERS:76]Layer_Code:1
					End if 
					
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]PL_Terms:53))  //
				ARRAY TEXT:C222(DM_at_OrderTerms; 0)
				ARRAY LONGINT:C221(DM_al_OrderTerms; 0)
				$_l_ListID:=AA_LoadListByName("Terms"; ->DM_at_OrderTerms; ->DM_al_OrderTerms; False:C215)
				$_l_DataPosition:=Find in array:C230(DM_at_OrderTerms; $_ptr_SourceData->{$_l_index})
				If ($_l_DataPosition<0)
					$_ptr_SourceData->{$_l_index}:=""
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]PO_Price_Group:54))  //
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_ptr_SourceData->{$_l_index})
				If (Records in selection:C76([PRICE_GROUPS:18])=0)
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Name:2=$_ptr_SourceData->{$_l_index})
					If (Records in selection:C76([STAGES:45])=0)
						$_ptr_SourceData->{$_l_index}:=""
					Else 
						$_ptr_SourceData->{$_l_index}:=[PRICE_GROUPS:18]Price_Code:1
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[COMPANIES:2]Default_Currency:59))  //
				$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderString+"_Strings")
		End case 
		
	End for 
	//the ‘raw received  header data is now checked
	$_ptr_SourceFieldArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Sfield")
	$_ptr_SourceDataType:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_SfieldType")
	$_Ptr_DestinationFieldArray:=Get pointer:C304("CUS_l_a"+$5+"_fields")
	$_t_DetailString:=$5
	$_ptr_DataString:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
	$_l_ArraySize:=Size of array:C274($_ptr_DataString->)  //number of order items
	For ($_l_RecordIndex; 1; $_l_ArraySize)
		//this section Just validates that received data is compliant
		//this is generic for orders-not source type dependent
		//special handling is placed into specific fields in relation to specific
		//data sources.
		For ($_l_index; 1; Size of array:C274($_ptr_SourceFieldArray->))
			$_l_SourceDataType:=$_ptr_SourceDataType->{$_l_index}
			$_ptr_DataField:=Field:C253(Table:C252(->[CONTACTS:1]); $_Ptr_DestinationFieldArray->{$_l_index})
			$_l_DestinationDataType:=Type:C295($_ptr_DataField->)
			If ($_l_SourceDataType#$_l_DestinationDataType)
				DM_ConvertTypes("CUS"; $_l_SourceDataType; $_l_DestinationDataType; $_t_DetailString; -$_l_index; $_l_RecordIndex)
			End if 
			
			//the data is now in the correct format
			Case of 
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Company_Code:1))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					$_t_CompanyCode:=DM_ValidateCompanyCode($2; $1; $_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					$_ptr_SourceData->{$_l_index}:=$_t_CompanyCode
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Title:3))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					ARRAY TEXT:C222(AA_at_TitleNames; 0)
					ARRAY LONGINT:C221(aa_al_TitleIds; 0)
					
					$_l_ListID:=AA_LoadListByName("Titles"; ->AA_at_TitleNames; ->aa_al_TitleIds)
					$_l_DataPosition:=Find in array:C230(AA_at_TitleNames; $_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					If ($_l_DataPosition<0)
						$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=""
					End if 
					
					
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Role:11))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					If (Records in selection:C76([ROLES:87])=0)
						QUERY:C277([ROLES:87]; [ROLES:87]Role_Name:2=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
						If (Records in selection:C76([ROLES:87])=0)
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=""
						Else 
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=[ROLES:87]Role_Code:1
						End if 
					End if 
					
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Status:14))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					If (Records in selection:C76([STATUS:4])=0)
						QUERY:C277([STATUS:4]; [STATUS:4]Status_Name:2=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
						If (Records in selection:C76([STATUS:4])=0)
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=""
						Else 
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=[STATUS:4]Status_Code:1
						End if 
					End if 
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Contact_Type:15))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					QUERY:C277([TYPES:5]; [TYPES:5]Type_Code:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					If (Records in selection:C76([TYPES:5])=0)
						QUERY:C277([TYPES:5]; [TYPES:5]Type_Name:2=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
						If (Records in selection:C76([TYPES:5])=0)
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=""
						Else 
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=[TYPES:5]Type_Code:1
						End if 
					End if 
					
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Source:16))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Code:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					If (Records in selection:C76([SOURCES:6])=0)
						QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Name:2=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
						If (Records in selection:C76([SOURCES:6])=0)
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=""
						Else 
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=[SOURCES:6]Source_Code:1
						End if 
					End if 
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Sales_Person:25))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
						If (Records in selection:C76([PERSONNEL:11])=0)
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=""
						Else 
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=[PERSONNEL:11]Initials:1
						End if 
					End if 
				: (Field:C253($_ptr_DataField)=Field:C253(->[CONTACTS:1]Taken_by:29))  //
					$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_ptr_SourceData->{$_l_RecordIndex}{$_l_index})
						If (Records in selection:C76([PERSONNEL:11])=0)
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=""
						Else 
							$_ptr_SourceData->{$_l_RecordIndex}{$_l_index}:=[PERSONNEL:11]Initials:1
						End if 
					End if 
					
			End case 
			
		End for 
	End for 
	
	//all the raw data is now validated.
	//now we can set ‘other fields
	//LOAD the Options information.
	
	ARRAY TEXT:C222(DM_at_StateFunction; 0)
	ARRAY TEXT:C222(DM_at_OrdSPMacro; 0)
	//the following happens before AND after putting the
	//defaults in
	
	DM_SetContactFields($_t_HeaderString; $_t_DetailString)
	DM_SetContactDefaults($3; $_t_HeaderString; $_t_DetailString)  //there are some fields that are both contact and company
	DM_SetContactFields($_t_HeaderString; $_t_DetailString)
	
	
	DM_l_Options:=0  // binary number
	
	//now all the supplied and default fields are set in the arrays we can
	//call the order creation method
	DM_l_Validity:=0
	DM_l_ValidityCheck:=AA_GetNextIDinMethod(->DM_l_Validity)
	
	
	//hrere we can check again if the CONTACT CODE exists
	$_ptr_SourceFieldArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Sfield")
	$_Ptr_DestinationFieldArray:=Get pointer:C304("CUS_al_"+$_t_DetailString+"_Fields")
	$_l_DataPosition:=Find in array:C230($_Ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Contact_Type:15))
	If ($_l_DataPosition>0)
		$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailString+"_Strings")
		For ($_l_index2; 1; Size of array:C274($_ptr_DataArray->))
			$_t_ContactCode:=$_ptr_DataArray->{$_l_index2}{$_l_DataPosition}
			If ($_t_ContactCode#"")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
				If (Records in selection:C76([CONTACTS:1])=0)
					DM_CreateContact(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $6; $7)
				Else 
					//record exists so just update
					$6->:=[CONTACTS:1]Contact_Code:2
					$7->:=[CONTACTS:1]Company_Code:1
					DM_ModifyContact([CONTACTS:1]Company_Code:1; [CONTACTS:1]Contact_Code:2; DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $_l_index2)
					$0:=True:C214
				End if 
			Else 
				DM_CreateContact(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $6; $7)
				$0:=True:C214
			End if 
		End for 
	Else 
		DM_CreateContact(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $6; $7)
		$0:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("DM_ValidateContact"; $_t_oldMethodName)