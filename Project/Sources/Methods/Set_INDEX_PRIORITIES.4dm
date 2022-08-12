//%attributes = {}
If (False:C215)
	//Project Method Name:      Set_INDEX_PRIORITIES
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 2:03 PM
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY POINTER:C280($_aptr_FieldsArray; 0)
	C_BOOLEAN:C305($_bo_Confirm; $_bo_FieldIndexed; $_bo_Run; $2)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_Priority; $_l_TableIndex; $_l_TableNumber; $1)
	C_POINTER:C301($_ptr_Field; $_Ptr_FieldPointer; $_Ptr_Table)
	C_TEXT:C284($_t_EndTimeString; $_t_FieldName; $_t_IndexName; $_t_oldMethodName; $_t_StartTimeString; $_t_TableName)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Set_INDEX_PRIORITIES")

//NG Modified Feb 2004 to enable a parameter to control the confirm message

If (Count parameters:C259>=2)
	$_bo_Confirm:=$2
Else 
	$_bo_Confirm:=True:C214
End if 
If ($_bo_Confirm)
	Gen_Confirm("Would you like indexes optimised?")
End if 
If (OK=1)
	// ALERT("This takes a long time. So enter out of hours times when system can do t
	Gen_Alert("This takes a long time. So enter out of hours times when system can do this.")
	Repeat 
		$_t_StartTimeString:=Request:C163("Enter time to start after  working hours"; "")
		$_ti_StartTime:=Time:C179($_t_StartTimeString)
	Until ($_ti_StartTime>0)
	Repeat 
		$_t_EndTimeString:=Request:C163("Enter time to stop before working hours"; "")
		$_ti_EndTime:=Time:C179($_t_EndTimeString)
	Until ($_ti_StartTime>0) & ($_ti_EndTime<$_ti_StartTime)
	
	
	If (Count parameters:C259>=1)
		$_l_Priority:=$1
	Else 
		$_l_Priority:=100
	End if 
	
	$_d_Date:=Current date:C33(*)
	For ($_l_TableIndex; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_TableIndex))
			
			For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableIndex))
				If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
					$_bo_Run:=False:C215
					If (Current date:C33(*)>=$_d_Date)
						
						If (Current date:C33(*)=$_d_Date)
							//before midnight
							If (Current time:C178(*)>$_ti_StartTime)
								//time to run
								$_bo_Run:=True:C214
							Else 
								
								If (Current time:C178(*)<$_ti_EndTime)
									//time to run
									$_bo_Run:=True:C214
								Else 
									$_bo_Run:=False:C215
								End if 
							End if 
						Else 
							//after midnight
							If (Current time:C178(*)<$_ti_EndTime)
								//time to run
								$_bo_Run:=True:C214
							Else 
								$_d_Date:=Current date:C33(*)
								$_bo_Run:=False:C215
							End if 
						End if 
					End if 
					
					If ($_bo_Run)
						GET FIELD PROPERTIES:C258($_l_TableIndex; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
						If ($_bo_FieldIndexed)
							$_Ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FieldIndex)
							SET INDEX:C344($_Ptr_FieldPointer->; False:C215)
							FLUSH CACHE:C297
							$_l_TableNumber:=$_l_TableIndex
							$_l_FieldNumber:=$_l_FieldIndex
							$_Ptr_Table:=Table:C252($_l_TableNumber)
							$_t_TableName:=Table name:C256($_Ptr_Table)
							$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
							$_t_FieldName:=Field name:C257($_ptr_Field)
							$_t_TableName:=Substring:C12($_t_TableName; 1; 3)
							ARRAY POINTER:C280($_aptr_FieldsArray; 1)
							$_aptr_FieldsArray{1}:=Field:C253($_l_TableNumber; $_l_FieldNumber)
							$_t_IndexName:=$_t_TableName+$_t_FieldName+"indx"
							$_t_IndexName:=Replace string:C233($_t_IndexName; " "; "")
							CREATE INDEX:C966($_Ptr_Table->; $_aptr_FieldsArray; Default index type:K58:2; $_t_IndexName)
							FLUSH CACHE:C297
							
						End if 
					Else 
						DelayTicks(60*60*60)
						
					End if 
				End if 
			End for 
		End if 
		
	End for 
End if 
ERR_MethodTrackerReturn("Set_INDEX_PRIORITIES"; $_t_oldMethodName)