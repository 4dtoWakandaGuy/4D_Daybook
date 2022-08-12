//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Import3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(IMP_al_SubRecordDocRef;0)
	//ARRAY LONGINT(IMP_al_SubRecordDocs;0)
	//ARRAY TEXT(GEN_at_FieldData;0)
	//ARRAY TEXT(IMP_at_ImportRecords;0;0)
	//ARRAY TEXT(IMP_at_ImportRecordsID;0;0)
	C_BLOB:C604($_blb_Export)
	C_BOOLEAN:C305($_bo_Continue; IMP_bo_GiveWarning; IMP_bo_ExportFields; GEN_bo_Overwrite; EXP_bo_ImportFIelds)
	C_LONGINT:C283($_l_CharacterPosition; $_l_Field; $_l_FieldCount; $_l_FieldIndex; $_l_OK; $_l_StartingPoint; $_l_StopLength; $_l_SubFieldRow; $_l_TableNumber; $5; GEN_l_DOCPOS)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_DocumentName; $_t_FieldName; $_t_ID; $_t_oldMethodName; $_t_ReceivedData; $_t_StructurePath; $_t_WholeRecord; $1; $2; $3; $4)
	C_TEXT:C284(DOC_t_FIeld)
	C_TIME:C306($_ti_DocumentRef; DOC_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Import3")

ARRAY TEXT:C222(IMP_at_ImportRecords; 0; 0)
ARRAY TEXT:C222(IMP_at_ImportRecordsID; 0; 0)
DEFAULT TABLE:C46(Table:C252($5)->)
DOC_ti_DocumentRef:=DB_OpenDocument($4; "TEXT")
If (Application type:C494#4D Remote mode:K5:5)
	Open window:C153(20; 60; 400; 160; -1984)
	$_t_StructurePath:=StructureFilePath
	$_t_StructurePath:=PathFromPathName($_t_StructurePath)
Else 
	$_t_StructurePath:=Application file:C491
	$_t_StructurePath:=PathFromPathName($_t_StructurePath)
End if 

If (DOC_ti_DocumentRef#?00:00:00?)
	
	If (Count parameters:C259>=1)
		$_Ptr_Table:=Current default table:C363
		
		
		If (Not:C34(IMP_bo_GiveWarning))
			//    ALERT("Note Picture fields will not be exported")
			//Gen_Alert ("Note Picture fields will not be imported")
			IMP_bo_GiveWarning:=True:C214
			CONFIRM:C162("Docs contain field names?"; "Yes"; "No")
			EXP_bo_ImportFIelds:=(OK=1)
		End if 
		ARRAY LONGINT:C221(IMP_al_SubRecordDocs; 0)
		ARRAY LONGINT:C221(IMP_al_SubRecordDocRef; 0)
		READ WRITE:C146($_Ptr_Table->)
		FIRST RECORD:C50($_Ptr_Table->)
		$_l_FieldCount:=Get last field number:C255($_Ptr_Table)
		$_l_TableNumber:=Table:C252($_Ptr_Table)
		GEN_l_DOCPOS:=0
		For ($_l_FieldIndex; 1; $_l_FieldCount)
			Case of 
				: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is subtable:K8:11)
					$_t_DocumentName:="SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldIndex)
					
					$_ti_DocumentRef:=DB_OpenDocument($_t_StructurePath+$1+$_t_DocumentName+".txt")
					If (EXP_bo_ImportFIelds)
						RECEIVE PACKET:C104(DOC_ti_DocumentRef; $_t_ReceivedData; Length:C16("Subfield see doc"+$_t_DocumentName+Char:C90(9)))
					End if 
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					GEN_l_DOCPOS:=GenImportSubRecordFieldNames($1+("SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldIndex))+".TXT"; $_l_TableNumber; $_l_FieldIndex; ""; $2; $3; GEN_l_DOCPOS)
				Else 
					If (EXP_bo_ImportFIelds)
						$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_FieldIndex)
						$_l_StopLength:=(Length:C16($_t_FieldName+Char:C90(9)))
						RECEIVE PACKET:C104(DOC_ti_DocumentRef; $_t_ReceivedData; $_l_StopLength)
					End if 
			End case 
		End for 
		//here you could check the field names
		//but we can at least count the fields
		$_l_StartingPoint:=Records in table:C83(Table:C252($_l_TableNumber)->)
		Repeat 
			RECEIVE PACKET:C104(DOC_ti_DocumentRef; $_t_WholeRecord; $3)
			If ($_t_WholeRecord#"")
				ARRAY TEXT:C222(GEN_at_FieldData; 0)
				ARRAY TEXT:C222(GEN_at_FieldData; $_l_FieldCount)
				$_l_Field:=0
				Repeat 
					$_l_CharacterPosition:=Position:C15($2; $_t_WholeRecord)
					If ($_l_CharacterPosition>0)
						$_l_Field:=$_l_Field+1
						If ($_l_Field>Size of array:C274(GEN_at_FieldData))
							INSERT IN ARRAY:C227(GEN_at_FieldData; Size of array:C274(GEN_at_FieldData)+1; 1)
						End if 
						GEN_at_FieldData{$_l_Field}:=Substring:C12($_t_WholeRecord; 1; $_l_CharacterPosition-1)
						$_t_WholeRecord:=Substring:C12($_t_WholeRecord; $_l_CharacterPosition+1; Length:C16($_t_WholeRecord))
					Else 
						$_l_CharacterPosition:=Position:C15($3; $_t_WholeRecord)
						If ($_l_CharacterPosition>0)
							$_l_Field:=$_l_Field+1
							If ($_l_Field>Size of array:C274(GEN_at_FieldData))
								INSERT IN ARRAY:C227(GEN_at_FieldData; Size of array:C274(GEN_at_FieldData)+1; 1)
							End if 
							GEN_at_FieldData{$_l_Field}:=Substring:C12($_t_WholeRecord; 1; $_l_CharacterPosition-1)
							$_t_WholeRecord:=""
						Else 
							$_l_Field:=$_l_Field+1
							If ($_l_Field>Size of array:C274(GEN_at_FieldData))
								INSERT IN ARRAY:C227(GEN_at_FieldData; Size of array:C274(GEN_at_FieldData)+1; 1)
							End if 
							GEN_at_FieldData{$_l_Field}:=$_t_WholeRecord
							$_t_WholeRecord:=""
						End if 
					End if 
				Until ($_l_CharacterPosition=0) | (Length:C16($_t_WholeRecord)=0)
				
				//we now have all the fields
				$_bo_Continue:=True:C214
				READ WRITE:C146($_Ptr_Table->)
				Gen_IMportFindRecord($_l_TableNumber; ->GEN_at_FieldData)
				If (Records in selection:C76(Table:C252($_l_TableNumber)->)=0)
					
					CREATE RECORD:C68($_Ptr_Table->)
					$_bo_Continue:=True:C214
				Else 
					$_bo_Continue:=True:C214
					If (GEN_bo_Overwrite)
						GEN_bo_Overwrite:=False:C215
					End if 
				End if 
				
				
				
				If ($_bo_Continue)
					ERASE WINDOW:C160
					MESSAGE:C88("Importing record: "+String:C10(Records in table:C83(Table:C252($_l_TableNumber)->)+1-$_l_StartingPoint)+" "+Table name:C256($_l_TableNumber))
					
					
					
					
					
					For ($_l_FieldIndex; 1; $_l_FieldCount)
						//GOTO XY(0;2)
						//MESSAGE("Importing field"+String($_l_FieldIndex)+" of "+String($_l_FieldCount))
						
						
						DOC_t_FIeld:=GEN_at_FieldData{$_l_FieldIndex}
						//
						Case of 
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is subtable:K8:11)
								$_l_SubFieldRow:=Find in array:C230(IMP_al_SubRecordDocs; $_l_FieldIndex)
								If ($_l_SubFieldRow<0)
									
									INSERT IN ARRAY:C227(IMP_al_SubRecordDocs; Size of array:C274(IMP_al_SubRecordDocs)+1; 1)
									INSERT IN ARRAY:C227(IMP_al_SubRecordDocRef; Size of array:C274(IMP_al_SubRecordDocRef)+1; 1)
									IMP_al_SubRecordDocs{Size of array:C274(IMP_al_SubRecordDocs)}:=$_l_FieldIndex
									$_l_OK:=OK
									DocImportSubRecords($_t_StructurePath+$1+("SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldIndex))+".TXT"; $_l_TableNumber; $_l_FieldIndex; DOC_t_FIeld; $2; $3)
									OK:=$_l_OK
								Else 
									$_l_OK:=OK
									DocImportSubRecords($_t_StructurePath+$1+("SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldIndex))+".TXT"; $_l_TableNumber; $_l_FieldIndex; DOC_t_FIeld; $2; $3)
									OK:=$_l_OK
								End if 
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is integer:K8:5) | (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is longint:K8:6) | (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is real:K8:4)
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_ptr_Field->:=Num:C11(DOC_t_FIeld)
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is date:K8:7)
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_ptr_Field->:=Date:C102(DOC_t_FIeld)
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is time:K8:8)
								
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_ptr_Field->:=Time:C179(Time string:C180(Num:C11((DOC_t_FIeld))))
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is date:K8:7)
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_ptr_Field->:=Date:C102(DOC_t_FIeld)
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is BLOB:K8:12)
								$_l_OK:=OK
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_t_ID:=DOC_t_FIeld
								$_t_ID:=Replace string:C233($_t_ID; "BLOB:"; "")
								If (Num:C11($_t_ID)>0)
									$_t_DocumentName:=$_t_StructurePath+"BLOBS:"+$1+"_"+$_t_ID+"_"+".TXT"
									DOCUMENT TO BLOB:C525($_t_DocumentName; $_ptr_Field->)
								End if 
								OK:=$_l_OK
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is picture:K8:10)
								$_l_OK:=OK
								SET BLOB SIZE:C606($_blb_Export; 0)
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_t_ID:=DOC_t_FIeld
								$_t_ID:=Replace string:C233($_t_ID; "PICTURE:"; "")
								If (Num:C11($_t_ID)>0)
									DOCUMENT TO BLOB:C525($_t_StructurePath+"PICBLOBS:"+$1+"_"+$_t_ID+"_"+".TXT"; $_blb_Export)
									BLOB TO PICTURE:C682($_blb_Export; $_ptr_Field->)
								End if 
								OK:=$_l_OK
							: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)=Is boolean:K8:9)
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_ptr_Field->:=(DOC_t_FIeld="TRUE")
							Else 
								$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
								$_ptr_Field->:=DOC_t_FIeld
						End case 
						
						
						
					End for 
					DB_SaveRecord($_Ptr_Table)
				End if 
			End if 
			
		Until (ok=0)
		CLOSE DOCUMENT:C267(DOC_ti_DocumentRef)
		
		
	Else 
		// ALERT("You must pass the path name to this method")
		Gen_Alert("You must pass the path name to this method")
	End if 
End if 
ERR_MethodTrackerReturn("Gen_Import3"; $_t_oldMethodName)