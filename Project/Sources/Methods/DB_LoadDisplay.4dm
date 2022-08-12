//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_LoadDisplay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 17:23`Method: DB_LoadDisplay
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldRow; $1)
	C_POINTER:C301($2; $3)
	C_TEXT:C284(<>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_LoadDisplay")

If (Count parameters:C259>=2)
	Case of 
		: ($1=Table:C252(->[COMPANIES:2]))
			$_l_FieldRow:=Find in array:C230($2->; <>DB_t_TownLabel)
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; <>DB_t_TownLabel)
			End if 
			$_l_FieldRow:=Find in array:C230($2->; <>DB_t_CountyLabel)
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; <>DB_t_CountyLabel)
			End if 
			$_l_FieldRow:=Find in array:C230($2->; <>DB_t_PostcodeLabel)
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; <>DB_t_PostcodeLabel)
			End if 
			$_l_FieldRow:=Find in array:C230($2->; <>DB_t_CountryLabel)
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; <>DB_t_CountryLabel)
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Telephone")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Telephone")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Fax")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Fax")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Status")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Status")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Type")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Type")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Source")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Source")
			End if 
			$2->:=1
		: ($1=Table:C252(->[CONTACTS:1]))
			$_l_FieldRow:=Find in array:C230($2->; "Contact Code")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Contact Code")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Title")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Title")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Job Title")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Job Title")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Department")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Department")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Extension")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Extension")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Role")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Role")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Status")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Status")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Type")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Type")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Source")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Source")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "1st Company")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "1st Company")
			End if 
			
			$2->:=1
		: ($1=Table:C252(->[PRODUCTS:9]))
			
			$_l_FieldRow:=Find in array:C230($2->; "Sales Price")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Sales Price")
			End if 
			$_l_FieldRow:=Find in array:C230($2->; "Standard Price")
			If ($_l_FieldRow<0)
				APPEND TO ARRAY:C911($2->; "Standard Price")
			End if 
			If (DB_GetModuleSettingByNUM(Module_StockControl)>0)
				$_l_FieldRow:=Find in array:C230($2->; "Min Stock")
				If ($_l_FieldRow<0)
					APPEND TO ARRAY:C911($2->; "Min Stock")
				End if 
				$_l_FieldRow:=Find in array:C230($2->; "Max Stock")
				If ($_l_FieldRow<0)
					APPEND TO ARRAY:C911($2->; "Max Stock")
				End if 
				
				$_l_FieldRow:=Find in array:C230($2->; "Stock Level")
				If ($_l_FieldRow<0)
					APPEND TO ARRAY:C911($2->; "Stock Level")
				End if 
			End if 
			$2->:=1
		: ($1=Table:C252(->[DIARY:12]))
			If (DB_GetModuleSettingByNUM(Module_DiaryManager)>0)
				ARRAY TEXT:C222($2->; 0)
				APPEND TO ARRAY:C911($2->; "History…")
				APPEND TO ARRAY:C911($2->; "Company")
				APPEND TO ARRAY:C911($2->; "Contact")
				
				If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
					APPEND TO ARRAY:C911($2->; "Job")
				End if 
				
				If ((DB_GetModuleSettingByNUM(Module_SalesOrders)>1) | (DB_GetModuleSettingByNUM(Module_Enquiries)>1))
					APPEND TO ARRAY:C911($2->; "Order")
				End if 
				
				If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
					APPEND TO ARRAY:C911($2->; "Call")
				End if 
				APPEND TO ARRAY:C911($2->; "Comp & Action")
				APPEND TO ARRAY:C911($2->; "Cont & Action")
				If (DB_GetModuleSettingByNUM(Module_JobCosting)>1)
					APPEND TO ARRAY:C911($2->; "Job & Action")
				End if 
				If ((DB_GetModuleSettingByNUM(Module_SalesOrders)>1) | (DB_GetModuleSettingByNUM(Module_Enquiries)>1))
					APPEND TO ARRAY:C911($2->; "Order & Act")
				End if 
				
				If (DB_GetModuleSettingByNUM(Module_ServiceCentre)>1)
					
					APPEND TO ARRAY:C911($2->; "Call & Action")
				End if 
				If (DB_GetModuleSettingByNUM(Module_WPManager)>1)
					APPEND TO ARRAY:C911($2->; "Document")
				End if 
				$2->:=1
				
				If (Count parameters:C259>=3)
					ARRAY TEXT:C222($3->; 8)
					$3->{1}:="Priority…"
					$3->{2}:="See 1"
					$3->{3}:="See 2"
					$3->{4}:="See 3"
					$3->{5}:="See To Do"
					$3->{6}:="See Done"
					$3->{7}:="See All"
					$3->{8}:="Set Priority"
					$3->:=1
				End if 
			End if 
		: ($1=Table:C252(->[JOBS:26]))  //THis is actually used in the diary time recording screen
			ARRAY TEXT:C222($2->; 2)
			$2->{1}:="Budget"
			$2->{2}:="Actual"
			$2->:=2
		: ($1=Table:C252(->[INVOICES:39]))
			ARRAY TEXT:C222($2->; 4)
			$2->{1}:="Date"
			$2->{2}:="State"
			$2->{3}:="Sales Person"
			$2->{4}:="Credit Stage"
			$2->:=2
	End case 
End if 
ERR_MethodTrackerReturn("DB_LoadDisplay"; $_t_oldMethodName)