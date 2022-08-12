//%attributes = {}
If (False:C215)
	//Project Method Name:      POFindFF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/11/2010 18:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_BOOLEAN:C305($_bo_Coded)
	C_LONGINT:C283($_l_TableNumber; $_l_TablePosition)
	C_POINTER:C301($_ptr_Field; $1)
	C_TEXT:C284($_t_CodeUsage; $_t_oldMethodName; $_t_TableNumAsString; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("POFindFF")
Load_Fields

If (Count parameters:C259>=1)
	//this code is only for use where ther is a single FF
	// it does not load the value into any array it simply finds the record
	$_l_TableNumber:=Table:C252($1)
	$_l_TablePosition:=Find in array:C230(<>DB_al_TableNums; $_l_TableNumber)
	If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
		$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
		$_t_TableNumAsString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
		
		If (Type:C295($_ptr_Field->)=9)
			$_t_CodeUsage:=String:C10($_ptr_Field->)
			$_bo_Coded:=($_t_CodeUsage#"0")
		Else 
			$_t_CodeUsage:=$_ptr_Field->
			$_bo_Coded:=($_t_CodeUsage#"")
		End if 
		DB_t_CurrentFormUsage:=$_t_TableNumAsString+$_t_CodeUsage
		
		QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=DB_t_CurrentFormUsage)
	End if 
End if 
ERR_MethodTrackerReturn("POFindFF"; $_t_oldMethodName)
