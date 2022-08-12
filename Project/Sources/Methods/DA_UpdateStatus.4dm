//%attributes = {}

//Database Method Name:      DA_UpdateStatus
//------------------ Method Notes ------------------
//------------------ Revision Control ----------------
//Date Created:  28/10/2017
//Created BY:  Unknown
//Date Modified: 
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>UNIT_bo_UnitTesting; $_Bo_RequiresQACheck; $_Bo_Unload; $_Bo_UpdateQACheck; $3)
	C_DATE:C307($_dte_QACheckedDate; $6)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CheckedByUUID; $_l_NewStatus; $_l_QACheckedByUUID; $2)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_Txt_DArecordUUID; $_Txt_QACheckedByUUID; $_Txt_QCheckedbyName; $1; $4; $5)
	C_TIME:C306($_ti_QACheckedTime; $7)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DA_UpdateStatus")

If (False:C215)
	//-------------------- Method Set Up -------------------
	//Project Method Name:      DA_UpdateStatus
	//Parameter Detail:
	//------------------ Method Narrative ------------------
	//Updates the status of a data integrity record. This only happens when we are QA'ing a record
	//------------------ Methods/Table List ----------------
	
	//Table(If any): 
	
	//Module: 
	
	//Calling Menu/Method/Form/Object Method: 
	//
	//Related Methods: 
	
	//
	//------------------ Assumptions ----------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2015
	//Created BY: Nigel Greenlee
	
	//////21/03/2017
	//Modified By: Nigel Greenlee
	
End if 
//---------- Type Parameters & Local Variables ----------
If (True:C214)
End if 
//---------- Reassign Passed Parameters OR get values ----------
If (Count parameters:C259>=1)
	$_Txt_DArecordUUID:=$1
	$_l_NewStatus:=$2
	
	$_dte_QACheckedDate:=Current date:C33
	$_ti_QACheckedTime:=Current time:C178
	If (Count parameters:C259>=3)
		$_Bo_RequiresQACheck:=$3
		$_Bo_UpdateQACheck:=True:C214
	End if 
	If (Count parameters:C259>=4)
		$_Txt_QACheckedByUUID:=$4
		If (Count parameters:C259>=4)
			$_Txt_QCheckedbyName:=$5  //Try to pass this if you do set $4 !!
			If (Count parameters:C259>=7)
				$_dte_QACheckedDate:=$6
				$_ti_QACheckedTime:=$7
			End if 
		Else 
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_CheckedByUUID)
			$_Txt_QCheckedbyName:=[PERSONNEL:11]Name:2
			UNLOAD RECORD:C212([PERSONNEL:11])
		End if 
	Else 
		$_l_QACheckedByUUID:=<>PER_l_CurrentUserID
		$_Txt_QCheckedbyName:=<>PER_t_CurrentUserName
	End if 
	
Else 
	
	
	
End if 

//-------------------- Main Method -------------------

If (Not:C34(UTIL_isUUIDNil($_Txt_DArecordUUID)))
	$_Bo_Unload:=False:C215
	If ([DATA_INTEGRITY_CONTROL:206]INTERNAL_UUID:1#$_Txt_DArecordUUID)
		READ WRITE:C146([DATA_INTEGRITY_CONTROL:206])
		QUERY:C277([DATA_INTEGRITY_CONTROL:206]; [DATA_INTEGRITY_CONTROL:206]INTERNAL_UUID:1=$_Txt_DArecordUUID)
		$_Bo_Unload:=True:C214
	End if 
	If ([DATA_INTEGRITY_CONTROL:206]INTERNAL_UUID:1=$_Txt_DArecordUUID)
		[DATA_INTEGRITY_CONTROL:206]QA_Record_Status_l:7:=$_l_NewStatus
		If ($_Bo_UpdateQACheck)
			[DATA_INTEGRITY_CONTROL:206]QA_Check_Required_bo:6:=$_Bo_RequiresQACheck
		End if 
		If (Not:C34(UTIL_isUUIDNil($_Txt_QACheckedByUUID)))
			[DATA_INTEGRITY_CONTROL:206]QA_Checked_Date:20:=$_dte_QACheckedDate
			[DATA_INTEGRITY_CONTROL:206]QA_Checked_Time_ti:21:=$_ti_QACheckedTime
			
			[DATA_INTEGRITY_CONTROL:206]QA_Checked_Stamp_l:22:=DATA_CreateTimeStamp($_dte_QACheckedDate; $_ti_QACheckedTime)
			[DATA_INTEGRITY_CONTROL:206]QA_Checkedby_UUID:19:=$_Txt_QACheckedByUUID
			
			[DATA_INTEGRITY_CONTROL:206]QA_CheckedBy_t:18:=$_Txt_QCheckedbyName
		End if 
		SAVE RECORD:C53([DATA_INTEGRITY_CONTROL:206])
		If ($_Bo_Unload)
			UNLOAD RECORD:C212([DATA_INTEGRITY_CONTROL:206])
			READ ONLY:C145([DATA_INTEGRITY_CONTROL:206])
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DA_UpdateStatus"; $_t_oldMethodName)