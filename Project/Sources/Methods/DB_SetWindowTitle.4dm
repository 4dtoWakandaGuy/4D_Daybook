//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SetWindowTitle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/06/2010 09:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_RecordsInSelection; $_l_RecordsInTable; $1; DB_l_CurrentDisplayedForm; DB_l_Deletedrecords; DB_l_MaxRecords)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_TableName; $2; DB_T_CurrentFilterName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SetWindowTitle")
$_t_TableName:=Table name:C256(DB_l_CurrentDisplayedForm)

If (Count parameters:C259>=2)
	If ($2="")
		$_t_TableName:=Table name:C256($1)
	Else 
		$_t_TableName:=$2
	End if 
	$_t_TableName:=Replace string:C233($_t_TableName; "_"; " ")
	
	$_ptr_Table:=Table:C252($1)
	$_l_RecordsInSelection:=Records in selection:C76($_ptr_Table->)
	$_l_RecordsInTable:=Records in table:C83($_ptr_Table->)
	DB_l_Deletedrecords:=0
	Case of 
		: (DB_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
			SET QUERY DESTINATION:C396(Into variable:K19:4; DB_l_Deletedrecords)
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Deleted:61#0)
			SET QUERY DESTINATION:C396(0)
			$_l_RecordsInTable:=$_l_RecordsInTable-DB_l_Deletedrecords
			//$_l_RecordsInTable:=
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
			SET QUERY DESTINATION:C396(Into variable:K19:4; DB_l_Deletedrecords)
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Deleted:32#0)
			SET QUERY DESTINATION:C396(0)
			$_l_RecordsInTable:=$_l_RecordsInTable-DB_l_Deletedrecords
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
			SET QUERY DESTINATION:C396(Into variable:K19:4; DB_l_Deletedrecords)
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54#0)
			SET QUERY DESTINATION:C396(0)
			$_l_RecordsInTable:=$_l_RecordsInTable-DB_l_Deletedrecords
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL:11]))
			SET QUERY DESTINATION:C396(Into variable:K19:4; DB_l_Deletedrecords)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#0)
			SET QUERY DESTINATION:C396(0)
			$_l_RecordsInTable:=$_l_RecordsInTable-DB_l_Deletedrecords
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[DIARY:12]))
			SET QUERY DESTINATION:C396(Into variable:K19:4; DB_l_Deletedrecords)
			QUERY:C277([DIARY:12]; [DIARY:12]Deleted:43#0)
			SET QUERY DESTINATION:C396(0)
			$_l_RecordsInTable:=$_l_RecordsInTable-DB_l_Deletedrecords
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
			
		: (DB_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))
			Case of 
				: ($2="Letters")
					$_t_TableName:="Document Templates"
			End case 
	End case 
	If (DB_l_MaxRecords>0)
		$_l_RecordsInTable:=DB_l_MaxRecords
	End if 
	If (DB_T_CurrentFilterName#"")
		SET WINDOW TITLE:C213("Filter applied: "+DB_T_CurrentFilterName+" "+$_t_TableName+" "+String:C10($_l_RecordsInSelection)+" of "+String:C10($_l_RecordsInTable))
		
	Else 
		SET WINDOW TITLE:C213($_t_TableName+" "+String:C10($_l_RecordsInSelection)+" of "+String:C10($_l_RecordsInTable))
	End if 
End if 
ERR_MethodTrackerReturn("DB_SetWindowTitle"; $_t_oldMethodName)