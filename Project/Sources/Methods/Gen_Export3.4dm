//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Export3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_Export)
	C_BOOLEAN:C305(IMP_bo_GiveWarning; IMP_bo_ExportFields)
	C_LONGINT:C283($_l_CountFields; $_l_FieldsIndex; $_l_IsFolder; $_l_MessageNumber; $_l_RecordsIndex; $_l_RecordsinSelection; $_l_TableNumber; $_l_TIme; $5; VID; VID2)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_DocumentName; $_t_oldMethodName; $_t_Packet; $_t_StructurePath; $1; $2; $3; $4)
	C_TIME:C306($_ti_DocumentRef; DOC_ti_DocumentRef; DOC_ti_DocumentRef2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Export3")

DEFAULT TABLE:C46(Table:C252($5)->)
DOC_ti_DocumentRef:=DB_CreateDocument($4; "TEXT")


If (Application type:C494#4D Remote mode:K5:5)
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
			//Gen_Alert ("Note Picture fields will not be exported")
			IMP_bo_GiveWarning:=True:C214
			CONFIRM:C162("Export field names"; "Yes"; "No")
			IMP_bo_ExportFields:=(OK=1)
			Open window:C153(20; 60; 400; 160; -1984)
		End if 
		FIRST RECORD:C50($_Ptr_Table->)
		$_l_CountFields:=Get last field number:C255($_Ptr_Table)
		$_l_TableNumber:=Table:C252($_Ptr_Table)
		
		For ($_l_FieldsIndex; 1; $_l_CountFields)
			Case of 
				: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is subtable:K8:11)
					$_t_DocumentName:="SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldsIndex)+".TXT"
					$_ti_DocumentRef:=DB_CreateDocument($1+$_t_DocumentName)
					If (IMP_bo_ExportFields)
						SEND PACKET:C103(DOC_ti_DocumentRef; "Subfield see doc"+$_t_DocumentName+Char:C90(9))
					End if 
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
					GenExportSubRecordFieldNames($1+("SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldsIndex)+".TXT"); $_l_TableNumber; $_l_FieldsIndex; ""; $2; $3)
				Else 
					If (IMP_bo_ExportFields)
						SEND PACKET:C103(DOC_ti_DocumentRef; (Field name:C257($_l_TableNumber; $_l_FieldsIndex))+Char:C90(9))
					End if 
			End case 
		End for 
		ALL RECORDS:C47($_Ptr_Table->)
		//REDUCE SELECTION($_Ptr_Table->;1)
		$_l_RecordsinSelection:=Records in selection:C76($_Ptr_Table->)
		$_l_MessageNumber:=0
		For ($_l_RecordsIndex; 1; $_l_RecordsinSelection)
			$_l_MessageNumber:=$_l_MessageNumber+1
			If ($_l_MessageNumber=1)
				ERASE WINDOW:C160
				MESSAGE:C88("Exporting record: "+String:C10($_l_RecordsIndex)+" of "+String:C10($_l_RecordsinSelection)+" "+Table name:C256($_l_TableNumber))
			Else 
				If ($_l_MessageNumber>100)
					$_l_MessageNumber:=0
					ERASE WINDOW:C160
					MESSAGE:C88("Exporting record: "+String:C10($_l_RecordsIndex)+" of "+String:C10($_l_RecordsinSelection)+" "+Table name:C256($_l_TableNumber))
					
				End if 
			End if 
			
			For ($_l_FieldsIndex; 1; $_l_CountFields)
				//GOTO XY(0;2)
				//MESSAGE("Exporting field"+String($_l_FieldsIndex)+" of "+String($_l_CountFields))
				
				Case of 
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is subtable:K8:11)
						
						VID:=AA_GetNextIDinMethod(->VID)
						//VID now contains a uniqueID
						SEND PACKET:C103(DOC_ti_DocumentRef; String:C10(VID)+$2)
						GenExportSubrecords($1+("SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldsIndex))+".TXT"; $_l_TableNumber; $_l_FieldsIndex; String:C10(VID); $2; $3)
						
						
						
						$_t_DocumentName:="SUB_"+String:C10($_l_TableNumber)+"_"+String:C10($_l_FieldsIndex)
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is integer:K8:5) | (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is longint:K8:6) | (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is real:K8:4)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						SEND PACKET:C103(DOC_ti_DocumentRef; String:C10($_ptr_Field->)+$2)
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is date:K8:7)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						SEND PACKET:C103(DOC_ti_DocumentRef; String:C10($_ptr_Field->)+$2)
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is time:K8:8)
						
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						$_l_TIme:=($_ptr_Field->)*1
						SEND PACKET:C103(DOC_ti_DocumentRef; Time string:C180($_l_TIme)+$2)
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is date:K8:7)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						SEND PACKET:C103(DOC_ti_DocumentRef; String:C10($_ptr_Field->)+$2)
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is BLOB:K8:12)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						If (BLOB size:C605($_ptr_Field->)>0)
							VID2:=AA_GetNextIDinMethod(->VID2)
							$_l_IsFolder:=Test path name:C476($_t_StructurePath+"BLOBS")
							If ($_l_IsFolder<0)
								CREATE FOLDER:C475($_t_StructurePath+"BLOBS")
							End if 
							SEND PACKET:C103(DOC_ti_DocumentRef; "BLOB:"+String:C10(VID2)+$2)
							DOC_ti_DocumentRef2:=DB_CreateDocument($_t_StructurePath+"BLOBS:"+$1+"_"+String:C10(VID2)+"_"+".TXT"; "TEXT")
							CLOSE DOCUMENT:C267(DOC_ti_DocumentRef2)
							$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
							BLOB TO DOCUMENT:C526(document; $_ptr_Field->)
						Else 
							SEND PACKET:C103(DOC_ti_DocumentRef; "BLOB:"+$2)
						End if 
						
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is picture:K8:10)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						If (Picture size:C356($_ptr_Field->)>0)
							$_l_IsFolder:=Test path name:C476($_t_StructurePath+"PICBLOBS")
							If ($_l_IsFolder<0)
								CREATE FOLDER:C475($_t_StructurePath+"PICBLOBS")
							End if 
							SET BLOB SIZE:C606($_blb_Export; 0)
							VID2:=AA_GetNextIDinMethod(->VID2)
							
							$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
							SEND PACKET:C103(DOC_ti_DocumentRef; "PICTURE:"+String:C10(VID2)+$2)
							DOC_ti_DocumentRef2:=DB_CreateDocument($_t_StructurePath+"PICBLOBS:"+$1+"_"+String:C10(VID2)+"_"+".TXT"; "TEXT")
							CLOSE DOCUMENT:C267(DOC_ti_DocumentRef2)
							
							$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
							PICTURE TO BLOB:C692($_ptr_Field->; $_blb_Export; "JPEG")
							BLOB TO DOCUMENT:C526(document; $_blb_Export)
						Else 
							SEND PACKET:C103(DOC_ti_DocumentRef; "PICTURE:"+String:C10(VID2)+$2)
						End if 
						
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldsIndex)->)=Is boolean:K8:9)
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						If ($_ptr_Field->)
							SEND PACKET:C103(DOC_ti_DocumentRef; "TRUE"+$2)
						Else 
							SEND PACKET:C103(DOC_ti_DocumentRef; "FALSE"+$2)
						End if 
					Else 
						$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldsIndex)
						$_t_Packet:=Replace string:C233($_ptr_Field->; $2; " ")
						$_t_Packet:=Replace string:C233($_ptr_Field->; $3; " ")
						SEND PACKET:C103(DOC_ti_DocumentRef; $_t_Packet+$2)
				End case 
			End for 
			SEND PACKET:C103(DOC_ti_DocumentRef; $3)
			NEXT RECORD:C51($_Ptr_Table->)
			
		End for 
		
		
		CLOSE DOCUMENT:C267(DOC_ti_DocumentRef)
	Else 
		// ALERT("You must pass the path name to this method")
		Gen_Alert("You must pass the path name to this method")
	End if 
End if 
ERR_MethodTrackerReturn("Gen_Export3"; $_t_oldMethodName)