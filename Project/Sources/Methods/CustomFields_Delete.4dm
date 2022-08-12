//%attributes = {}
If (False:C215)
	//Project Method Name:      CustomFields_Delete
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
	//ARRAY LONGINT(<>SYS_al_TableUniqueField;0)
	C_LONGINT:C283($_l_TableNumber)
	C_POINTER:C301($_ptr_Field; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_TableNumberString; $_t_UniqueCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CustomFields_Delete")
//CustomFields_Delete - associted with deletions from other files

$_l_TableNumber:=Table:C252($1)
If (<>SYS_al_TableUniqueField{$_l_TableNumber}#0)
	$_ptr_Field:=Field:C253($_l_TableNumber; <>SYS_al_TableUniqueField{$_l_TableNumber})
	$_t_TableNumberString:=STR_LeadZeros(String:C10($_l_TableNumber); 3)
	If (Type:C295($_ptr_Field->)=9)
		$_t_UniqueCode:=$_t_TableNumberString+String:C10($_ptr_Field->)
	Else 
		$_t_UniqueCode:=$_t_TableNumberString+$_ptr_Field->
	End if 
	
	READ WRITE:C146([CUSTOM_FIELDS:98])
	QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]Unique_Code:2=$_t_UniqueCode)
	DELETE SELECTION:C66([CUSTOM_FIELDS:98])
	READ ONLY:C145([CUSTOM_FIELDS:98])
End if 
ERR_MethodTrackerReturn("CustomFields_Delete"; $_t_oldMethodName)