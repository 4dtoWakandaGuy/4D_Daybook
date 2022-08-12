//%attributes = {}
If (False:C215)
	//Project Method Name:      DEI_ReportConflict4Table
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
	ARRAY DATE:C224($_ad_DateFieldValues; 0)
	ARRAY LONGINT:C221($_al_LongintFieldValues; 0)
	ARRAY REAL:C219($_ar_RealFieldValues; 0)
	ARRAY TEXT:C222($_at AlphaFieldValues; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_UniqueErrorFound; $0)
	C_DATE:C307($_d NewValue)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_FixConflicts; $_l_FoundRecord; $_l_IDFIeldNumber; $_l_NewValue; $_l_RecordCount; $_l_RecordCount2; $_l_TableNumber; $_l_Thermo)
	C_LONGINT:C283($_l_ValueCount; $2)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_IDField; $_ptr_Table; $1)
	C_REAL:C285($_r_NewValue)
	C_TEXT:C284($_t_EndofRecord; $_t_FIeldName; $_t_NewAlphaValue; $_t_oldMethodName; $_t_TableName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DEI_ReportConflict4Table")

If (Count parameters:C259>0) & (Not:C34(Is nil pointer:C315($1)))
	
	If (Count parameters:C259>1)
		$_l_FixConflicts:=$2
	Else 
		$_l_FixConflicts:=0
	End if 
	
	$_l_Thermo:=OPEN_THERMOMETER("Checking non-unique for unique fields...")
	
	If (Test path name:C476("non-uniquedata.txt")=Is a document:K24:1)
		$_ti_DocumentRef:=Append document:C265("non-uniquedata.txt")
	Else 
		$_ti_DocumentRef:=DB_CreateDocument("non-uniquedata.txt")
	End if 
	
	If (OK=1)
		
		
		If (Is macOS:C1572)
			$_t_EndofRecord:=Char:C90(Carriage return:K15:38)
		Else 
			$_t_EndofRecord:=Char:C90(Carriage return:K15:38)+Char:C90(Line feed:K15:40)
		End if 
		
		$_ptr_Table:=$1
		$_l_TableNumber:=Table:C252($_ptr_Table)
		
		$_t_TableName:=Table name:C256($_l_TableNumber)
		$_ptr_IDField:=QV_GetIdField($_l_TableNumber)
		$_l_IDFIeldNumber:=Field:C253($_ptr_IDField)
		
		For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableNumber))
			
			GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
			
			If ($_l_FieldIndex=$_l_IDFIeldNumber)  //bsw 29/12/03 ($_bo_FieldUnique)
				$_t_FIeldName:=Field name:C257($_l_TableNumber; $_l_FieldIndex)
				$_ptr_FieldPointer:=Field:C253($_l_TableNumber; $_l_FieldIndex)
				ALL RECORDS:C47($_ptr_Table->)
				Case of 
						
					: ($_l_FieldType=Is alpha field:K8:1)
						
						ARRAY TEXT:C222($_at AlphaFieldValues; 0)
						DISTINCT VALUES:C339($_ptr_FieldPointer->; $_at AlphaFieldValues)
						If (Size of array:C274($_at AlphaFieldValues)#Records in selection:C76($_ptr_Table->))
							For ($_l_RecordCount; 1; Size of array:C274($_at AlphaFieldValues))
								READ WRITE:C146($_ptr_Table->)
								QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_at AlphaFieldValues{$_l_RecordCount})
								If (Records in selection:C76($_ptr_Table->)>1)
									$_bo_UniqueErrorFound:=True:C214
									For ($_l_RecordCount2; 1; Records in selection:C76($_ptr_Table->))
										
										SEND PACKET:C103($_ti_DocumentRef; Table name:C256($_ptr_Table)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; Field name:C257($_ptr_FieldPointer)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; $_ptr_FieldPointer->+$_t_EndofRecord)
										NEXT RECORD:C51($_ptr_Table->)
										
										//Purge the value here - fix it
										Case of 
											: ($_l_FixConflicts=2)
												DELETE RECORD:C58($_ptr_Table->)
											: ($_l_FixConflicts=1)
												$_l_ValueCount:=0
												Repeat 
													IDLE:C311
													$_t_NewAlphaValue:=$_at AlphaFieldValues{$_l_RecordCount}+"-"+String:C10($_l_ValueCount)+"DUP"
													$_l_FoundRecord:=Find in field:C653($_ptr_FieldPointer->; $_t_NewAlphaValue)
													$_l_ValueCount:=$_l_ValueCount+1
												Until ($_l_FoundRecord<=0)
												
												If (Length:C16($_t_NewAlphaValue)>$_l_FieldLength)
													$_t_NewAlphaValue:=Substring:C12($_t_NewAlphaValue; 1; $_l_FieldLength)
												End if 
												
												$_ptr_FieldPointer->:=$_t_NewAlphaValue
												SAVE RECORD:C53($_ptr_Table->)
										End case 
										
									End for 
								End if 
								SET_THERMOMETER("...reporting table "+$_t_TableName+" - Field: "+$_t_FIeldName; ($_l_RecordCount/Size of array:C274($_at AlphaFieldValues)*100))
							End for 
						End if 
						
					: ($_l_FieldType=Is real:K8:4)
						
						ARRAY REAL:C219($_ar_RealFieldValues; 0)
						DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ar_RealFieldValues)
						If (Size of array:C274($_ar_RealFieldValues)#Records in selection:C76($_ptr_Table->))
							For ($_l_RecordCount; 1; Size of array:C274($_ar_RealFieldValues))
								READ WRITE:C146($_ptr_Table->)
								QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_ar_RealFieldValues{$_l_RecordCount})
								If (Records in selection:C76($_ptr_Table->)>1)
									$_bo_UniqueErrorFound:=True:C214
									For ($_l_RecordCount2; 1; Records in selection:C76($_ptr_Table->))
										SEND PACKET:C103($_ti_DocumentRef; Table name:C256($_ptr_Table)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; Field name:C257($_ptr_FieldPointer)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; String:C10($_ptr_FieldPointer->)+$_t_EndofRecord)
										NEXT RECORD:C51($_ptr_Table->)
										
										Case of 
											: ($_l_FixConflicts=2)
												DELETE RECORD:C58($_ptr_Table->)
												
											: ($_l_FixConflicts=1)
												//Purge the value here - fix it
												$_l_ValueCount:=1
												Repeat 
													IDLE:C311
													$_l_ValueCount:=$_l_ValueCount+1
													$_r_NewValue:=$_ar_RealFieldValues{$_l_RecordCount}+$_l_ValueCount
													$_l_FoundRecord:=Find in field:C653($_ptr_FieldPointer->; $_r_NewValue)
												Until ($_l_FoundRecord<=0)
												
												$_ptr_FieldPointer->:=$_r_NewValue
												SAVE RECORD:C53($_ptr_Table->)
										End case 
										
									End for 
								End if 
								SET_THERMOMETER("...reporting table "+$_t_TableName+" - Field: "+$_t_FIeldName; ($_l_RecordCount/Size of array:C274($_ar_RealFieldValues)*100))
							End for 
						End if 
						
					: (($_l_FieldType=Is integer:K8:5) | ($_l_FieldType=Is longint:K8:6))
						
						ARRAY LONGINT:C221($_al_LongintFieldValues; 0)
						DISTINCT VALUES:C339($_ptr_FieldPointer->; $_al_LongintFieldValues)
						If (Size of array:C274($_al_LongintFieldValues)#Records in selection:C76($_ptr_Table->))
							For ($_l_RecordCount; 1; Size of array:C274($_al_LongintFieldValues))
								READ WRITE:C146($_ptr_Table->)
								QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_al_LongintFieldValues{$_l_RecordCount})
								If (Records in selection:C76($_ptr_Table->)>1)
									$_bo_UniqueErrorFound:=True:C214
									
									For ($_l_RecordCount2; 1; Records in selection:C76($_ptr_Table->))
										SEND PACKET:C103($_ti_DocumentRef; Table name:C256($_ptr_Table)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; Field name:C257($_ptr_FieldPointer)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; String:C10($_ptr_FieldPointer->)+$_t_EndofRecord)
										NEXT RECORD:C51($_ptr_Table->)
										
										Case of 
											: ($_l_FixConflicts=2)
												DELETE RECORD:C58($_ptr_Table->)
											: ($_l_FixConflicts=1)
												//Purge the value here - fix it
												$_l_ValueCount:=1
												Repeat 
													IDLE:C311
													$_l_ValueCount:=$_l_ValueCount+1
													$_l_NewValue:=$_al_LongintFieldValues{$_l_RecordCount}+$_l_ValueCount
													$_l_FoundRecord:=Find in field:C653($_ptr_FieldPointer->; $_l_NewValue)
												Until ($_l_FoundRecord<=0)
												
												$_ptr_FieldPointer->:=$_l_NewValue
												SAVE RECORD:C53($_ptr_Table->)
										End case 
										
									End for 
									
								End if 
								SET_THERMOMETER("...reporting table "+$_t_TableName+" - Field: "+$_t_FIeldName; ($_l_RecordCount/Size of array:C274($_al_LongintFieldValues)*100))
							End for 
						End if 
						
					: ($_l_FieldType=Is date:K8:7)
						
						ARRAY DATE:C224($_ad_DateFieldValues; 0)
						DISTINCT VALUES:C339($_ptr_FieldPointer->; $_ad_DateFieldValues)
						If (Size of array:C274($_ad_DateFieldValues)#Records in selection:C76($_ptr_Table->))
							For ($_l_RecordCount; 1; Size of array:C274($_ad_DateFieldValues))
								READ WRITE:C146($_ptr_Table->)
								QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_ad_DateFieldValues{$_l_RecordCount})
								If (Records in selection:C76($_ptr_Table->)>1)
									$_bo_UniqueErrorFound:=True:C214
									For ($_l_RecordCount2; 1; Records in selection:C76($_ptr_Table->))
										SEND PACKET:C103($_ti_DocumentRef; Table name:C256($_ptr_Table)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; Field name:C257($_ptr_FieldPointer)+Char:C90(Tab:K15:37))
										SEND PACKET:C103($_ti_DocumentRef; String:C10($_ptr_FieldPointer->)+$_t_EndofRecord)
										NEXT RECORD:C51($_ptr_Table->)
										Case of 
											: ($_l_FixConflicts=2)
												DELETE RECORD:C58($_ptr_Table->)
											: ($_l_FixConflicts=1)
												//Purge the value here - fix it
												$_l_ValueCount:=1
												Repeat 
													IDLE:C311
													$_l_ValueCount:=$_l_ValueCount+1
													$_d NewValue:=$_ad_DateFieldValues{$_l_RecordCount}+$_l_ValueCount
													$_l_FoundRecord:=Find in field:C653($_ptr_FieldPointer->; $_d NewValue)
												Until ($_l_FoundRecord<=0)
												
												$_ptr_FieldPointer->:=$_d NewValue
												SAVE RECORD:C53($_ptr_Table->)
										End case 
										
									End for 
								End if 
								SET_THERMOMETER("...reporting table "+$_t_TableName+" - Field: "+$_t_FIeldName; ($_l_RecordCount/Size of array:C274($_ad_DateFieldValues)*100))
							End for 
						End if 
				End case 
			End if 
			
		End for 
		
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		CLOSE_THERMOMETER
		
		$0:=$_bo_UniqueErrorFound
		
	End if 
	
End if 
ERR_MethodTrackerReturn("DEI_ReportConflict4Table"; $_t_oldMethodName)