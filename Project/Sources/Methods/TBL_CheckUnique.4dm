//%attributes = {}
If (False:C215)
	//Project Method Name:      TBL_CheckUnique
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
	ARRAY INTEGER:C220($_ai_IntegerValues; 0)
	ARRAY LONGINT:C221($_al_LongintValues; 0)
	ARRAY REAL:C219($_ar_RealValues; 0)
	ARRAY TEXT:C222($_at_TextValues; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldUnique; $_bo_invisible)
	C_LONGINT:C283($_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_matchingDataRow; $_l_OK; $_l_Recordindex; $_l_TableIndex; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_ptr_Field; $_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_TextValue)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TBL_CheckUnique")
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 40; 300; 120; -1984)


For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		ERASE WINDOW:C160
		MESSAGE:C88("Checking table "+Table name:C256(Table:C252($_l_TableIndex)))
		For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
				GET FIELD PROPERTIES:C258($_l_TableIndex; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_invisible)
				If ($_bo_FieldUnique)
					ERASE WINDOW:C160
					MESSAGE:C88("Checking table "+Table name:C256(Table:C252($_l_TableIndex)))
					MESSAGE:C88(Char:C90(13)+"Checking Field "+Field name:C257(Field:C253($_l_TableIndex; $_l_FieldIndex)))
					
					ALL RECORDS:C47(Table:C252($_l_TableIndex)->)
					$_ptr_Field:=Field:C253($_l_TableIndex; $_l_FieldIndex)
					$_ptr_Table:=Table:C252($_l_TableIndex)
					ORDER BY:C49($_ptr_Table->; $_ptr_Field->)
					ARRAY TEXT:C222($_at_TextValues; 0)
					ARRAY LONGINT:C221($_al_LongintValues; 0)
					ARRAY INTEGER:C220($_ai_IntegerValues; 0)
					ARRAY REAL:C219($_ar_RealValues; 0)
					$_l_OK:=1
					Case of 
						: ($_l_FieldType=Is alpha field:K8:1)
							
							ARRAY TEXT:C222($_at_TextValues; Records in table:C83($_ptr_Table->))
							
						: ($_l_FieldType=Is longint:K8:6)
							
							ARRAY LONGINT:C221($_al_LongintValues; Records in table:C83($_ptr_Table->))
							
						: ($_l_FieldType=Is integer:K8:5)
							
							ARRAY INTEGER:C220($_ai_IntegerValues; Records in table:C83($_ptr_Table->))
							
							
							ARRAY REAL:C219($_ar_RealValues; Records in table:C83($_ptr_Table->))
							
						Else 
							$_l_OK:=0
					End case 
					
					If ($_l_OK=1)
						FIRST RECORD:C50($_ptr_Table->)
						$_l_CurrentRow:=0
						For ($_l_Recordindex; 1; Records in selection:C76($_ptr_Table->))
							//$value:=$_ptr_Field->
							ERASE WINDOW:C160
							MESSAGE:C88("Checking table "+Table name:C256(Table:C252($_l_TableIndex)))
							MESSAGE:C88(Char:C90(13)+"Checking Field "+Field name:C257(Field:C253($_l_TableIndex; $_l_FieldIndex)))
							Case of 
								: ($_l_FieldType=Is alpha field:K8:1)
									$_l_matchingDataRow:=Find in array:C230($_at_TextValues; $_ptr_Field->)
									$_t_TextValue:=$_ptr_Field->
								: ($_l_FieldType=Is longint:K8:6)
									$_l_matchingDataRow:=Find in array:C230($_al_LongintValues; $_ptr_Field->)
									$_t_TextValue:=String:C10($_ptr_Field->)
								: ($_l_FieldType=Is real:K8:4)
									$_l_matchingDataRow:=Find in array:C230($_ar_RealValues; $_ptr_Field->)
									$_t_TextValue:=String:C10($_ptr_Field->)
								: ($_l_FieldType=Is integer:K8:5)
									$_l_matchingDataRow:=Find in array:C230($_ai_IntegerValues; $_ptr_Field->)
									$_t_TextValue:=String:C10($_ptr_Field->)
							End case 
							MESSAGE:C88(Char:C90(13)+"Checking ID "+$_t_TextValue)
							
							If ($_l_matchingDataRow<0)
								$_l_CurrentRow:=$_l_CurrentRow+1
								Case of 
									: ($_l_FieldType=Is alpha field:K8:1)
										$_at_TextValues{$_l_CurrentRow}:=$_ptr_Field->
									: ($_l_FieldType=Is longint:K8:6)
										$_al_LongintValues{$_l_CurrentRow}:=$_ptr_Field->
									: ($_l_FieldType=Is real:K8:4)
										$_ar_RealValues{$_l_CurrentRow}:=$_ptr_Field->
									: ($_l_FieldType=Is integer:K8:5)
										$_ai_IntegerValues{$_l_CurrentRow}:=$_ptr_Field->
								End case 
							Else 
								If ($_ti_DocumentRef=?00:00:00?)
									$_ti_DocumentRef:=DB_CreateDocument("UNIQUE ERRORS.txt"; "TEXT")
									SEND PACKET:C103($_ti_DocumentRef; "The following unique values are not unique, this")
									SEND PACKET:C103($_ti_DocumentRef; " will prevent you from re-importing this data"+Char:C90(13))
									SEND PACKET:C103($_ti_DocumentRef; " Correct these before exporting data."+Char:C90(13))
									// ALERT("There are Record Clashes, a document called 'unique errors' is being cre
									Gen_Alert("There are Record Clashes, a document called 'unique errors' is being created.")
									
								End if 
								Case of 
									: ($_l_FieldType=Is alpha field:K8:1)
										SEND PACKET:C103($_ti_DocumentRef; Table name:C256($_ptr_Table)+" "+Field name:C257($_ptr_Field)+" "+$_ptr_Field->+Char:C90(13))
									Else 
										SEND PACKET:C103($_ti_DocumentRef; Table name:C256($_ptr_Table)+" "+Field name:C257($_ptr_Field)+" +"+String:C10($_ptr_Field->)+Char:C90(13))
								End case 
							End if 
							NEXT RECORD:C51($_ptr_Table->)
							
						End for 
						
					Else 
						If ($_ti_DocumentRef=?00:00:00?)
							$_ti_DocumentRef:=DB_CreateDocument("UNIQUE ERRORS.txt"; "TEXT")
							SEND PACKET:C103($_ti_DocumentRef; "The following unique values are not unique, this")
							SEND PACKET:C103($_ti_DocumentRef; "will prevent you from re-importing this data"+Char:C90(13))
						End if 
						SEND PACKET:C103($_ti_DocumentRef; Table name:C256($_ptr_Table)+" "+Field name:C257($_ptr_Field)+" is of type "+String:C10($_l_FieldType))
						
					End if 
					
				End if 
			End if 
		End for 
	End if 
End for 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If ($_ti_DocumentRef#?00:00:00?)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	// $0:=False
	//ALERT("Record ID Clash checking Completed")
	Gen_Alert("Record ID clash checking completed.")
Else 
	//$0:=True
	//  ALERT("There are no record ID clashes in your system, check completed")
	Gen_Alert("There are no record ID clashes in your system. Check completed.")
	
End if 
ERR_MethodTrackerReturn("TBL_CheckUnique"; $_t_oldMethodName)
