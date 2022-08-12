//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_VALIDATEDIARY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 11:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_ArraySize; $_l_DestinationDataType; $_l_FieldPosition; $_l_Index; $_l_Index2; $_l_SourceDataType; $1; $2; $3; DM_l_Options; DM_l_Validity)
	C_LONGINT:C283(DM_l_ValidityCheck)
	C_POINTER:C301($_ptr_DataArray; $_ptr_DataField; $_ptr_DestinationFieldArray; $_ptr_SourceDataArray; $_ptr_SourceDataType; $_ptr_SourceFieldArray; $6; $7)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_DetailString; $_t_DiaryCode; $_t_HeaderString; $_t_oldMethodName; $4; $5; DM_t_ValidCompany)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_VALIDATEDIARY")



If (Count parameters:C259>=5)
	$_ptr_SourceFieldArray:=Get pointer:C304("DIA_at_"+$4+"_Sfield")
	$_ptr_SourceDataType:=Get pointer:C304("DIA_al_"+$4+"_SfieldType")
	$_ptr_DestinationFieldArray:=Get pointer:C304("DIA_al_"+$4+"_Fields")
	$_t_HeaderString:=$4
	$_t_DetailString:=$5
	//this section Just validates that received data is compliant
	//this is generic for orders-not source type dependent
	//special handling is placed into specific fields in relation to specific
	//data sources.
	For ($_l_Index; 1; Size of array:C274($_ptr_SourceFieldArray->))
		$_l_SourceDataType:=$_ptr_SourceDataType->{$_l_Index}
		$_ptr_DataField:=Field:C253(Table:C252(->[ORDERS:24]); $_ptr_DestinationFieldArray->{$_l_Index})
		$_l_DestinationDataType:=Type:C295($_ptr_DataField->)
		If ($_l_SourceDataType#$_l_DestinationDataType)
			DM_ConvertTypes("DIA"; $_l_SourceDataType; $_l_DestinationDataType; $_t_HeaderString; $_l_Index)
		End if 
		
		//the data is now in the correct format
		Case of 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Company_Code:1))
				//Company Code
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				$_t_CompanyCode:=DM_ValidateCompanyCode($2; $1; $_ptr_SourceDataArray->{$_l_Index})
				$_ptr_SourceDataArray->{$_l_Index}:=$_t_CompanyCode
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Contact_Code:2))
				//Contact Code
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				DM_t_ValidCompany:=""
				$_t_ContactCode:=DM_ValidateContactCode($2; $1; $_ptr_SourceDataArray->{$_l_Index}; ->DM_t_ValidCompany)
				$_ptr_SourceDataArray->{$_l_Index}:=$_t_ContactCode
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
					$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[DIARY:12]Company_Code:1))
					If ($_l_FieldPosition<0)
						$_l_ArraySize:=Size of array:C274($_ptr_DestinationFieldArray->)+1
						INSERT IN ARRAY:C227($_ptr_DestinationFieldArray->; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
						INSERT IN ARRAY:C227($_ptr_SourceDataType->; $_l_ArraySize; 1)
						$_ptr_DataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
						INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
						$_ptr_DataArray:=Get pointer:C304("DIA_ai_"+$_t_HeaderString+"_Integer")
						INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
						$_ptr_DataArray:=Get pointer:C304("DIA_al_"+$_t_HeaderString+"_Longint")
						INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
						$_ptr_DataArray:=Get pointer:C304("DIA_ar_"+$_t_HeaderString+"_Real")
						INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
						$_ptr_DataArray:=Get pointer:C304("DIA_ad_"+$_t_HeaderString+"_Date")
						INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
						$_ptr_DataArray:=Get pointer:C304("DIA_abo_"+$_t_HeaderString+"_Boolean")
						INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
						$_ptr_DataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Text")
						INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
						$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldArray->)
						$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[DIARY:12]Company_Code:1)
					End if 
					$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[DIARY:12]Company_Code:1)
					$_ptr_DataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
					$_ptr_DataArray->{$_l_FieldPosition}:=DM_t_ValidCompany
				End if 
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([CONTACTS:1])=0)
					//handle error here
					$_ptr_SourceDataArray->{$_l_Index}:=""
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Action_Code:9))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([ACTIONS:13])=0)
					QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Name:2=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([ACTIONS:13])=0)
						$_ptr_SourceDataArray->{$_l_Index}:=""
					Else 
						$_ptr_SourceDataArray->{$_l_Index}:=[ACTIONS:13]Action_Code:1
					End if 
					
				End if 
				
				
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Call_Code:25))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([SERVICE_CALLS:20])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Document_Code:15))  //Person
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				//person
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([DOCUMENTS:7])=0)
					$_ptr_SourceDataArray->{$_l_Index}:=""
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Person:8))  //State
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Person_Identity:13=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([PERSONNEL:11])=0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						//handle error
						$_ptr_SourceDataArray->{$_l_Index}:=""
					Else 
						$_ptr_SourceDataArray->{$_l_Index}:=[PERSONNEL:11]Person_Identity:13
					End if 
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Person:8))  //State
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Person_Identity:13=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([PERSONNEL:11])=0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_ptr_SourceDataArray->{$_l_Index})
					If (Records in selection:C76([PERSONNEL:11])=0)
						//handle error
						$_ptr_SourceDataArray->{$_l_Index}:=""
					Else 
						$_ptr_SourceDataArray->{$_l_Index}:=[PERSONNEL:11]Person_Identity:13
					End if 
				End if 
				
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Job_Code:19))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([JOBS:26])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Script_Code:29))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([SCRIPTS:80])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Order_Code:26))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([ORDERS:24])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Picture_Code:37))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PICTURES:85]; [PICTURES:85]Picture_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([PICTURES:85])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Product_Code:13))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([PRODUCTS:9])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Result_Code:11))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([RESULTS:14])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
			: (Field:C253($_ptr_DataField)=Field:C253(->[DIARY:12]Stage_Code:21))  //ACTIONS
				$_ptr_SourceDataArray:=Get pointer:C304("DIA_at_"+$_t_HeaderString+"_Strings")
				QUERY:C277([STAGES:45]; [STAGES:45]Stage_Code:1=$_ptr_SourceDataArray->{$_l_Index})
				If (Records in selection:C76([STAGES:45])=0)
					
					
					$_ptr_SourceDataArray->{$_l_Index}:=""
					
					
				End if 
				
				
		End case 
		
	End for 
	//all the raw data is now validated.
	//now we can set ‘other fields
	//LOAD the Options information.
	DM_SetDiaryDefaults($3; $_t_HeaderString; $_t_DetailString)
	//now all the supplied and default fields are set in the arrays we can
	//call the order creation method
	DM_l_Validity:=0
	DM_l_ValidityCheck:=AA_GetNextIDinMethod(->DM_l_Validity)
	
	
	//DM_Createorder(DM_l_ValidityCheck;DM_l_Options;$_t_HeaderString;$_t_DetailString;->DM_bl_StatesArrays)
	$0:=True:C214
	$_ptr_SourceFieldArray:=Get pointer:C304("DIA_al_"+$_t_DetailString+"_Sfield")
	$_ptr_DestinationFieldArray:=Get pointer:C304("DIA_al_"+$_t_DetailString+"_Fields")
	$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[DIARY:12]Diary_Code:3))
	If ($_l_FieldPosition>0)
		$_ptr_DataArray:=Get pointer:C304("DIA_at_"+$_t_DetailString+"_Strings")
		
		$_t_DiaryCode:=$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}
		If ($_t_DiaryCode#"")
			QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_DiaryCode)
			If (Records in selection:C76([DIARY:12])=0)
				DM_CreateDiary(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $6; $7)
			Else 
				//record exists so just update
				$6->:=[CONTACTS:1]Contact_Code:2
				$7->:=[CONTACTS:1]Company_Code:1
				DM_ModifyContact([CONTACTS:1]Company_Code:1; [CONTACTS:1]Contact_Code:2; DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $_l_Index)
				$0:=True:C214
			End if 
		Else 
			DM_CreateContact(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $6; $7)
			$0:=True:C214
		End if 
		
	Else 
		DM_CreateContact(DM_l_ValidityCheck; DM_l_Options; $_t_HeaderString; $_t_DetailString; $6; $7)
		$0:=True:C214
	End if 
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("DM_VALIDATEDIARY"; $_t_oldMethodName)