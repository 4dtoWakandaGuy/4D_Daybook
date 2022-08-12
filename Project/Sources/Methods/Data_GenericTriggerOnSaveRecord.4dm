//%attributes = {}

//Database Method Name:      Data_GenericTriggerOnSaveRecord
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  28/10/2017
//Created BY:  Unknown
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_NewBLob; $_blb_OldBLob)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting; $_bo_LastCHangeFieldSet)
	C_LONGINT:C283($_l_DatabaseEventValue; $_l_FieldIndex; $_l_FIeldModifiedCount; $_l_IDFIeldNumber; $_l_LastFieldNumber; $_l_RecordIDValue; $_l_recordNumValue; $_l_RecordStatus; $_l_TableNumValue; $_l_TriggerLevelValue; $_l_UUIDFieldNumber)
	C_LONGINT:C283($1; $2; $3)
	C_OBJECT:C1216($_Obj_RecordInformation)
	C_PICTURE:C286($_pic_Mask; $_pic_OldPicture)
	C_POINTER:C301($_ptr_CurrentFieldPointer; $_Ptr_IDFIeldPointer; $_Ptr_lastChangeField; $_Ptr_TablePointer; $_Ptr_TablePtr; $_Ptr_UUIDFieldPointer; $4)
	C_TEXT:C284($_t_CurrentUserName; $_t_FieldName; $_t_LastChangeReason; $_txt_NewBlobText; $_txt_oldBlobText; $_Txt_RecordUUID)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Data_GenericTriggerOnSaveRecord")

If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      Data_GenericTriggerOnSaveRecord
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------

If (Count parameters:C259>=1)
	$_l_TriggerLevelValue:=Trigger level:C398
	TRIGGER PROPERTIES:C399($_l_TriggerLevelValue; $_l_DatabaseEventValue; $_l_TableNumValue; $_l_recordNumValue)
	
	$_l_UUIDFieldNumber:=1  //The UUID field is the First_Field by default=only need to pass it if for some reason it is different
	$_l_IDFIeldNumber:=2  //THe ID field is the second field by default=only need to pass it is different
	$_l_UUIDFieldNumber:=$1
	If (Count parameters:C259>=2)
		If ($2#0)
			$_l_IDFIeldNumber:=$2
		End if 
	End if 
	If (Count parameters:C259>=3)
		If ($3#0)
			$_l_RecordStatus:=$3
		End if 
	End if 
	$_bo_LastCHangeFieldSet:=False:C215
	If (Count parameters:C259>=4)
		$_Ptr_lastChangeField:=$4
		$_bo_LastCHangeFieldSet:=True:C214
	End if 
Else 
	
	
	
End if 

//-------------------- Main Method -------------------
If ($_l_TableNumValue>0)
	$_t_CurrentUserName:=Current user:C182
	
	
	$_t_LastChangeReason:=""
	If ($_bo_LastCHangeFieldSet)
		If (Type:C295($_Ptr_lastChangeField->)=Is text:K8:3)
			$_t_LastChangeReason:=$_Ptr_lastChangeField->
			$_Ptr_lastChangeField->:=""  //clear it
		End if 
	End if 
	$_l_RecordIDValue:=0
	$_Ptr_TablePtr:=Table:C252($_l_TableNumValue)
	$_Ptr_UUIDFieldPointer:=Field:C253($_l_TableNumValue; $_l_UUIDFieldNumber)
	
	$_Txt_RecordUUID:=$_Ptr_UUIDFieldPointer->  //note that this value is auto created when the record is created
	//Create a an id on the record if there is one
	If ($_l_TableNumValue#Table:C252(->[IDENTIFIERS:16])) & ($_l_TableNumValue#Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		
		If ($_l_IDFIeldNumber>0)  //Note that some tables do not have this
			$_Ptr_IDFIeldPointer:=Field:C253($_l_TableNumValue; $_l_IDFIeldNumber)
			If (Type:C295($_Ptr_IDFIeldPointer->)=Is longint:K8:6)
				If ($_Ptr_IDFIeldPointer->=0)
					$_Ptr_IDFIeldPointer->:=AA_GetNextID($_Ptr_IDFIeldPointer)
				End if 
				$_l_RecordIDValue:=$_Ptr_IDFIeldPointer->
			Else 
				$_l_RecordIDValue:=0
			End if 
		Else 
			$_l_RecordIDValue:=0
		End if 
	End if 
	////
	$_Ptr_TablePointer:=Table:C252($_l_TableNumValue)
	$_l_LastFieldNumber:=Get last field number:C255($_l_TableNumValue)
	$_l_FIeldModifiedCount:=0
	$_t_FieldName:=""
	For ($_l_FieldIndex; 1; $_l_LastFieldNumber)
		If (Is field number valid:C1000($_l_TableNumValue; $_l_FieldIndex))
			$_ptr_CurrentFieldPointer:=Field:C253($_l_TableNumValue; $_l_FieldIndex)
			Case of 
				: (Type:C295($_ptr_CurrentFieldPointer->)=Is BLOB:K8:12)
					$_blb_OldBLob:=Old:C35($_ptr_CurrentFieldPointer->)
					$_txt_oldBlobText:=BLOB to text:C555($_blb_OldBLob; UTF8 text without length:K22:17)
					$_blb_NewBLob:=($_ptr_CurrentFieldPointer->)
					$_txt_NewBlobText:=BLOB to text:C555($_blb_NewBLob; UTF8 text without length:K22:17)
					If ($_txt_NewBlobText#$_txt_oldBlobText)
						If ($_t_FieldName="")
							$_t_FieldName:=Field name:C257($_l_TableNumValue; $_l_FieldIndex)
						Else 
							$_t_FieldName:=$_t_FieldName+", and "+Field name:C257($_l_TableNumValue; $_l_FieldIndex)
						End if 
					End if 
					
				: (Type:C295($_ptr_CurrentFieldPointer->)=Is picture:K8:10)
					$_pic_OldPicture:=Old:C35($_ptr_CurrentFieldPointer->)
					If (Picture size:C356($_pic_OldPicture)>0) | (Picture size:C356($_ptr_CurrentFieldPointer->)>0)
						If (Not:C34(Equal pictures:C1196($_pic_OldPicture; $_ptr_CurrentFieldPointer->; $_pic_Mask)))
							
							If ($_t_FieldName="")
								$_t_FieldName:=Field name:C257($_l_TableNumValue; $_l_FieldIndex)
							Else 
								$_t_FieldName:=$_t_FieldName+", and "+Field name:C257($_l_TableNumValue; $_l_FieldIndex)
							End if 
						End if 
					End if 
				Else 
					
					If ((Old:C35($_ptr_CurrentFieldPointer->))#($_ptr_CurrentFieldPointer->))
						$_l_FIeldModifiedCount:=$_l_FIeldModifiedCount+1
						If ($_t_FieldName="")
							$_t_FieldName:=Field name:C257($_l_TableNumValue; $_l_FieldIndex)
						Else 
							$_t_FieldName:=$_t_FieldName+", and "+Field name:C257($_l_TableNumValue; $_l_FieldIndex)
						End if 
					End if 
			End case 
		End if 
	End for 
	If ($_l_FIeldModifiedCount>0)
		//TRACE
		
		
		////
		//Create a Record in the post action table to create the mirror
		If (DB_HasTableHistory($_l_TableNumValue))
			OB SET:C1220($_obj_RecordInformation; "Last Editor Name"; $_t_CurrentUserName)
			OB SET:C1220($_obj_RecordInformation; "Last Editor Reason"; $_t_LastChangeReason)
			OB SET:C1220($_Obj_RecordInformation; "Master Table"; $_l_TableNumValue)
			OB SET:C1220($_Obj_RecordInformation; "Master UUID"; $_Txt_RecordUUID)
			OB SET:C1220($_Obj_RecordInformation; "Master ID"; $_l_RecordIDValue)
			If ($_l_RecordStatus#0)
				OB SET:C1220($_Obj_RecordInformation; "Record Status"; $_l_RecordStatus)
			End if 
			//DATA_CreatePostAction($_l_TableNumValue;"Integrity";$_Obj_RecordInformation)
		End if 
	End if 
End if 
//DATA_CreatePostAction ($_l_TableNumValue;"Integrity";$_Obj_RecordInformation)
ERR_MethodTrackerReturn("Data_GenericTriggerOnSaveRecord"; $_t_oldMethodName)