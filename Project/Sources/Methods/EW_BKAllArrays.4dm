//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_BKAllArrays
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
	//ARRAY TEXT(EW_at_BKTables;0)
	//ARRAY TEXT(EW_at_ExportTableNames;0)
	//ARRAY LONGINT(EW_al_ExportTableNumbers;0)
	C_LONGINT:C283($1; $MapNumber; EW_l_SelectedTableNumber)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_BKAllArrays")
// EW_BKAllArrays
// Sets up all the arrays etc. for the ecommerce interface
// Parameters: $1 = the store reference number
// 26/08/03 pb

$MapNumber:=$1
If ($MapNumber>0)
	QUERY:C277([EW_BK_FieldMap:121]; [EW_BK_FieldMap:121]x_MapSetID:7=$MapNumber)
	If (Records in selection:C76([EW_BK_FieldMap:121])=0)  // can happen if the data model was created in Catalogue screen
		ARRAY TEXT:C222(EW_at_ExportTableNames; 1)
		ARRAY LONGINT:C221(EW_al_ExportTableNumbers; 1)
		EW_at_BKTables:=1
		EW_at_ExportTableNames{1}:="Select a table"
		EW_al_ExportTableNumbers{1}:=0
		EW_BKFieldMapArrays(0; ""; "DB")
		EW_BKFieldMapArrays(0; ""; "BK")
	Else 
		
		EW_BKFieldMapArrays($MapNumber; ""; "DB")
		ARRAY TEXT:C222(EW_at_ExportTableNames; 1)
		ARRAY LONGINT:C221(EW_al_ExportTableNumbers; 1)
		FIRST RECORD:C50([EW_BK_FieldMap:121])
		Case of 
			: ([EW_BK_FieldMap:121]DayBookTableNumber:1=Table:C252(->[COMPANIES:2]))
				EW_l_SelectedTableNumber:=1  // force it to Contacts
				
			Else 
				EW_l_SelectedTableNumber:=[EW_BK_FieldMap:121]DayBookTableNumber:1
		End case 
		Case of 
			: (EW_l_SelectedTableNumber=Table:C252(->[CONTACTS:1]))
				EW_at_BKTables:=3  // Customers
				EW_at_ExportTableNames{1}:="Contacts"
				EW_al_ExportTableNumbers{1}:=Table:C252(->[CONTACTS:1])
			Else   // must be products or catalogue
				EW_at_BKTables:=2  // Items
				EW_at_ExportTableNames{1}:="Products"
				EW_al_ExportTableNumbers{1}:=Table:C252(->[PRODUCTS:9])
		End case 
		EW_at_ExportTableNames:=1
		EW_BKFieldMapArrays(0; EW_at_BKTables{EW_at_BKTables}; "BK")
	End if 
Else 
	ARRAY TEXT:C222(EW_at_ExportTableNames; 1)
	ARRAY LONGINT:C221(EW_al_ExportTableNumbers; 1)
	EW_at_ExportTableNames{1}:="Select a Table"
	EW_al_ExportTableNumbers{1}:=0
	EW_l_SelectedTableNumber:=0
	EW_BKFieldMapArrays(0; ""; "DB")
	EW_BKFieldMapArrays(0; ""; "BK")
	EW_at_BKTables:=1
	
End if 
ERR_MethodTrackerReturn("EW_BKAllArrays"; $_t_oldMethodName)