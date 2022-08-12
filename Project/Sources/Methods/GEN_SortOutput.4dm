//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_SortOutput
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_FieldIndexed; $_bo_Swap; $2)
	C_LONGINT:C283($_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_TableNumber; FS_l_SortDirection; FS_l_SortFieldNUM)
	C_POINTER:C301($1; $3)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_VariableName; FS_t_SortVariableName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_SortOutput")
//NG March 2004
//this method is to replace the current 'sort' scripts on the buttons on output forms
// for this method to work properly The text associated with the field should be named in the following way
//oOFL{field name} eg oOFLAccount Code (OFL=Output field label)
If (Count parameters:C259>=2)
	$_bo_Swap:=$2
Else 
	$_bo_Swap:=True:C214
End if 
If (Count parameters:C259>=1)
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	If ($_l_TableNumber>0)
		GET FIELD PROPERTIES:C258($1; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed)
		$_t_FieldName:=Field name:C257($_l_TableNumber; $_l_FieldNumber)
	Else 
		$_l_TableNumber:=Table:C252($3)
		$_bo_FieldIndexed:=True:C214
		$_t_FieldName:=$_t_VariableName
	End if 
Else 
	
End if 

If (Records in selection:C76(Table:C252($_l_TableNumber)->)>1000) & (Not:C34($_bo_FieldIndexed))
	If ($_bo_Swap)  //if swap is false we are loading the form so dont ask!!
		Gen_Confirm("This field is not indexed, sorting make take some time."; "Continue"; "Cancel")
		If (OK=1)
			$_bo_Continue:=True:C214
		Else 
			$_bo_Continue:=False:C215
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	
Else 
	$_bo_Continue:=True:C214
End if 
//FS_l_SortDirection is the sort order!!
If ($_bo_Swap)
	If ($_l_FieldNumber>0)
		If (FS_l_SortFieldNUM=$_l_FieldNumber)
			//field has not been swapped -dont swap order
			FS_l_SortDirection:=Abs:C99(FS_l_SortDirection-1)
		Else 
			FS_l_SortFieldNUM:=$_l_FieldNumber
			FS_t_SortVariableName:=""
		End if 
	Else 
		If (FS_t_SortVariableName=$_t_VariableName)
			FS_l_SortDirection:=Abs:C99(FS_l_SortDirection-1)
		Else 
			FS_l_SortFieldNUM:=0
			FS_t_SortVariableName:=$_t_VariableName
		End if 
		
	End if 
End if 

OBJECT SET FONT STYLE:C166(*; "oOFL"+"@"; Plain:K14:1)
OBJECT SET FONT STYLE:C166(*; "oOFL"+$_t_FieldName; Bold:K14:2+Underline:K14:4)
If ($_l_FieldNumber>0)
	Case of 
		: (FS_l_SortDirection=1)
			OBJECT SET VISIBLE:C603(*; "oOFLupArrow"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOFLdownArrow"; False:C215)
			ORDER BY:C49(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->; <)
		: (FS_l_SortDirection=0)
			OBJECT SET VISIBLE:C603(*; "oOFLDownArrow"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOFLUpArrow"; False:C215)
			ORDER BY:C49(Table:C252($_l_TableNumber)->; Field:C253($_l_TableNumber; $_l_FieldNumber)->; >)
	End case 
Else 
	Case of 
		: (FS_l_SortDirection=1)
			OBJECT SET VISIBLE:C603(*; "oOFLupArrow"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOFLdownArrow"; False:C215)
			ORDER BY FORMULA:C300(Table:C252($_l_TableNumber)->; $_t_VariableName; <)
			
		: (FS_l_SortDirection=0)
			OBJECT SET VISIBLE:C603(*; "oOFLDownArrow"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOFLUpArrow"; False:C215)
			ORDER BY FORMULA:C300(Table:C252($_l_TableNumber)->; $_t_VariableName; >)
			
	End case 
End if 
ERR_MethodTrackerReturn("GEN_SortOutput"; $_t_oldMethodName)