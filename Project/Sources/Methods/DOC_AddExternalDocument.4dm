//%attributes = {}

If (False:C215)
	//Project Method Name:      DOC_AddExternalDocument
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
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	ARRAY TEXT:C222($_at_AttachmentNames; 0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_BLOB:C604($_blb_DocumentBLOB)
	C_BOOLEAN:C305($_bo_SetPrimeRelation)
	C_LONGINT:C283($_l_attachmentIndex; $_l_attachmentIndexDField; $_l_DeNormalised; $_l_DocNameIndex; $_l_DocumentSize; $_l_FieldRow; $_l_OK; $_l_Process; $_l_RelationsIndex; $_l_VariableType; $_l_VariableType2)
	C_LONGINT:C283($_l_VariableType3; $_l_VariableType4; SD2_l_autoActionCode)
	C_POINTER:C301($_ptr_Field; $_ptr_Field2; $_ptr_Table; $1; $2; $3; $4)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentDocumentCode; $_t_DocumentExtension; $_t_DocumentName; $_t_oldMethodName; $_t_RelationshipName; $_t_SelectedPath; DOC_t_DocumentCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_AddExternalDocument")

If (False:C215)
	
End if 
$_t_oldMethodName:=ERR_MethodTracker("DOC_AddExternalDocument")

ARRAY TEXT:C222($_at_AttachmentNames; 0)
//Note do not mix metaphores in the pointers either pointer to an array or a variable-is $1»  is a variable and $2» is an array this will get an error
If (Count parameters:C259>=3)  //cannot attach a doc to nothing
	//vvv
	$_l_VariableType:=Type:C295($1->)
	$_l_VariableType2:=Type:C295($2->)
	$_l_VariableType3:=Type:C295($3->)
	If (Count parameters:C259>=4)
		$_l_VariableType4:=Type:C295($4->)
	End if 
	$_l_OK:=0
	If ($_l_VariableType=14) | ($_l_VariableType=15) | ($_l_VariableType=16)  //Longint integer or real array pointer
		If ($_l_VariableType2=14) | ($_l_VariableType2=15) | ($_l_VariableType2=16)  // Field pointer arrays
			If ($_l_VariableType3=21) | ($_l_VariableType3=18)  //Record codes array-strings
				If (Count parameters:C259>=4)
					If ($_l_VariableType4=14) | ($_l_VariableType4=15) | ($_l_VariableType4=16)  //`Record IDs pointer array
						$_l_OK:=1
					End if 
				Else 
					$_l_OK:=1
				End if 
			End if 
		End if 
	Else 
		If ($_l_VariableType=1) | ($_l_VariableType=8) | ($_l_VariableType=9)  //Longint integer or real Variable or field pointer
			If ($_l_VariableType2=1) | ($_l_VariableType2=8) | ($_l_VariableType2=9)  // Field pointer variable
				If ($_l_VariableType3=0) | ($_l_VariableType3=24) | ($_l_VariableType3=2)  //Record code strings
					If (Count parameters:C259>=4)
						If ($_l_VariableType4=1) | ($_l_VariableType4=8) | ($_l_VariableType4=9)  // Record ID pointer variable
							$_l_OK:=1
						End if 
					Else 
						$_l_OK:=1
					End if 
				End if 
			End if 
		End if 
	End if 
	If ($_l_OK=1)
		$_t_SelectedPath:=DB_SelectDocument(""; "*"; "Select Document(s) to Attach"; 1; ->$_at_AttachmentNames)
		If (Size of array:C274($_at_AttachmentNames)>0) & (OK=1)
			//Create a [DOCUMENT] record for each one and a diary record..note the diary record should be DONE
			For ($_l_attachmentIndex; 1; Size of array:C274($_at_AttachmentNames))
				CREATE RECORD:C68([DOCUMENTS:7])
				[DOCUMENTS:7]Document_Class:14:=-13
				GET DOCUMENT ICON:C700($_at_AttachmentNames{$_l_attachmentIndex}; [DOCUMENTS:7]DOC_ICON:20; 16)
				[DOCUMENTS:7]DOC_PATH:21:=$_at_AttachmentNames{$_l_attachmentIndex}
				[DOCUMENTS:7]DOC_LOCATION:22:=Get_Email_Owner  //Re--using this bit of code which returns a machine name
				$_t_DocumentName:=DocNameFromPath($_at_AttachmentNames{$_l_attachmentIndex})
				[DOCUMENTS:7]Heading:2:=$_t_DocumentName
				//$Document_Type:=_o_Document type($_at_AttachmentNames{$_l_attachmentIndex})
				//If ($Document_Type="    ")  //no doc type..get the doc extn
				For ($_l_DocNameIndex; Length:C16($_t_DocumentName); 1; -1)
					If ($_t_DocumentName[[$_l_DocNameIndex]]=".")
						$_t_DocumentExtension:=Substring:C12($_t_DocumentName; $_l_DocNameIndex; Length:C16($_t_DocumentName))
						$_l_DocNameIndex:=0
					End if 
				End for 
				//End if 
				//[DOCUMENTS]DOC_CREATOR:=_o_Document creator($_at_AttachmentNames{$_l_attachmentIndex})
				SET BLOB SIZE:C606($_blb_DocumentBLOB; 0)
				$_l_DocumentSize:=Get document size:C479($_at_AttachmentNames{$_l_attachmentIndex})
				If ($_l_DocumentSize<32000)  //This is only so we are not storing big blobs. The blob of the doc is just for speed anyway
					DOCUMENT TO BLOB:C525($_at_AttachmentNames{$_l_attachmentIndex}; [DOCUMENTS:7]DOC_BLOB:17)
				End if 
				$_t_CurrentDocumentCode:=DOC_t_DocumentCode
				Let_No("A")
				[DOCUMENTS:7]Document_Code:1:=DOC_t_DocumentCode
				DOC_t_DocumentCode:=$_t_CurrentDocumentCode
				[DOCUMENTS:7]Person:10:=<>PER_t_CurrentUserInitials
				//This should match the action code for the diary.
				SD2_CheckDefaultAction("DOC")
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1="DOC")
				SD2_ActionAttributesToArrays
				[DOCUMENTS:7]Document_Type:13:="DOC"
				DB_SaveRecord(->[DOCUMENTS:7])
				CREATE RECORD:C68([DIARY:12])
				[DIARY:12]Action_Code:9:="DOC"
				[DIARY:12]Subject:63:=[DOCUMENTS:7]Heading:2
				[DIARY:12]Date_Do_From:4:=Current date:C33(*)
				[DIARY:12]Date_Do_To:33:=Current date:C33(*)
				[DIARY:12]Date_Done_From:5:=Current date:C33(*)
				[DIARY:12]Date_Done_To:34:=Current date:C33(*)
				DiarySetCode
				[DIARY:12]Document_Heading:32:=[DOCUMENTS:7]Heading:2
				[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
				[DIARY:12]Done:14:=True:C214
				[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
				[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
				If ([PERSONNEL:11]Initials:1#[DIARY:12]Person:8)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
				End if 
				[DIARY:12]PersonID:56:=[PERSONNEL:11]Personnel_ID:48
				//[DIARY]Result Code
				If ([DIARY:12]Company_Code:1#"")
					If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)
						[DIARY:12]Status:30:=[COMPANIES:2]Status:12
					End if 
				End if 
				[DIARY:12]Time_Do_From:6:=Current time:C178(*)
				[DIARY:12]Time_Do_To:35:=Current time:C178(*)
				[DIARY:12]Time_Done_From:7:=Current time:C178(*)
				[DIARY:12]Time_Done_To:36:=Current time:C178(*)
				$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
				If ($_l_FieldRow>0)
					[DIARY:12]x_Close_Options:71:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
				End if 
				
				
				[DIARY:12]x_Open_Parent:69:=1
				[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)
				$_l_FieldRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
				If ($_l_FieldRow>0)
					SD2_l_autoActionCode:=SD2_al_ActionVirtFieldDataLong{$_l_FieldRow}
				End if 
				DB_SaveRecord(->[DIARY:12])
				If ($_l_VariableType=14) | ($_l_VariableType=15) | ($_l_VariableType=16)  //Longint integer or real array pointer
					//array of attach to
					For ($_l_RelationsIndex; 1; Size of array:C274($1->))
						//NOTE THAT THE 1ST RELATION WILL BE THE PRIME RELATION-DOES NOT REALLY MATTHER THOUGH
						$_bo_SetPrimeRelation:=False:C215
						If ($_l_RelationsIndex=1)
							$_bo_SetPrimeRelation:=True:C214
						End if 
						If ($_bo_SetPrimeRelation)
							[DIARY:12]Data_Source_Table:49:=$1->{$_l_RelationsIndex}
						End if 
						$_t_RelationshipName:=""
						Case of 
								
							: ($1->{$_l_RelationsIndex}=Table:C252(->[SERVICE_CALLS:20])) & ([DIARY:12]Call_Code:25="")
								[DIARY:12]Call_Code:25:=$3->{$_l_RelationsIndex}
								$_t_RelationshipName:="Service Call"
							: ($1->{$_l_RelationsIndex}=Table:C252(->[COMPANIES:2])) & ([DIARY:12]Company_Code:1="")
								[DIARY:12]Company_Code:1:=$3->{$_l_RelationsIndex}
								$_t_RelationshipName:="Company"
							: ($1->{$_l_RelationsIndex}=Table:C252(->[CONTACTS:1])) & ([DIARY:12]Contact_Code:2="")
								[DIARY:12]Contact_Code:2:=$3->{$_l_RelationsIndex}
								$_t_RelationshipName:="Contact"
							: ($1->{$_l_RelationsIndex}=Table:C252(->[JOBS:26])) & ([DIARY:12]Job_Code:19="")
								[DIARY:12]Job_Code:19:=$3->{$_l_RelationsIndex}
								$_t_RelationshipName:="Job"
							: ($1->{$_l_RelationsIndex}=Table:C252(->[ORDERS:24])) & ([DIARY:12]Order_Code:26="")
								[DIARY:12]Order_Code:26:=$3->{$_l_RelationsIndex}
								$_t_RelationshipName:="Order"
							: ($1->{$_l_RelationsIndex}=Table:C252(->[PRODUCTS:9])) & ([DIARY:12]Product_Code:13="")
								[DIARY:12]Product_Code:13:=$3->{$_l_RelationsIndex}
								$_t_RelationshipName:="Product"
							: ($1->{$_l_RelationsIndex}=Table:C252(->[JOB_STAGES:47])) & ([DIARY:12]Stage_Code:21="")
								[DIARY:12]Stage_Code:21:=$3->{$_l_RelationsIndex}
								$_t_RelationshipName:="Job Stage"
						End case 
						CREATE RECORD:C68([xDiaryRelations:137])
						[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
						
						If (Count parameters:C259>=4)
							If ($4->{$_l_RelationsIndex}=0)
								$_ptr_Field:=Field:C253($1->{$_l_RelationsIndex}; $2->{$_l_RelationsIndex})
								If ($_ptr_Field->#$3->{$_l_RelationsIndex})  //Note the $2  must always be pointer at the code field  not the ID field
									$_ptr_Table:=Table:C252($1->{$_l_RelationsIndex})
									QUERY:C277($_ptr_Table->; $_ptr_Field->=$3->{$_l_RelationsIndex})
								End if 
								$_l_attachmentIndexDField:=AA_GetIDFieldNum($1->{$_l_RelationsIndex})
								If ($_l_attachmentIndexDField>0)
									$_ptr_Field2:=Field:C253($1->{$_l_RelationsIndex}; $_l_attachmentIndexDField)
									[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
								End if 
								
							Else 
								[xDiaryRelations:137]xRecordID:4:=$4->{$_l_RelationsIndex}
							End if 
							[xDiaryRelations:137]XRecord_Code:5:=$3->{$_l_RelationsIndex}
						Else 
							$_ptr_Field:=Field:C253($1->{$_l_RelationsIndex}; $2->{$_l_RelationsIndex})
							If ($_ptr_Field->#$3->{$_l_RelationsIndex})  //Note the $2  must always be pointer at the code field  not the ID field
								$_ptr_Table:=Table:C252($1->{$_l_RelationsIndex})
								QUERY:C277($_ptr_Table->; $_ptr_Field->=$3->{$_l_RelationsIndex})
							End if 
							$_l_attachmentIndexDField:=AA_GetIDFieldNum($1->{$_l_RelationsIndex})
							If ($_l_attachmentIndexDField>0)
								$_ptr_Field2:=Field:C253($1->{$_l_RelationsIndex}; $_l_attachmentIndexDField)
								[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
							End if 
							[xDiaryRelations:137]XRecord_Code:5:=$3->{$_l_RelationsIndex}
						End if 
						[xDiaryRelations:137]xTableNUM:3:=$1->{$_l_RelationsIndex}
						$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
						[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
						[xDiaryRelations:137]X_DisplayedName:6:=""
						[xDiaryRelations:137]x_RelationshipName:7:=$_t_RelationshipName
						DB_SaveRecord(->[xDiaryRelations:137])
						
					End for 
					
				Else 
					//aTTACH TO ONE
					
					//NOTE THAT THE 1ST RELATION WILL BE THE PRIME RELATION-DOES NOT REALLY MATTHER THOUGH
					
					[DIARY:12]Data_Source_Table:49:=$1->
					
					$_t_RelationshipName:=""
					Case of 
							
						: ($1->=Table:C252(->[SERVICE_CALLS:20])) & ([DIARY:12]Call_Code:25="")
							[DIARY:12]Call_Code:25:=$3->
							$_t_RelationshipName:="Service Call"
						: ($1->=Table:C252(->[COMPANIES:2])) & ([DIARY:12]Company_Code:1="")
							[DIARY:12]Company_Code:1:=$3->
							$_t_RelationshipName:="Company"
						: ($1->=Table:C252(->[CONTACTS:1])) & ([DIARY:12]Contact_Code:2="")
							[DIARY:12]Contact_Code:2:=$3->
							$_t_RelationshipName:="Contact"
						: ($1->=Table:C252(->[JOBS:26])) & ([DIARY:12]Job_Code:19="")
							[DIARY:12]Job_Code:19:=$3->
							$_t_RelationshipName:="Job"
						: ($1->=Table:C252(->[ORDERS:24])) & ([DIARY:12]Order_Code:26="")
							[DIARY:12]Order_Code:26:=$3->
							$_t_RelationshipName:="Order"
						: ($1->=Table:C252(->[PRODUCTS:9])) & ([DIARY:12]Product_Code:13="")
							[DIARY:12]Product_Code:13:=$3->
							$_t_RelationshipName:="Product"
						: ($1->=Table:C252(->[JOB_STAGES:47])) & ([DIARY:12]Stage_Code:21="")
							[DIARY:12]Stage_Code:21:=$3->
							$_t_RelationshipName:="Job Stage"
					End case 
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					
					If (Count parameters:C259>=4)
						If ($4->=0)
							$_ptr_Field:=Field:C253($1->; $2->)
							If ($_ptr_Field->#$3->)  //Note the $2  must always be pointer at the code field  not the ID field
								$_ptr_Table:=Table:C252($1->)
								QUERY:C277($_ptr_Table->; $_ptr_Field->=$3->)
							End if 
							$_l_attachmentIndexDField:=AA_GetIDFieldNum($1->)
							If ($_l_attachmentIndexDField>0)
								$_ptr_Field2:=Field:C253($1->; $_l_attachmentIndexDField)
								[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
							End if 
							
						Else 
							[xDiaryRelations:137]xRecordID:4:=$4->
						End if 
						[xDiaryRelations:137]XRecord_Code:5:=$3->
					Else 
						$_ptr_Field:=Field:C253($1->; $2->)
						If ($_ptr_Field->#$3->)  //Note the $2  must always be pointer at the code field  not the ID field
							$_ptr_Table:=Table:C252($1->)
							QUERY:C277($_ptr_Table->; $_ptr_Field->=$3->)
						End if 
						$_l_attachmentIndexDField:=AA_GetIDFieldNum($1->)
						If ($_l_attachmentIndexDField>0)
							$_ptr_Field2:=Field:C253($1->; $_l_attachmentIndexDField)
							[xDiaryRelations:137]xRecordID:4:=$_ptr_Field2->
						End if 
						[xDiaryRelations:137]XRecord_Code:5:=$3->
					End if 
					[xDiaryRelations:137]xTableNUM:3:=$1->
					$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
					[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
					[xDiaryRelations:137]X_DisplayedName:6:=""
					[xDiaryRelations:137]x_RelationshipName:7:=$_t_RelationshipName
					DB_SaveRecord(->[xDiaryRelations:137])
					
					
				End if 
				DB_SaveRecord(->[DIARY:12])
				
				//[DIARY]Call Code
				//[DIARY]Company Code
				//[DIARY]Contact Code
				
				//[DIARY]Job Code
				//[DIARY]Order Code
				//[DIARY]Product Code
				//[DIARY]Stage Code
			End for 
			UNLOAD RECORD:C212([DOCUMENTS:7])
			UNLOAD RECORD:C212([xDiaryRelations:137])
			UNLOAD RECORD:C212([DIARY:12])
			
			$_l_Process:=New process:C317("DOC_moveDoctoServer"; 128000; "Moving Documents"; *)
		End if 
	Else 
		Gen_Alert("The parameters passed to this method do not match requirements")
	End if 
Else 
	Gen_Alert("This method has been passed too few parameters")
	
End if 
ERR_MethodTrackerReturn("DOC_AddExternalDocument"; $_t_oldMethodName)