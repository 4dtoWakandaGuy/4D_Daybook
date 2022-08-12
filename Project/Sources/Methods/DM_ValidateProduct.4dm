//%attributes = {}

If (False:C215)
	//Project Method Name:      DM_ValidateProduct
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
	C_BOOLEAN:C305($_bo_Create; $0)
	C_LONGINT:C283($_l_DestinationDataType; $_l_FieldPosition; $_l_Index; $_l_SourceDataType; $1; $2; $3; DM_l_Options; DM_l_Validity; DM_l_ValidityCheck)
	C_POINTER:C301($_ptr_DataField; $_Ptr_DestinationFieldArray; $_Ptr_SourceDataArray; $_Ptr_SourceTypeArray; $6)
	C_TEXT:C284($_t_DetailString; $_t_HeaderString; $_t_oldMethodName; $_t_ProductCode; $4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateProduct")


//this will be the method that validates a contact record received from outside
$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateProduct")
If (Count parameters:C259>=5)
	$_Ptr_SourceDataArray:=Get pointer:C304("ITM_at_"+$4+"_Sfield")
	$_Ptr_SourceTypeArray:=Get pointer:C304("ITM_al_"+$4+"_SfieldType")
	$_Ptr_DestinationFieldArray:=Get pointer:C304("ITM_al_"+$4+"_Fields")
	$_t_HeaderString:=$4
	$_t_DetailString:=$5
	For ($_l_Index; 1; Size of array:C274($_Ptr_SourceDataArray->))
		$_l_SourceDataType:=$_Ptr_SourceTypeArray->{$_l_Index}
		$_ptr_DataField:=Field:C253(Table:C252(->[PRODUCTS:9]); $_Ptr_DestinationFieldArray->{$_l_Index})
		$_l_DestinationDataType:=Type:C295($_ptr_DataField->)
		If ($_l_SourceDataType#$_l_DestinationDataType)
			DM_ConvertTypes("ITM"; $_l_SourceDataType; $_l_DestinationDataType; $_t_HeaderString; $_l_Index)
		End if 
		Case of 
			: (Field:C253($_ptr_DataField)=Field:C253(->[PRODUCTS:9]Product_Code:1))
				$_ptr_SourceDataArray:=Get pointer:C304("ITM_at_"+$_t_HeaderString+"_Strings")
			: (Field:C253($_ptr_DataField)=Field:C253(->[PRODUCTS:9]Group_Code:3))
				
				$_ptr_SourceDataArray:=Get pointer:C304("ITM_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([PRODUCT_GROUPS:10])=0)
					QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Name:2=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([PRODUCT_GROUPS:10])=0)
						$_ptr_SourceDataArray->{$_l_Index}:=""
					End if 
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[PRODUCTS:9]Brand_Code:4))
				$_ptr_SourceDataArray:=Get pointer:C304("ITM_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
					QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Name:2=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
						$_ptr_SourceDataArray->{$_l_Index}:=""
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[PRODUCTS:9]Sales_Account:7))
				$_ptr_SourceDataArray:=Get pointer:C304("ITM_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([ACCOUNTS:32])=0)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Name:3=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([ACCOUNTS:32])=0)
						$_ptr_SourceDataArray->{$_l_Index}:=""
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[PRODUCTS:9]Analysis_Code:18))
				$_ptr_SourceDataArray:=Get pointer:C304("ITM_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([ANALYSES:36])=0)
					QUERY:C277([ANALYSES:36]; [ANALYSES:36]Analysis_Name:2=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([ANALYSES:36])=0)
						$_ptr_SourceDataArray->{$_l_Index}:=""
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[PRODUCTS:9]Stock_Account:42))
				$_ptr_SourceDataArray:=Get pointer:C304("ITM_at"+$_t_HeaderString+"_Strings")
				QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([ACCOUNTS:32])=0)
					QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Name:3=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([ACCOUNTS:32])=0)
						$_ptr_SourceDataArray->{$_l_Index}:=""
					End if 
				End if 
				
		End case 
	End for 
	$_bo_Create:=True:C214
	$_l_FieldPosition:=Find in array:C230($_Ptr_DestinationFieldArray->; Field:C253(->[PRODUCTS:9]Product_Code:1))
	//in the first iteration no products are created on the bK so this should be found
	
	If ($_l_FieldPosition>0)
		$_t_ProductCode:=""
		$_ptr_SourceDataArray:=Get pointer:C304("ITM_at_"+$_t_HeaderString+"_Strings")
		$_t_ProductCode:=$_ptr_SourceDataArray->{$_l_FieldPosition}
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
		If (Records in selection:C76([PRODUCTS:9])=1)
			$_bo_Create:=False:C215
			$6->:=[PRODUCTS:9]Product_Code:1
			$0:=True:C214
		End if 
	End if 
	If ($_bo_Create)
		DM_SetProductDefaults($4; $_t_HeaderString; $_t_DetailString)
		
		DM_l_Options:=0  // binary number
		//now all the supplied and default fields are set in the arrays we can
		//call the Product creation method
		DM_l_Validity:=0
		DM_l_ValidityCheck:=AA_GetNextIDinMethod(->DM_l_Validity)
		
		DM_CreateProduct(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $6)
		$0:=True:C214
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DM_ValidateProduct"; $_t_oldMethodName)