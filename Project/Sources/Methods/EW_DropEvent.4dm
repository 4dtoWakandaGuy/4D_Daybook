//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_DropEvent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(EW_ai_StepDetailOrder;0)
	//ARRAY LONGINT(EW_al_BKFieldType;0)
	//ARRAY LONGINT(EW_al_dbFieldMapTypes;0)
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//ARRAY TEXT(EW_at_OutputLabels;0)
	C_BOOLEAN:C305($_bo_Accept; EW_bo_ModifiedSettings)
	C_LONGINT:C283($_l_DestinationRow; $_l_FieldNumber; $_l_Index; $_l_SourceProcess; $_l_SourceRow; $_l_TableNumber)
	C_POINTER:C301($_ptr_DestinationArea; $_Ptr_SourceObject; $1)
	C_REAL:C285(eALStepdetails)
	C_TEXT:C284($_t_DestinationAreaName; $_t_oldMethodName; $_t_SourceAreaName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_DropEvent")
// EW_DropEvent
// Parameters: $1=Pointer to the listbox area from which this was called (the drop area)
//Case of
//  : (Form event=On Drop )
//   DRAG AND DROP PROPERTIES(srcObject;srcElement;srcProcess)
//   RESOLVE POINTER(srcObject;$_t_VariableName;$_l_TableNumber;$_l_FieldNumber)
//EW_lb_FieldList;EW_lb_StepDetails;eALBKfields;eLBFieldMap)  ` essential to declare all ALLP areas here!
$_ptr_DestinationArea:=$1
RESOLVE POINTER:C394($1->; $_t_DestinationAreaName; $_l_TableNumber; $_l_FieldNumber)

_O_DRAG AND DROP PROPERTIES:C607($_Ptr_SourceObject; $_l_SourceRow; $_l_SourceProcess)
RESOLVE POINTER:C394($_Ptr_SourceObject->; $_t_SourceAreaName; $_l_TableNumber; $_l_FieldNumber)
//AL_GetDrgSrcRow ($_Ptr_SourceObject;$_l_SourceRow)
//AL_GetDrgArea ($_Ptr_SourceObject;$_ptr_DestinationArea;$DestProcessID)
//AL_GetDrgDstRow ($_ptr_DestinationArea;$_l_DestinationRow)
//$_l_DestinationRow:=$_ptr_DestinationArea  ` todo: this needs testing!
$_bo_Accept:=True:C214
Case of 
	: ($_t_SourceAreaName=$_t_DestinationAreaName)  // dragged within the same area
		Case of 
			: ($_t_SourceAreaName="eLBtepDetails")
				If ($_l_SourceRow#$_l_DestinationRow)
					For ($_l_Index; 1; Size of array:C274(EW_ai_StepDetailOrder))
						EW_ai_StepDetailOrder{$_l_Index}:=$_l_Index
					End for 
				End if 
				//       EW_bo_ModifiedStep:=True
				//If (False)  ` not sure if this is needed
				//SORT ARRAY(EW_ai_StepDetailOrder;EW_at_ExportFields;EW_al_ExportFieldNumbers;EW_at_ExportActions;EW_al_StepDetailRecordnos;EW_at_OutputLabels)
				//End if   ` false
		End case 
		
		//: ($_Ptr_SourceObject=eALFieldList) & ($_ptr_DestinationArea=eALStepdetails)  ` drag from the field list to the detail list
	: ($_t_SourceAreaName="EW_lb_FieldList") & ($_t_DestinationAreaName="EW_lb_StepDetails")  // drag from the field list to the detail list
		// on the Export Wizard screen
		If ([EW_ExportTables:120]SubFieldNumber:7>0)  // it is for a subtable
			EW_InsertElements($_t_DestinationAreaName; "Field Data"; [EW_ExportTables:120]TableNumber:3; [EW_ExportTables:120]SubFieldNumber:7; EW_al_DBFieldNumbers{$_l_SourceRow}; EW_at_DBFieldNames{$_l_SourceRow}; 0; 0; $_l_DestinationRow)
		Else 
			EW_InsertElements($_t_DestinationAreaName; "Field Data"; [EW_ExportTables:120]TableNumber:3; EW_al_DBFieldNumbers{$_l_SourceRow}; 0; EW_at_DBFieldNames{$_l_SourceRow}; 0; 0; $_l_DestinationRow)
		End if 
		//   EW_bo_ModifiedStep:=True
		SORT ARRAY:C229(EW_ai_StepDetailOrder; EW_at_ExportFields; EW_al_ExportFieldNumbers; EW_at_ExportActions; EW_al_StepDetailRecordnos; EW_at_OutputLabels)
		EW_LBI_Setup(->eALStepdetails; "EWDetails"; 3; ->EW_at_ExportFields; ->EW_at_OutputLabels; ->EW_at_ExportActions; ->EW_al_ExportFieldNumbers; ->EW_al_StepDetailRecordnos; ->EW_ai_StepDetailOrder)
		
		//: ($_Ptr_SourceObject=eALBKfields) & ($_ptr_DestinationArea=eALFieldMap)  ` drag from the BK field list to the DB field list
	: ($_t_SourceAreaName="e_LB_BKfields") & ($_t_DestinationAreaName="e_LB_FieldMap")  // drag from the BK field list to the DB field list
		// on the Field Map screen
		// check that the field types match
		Case of 
			: (EW_al_BKFieldType{$_l_SourceRow}=Is date:K8:7)
				If (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is date:K8:7) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is text:K8:3) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is alpha field:K8:1)
					$_bo_Accept:=False:C215
				End if 
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is alpha field:K8:1)
				// anything can be coerced into Alpha or text
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is text:K8:3)
				// anything can be coerced into Alpha or text
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is real:K8:4)
				If (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is real:K8:4) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is integer:K8:5) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is longint:K8:6)
					$_bo_Accept:=False:C215
				End if 
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is integer:K8:5)
				If (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is integer:K8:5) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is longint:K8:6) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is real:K8:4)
					$_bo_Accept:=False:C215
				End if 
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is longint:K8:6)
				If (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is longint:K8:6) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is real:K8:4)
					$_bo_Accept:=False:C215
				End if 
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is time:K8:8)
				If (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is time:K8:8)
					$_bo_Accept:=False:C215
				End if 
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is picture:K8:10)
				If (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is picture:K8:10)
					$_bo_Accept:=False:C215
				End if 
				
			: (EW_al_BKFieldType{$_l_SourceRow}=Is boolean:K8:9)
				If (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is boolean:K8:9) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is integer:K8:5) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is longint:K8:6) & (EW_al_dbFieldMapTypes{$_l_DestinationRow}#Is real:K8:4)
					$_bo_Accept:=False:C215
				End if 
				
			Else 
		End case 
		If ($_bo_Accept=False:C215)
			//  ALERT("The field types are incompatible.")
			Gen_Alert("The field types are incompatible.")
		Else 
			EW_at_BKFieldNames{$_l_DestinationRow}:=EW_at_BKFieldNames{$_l_SourceRow}
			EW_bo_ModifiedSettings:=True:C214
		End if 
		
End case 


//AL_UpdateArrays ($_Ptr_SourceObject;-1)
//AL_UpdateArrays ($_ptr_DestinationArea;-1)
ERR_MethodTrackerReturn("EW_DropEvent"; $_t_oldMethodName)