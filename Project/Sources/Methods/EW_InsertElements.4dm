//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_InsertElements
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
	//ARRAY LONGINT(EW_al_ExportFieldNumbers;0)
	//ARRAY LONGINT(EW_al_StepDetailRecordnos;0)
	//ARRAY TEXT(EW_at_AllBKFieldMapNames;0)
	//ARRAY TEXT(EW_at_AllDBFieldMapNames;0)
	//ARRAY TEXT(EW_at_ExportActions;0)
	//ARRAY TEXT(EW_at_ExportFields;0)
	//ARRAY TEXT(EW_at_OutputLabels;0)
	C_BOOLEAN:C305(EW_bo_ModifiedStep)
	C_LONGINT:C283($_l_DestinationRow; $_l_FieldNumber; $_l_Index; $_l_MapPosition; $_l_SourceRow; $_l_TableNumber; $9)
	C_REAL:C285($3; $4; $5; $7; $8)
	C_TEXT:C284($_t_AreaName; $_t_oldMethodName; $1; $10; $2; $6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_InsertElements")
// EW_Insertelements
// Inserts elements into arrays and reorders etc.
// 8/07/02 pb

// parameters:
//     $1=the area
//     $2=Text for the Action Type (eALStepDetails) e.g. Field Data, Calculation
//     $3=Table no.
//     $4 = field number
//     $5 = subfield number
//     $6:=field name
//     $7 = related field number
//     $8=The field number (overrides field selected in field list)
//                              e.g. for use with Calculations or 0
//     $9=the position of the new element in the list
// $10 - optional - macro code or some other miscellaneous info


CREATE SET:C116([EW_StepActions:119]; "use")
$_t_AreaName:=$1
$_l_TableNumber:=$3
If ($8>0)
	$_l_FieldNumber:=$8
Else 
	$_l_FieldNumber:=$4
End if 
$_l_DestinationRow:=$9

CREATE RECORD:C68([EW_StepActions:119])
[EW_StepActions:119]StepTableRecordNumber:1:=[EW_ExportTables:120]RecordNumber:2
[EW_StepActions:119]RecordNumber:2:=Gen_RecordNumber(Table:C252(->[EW_StepActions:119]))
[EW_StepActions:119]WhatDataToExport:4:=$6
[EW_StepActions:119]FieldNumber:6:=$_l_FieldNumber
//[EW_StepActions]FieldNumber:=$4
[EW_StepActions:119]Action:7:=$2
[EW_StepActions:119]TableNumber:9:=$3
[EW_StepActions:119]SubfieldNumber:10:=$5
[EW_StepActions:119]RelatedFieldNumber:11:=$7
[EW_StepActions:119]ActionOrder:3:=$_l_DestinationRow
If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
	$_l_MapPosition:=Find in array:C230(EW_at_AllDBFieldMapNames; $6)
	[EW_StepActions:119]OutputLabel:13:=EW_at_AllBKFieldMapNames{$_l_MapPosition}
Else 
	[EW_StepActions:119]OutputLabel:13:=$6
End if 
If (Count parameters:C259=10)
	Case of 
		: ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
			[EW_StepActions:119]OutputLabel:13:=$10
		Else 
			[EW_StepActions:119]MacroCode:14:=$10  // could be something else ...
	End case 
End if 
DB_SaveRecord(->[EW_StepActions:119])

Case of 
	: ($_t_AreaName="EW_lb_StepDetails")
		INSERT IN ARRAY:C227(EW_at_ExportFields; $_l_DestinationRow)
		INSERT IN ARRAY:C227(EW_al_ExportFieldNumbers; $_l_DestinationRow)
		INSERT IN ARRAY:C227(EW_at_ExportActions; $_l_DestinationRow)
		INSERT IN ARRAY:C227(EW_ai_StepDetailOrder; $_l_DestinationRow)
		INSERT IN ARRAY:C227(EW_al_StepDetailRecordnos; $_l_DestinationRow)
		INSERT IN ARRAY:C227(EW_at_OutputLabels; $_l_DestinationRow)
		EW_at_ExportFields{$_l_DestinationRow}:=$6
		EW_al_ExportFieldNumbers{$_l_DestinationRow}:=$_l_FieldNumber
		EW_at_ExportActions{$_l_DestinationRow}:=Substring:C12($2; 1; 10)
		EW_ai_StepDetailOrder{$_l_DestinationRow}:=$_l_DestinationRow
		EW_al_StepDetailRecordnos{$_l_DestinationRow}:=[EW_StepActions:119]RecordNumber:2
		EW_at_OutputLabels{$_l_DestinationRow}:=[EW_StepActions:119]OutputLabel:13
		For ($_l_Index; 1; Size of array:C274(EW_ai_StepDetailOrder))
			EW_ai_StepDetailOrder{$_l_Index}:=$_l_Index
		End for 
End case 
EW_bo_ModifiedStep:=True:C214
ADD TO SET:C119([EW_StepActions:119]; "use")
USE SET:C118("use")
ERR_MethodTrackerReturn("EW_InsertElements"; $_t_oldMethodName)