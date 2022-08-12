//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ExportSubfields
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 13:17:08If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_RecordsInSelection)
	C_POINTER:C301($_Ptr_SubTable; ParentIDfieldPtr)
	C_TEXT:C284($_t_oldMethodName; $_t_Parentdata; $_t_Text; $0; s2RecordDelimiter; s3FieldDelimiter; tRepeatData)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ExportSubfields")
// EW_ExportSubfields
// 19/08/02 pb


//USE SET("subfields")
ORDER BY:C49([EW_StepActions:119]; [EW_StepActions:119]ActionOrder:3)
//$_Ptr_SubTable:=EW_GetSubTablePointer ([EW_StepActions]TableNumber;
//[EW_StepActions]FieldNumber)
$_Ptr_SubTable:=EW_GetSubTablePointer([EW_StepActions:119]TableNumber:9; [EW_ExportTables:120]SubFieldNumber:7)
$_l_RecordsInSelection:=Records in selection:C76($_Ptr_SubTable->)
_O_FIRST SUBRECORD:C61($_Ptr_SubTable->)
$_t_Text:=""
For ($_l_Index; 1; $_l_RecordsInSelection)
	FIRST RECORD:C50([EW_StepActions:119])
	For ($_l_Index; 1; Records in selection:C76([EW_StepActions:119]))
		If ($_l_Index=1)
			$_t_Parentdata:=FieldDataToText(ParentIDfieldPtr)
			If ([EW_ExportProjects:117]IncludeParentRecordData:13)
				//      $_t_Text:=tRepeatData+$_t_Text
				$_t_Text:=tRepeatData+$_t_Parentdata+s3FieldDelimiter
			Else 
				//       $_t_Text:=tBlankRows+$_t_Parentdata+s3FieldDelimiter+$_t_Text
				$_t_Text:=$_t_Parentdata+s3FieldDelimiter
			End if 
		End if 
		$_t_Text:=$_t_Text+EW_GetSubfieldData([EW_StepActions:119]TableNumber:9; [EW_StepActions:119]FieldNumber:6; [EW_StepActions:119]SubfieldNumber:10)
		//    If ($_l_Index=Records in subselection($_Ptr_SubTable->))
		If ($_l_Index<Records in selection:C76([EW_StepActions:119]))
			$_t_Text:=$_t_Text+s3FieldDelimiter
		End if 
		//   TEXT TO BLOB($_t_Text;bRelatedTableData;Text without length ;*)
		NEXT RECORD:C51([EW_StepActions:119])
	End for 
	$_t_Text:=$_t_Text+s2RecordDelimiter
	_O_NEXT SUBRECORD:C62($_Ptr_SubTable->)
End for 
$0:=$_t_Text
ERR_MethodTrackerReturn("EW_ExportSubfields"; $_t_oldMethodName)