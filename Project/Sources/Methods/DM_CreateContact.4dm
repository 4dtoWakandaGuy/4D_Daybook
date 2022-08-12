//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_CreateContact
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
	C_BOOLEAN:C305($_bo_Modify)
	C_LONGINT:C283($_l_ArraySize; $_l_CharacterPosition; $_l_FieldPosition; $_l_Fieldtype; $_l_Index; $_l_Index2; $_l_RecordCount; $_l_RecordIdentFieldPosition; DM_l_ValidityCheck; vAdd)
	C_POINTER:C301($_ptr_DataArray; $_ptr_DataArrayPointer; $_ptr_DestinationFieldArray; $_ptr_DestinationFieldArray2; $_Ptr_DetailsField; $_ptr_DetailStringArray; $_ptr_Field; $_Ptr_HeaderArray; $_ptr_HeaderFIeld; $_ptr_SourceData; $_ptr_SourceFieldArray)
	C_POINTER:C301($_Ptr_SourceFieldArray2; $_Ptr_SourceType2; $_ptr_SourceTypePointer; $5; $6)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_DetailData; $_t_EmailAfter; $_t_EmailBefore; $_t_EmailTotal; $_t_ForeName; $_t_HeaderData; $_t_oldMethodName; $_t_SurName; $3; $4; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DM_t_CallingCompanyCode; DM_t_CallingCompanyName; DM_t_CallingCompanyPostCode; SYS_t_AccessType)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_CreateContact")
//here we are receiving contact data
//we must test if the company exists
//if we are not passed a company code
//we will query for the company by name and post code
//if the record exists we dont need to create it
//this method will also take a further check to see we do not create the same cont
//contact more than once.
//upto this point any checks have only looked at the contact code.
DM_t_CallingCompanyName:=""
DM_t_CallingCompanyPostCode:=""
DM_t_CallingCompanyCode:=""

If (Count parameters:C259>=2)
	If ($1=DM_l_ValidityCheck) & (DM_l_ValidityCheck>0)
		//VALID CALL
		$_t_HeaderData:=$3
		$_t_DetailData:=$4
		$_ptr_HeaderFIeld:=Get pointer:C304("CUS_ati_"+$3+"_Fields")
		$_l_FieldPosition:=Find in array:C230($_ptr_HeaderFIeld->; Field:C253(->[COMPANIES:2]Company_Code:1))
		If ($_l_FieldPosition>0)
			$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Strings")
			DM_t_CallingCompanyCode:=$_ptr_SourceData->{$_l_FieldPosition}
		End if 
		$_l_FieldPosition:=Find in array:C230($_ptr_HeaderFIeld->; Field:C253(->[COMPANIES:2]Company_Name:2))
		If ($_l_FieldPosition>0)
			$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Strings")
			DM_t_CallingCompanyName:=$_ptr_SourceData->{$_l_FieldPosition}
		End if 
		$_l_FieldPosition:=Find in array:C230($_ptr_HeaderFIeld->; Field:C253(->[COMPANIES:2]Postal_Code:7))
		If ($_l_FieldPosition>0)
			$_ptr_SourceData:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Strings")
			DM_t_CallingCompanyPostCode:=$_ptr_SourceData->{$_l_FieldPosition}
		End if 
		
		If (DM_t_CallingCompanyCode="") & (DM_t_CallingCompanyName#"") & (DM_t_CallingCompanyPostCode#"")
			//we dont have a company code
			//but we have a post code and company name
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Name:2=DM_t_CallingCompanyName; *)
			QUERY:C277([COMPANIES:2];  & ; [COMPANIES:2]Postal_Code:7=DM_t_CallingCompanyPostCode)
			If (Records in selection:C76([COMPANIES:2])>=1)
				DM_t_CallingCompanyCode:=[COMPANIES:2]Company_Code:1
			End if 
		End if 
		If (DM_t_CallingCompanyCode="")
			DM_CreateCompany($1; $2; $3; $5)
			
			$_bo_Modify:=False:C215
			DM_t_CallingCompanyCode:=$5->
		Else 
			$_bo_Modify:=True:C214
		End if 
		If (DM_t_CallingCompanyCode#"")
			$5->:=DM_t_CallingCompanyCode
			//we have a company code
			//put the company code on the contact arrays
			//update the company record.
			$_ptr_SourceFieldArray:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Sfield")
			$_ptr_SourceTypePointer:=Get pointer:C304("CUS_ati_"+$_t_HeaderData+"_SFieldType")
			$_ptr_DestinationFieldArray:=Get pointer:C304("CUS_ati_"+$_t_HeaderData+"_Fields")
			
			$_l_RecordIdentFieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[COMPANIES:2]Company_Code:1))
			
			$_Ptr_SourceFieldArray2:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Sfield")
			$_Ptr_SourceType2:=Get pointer:C304("CUS_ati_"+$_t_DetailData+"_SFieldType")
			$_ptr_DestinationFieldArray2:=Get pointer:C304("CUS_ati_"+$_t_DetailData+"_Fields")
			$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray2->; Field:C253(->[CONTACTS:1]Company_Code:1))
			If ($_l_FieldPosition<0)
				//field in details array does not exist
				$_l_ArraySize:=Size of array:C274($_ptr_DestinationFieldArray2->)+1
				INSERT IN ARRAY:C227($_ptr_DestinationFieldArray2->; $_l_ArraySize; 1)
				INSERT IN ARRAY:C227($_Ptr_SourceFieldArray2->; $_l_ArraySize; 1)
				INSERT IN ARRAY:C227($_Ptr_SourceType2->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Strings")
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
				End for 
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_DetailData+"_Integer")
					INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
				End for 
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					$_ptr_DataArray:=Get pointer:C304("CUS_ati_"+$_t_DetailData+"_Longint")
					INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
				End for 
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_DetailData+"_Real")
					INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
				End for 
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_DetailData+"_Date")
					INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
				End for 
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_DetailData+"_Boolean")
					INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
				End for 
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Text")
					INSERT IN ARRAY:C227($_ptr_DataArray->{$_l_Index}; $_l_ArraySize; 1)
				End for 
				$_l_FieldPosition:=Size of array:C274($_ptr_DestinationFieldArray2->)
				$_ptr_DestinationFieldArray2->{$_l_FieldPosition}:=Field:C253(->[CONTACTS:1]Company_Code:1)
				$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Strings")
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_CallingCompanyCode
				End for 
				
			Else 
				$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Strings")
				For ($_l_Index; 1; Size of array:C274($_ptr_DataArray->))
					If ($_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}="")
						$_ptr_DataArray->{$_l_Index}{$_l_FieldPosition}:=DM_t_CallingCompanyCode
					End if 
				End for 
				
			End if 
			If ($_l_RecordIdentFieldPosition<0)
				//field in header array does not exist so add it
				$_l_ArraySize:=Size of array:C274($_ptr_DestinationFieldArray->)
				INSERT IN ARRAY:C227($_ptr_DestinationFieldArray->; $_l_ArraySize; 1)
				INSERT IN ARRAY:C227($_ptr_SourceFieldArray->; $_l_ArraySize; 1)
				INSERT IN ARRAY:C227($_ptr_SourceTypePointer->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Strings")
				INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_ai_"+$_t_HeaderData+"_Integer")
				INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_ati_"+$_t_HeaderData+"_Longint")
				INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_ar_"+$_t_HeaderData+"_Real")
				INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_ad_"+$_t_HeaderData+"_Date")
				INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_abo_"+$_t_HeaderData+"_Boolean")
				INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
				$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Text")
				INSERT IN ARRAY:C227($_ptr_DataArray->; $_l_ArraySize; 1)
				$_l_RecordIdentFieldPosition:=Size of array:C274($_ptr_DestinationFieldArray->)
				$_ptr_DestinationFieldArray->{$_l_FieldPosition}:=Field:C253(->[COMPANIES:2]Company_Code:1)
				$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Strings")
				$_Ptr_HeaderArray:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Strings")
				$_Ptr_HeaderArray->{$_l_RecordIdentFieldPosition}:=DM_t_CallingCompanyCode
			Else 
				$_ptr_DataArray:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Strings")
				$_Ptr_HeaderArray:=Get pointer:C304("CUS_at_"+$_t_HeaderData+"_Strings")
				$_Ptr_HeaderArray->{$_l_RecordIdentFieldPosition}:=DM_t_CallingCompanyCode
			End if 
		End if 
		If ($_bo_Modify)
			
			DM_ModifyCompany(DM_t_CallingCompanyCode; $1; $2; $3; $4)
			
			
		End if 
		
	End if 
	//the Company_Now exists
	//we will now simulate creating a contact
	//record
	//actually first we will see if the the contact exists using the company code
	//the only UNIQUE value that users enter is an email address
	//NOTE two people could use the same email address e.g. info@
	// but if two peter smiths were using the same then we can only assume
	//they are the same peter smith.
	$_ptr_DetailStringArray:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Strings")
	$_l_RecordCount:=Size of array:C274($_ptr_DetailStringArray->)
	For ($_l_Index2; 1; $_l_RecordCount)  //this is probably ONE
		$_t_ForeName:=""
		$_t_SurName:=""
		$_ptr_DestinationFieldArray:=Get pointer:C304("CUS_ati_"+$_t_DetailData+"_Fields")
		$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Forename:4))
		If ($_l_FieldPosition>0)
			$_t_ForeName:=$_ptr_DetailStringArray->{$_l_Index2}{$_l_FieldPosition}
		End if 
		$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Surname:5))
		If ($_l_FieldPosition>0)
			$_t_SurName:=$_ptr_DetailStringArray->{$_l_Index2}{$_l_FieldPosition}
		End if 
		$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]EMail_After_At:24))
		If ($_l_FieldPosition>0)
			$_t_EmailAfter:=$_ptr_DetailStringArray->{$_l_Index2}{$_l_FieldPosition}
		End if 
		$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Email_Before_At:30))
		If ($_l_FieldPosition>0)
			$_t_EmailBefore:=$_ptr_DetailStringArray->{$_l_Index2}{$_l_FieldPosition}
		End if 
		//need the full email field to complete this.
		$_t_EmailTotal:=""
		$_l_FieldPosition:=Find in array:C230($_ptr_DestinationFieldArray->; Field:C253(->[CONTACTS:1]Email_Address:35))
		If ($_l_FieldPosition>0)
			$_t_EmailTotal:=$_ptr_DetailStringArray->{$_l_Index2}{$_l_FieldPosition}
		End if 
		If ($_t_EmailTotal#"")
			$_l_CharacterPosition:=Position:C15(Char:C90(64); $_t_EmailTotal)
			If ($_l_CharacterPosition>0)
				//it should be
				$_t_EmailBefore:=Substring:C12($_t_EmailTotal; 1; $_l_CharacterPosition-1)
				$_t_EmailAfter:=Substring:C12($_t_EmailTotal; $_l_CharacterPosition+1; Length:C16($_t_EmailTotal))
			End if 
			
		End if 
		
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=DM_t_CallingCompanyCode; *)
		QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_ForeName; *)
		QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Surname:5=$_t_SurName; *)
		QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]EMail_After_At:24=$_t_EmailAfter; *)
		QUERY:C277([CONTACTS:1];  & ; [CONTACTS:1]Email_Before_At:30=$_t_EmailBefore)
		If (Records in selection:C76([CONTACTS:1])=0)
			//create
			
			StartTransaction
			Start_Process
			vAdd:=1
			SYS_t_AccessType:=""
			DB_t_CurrentFormUsage:="None"
			READ WRITE:C146([CONTACTS:1])
			CREATE RECORD:C68([CONTACTS:1])
			//note that this generates CONTACTS NOT THE COMPANY
			Contacts_InLPB(False:C215)
			$_Ptr_DetailsField:=Get pointer:C304("CUS_ati_"+$_t_DetailData+"_Fields")
			For ($_l_Index; 1; Size of array:C274($_Ptr_DetailsField->))
				$_ptr_Field:=Field:C253(Table:C252(->[CONTACTS:1]); $_Ptr_DetailsField->{$_l_Index})
				$_l_Fieldtype:=Type:C295($_ptr_Field->)
				Case of 
					: ($_l_Fieldtype=Is alpha field:K8:1)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Strings")
					: ($_l_Fieldtype=Is text:K8:3)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_at_"+$_t_DetailData+"_Text")
					: ($_l_Fieldtype=Is real:K8:4)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_ar_"+$_t_DetailData+"_Real")
					: ($_l_Fieldtype=Is longint:K8:6)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_ati_"+$_t_DetailData+"_Longint")
					: ($_l_Fieldtype=Is integer:K8:5)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_ai_"+$_t_DetailData+"_Integer")
					: ($_l_Fieldtype=Is date:K8:7)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_ad_"+$_t_DetailData+"_Date")
					: ($_l_Fieldtype=Is time:K8:8)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_ati_"+$_t_DetailData+"_Time")
					: ($_l_Fieldtype=Is boolean:K8:9)
						$_ptr_DataArrayPointer:=Get pointer:C304("CUS_abo_"+$_t_DetailData+"_Boolean")
						
				End case 
				If ($_l_Fieldtype=Is time:K8:8)
					$_ti_Time:=Time:C179(Time string:C180($_ptr_DataArrayPointer->{$_l_Index2}{$_l_Index}))
					$_ptr_Field->:=$_ti_Time
				Else 
					$_ptr_Field->:=$_ptr_DataArrayPointer->{$_l_Index2}{$_l_Index}
				End if 
				Contacts_InLPD
			End for 
			If ([CONTACTS:1]Contact_Code:2="")
				Contact_Code
			End if 
			DB_SaveRecord(->[CONTACTS:1])
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
			$6->:=[CONTACTS:1]Contact_Code:2
			$5->:=[CONTACTS:1]Company_Code:1
			Transact_End
			
		Else 
			//recall modify
			$6->:=[CONTACTS:1]Contact_Code:2
			$5->:=[CONTACTS:1]Company_Code:1
			DM_ModifyContact([CONTACTS:1]Company_Code:1; [CONTACTS:1]Contact_Code:2; $1; $2; $_t_HeaderData; $_t_DetailData; $_l_Index2)
			
		End if 
		
	End for 
	
End if 
ERR_MethodTrackerReturn("DM_CreateContact"; $_t_oldMethodName)