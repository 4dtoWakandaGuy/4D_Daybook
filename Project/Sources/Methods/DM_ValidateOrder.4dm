//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ValidateOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 18:03:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DM_ai_DefaultState;0)
	//ARRAY LONGINT(DM_al_OrderDelMethod;0)
	//ARRAY LONGINT(DM_al_OrderDelTerms;0)
	//ARRAY LONGINT(DM_al_OrderTerms;0)
	//ARRAY TEXT(DM_at_OrderDelMethod;0)
	//ARRAY TEXT(DM_at_OrderDelTerms;0)
	//ARRAY TEXT(DM_at_OrderTerms;0)
	//ARRAY TEXT(DM_at_OrdSPMacro;0)
	//ARRAY TEXT(DM_at_StateFunction;0)
	//ARRAY TEXT(DM_at_StateNames;0)
	C_BLOB:C604(DM_bl_StatesArrays)
	C_BOOLEAN:C305($0; DM_bo_allocateStock; DM_bo_AutoInvoice; DM_bo_OrdPrintSet)
	C_LONGINT:C283($_l_ArraySize; $_l_DestinationDataType; $_l_DestinationDataType2; $_l_FieldPosition; $_l_FIeldtoFind; $_l_Index; $_l_ListID; $_l_RecordIndex; $_l_SourceDataType; $_l_SourceDataType2; $1)
	C_LONGINT:C283($2; $3; DM_cb_ORDERallocate; DM_cb_ORDERInvoice; DM_l_Options; DM_l_Validity; DM_l_ValidityCheck)
	C_POINTER:C301($_Ptr_DataArray; $_Ptr_DataString; $_ptr_DestinationField2; $_ptr_DestinationFieldsArray; $_ptr_Field; $_ptr_FieldsArray; $_ptr_FieldsTypesArray; $_ptr_SourceData; $_ptr_SourceData2)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_ContractCode; $_t_DetailString; $_t_HeaderString; $_t_InvoiceNumber; $_t_JobCode; $_t_JobStageCode; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode)
	C_TEXT:C284($_t_ProductName; $_t_PurchOrderNumber; $4; $5; DM_t_State; DM_t_ValidCompany; DM_t_ValidJob)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateOrder")



If (Count parameters:C259>=5)
	$_ptr_FieldsArray:=Get pointer:C304("ORD_at_"+$4+"_Sfield")
	$_ptr_FieldsTypesArray:=Get pointer:C304("ORD_al_"+$4+"_SfieldType")
	$_ptr_DestinationFieldsArray:=Get pointer:C304("ORD_al_"+$4+"_Fields")
	$_t_HeaderString:=$4
	$_t_DetailString:=$5
	//this section Just validates that received data is compliant
	//this is generic for orders-not source type dependent
	//special handling is placed into specific fields in relation to specific
	//data sources.
	For ($_l_Index; 1; Size of array:C274($_ptr_FieldsArray->))
		$_l_SourceDataType:=$_ptr_FieldsTypesArray->{$_l_Index}
		$_ptr_Field:=Field:C253(Table:C252(->[ORDERS:24]); $_ptr_DestinationFieldsArray->{$_l_Index})
		$_l_DestinationDataType:=Type:C295($_ptr_Field->)
		If ($_l_SourceDataType#$_l_DestinationDataType)
			DM_ConvertTypes("ORD"; $_l_SourceDataType; $_l_DestinationDataType; $_t_HeaderString; $_l_Index)
		End if 
		
		//the data is now in the correct format
		Case of 
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Company_Code:1))
				//Company Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				$_t_CompanyCode:=DM_ValidateCompanyCode($2; $1; $_ptr_SourceData->{$_l_Index})
				$_ptr_SourceData->{$_l_Index}:=$_t_CompanyCode
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Contact_Code:2))
				//Contact Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				DM_t_ValidCompany:=""
				$_t_ContactCode:=DM_ValidateContactCode($2; $1; $_ptr_SourceData->{$_l_Index}; ->DM_t_ValidCompany)
				$_ptr_SourceData->{$_l_Index}:=$_t_ContactCode
				If (DM_t_ValidCompany#"")
					//a company code was passed back
					READ ONLY:C145([COMPANIES:2])
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=DM_t_ValidCompany)
					If (Records in selection:C76([COMPANIES:2])=0)
						DM_t_ValidCompany:=""
					End if 
				Else 
					READ ONLY:C145([CONTACTS:1])
					QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_t_ContactCode)
					DM_t_ValidCompany:=[CONTACTS:1]Company_Code:1
				End if 
				If (DM_t_ValidCompany#"")
					$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldsArray->; Field:C253(->[ORDERS:24]Company_Code:1))
					If ($_l_FieldPosition<0)
						$_l_ArraySize:=Size of array:C274($_ptr_DestinationFieldsArray->)+1
						INSERT IN ARRAY:C227($_ptr_DestinationFieldsArray->; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227($_ptr_FieldsArray->; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227($_ptr_FieldsTypesArray->; $_l_ArraySize; 1)
						$_Ptr_DataArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
						INSERT IN ARRAY:C227($_Ptr_DataArray->; $_l_ArraySize; 1)
						$_Ptr_DataArray:=Get pointer:C304("ORD_ai"+$_t_HeaderString+"_Integer")
						INSERT IN ARRAY:C227($_Ptr_DataArray->; $_l_ArraySize; 1)
						$_Ptr_DataArray:=Get pointer:C304("ORD_al"+$_t_HeaderString+"_Longint")
						INSERT IN ARRAY:C227($_Ptr_DataArray->; $_l_ArraySize; 1)
						$_Ptr_DataArray:=Get pointer:C304("ORD_ar_"+$_t_HeaderString+"_Real")
						INSERT IN ARRAY:C227($_Ptr_DataArray->; $_l_ArraySize; 1)
						$_Ptr_DataArray:=Get pointer:C304("ORD_ad_"+$_t_HeaderString+"_Date")
						INSERT IN ARRAY:C227($_Ptr_DataArray->; $_l_ArraySize; 1)
						$_Ptr_DataArray:=Get pointer:C304("ORD_abo_"+$_t_HeaderString+"_Boolean")
						INSERT IN ARRAY:C227($_Ptr_DataArray->; $_l_ArraySize; 1)
						$_Ptr_DataArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Text")
						INSERT IN ARRAY:C227($_Ptr_DataArray->; $_l_ArraySize; 1)
						$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldsArray->)
						$_ptr_DestinationFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Company_Code:1)
					End if 
					$_ptr_DestinationFieldsArray->{$_l_FieldPosition}:=Field:C253(->[ORDERS:24]Company_Code:1)
					$_Ptr_DataArray:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
					$_Ptr_DataArray->{$_l_FieldPosition}:=DM_t_ValidCompany
				End if 
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([CONTACTS:1])=0)
					//handle error here
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Order_Code:3))
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				//Order Code
				//Check it does not clash!!
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([ORDERS:24])>0)
					//handle error?, it is possible this is not an error!
					$_t_OrderCode:=DM_ValidOrderCode($2; 0; $_ptr_SourceData->{$_l_Index})
					If ($_t_OrderCode="ERR@")
						//this is an error
					Else 
						$_ptr_SourceData->{$_l_Index}:=$_t_OrderCode
					End if 
					
				End if 
				//
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Person:5))  //Person
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				//person
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([PERSONNEL:11])=0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_ptr_SourceData->{$_l_Index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						$_ptr_SourceData->{$_l_Index}:=""
					Else 
						$_ptr_SourceData->{$_l_Index}:=[PERSONNEL:11]Initials:1
					End if 
				End if 
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]State:15))  //State
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([TABLE_RECORD_STATES:90])=0)
					//handle error
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Terms:16))  //terms
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				ARRAY TEXT:C222(DM_at_OrderTerms; 0)
				ARRAY LONGINT:C221(DM_al_OrderTerms; 0)
				$_l_ListID:=AA_LoadListByName("Terms"; ->DM_at_OrderTerms; ->DM_al_OrderTerms; False:C215)
				$_l_FieldPosition:=Find in array:C230(DM_at_OrderTerms; $_ptr_SourceData->{$_l_Index})
				If ($_l_FieldPosition<0)
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Taken_By:17))  //Taken by
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				//person
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([PERSONNEL:11])=0)
					//handle error
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Source:18))  //Source
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				
				QUERY:C277([SOURCES:6]; [SOURCES:6]Source_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([SOURCES:6])=0)
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Delivery_Method:19))  //Delivery method
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				ARRAY TEXT:C222(DM_at_OrderDelMethod; 0)
				ARRAY LONGINT:C221(DM_al_OrderDelMethod; 0)
				$_l_ListID:=AA_LoadListByName("Del Methods"; ->DM_at_OrderDelMethod; ->DM_al_OrderDelMethod; False:C215)
				$_l_FieldPosition:=Find in array:C230(DM_at_OrderDelMethod; $_ptr_SourceData->{$_l_Index})
				If ($_l_FieldPosition<0)
					$_ptr_SourceData->{$_l_Index}:=""
					
				End if 
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Delivery_Company:29))  //Delivery Company Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				$_t_CompanyCode:=DM_ValidateCompanyCode($2; $1; $_ptr_SourceData->{$_l_Index})
				$_ptr_SourceData->{$_l_Index}:=$_t_CompanyCode
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Delivery_Contact:30))  //Delivery Contact Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				$_t_ContactCode:=DM_ValidateContactCode($2; $1; $_ptr_SourceData->{$_l_Index})
				$_ptr_SourceData->{$_l_Index}:=$_t_ContactCode
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Currency_Code:32))  //Currency Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([CURRENCIES:71])=0)
					//handle error
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Analysis_Code:33))  //Analysis Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([ANALYSES:36])=0)
					//handle error
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Area_Code:35))  //Area Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([AREAS:3]; [AREAS:3]Area_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([AREAS:3])=0)
					QUERY:C277([AREAS:3]; [AREAS:3]Area_Name:2=$_ptr_SourceData->{$_l_Index})
					If (Records in selection:C76([AREAS:3])=0)
						$_ptr_SourceData->{$_l_Index}:=""
					Else 
						$_ptr_SourceData->{$_l_Index}:=[AREAS:3]Area_Code:1
					End if 
				End if 
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Shipping_Agent:41))  //Shipping agent Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				$_t_CompanyCode:=DM_ValidateCompanyCode($2; $1; $_ptr_SourceData->{$_l_Index})
				$_ptr_SourceData->{$_l_Index}:=$_t_CompanyCode
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Order_Period:42))  //period code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([PERIODS:33])=0)
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Order_Type:43))  //Order Type
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([JOB_TYPES:65])=0)
					$_ptr_SourceData->{$_l_Index}:=""
				End if 
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Layer_Code:47))  //Layer Code
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Code:1=$_ptr_SourceData->{$_l_Index})
				If (Records in selection:C76([LAYERS:76])=0)
					QUERY:C277([LAYERS:76]; [LAYERS:76]Layer_Name:2=$_ptr_SourceData->{$_l_Index})
					If (Records in selection:C76([LAYERS:76])=0)
						$_ptr_SourceData->{$_l_Index}:=""
					Else 
						$_ptr_SourceData->{$_l_Index}:=[LAYERS:76]Layer_Code:1
					End if 
					
				End if 
				
				
			: (Field:C253($_ptr_Field)=Field:C253(->[ORDERS:24]Delivery_Terms:52))  //Delivery Terms
				$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_HeaderString+"_Strings")
				ARRAY TEXT:C222(DM_at_OrderDelTerms; 0)
				ARRAY LONGINT:C221(DM_al_OrderDelTerms; 0)
				$_l_ListID:=AA_LoadListByName("Del Terms"; ->DM_at_OrderDelTerms; ->DM_al_OrderDelTerms; False:C215)
				$_l_FieldPosition:=Find in array:C230(DM_at_OrderDelTerms; $_ptr_SourceData->{$_l_Index})
				If ($_l_FieldPosition<0)
					$_ptr_SourceData->{$_l_Index}:=""
					
				End if 
				
		End case 
		
	End for 
	//the ‘raw received  header data is now checked
	$_ptr_FieldsArray:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Sfield")
	$_ptr_FieldsTypesArray:=Get pointer:C304("ORD_al_"+$_t_DetailString+"_SfieldType")
	$_ptr_DestinationFieldsArray:=Get pointer:C304("ORD_al_"+$5+"_fields")
	$_t_DetailString:=$5
	$_Ptr_DataString:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
	$_l_ArraySize:=Size of array:C274($_Ptr_DataString->)  //number of order items
	For ($_l_RecordIndex; 1; $_l_ArraySize)
		//this section Just validates that received data is compliant
		//this is generic for orders-not source type dependent
		//special handling is placed into specific fields in relation to specific
		//data sources.
		For ($_l_Index; 1; Size of array:C274($_ptr_FieldsArray->))
			$_l_SourceDataType:=$_ptr_FieldsTypesArray->{$_l_Index}
			$_ptr_Field:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_ptr_DestinationFieldsArray->{$_l_Index})
			$_l_DestinationDataType:=Type:C295($_ptr_Field->)
			If ($_l_SourceDataType#$_l_DestinationDataType)
				DM_ConvertTypes("ORD"; $_l_SourceDataType; $_l_DestinationDataType; $_t_DetailString; -$_l_Index; $_l_RecordIndex)
			End if 
			
			//the data is now in the correct format
			Case of 
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Product_Code:2))  //Product Code
					$_l_FIeldtoFind:=Field:C253(->[ORDER_ITEMS:25]Product_Name:13)
					$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldsArray->; $_l_FIeldtoFind)
					$_t_ProductName:=""
					If ($_l_FieldPosition>0)
						$_l_SourceDataType2:=$_ptr_FieldsTypesArray->{$_l_FieldPosition}
						$_ptr_DestinationField2:=Field:C253(Table:C252(->[ORDER_ITEMS:25]); $_ptr_DestinationFieldsArray->{$_l_Index})
						$_l_DestinationDataType2:=Type:C295($_ptr_DestinationField2->)
						If ($_l_SourceDataType2#$_l_DestinationDataType2)
							DM_ConvertTypes("ORD"; $_l_SourceDataType2; $_l_DestinationDataType2; $_t_DetailString; -$_l_FieldPosition; $_l_RecordIndex)
						End if 
						$_ptr_SourceData2:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
						$_t_ProductName:=$_ptr_SourceData2->{$_l_RecordIndex}{$_l_FieldPosition}
					End if 
					
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					$_t_ProductCode:=$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}
					$_t_ProductCode:=DM_ValidateProductCode($2; $1; $_t_ProductCode; $_t_ProductName)
					$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=$_t_ProductCode
					
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Sales_Price:4))  //Sales price
					//should check its not below cost?
					//mm and apparently a curved ball!!!
					//this sale is in the default currency of the business kit.
					//and actually may be sold in a foreign currency
					//so somewhere the prices may need to convert to currency of the country
					//of the person we are selling to @!@@@@@@@ arghhhhhhhh
					
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Person:14))  //Person
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					//person
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						//handle error
						$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=""
					End if 
					
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Invoice_Number:17))  //Invoice Number
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					$_t_InvoiceNumber:=DM_ValidateInvoiceNumber($2; $1; $_ptr_SourceData->{$_l_RecordIndex}{$_l_Index})
					$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=$_t_InvoiceNumber
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Purchase_Order_Number:18))  //Purchase order number
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					$_t_PurchOrderNumber:=DM_ValidatePONumber($2; $1; $_ptr_SourceData->{$_l_RecordIndex}{$_l_Index})
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Supplier_Code:20))  //Supplier Company Code
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					$_t_CompanyCode:=DM_ValidateCompanyCode($2; $1; $_ptr_SourceData->{$_l_RecordIndex}{$_l_Index})
					$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=$_t_CompanyCode
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Item_Number:27))  //Item Number
					
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Allocated:28))  //Allocated stock quantity
					//MEANS MUST UPDATE THE STOCK, as well
					//handle that in the order creation
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Contract_Code:29))  //Contract Code
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					$_t_ContractCode:=DM_ValidateContract($2; $1; $_ptr_SourceData->{$_l_RecordIndex}{$_l_Index})
					$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=$_t_ContractCode
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Job_Code:34))  //Job Code
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					$_t_JobCode:=DM_ValidateJob($2; $1; $_ptr_SourceData->{$_l_RecordIndex}{$_l_Index})
					$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=$_t_JobCode
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Job_Stage:35))  //Job Stage
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					DM_t_ValidJob:=""
					$_t_JobStageCode:=DM_ValidateJobStage($2; $1; ($_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}); ->DM_t_ValidJob)
					$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=$_t_JobStageCode
					If (DM_t_ValidJob#"")
						//a   job code passed back
					End if 
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Price_Code:36))  //Price Code
					$_ptr_SourceData:=Get pointer:C304("ORD_at_"+$_t_DetailString+"_Strings")
					QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Price_Code:1=$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index})
					If (Records in selection:C76([PRICE_GROUPS:18])=0)
						$_ptr_SourceData->{$_l_RecordIndex}{$_l_Index}:=""
					End if 
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Component_Level:47))  //Component Level
					//mmmmMMMMMMM
				: (Field:C253($_ptr_Field)=Field:C253(->[ORDER_ITEMS:25]Level_Up_Item_Number:48))  //Level Up item No!
					//MMMMMMmmmmm
			End case 
			
		End for 
	End for 
	
	//all the raw data is now validated.
	//now we can set ‘other fields
	//LOAD the Options information.
	
	ARRAY TEXT:C222(DM_at_StateFunction; 0)
	ARRAY TEXT:C222(DM_at_OrdSPMacro; 0)
	
	DM_SetOrderDefaults($3; $_t_HeaderString; $_t_DetailString)
	DM_l_Options:=0  // binary number
	If (DM_cb_ORDERInvoice=1)
		DM_l_Options:=DM_l_Options ?+ 1
	End if 
	If (DM_cb_ORDERallocate=1)
		DM_l_Options:=DM_l_Options ?+ 2
	End if 
	//now all the supplied and default fields are set in the arrays we can
	//call the order creation method
	DM_l_Validity:=0
	DM_l_ValidityCheck:=AA_GetNextIDinMethod(->DM_l_Validity)
	SET BLOB SIZE:C606(DM_bl_StatesArrays; 0)
	VARIABLE TO BLOB:C532(DM_ai_DefaultState; DM_bl_StatesArrays; *)
	VARIABLE TO BLOB:C532(DM_at_StateNames; DM_bl_StatesArrays; *)
	VARIABLE TO BLOB:C532(DM_at_StateFunction; DM_bl_StatesArrays; *)
	
	
	DM_CreateOrder(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; ->DM_bl_StatesArrays)
	$0:=True:C214
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("DM_ValidateOrder"; $_t_oldMethodName)