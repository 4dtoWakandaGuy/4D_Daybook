//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_DelSubentity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2011 16:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_lb_RelatedData;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	C_BOOLEAN:C305($_bo_Coded; PROD_bo_AddSupplier)
	C_LONGINT:C283($_l_ColumnNumber; $_l_Row; $_l_TableNumber; $_l_TablePosition)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284($_t_CodeUsage; $_t_FieldName; $_t_oldMethodName; $_t_TableNumAsString; $_t_UniqueCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_DelSubentity")
Case of 
	: ($1="Supplier")
		//KMW NOTE: 11/11/08 v631b120f - The following code could do with a...
		//... call to an as yet non-existent method called "LBi_FindLinesSub" (for...
		//... selecting mutliple subrecords)...could possibly be implemented using...
		//... "query sub records" command. The issue is is that currently the following...
		//...code removes the array lines but only actually deletes the first sub record.
		If (PROD_bo_AddSupplier)
			DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
		End if 
		READ WRITE:C146([PRODUCTS_SUPPLIERS:148])
		If (LBi_FindLine(->PRD_aPtr_RelatedConfiguration))
			DELETE RECORD:C58([PRODUCTS_SUPPLIERS:148])
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
			LBi_Xminuses(->PRD_aPtr_RelatedConfiguration)
		End if 
	: ($1="Stock")
	: ($1="Price")
	: ($1="FurtherField")
		//TRACE
		
		LISTBOX GET CELL POSITION:C971(PRD_lb_RelatedData; $_l_ColumnNumber; $_l_Row)
		If ($_l_Row>0)
			$_t_FieldName:=FUR_at_CustomFieldNames{$_l_Row}
			$_l_TableNumber:=Table:C252(->[PRODUCTS:9])
			$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
			$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
			$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
			If (Type:C295($_ptr_Field->)=9)
				$_t_CodeUsage:=String:C10($_ptr_Field->)
				$_bo_Coded:=($_t_CodeUsage#"0")
			Else 
				$_t_CodeUsage:=$_ptr_Field->
				$_bo_Coded:=($_t_CodeUsage#"")
			End if 
			//$_bo_Coded:=TRUE
			//TRACE
			If ($_bo_Coded) | (True:C214)
				$_t_UniqueCode:=$_t_TableNumAsString+$_t_CodeUsage
			End if 
		End if 
		READ WRITE:C146([CUSTOM_FIELDS:98])
		QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_UniqueCode; *)
		QUERY:C277([CUSTOM_FIELDS:98];  & ; [CUSTOM_FIELDS:98]Field_Name:3=FUR_at_CustomFieldNames{$_l_Row})
		APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Deleted:8:=1)
		CUS_at_DisplayedData{$_l_Row}:=""
		
		
	: ($1="FurthAnal")
		PROD_DelSubEntityAnalyses
		
	: ($1="Component")
		PROD_DelSubEntityComponents
		
End case 
ERR_MethodTrackerReturn("Products_DelSubentity"; $_t_oldMethodName)
