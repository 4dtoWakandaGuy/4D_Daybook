//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_FieldMapSave
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
	//ARRAY LONGINT(EW_al_dbFieldMapTypes;0)
	//ARRAY LONGINT(EW_al_DBFieldNumbers;0)
	//ARRAY TEXT(EW_at_DBFieldNames;0)
	//ARRAY TEXT(EW_at_BKFieldNames;0)
	//ARRAY TEXT(EW_at_BKTables;0)
	//ARRAY TEXT(EW_at_DBTypes;0)
	C_BOOLEAN:C305($_bo_Accept; $0; EW_bo_ModifiedSettings)
	C_LONGINT:C283($_l_Mapnumber; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_FieldMapSave")
// EW_FieldMapSave
// 7/10/02 pb
// parameters: $1 = the table number xx see below
// parameters: $1 = the field map number 26/08/03 pb


$_l_Mapnumber:=$1
$_bo_Accept:=True:C214
Case of 
	: (EW_at_BKTables{EW_at_BKTables}="items")
		Case of 
				//     : (Find in array(EW_at_BKFieldNames;"C01")<1)
				//    Gen_Alert ("The Ecommerce field "+Char(34)+"CO1"+Char(34)+" must be included
				//     $_bo_Accept:=False
		End case 
		
	: (EW_at_BKTables{EW_at_BKTables}="customers")
		Case of 
				//     : (Find in array(EW_at_BKFieldNames;"CusCode")<1)
				//      Gen_Alert ("The Ecommerce field "+Char(34)+"CusCode"+Char(34)+" must be in
				//     $_bo_Accept:=False
		End case 
End case 

If ($_bo_Accept)
	READ WRITE:C146([EW_BK_FieldMap:121])
	// QUERY([EW_BK_FieldMap];[EW_BK_FieldMap]DayBookTableNumber=$_l_TableNumber)
	QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=$_l_Mapnumber)
	ORDER BY:C49([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]DaybookFieldName:5)
	SORT ARRAY:C229(EW_at_DBFieldNames; EW_at_BKFieldNames; EW_al_DBFieldNumbers; EW_at_DBTypes; EW_al_dbFieldMapTypes)
	ARRAY TO SELECTION:C261(EW_at_BKFieldNames; [EW_BK_FieldMap:121]BKFieldName:3)
	DB_lockFile(->[EW_BK_FieldMap:121])
	APPLY TO SELECTION:C70([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]BKTableName:6:=EW_at_BKTables{EW_at_BKTables})
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[EW_BK_FieldMap:121]))
	SORT ARRAY:C229(EW_at_DBFieldNames; EW_al_DBFieldNumbers; EW_at_DBTypes; EW_at_BKFieldNames; EW_al_dbFieldMapTypes)
	
	EW_FieldMapPrefsSave
	EW_bo_ModifiedSettings:=False:C215
	// ACCEPT
End if 
$0:=$_bo_Accept
ERR_MethodTrackerReturn("EW_FieldMapSave"; $_t_oldMethodName)