//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_FieldArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/03/2010 05:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(EW_lb_FieldList;0)
	//ARRAY BOOLEAN(EW_lb_RelatedData;0)
	//ARRAY LONGINT(EW_al_dbFieldMapTypes;0)
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	//ARRAY LONGINT(EW_al_DBTableNumbers;0)
	//ARRAY LONGINT(EW_al_ManyTableNumbers;0)
	//ARRAY LONGINT(EW_al_NumericFieldNums;0)
	//ARRAY LONGINT(EW_al_NumericFieldTablenums;0)
	//ARRAY LONGINT(EW_al_RelatedManyFieldNumber;0)
	//ARRAY LONGINT(EW_al_RelatedOneFieldNumber;0)
	//ARRAY LONGINT(EW_al_RelatedSubFieldNumbers;0)
	//ARRAY LONGINT(EW_al_RelatedTableNumbers;0)
	//ARRAY TEXT(EW_at_AllBKFieldMapNames;0)
	//ARRAY TEXT(EW_at_AllDBFieldMapNames;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_ControlExportTables;0)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	//ARRAY TEXT(EW_at_NumericFields;0)
	//ARRAY TEXT(EW_at_OneTableFieldNumber;0)
	//ARRAY TEXT(EW_at_RelatedTableNames;0)
	C_BOOLEAN:C305($_bo_AutoMany; $_bo_AutoOne; $_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; $_bo_UseThisOne; DB_bo_FontsInited)
	C_LONGINT:C283(<>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; $_l_ActualFieldCount; $_l_ChoiceField; $_l_FIeldLength; $_l_FIeldType; $_l_Index; $_l_ManytableNumber; $_l_MaxFields; $_l_OneField; $_l_OneTable)
	C_LONGINT:C283($_l_SubFieldNumber; $_l_TableNumber; $1; $2)
	C_REAL:C285($_l_FieldTablePosition; $_l_NumericCount)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_oldMethodName; $_t_TableandFieldNumber)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_FieldArrays")
// EW_fieldArrays
// 28/06/02 pb
// Parameters: $1 = the table number
//                     $2 = subfield no. or related table no. (optional)

$_l_TableNumber:=$1
$_l_SubFieldNumber:=$2

If ([EW_ExportSteps:118]CatalogueExport:9) & ([EW_ExportTables:120]TableNumber:3=Table:C252(->[CATALOGUE:108]))  // 01/03/03 pb
	$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
End if 
// these arrays are the base table field arrays
ARRAY TEXT:C222(EW_at_DBFieldNames; 0)
ARRAY LONGINT:C221(EW_al_DBFieldNumbers; 0)
ARRAY LONGINT:C221(EW_al_dbFieldMapTypes; 0)
//ARRAY LONGINT(EW_al_ExportTableNumbers;0)  `EW_al_ExportTableNumbers
ARRAY LONGINT:C221(EW_al_DBTableNumbers; 0)  // 4/12/03 pb

// these arrays are the related tables and subtables
ARRAY TEXT:C222(EW_at_RelatedTableNames; 0)
ARRAY LONGINT:C221(EW_al_RelatedTableNumbers; 0)
ARRAY LONGINT:C221(EW_al_RelatedSubFieldNumbers; 0)
ARRAY LONGINT:C221(EW_al_RelatedOneFieldNumber; 0)
ARRAY LONGINT:C221(EW_al_RelatedManyFieldNumber; 0)

// these arrays are used in Calculations: only numeric fields
ARRAY TEXT:C222(EW_at_NumericFields; 0)
ARRAY LONGINT:C221(EW_al_NumericFieldNums; 0)
ARRAY LONGINT:C221(EW_al_NumericFieldTablenums; 0)
ARRAY TEXT:C222(EW_at_NumericFields; 50)
ARRAY LONGINT:C221(EW_al_NumericFieldNums; 50)
ARRAY LONGINT:C221(EW_al_NumericFieldTablenums; 50)
//$_l_NumericCount:=0

Case of 
	: ($_l_SubFieldNumber>0)
		//    EW_SubRecordFieldNames ($_l_TableNumber;$_l_SubFieldNumber)
		EW_SubRecordFieldNames($_l_TableNumber; $_l_SubFieldNumber)
		EW_LBI_Setup(->EW_lb_FieldList; "EWfields"; 1; ->EW_at_DBFieldNames; ->EW_al_DBFieldNumbers; ->EW_al_dbFieldMapTypes)
		EW_LBI_Setup(->EW_lb_RelatedData; "EWrelatedTables"; 1; ->EW_at_RelatedTableNames; ->EW_al_RelatedTableNumbers; ->EW_al_RelatedSubFieldNumbers; ->EW_al_RelatedManyFieldNumber; ->EW_al_RelatedOneFieldNumber)
		If (Not:C34(DB_bo_FontsInited))
			DB_SetDefaultFonts
		End if 
		
		For ($_l_Index; 1; Size of array:C274(EW_al_RelatedSubFieldNumbers))
			If (EW_al_RelatedSubFieldNumbers{$_l_Index}>0)  // it's a subtable
				LB_SETFONT(->EW_lb_RelatedData; "oExportWizs"; 2; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
			Else 
				LB_SETFONT(->EW_lb_RelatedData; "oExportWizs"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
			End if 
		End for 
		
	: ($_l_TableNumber>0)
		If ([EW_ExportProjects:117]Exportformat:7="daybook ecommerce")
			// there will already be a selection of field Map records
			//SELECTION TO ARRAY([EW_BK_FieldMap]DayBookFieldNumber;EW_al_DBFieldNumbers;[EW_BK_FieldMap]BKFieldName;EW_at_BKFieldNames;;[EW_BK_FieldMap]DaybookFieldType;EW_al_dbFieldMapTypes)
			
			SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]DaybookFieldName:5; EW_at_DBFieldNames; [EW_BK_FieldMap:121]DayBookFieldNumber:2; EW_al_DBFieldNumbers; [EW_BK_FieldMap:121]DaybookFieldType:4; EW_al_dbFieldMapTypes; [EW_BK_FieldMap:121]DayBookTableNumber:1; EW_al_DBTableNumbers)
			ARRAY TEXT:C222(EW_at_AllDBFieldMapNames; 0)
			ARRAY TEXT:C222(EW_at_AllBKFieldMapNames; 0)
			QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]BKFieldName:3#"")
			SELECTION TO ARRAY:C260([EW_BK_FieldMap:121]DaybookFieldName:5; EW_at_AllDBFieldMapNames; [EW_BK_FieldMap:121]BKFieldName:3; EW_at_AllBKFieldMapNames)
			$_l_MaxFields:=Get last field number:C255($_l_TableNumber)
			For ($_l_Index; 1; $_l_MaxFields)
				$_l_NumericCount:=$_l_NumericCount+1
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_Index; $_l_FIeldType; $_l_FIeldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				EW_NumericFieldArrays($_l_Index; $_l_TableNumber; $_l_FIeldType)  // this is for Calculations
			End for 
		Else 
			//    $maxlength:=0
			$_l_MaxFields:=Get last field number:C255($_l_TableNumber)
			ARRAY TEXT:C222(EW_at_DBFieldNames; $_l_MaxFields)
			ARRAY LONGINT:C221(EW_al_DBFieldNumbers; $_l_MaxFields)
			ARRAY LONGINT:C221(EW_al_dbFieldMapTypes; $_l_MaxFields)
			ARRAY LONGINT:C221(EW_al_DBTableNumbers; $_l_MaxFields)  // 4/12/03 pb
			$_l_ActualFieldCount:=0
			For ($_l_Index; 1; $_l_MaxFields)
				//      ALERT("field no. "+String($_l_Index))
				EW_al_DBTableNumbers{$_l_Index}:=$_l_TableNumber  // 4/12/03 pb
				GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_Index; $_l_FIeldType; $_l_FIeldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				$_l_NumericCount:=$_l_NumericCount+1
				EW_NumericFieldArrays($_l_Index; $_l_TableNumber; $_l_FIeldType)  // this is for Calculations
				$_t_TableandFieldNumber:=String:C10($_l_TableNumber)+" "+String:C10($_l_Index)
				$_l_FieldTablePosition:=Find in array:C230(EW_at_OneTableFieldNumber; $_t_TableandFieldNumber)  // finds many to one relations
				//   ALERT("Size of  EW_at_OneTableFieldNumber array is "+  `
				//String(Size of array(EW_at_OneTableFieldNumber)))
				//     ALERT("$_l_FieldTablePosition = "+String($_l_FieldTablePosition))
				GET RELATION PROPERTIES:C686($_l_TableNumber; $_l_Index; $_l_OneTable; $_l_OneField; $_l_ChoiceField; $_bo_AutoOne; $_bo_AutoMany)
				$_bo_UseThisOne:=True:C214
				
				//      ALERT("One table is "+String($_l_OneTable))
				If ($_bo_AutoOne)
					//        ALERT("autoOne is True")
				Else 
					//      ALERT("autoOne is False")
				End if 
				If ($_bo_AutoMany)
					//      ALERT("auto Many is True")
				Else 
					//       ALERT("auto Many is False")
				End if 
				
				Case of 
					: ($_l_OneTable>0)  // there is a many to one relation on this field (this is the "many" table)
						//          ALERT("Many to one")
						If (Find in array:C230(EW_at_RelatedTableNames; Table name:C256($_l_OneTable))<1)
							If (Find in array:C230(EW_at_ControlExportTables; Table name:C256($_l_OneTable))<1)  // 7/11/02 pb
								INSERT IN ARRAY:C227(EW_at_RelatedTableNames; 1)
								INSERT IN ARRAY:C227(EW_al_RelatedTableNumbers; 1)
								INSERT IN ARRAY:C227(EW_al_RelatedSubFieldNumbers; 1)
								INSERT IN ARRAY:C227(EW_al_RelatedManyFieldNumber; 1)
								INSERT IN ARRAY:C227(EW_al_RelatedOneFieldNumber; 1)
								EW_at_RelatedTableNames{1}:=Table name:C256($_l_OneTable)
								EW_al_RelatedTableNumbers{1}:=$_l_OneTable
								EW_al_RelatedOneFieldNumber{1}:=$_l_Index
								If ($_l_OneTable=[EW_ExportTables:120]ParentTableNumber:6)
									[EW_ExportTables:120]RelatedManyfieldNumber:9:=$_l_Index
								End if 
							End if 
						End if 
						
					: ($_l_FieldTablePosition>0)  // there is a one to many relation (this is the "one" table)
						//          ALERT("One to many")
						
						For ($_l_Index; 1; Size of array:C274(EW_at_OneTableFieldNumber))  // 'cos there might be more than one relation for this field
							$_t_TableandFieldNumber:=String:C10($_l_TableNumber)+" "+String:C10($_l_Index)
							$_l_ManytableNumber:=EW_al_ManyTableNumbers{$_l_Index}
							If (EW_at_OneTableFieldNumber{$_l_Index}=$_t_TableandFieldNumber) & (Find in array:C230(EW_at_RelatedTableNames; Table name:C256($_l_ManytableNumber))<1)
								If (Find in array:C230(EW_at_ControlExportTables; Table name:C256($_l_ManytableNumber))<1)
									INSERT IN ARRAY:C227(EW_at_RelatedTableNames; 1)
									INSERT IN ARRAY:C227(EW_al_RelatedTableNumbers; 1)
									INSERT IN ARRAY:C227(EW_al_RelatedSubFieldNumbers; 1)
									INSERT IN ARRAY:C227(EW_al_RelatedManyFieldNumber; 1)
									INSERT IN ARRAY:C227(EW_al_RelatedOneFieldNumber; 1)
									EW_at_RelatedTableNames{1}:=Table name:C256($_l_ManytableNumber)
									//                  ALERT("EW_at_RelatedTableNames{1} is "+EW_at_RelatedTableNames{1})
									EW_al_RelatedTableNumbers{1}:=$_l_ManytableNumber
									EW_al_RelatedManyFieldNumber{1}:=$_l_Index
								End if 
							End if   // onetable match
						End for 
						
					: ($_l_FIeldType=Is subtable:K8:11)
						If (Field name:C257($_l_TableNumber; $_l_Index)#"@unused@")
							INSERT IN ARRAY:C227(EW_at_RelatedTableNames; 1)
							INSERT IN ARRAY:C227(EW_al_RelatedTableNumbers; 1)
							INSERT IN ARRAY:C227(EW_al_RelatedSubFieldNumbers; 1)
							INSERT IN ARRAY:C227(EW_al_RelatedManyFieldNumber; 1)
							INSERT IN ARRAY:C227(EW_al_RelatedOneFieldNumber; 1)
							EW_at_RelatedTableNames{1}:=Field name:C257($_l_TableNumber; $_l_Index)
							EW_al_RelatedTableNumbers{1}:=$_l_TableNumber
							EW_al_RelatedSubFieldNumbers{1}:=$_l_Index
						End if 
						$_bo_UseThisOne:=False:C215  // don't include in field list
					Else 
						//            ALERT("None of the above")
						
				End case 
				If ($_bo_UseThisOne)
					$_l_ActualFieldCount:=$_l_ActualFieldCount+1
					EW_at_DBFieldNames{$_l_ActualFieldCount}:=Field name:C257($_l_TableNumber; $_l_Index)
					EW_al_DBFieldNumbers{$_l_ActualFieldCount}:=$_l_Index
					EW_al_dbFieldMapTypes{$_l_ActualFieldCount}:=$_l_FIeldType
				End if 
			End for 
			ARRAY TEXT:C222(EW_at_DBFieldNames; $_l_ActualFieldCount)
			ARRAY LONGINT:C221(EW_al_DBFieldNumbers; $_l_ActualFieldCount)
			ARRAY LONGINT:C221(EW_al_dbFieldMapTypes; $_l_ActualFieldCount)
			ARRAY LONGINT:C221(EW_al_DBTableNumbers; $_l_ActualFieldCount)
		End if   // is ecommerce export
		SORT ARRAY:C229(EW_at_RelatedTableNames; EW_al_RelatedTableNumbers; EW_al_RelatedSubFieldNumbers; EW_al_RelatedManyFieldNumber; EW_al_RelatedOneFieldNumber)
		SORT ARRAY:C229(EW_at_DBFieldNames; EW_al_DBFieldNumbers; EW_al_dbFieldMapTypes; EW_al_DBTableNumbers)
		EW_LBI_Setup(->EW_lb_FieldList; "EWfields"; 1; ->EW_at_DBFieldNames; ->EW_al_DBFieldNumbers; ->EW_al_dbFieldMapTypes; ->EW_al_DBTableNumbers)
		EW_LBI_Setup(->EW_lb_RelatedData; "EWrelatedTables"; 1; ->EW_at_RelatedTableNames; ->EW_al_RelatedTableNumbers; ->EW_al_RelatedSubFieldNumbers; ->EW_al_RelatedManyFieldNumber; ->EW_al_RelatedOneFieldNumber)
		If (Not:C34(DB_bo_FontsInited))
			DB_SetDefaultFonts
		End if 
		For ($_l_Index; 1; Size of array:C274(EW_al_RelatedSubFieldNumbers))
			If (EW_al_RelatedSubFieldNumbers{$_l_Index}>0)  // it's a subtable
				//`AL_SetRowStyle (eALRelatedData;$_l_Index;1;"")  ` bold
				
				LB_SETFONT(->EW_lb_RelatedData; "oExportWizs"; 2; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
			Else 
				LB_SETFONT(->EW_lb_RelatedData; "oExportWizs"; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
				//AL_SetRowStyle (eALRelatedData;$_l_Index;0;"")  ` plain
			End if 
		End for 
		
		
		
End case 

ARRAY TEXT:C222(EW_at_NumericFields; $_l_NumericCount)  // these arrays are used in Calculations
ARRAY LONGINT:C221(EW_al_NumericFieldNums; $_l_NumericCount)
ARRAY LONGINT:C221(EW_al_NumericFieldTablenums; $_l_NumericCount)
SORT ARRAY:C229(EW_at_NumericFields; EW_al_NumericFieldNums; EW_al_NumericFieldTablenums)
ERR_MethodTrackerReturn("EW_FieldArrays"; $_t_oldMethodName)