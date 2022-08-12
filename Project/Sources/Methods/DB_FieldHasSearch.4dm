//%attributes = {}

If (False:C215)
	//Database Method Name:      DB_FieldHasSearch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_LONGINT:C283($_l_TableNumber; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_FieldHasSearch")

//by default the answer is yes but this will allow to return false for any field we do not want to search against
$_l_TableNumber:=$1
$0:=True:C214
Case of 
	: ($_l_TableNumber=Table:C252(->[CURRENCIES:71]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[CURRENCY_RATES:72]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[CONTRACTS_CONTACTS:151]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[DATA_AUDITS:102]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[DELETIONS:66]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[DIARY_ITEMOWNERS:106]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EMAIL_ATTACHMENTS:103]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EMAIL_RECIPIENTS:104]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EW_BK_FieldMap:121]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EW_BKFields:122]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EW_ExportProjects:117]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EW_ExportSteps:118]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EW_ExportTables:120]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[EW_StepActions:119]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS_PERSONNEL:100]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[TABLE_RECORD_STATES:90]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS:16]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[IDENTIFIERS_MULTI_NUMBERS:94]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[CONTRACT_RECORD_ANALYSIS:88]))
		$0:=False:C215
	: ($_l_TableNumber=Table:C252(->[CUSTOM_FIELDS:98]))
		$0:=False:C215
End case 
ERR_MethodTrackerReturn("DB_FieldHasSearch"; $_t_oldMethodName)