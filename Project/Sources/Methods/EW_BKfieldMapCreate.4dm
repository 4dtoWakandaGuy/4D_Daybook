//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_BKfieldMapCreate
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
	ARRAY TEXT:C222($_at_abbreviatedFieldNames; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique; EW_bo_ModifiedSettings)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_LastFieldNumber; $_l_TableNumber)
	C_REAL:C285($1; $2)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_BKfieldMapCreate")
// EW_BKFieldMapCreate
// Creates the necessary field map records for use with the Business Kit
// Parameters: $1=the tab;e number
// $2 = the map number 26/08/03 pb
//03/10/02 pb

$_l_TableNumber:=$1
ARRAY TEXT:C222($_at_abbreviatedFieldNames; Get last field number:C255($_l_TableNumber))
For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableNumber))
	GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
	
	Case of 
		: ($_l_FieldType=Is subtable:K8:11) | ($_bo_FieldInvisible=True:C214)
			// skip this dude
			
		Else 
			CREATE RECORD:C68([EW_BK_FieldMap:121])
			[EW_BK_FieldMap:121]DayBookTableNumber:1:=$_l_TableNumber
			[EW_BK_FieldMap:121]DayBookFieldNumber:2:=$_l_FieldIndex
			[EW_BK_FieldMap:121]DaybookFieldName:5:=Field name:C257($_l_TableNumber; $_l_FieldIndex)
			[EW_BK_FieldMap:121]DaybookFieldType:4:=Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)
			[EW_BK_FieldMap:121]x_MapSetID:7:=$2
			Case of   // 04/09/03
				: ($_l_TableNumber=Table:C252(->[CONTACTS:1])) & ($_l_FieldIndex=Field:C253(->[CONTACTS:1]Contact_Code:2))
					[EW_BK_FieldMap:121]BKFieldName:3:="CusPersoA1"
				: ($_l_TableNumber=Table:C252(->[CONTACTS:1])) & ($_l_FieldIndex=Field:C253(->[CONTACTS:1]Company_Code:1))
					[EW_BK_FieldMap:121]BKFieldName:3:="CusPersoA2"
				: ($_l_TableNumber=Table:C252(->[PRODUCTS:9])) & ($_l_FieldIndex=Field:C253(->[PRODUCTS:9]Product_Code:1))
					[EW_BK_FieldMap:121]BKFieldName:3:="C04"
				: ($_l_TableNumber=Table:C252(->[PRODUCTS:9])) & ($_l_FieldIndex=Field:C253(->[PRODUCTS:9]Product_Name:2))
					[EW_BK_FieldMap:121]BKFieldName:3:="T01"
			End case 
			DB_SaveRecord(->[EW_BK_FieldMap:121])
			AA_CheckFileUnlocked(->[EW_BK_FieldMap:121]x_MapSetID:7)
			$_at_abbreviatedFieldNames{$_l_FieldIndex}:=Replace string:C233([EW_BK_FieldMap:121]DaybookFieldName:5; " "; "")
			$_at_abbreviatedFieldNames{$_l_FieldIndex}:=Replace string:C233($_at_abbreviatedFieldNames{$_l_FieldIndex}; "_"; "")
	End case 
End for 

If ($_l_TableNumber=Table:C252(->[CONTACTS:1]))  // 28/08/03 pb
	$_l_LastFieldNumber:=Get last field number:C255(->[COMPANIES:2])
	$_l_TableNumber:=Table:C252(->[COMPANIES:2])
	For ($_l_FieldIndex; 1; $_l_LastFieldNumber)
		GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
		Case of 
			: ($_l_TableNumber=2) & ($_l_FieldIndex=Field:C253(->[COMPANIES:2]Address_Line_two:4))
				//skip this dude
			: ($_l_TableNumber=2) & ($_l_FieldIndex=Field:C253(->[COMPANIES:2]Invoice_Address_Line_Two:19))
				//skip this dude
			: ($_l_FieldType#Is subtable:K8:11) & ($_bo_FieldInvisible=False:C215)
				$_t_FieldName:=Replace string:C233(Field name:C257($_l_TableNumber; $_l_FieldIndex); " "; "")
				$_t_FieldName:=Replace string:C233($_t_FieldName; "_"; "")
				If (Find in array:C230($_at_abbreviatedFieldNames; $_t_FieldName)<1)
					CREATE RECORD:C68([EW_BK_FieldMap:121])
					[EW_BK_FieldMap:121]DayBookTableNumber:1:=$_l_TableNumber
					[EW_BK_FieldMap:121]DayBookFieldNumber:2:=$_l_FieldIndex
					[EW_BK_FieldMap:121]DaybookFieldName:5:=Field name:C257($_l_TableNumber; $_l_FieldIndex)
					Case of   // 'cos address 1 + 2 are in one BK field
						: ([EW_BK_FieldMap:121]DaybookFieldName:5="Add1")
							[EW_BK_FieldMap:121]DaybookFieldName:5:="Add1 + Add2"
						: ([EW_BK_FieldMap:121]DaybookFieldName:5="IAdd1")
							[EW_BK_FieldMap:121]DaybookFieldName:5:="IAdd1 + IAdd2"
					End case 
					[EW_BK_FieldMap:121]DaybookFieldType:4:=Type:C295(Field:C253($_l_TableNumber; $_l_FieldIndex)->)
					[EW_BK_FieldMap:121]x_MapSetID:7:=$2
					DB_SaveRecord(->[EW_BK_FieldMap:121])
				End if 
		End case 
	End for 
	
End if 

UNLOAD RECORD:C212([EW_BK_FieldMap:121])
EW_bo_ModifiedSettings:=True:C214
ERR_MethodTrackerReturn("EW_BKfieldMapCreate"; $_t_oldMethodName)