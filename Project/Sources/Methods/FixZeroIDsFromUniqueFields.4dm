//%attributes = {}
If (False:C215)
	//Project Method Name:      FixZeroIDsFromUniqueFields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/12/2010 07:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_Continue; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_FieldLength; $_l_FieldType; $_l_Just1tablenumber; $_l_PercentageDone; $_l_RecordsCount; $_l_RecordsIndex; $_l_TableIndex; $_l_Thermo; $1)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FixZeroIDsFromUniqueFields")

If (Count parameters:C259>0)
	$_l_Just1tablenumber:=$1
Else 
	$_l_Just1tablenumber:=0
End if 


$_l_Thermo:=OPEN_THERMOMETER("...fixing zero ids")

For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		$_bo_Continue:=False:C215
		
		If ($_l_Just1tablenumber=0)
			$_bo_Continue:=True:C214
		Else 
			$_bo_Continue:=($_l_Just1tablenumber=$_l_TableIndex)
		End if 
		
		If ($_bo_Continue)
			$_ptr_Table:=Table:C252($_l_TableIndex)
			
			SET_THERMOMETER("...checking zero ids "+Table name:C256($_l_TableIndex); $_l_TableIndex)
			
			$_ptr_FieldPointer:=QV_GetIdField($_l_TableIndex)
			
			If (Not:C34(Is nil pointer:C315($_ptr_FieldPointer)))
				
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				
				//If ($_bo_FieldUnique)        ` bsw 23/12/03 4d causes problems with indexes and
				//unique field properties
				
				Case of 
					: ($_l_FieldType=Is longint:K8:6) | ($_l_FieldType=Is integer:K8:5)
						
						READ WRITE:C146($_ptr_Table->)
						QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=0)
						$_l_RecordsCount:=Records in selection:C76($_ptr_Table->)
						If ($_l_RecordsCount>0)
							FIRST RECORD:C50($_ptr_Table->)
							
							For ($_l_RecordsIndex; 1; $_l_RecordsCount)
								$_ptr_FieldPointer->:=AA_GetNextID($_ptr_FieldPointer)
								SAVE RECORD:C53($_ptr_Table->)
								$_l_PercentageDone:=($_l_RecordsIndex/$_l_RecordsCount)*100
								SET_THERMOMETER("...fixing zero ids: "+Table name:C256($_l_TableIndex)+" "+String:C10($_l_RecordsIndex)+" of "+String:C10($_l_RecordsCount); $_l_PercentageDone)
								NEXT RECORD:C51($_ptr_Table->)
							End for 
							UnloadAllRecords($_ptr_Table)
							
						End if 
						
					: ($_l_FieldType=Is alpha field:K8:1)
						
						READ WRITE:C146($_ptr_Table->)
						QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->="")
						$_l_RecordsCount:=Records in selection:C76($_ptr_Table->)
						If ($_l_RecordsCount>0)
							
							FIRST RECORD:C50($_ptr_Table->)
							
							For ($_l_RecordsIndex; 1; $_l_RecordsCount)
								$_ptr_FieldPointer->:=String:C10(AA_GetNextID($_ptr_FieldPointer))
								SAVE RECORD:C53($_ptr_Table->)
								$_l_PercentageDone:=($_l_RecordsIndex/$_l_RecordsCount)*100
								SET_THERMOMETER("...fixing zero ids: "+Table name:C256($_l_TableIndex)+" "+String:C10($_l_RecordsIndex)+" of "+String:C10($_l_RecordsCount); $_l_PercentageDone)
								NEXT RECORD:C51($_ptr_Table->)
							End for 
							UnloadAllRecords($_ptr_Table)
						End if 
						
				End case 
				//End if bsw 23/12/03         ` bsw 23/12/03 4d causes problems with indexes and
				//unique props
				
			End if 
		End if 
		
		If (<>SYS_bo_QuitCalled)  //Get out of this loop if quiting
			$_l_TableIndex:=Get last table number:C254
		End if 
	End if 
End for 

CLOSE_THERMOMETER
ERR_MethodTrackerReturn("FixZeroIDsFromUniqueFields"; $_t_oldMethodName)