//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DBLookupQuery
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharPosition)
	C_POINTER:C301($_ptr_LookupCodeFIeld; $_ptr_LookupFieldFIeld; $_ptr_LookupTable; $_ptr_QueryField; $2)
	C_TEXT:C284($_t_Data; $_t_LookupCodeFIeld; $_t_LookupFieldFIeld; $_t_oldMethodName; $_t_Related; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DBLookupQuery")
//IME_DBLookupQuery
//Rollo 15/10/2004

//Kind of equivalent to IME_RelateOne
//returns the related value (eg name) used in a web lookup

//$1 eg:
//Data=[SERVICE CALLS]Company Code;Lookup=[COMPANIES]Company Code/[COMPANIES]Company Name


$_t_Data:=$1
$_ptr_QueryField:=$2

$_t_Related:=""

If ($_ptr_QueryField->#"")
	
	$_l_CharPosition:=Position:C15("="; $_t_Data)
	If ($_l_CharPosition>0)
		
		$_t_Data:=Substring:C12($_t_Data; $_l_CharPosition+1)
		$_l_CharPosition:=Position:C15("/"; $_t_Data)
		
		If ($_l_CharPosition>0)
			
			$_t_LookupCodeFIeld:=Substring:C12($_t_Data; 1; $_l_CharPosition-1)
			$_t_LookupFieldFIeld:=Substring:C12($_t_Data; $_l_CharPosition+1)
			
			If (($_t_LookupCodeFIeld#"") & ($_t_LookupFieldFIeld#""))
				
				$_ptr_LookupCodeFIeld:=UTI_FieldPointerFromString($_t_LookupCodeFIeld)
				$_ptr_LookupFieldFIeld:=UTI_FieldPointerFromString($_t_LookupFieldFIeld)
				
				If ((Not:C34(Is nil pointer:C315($_ptr_LookupCodeFIeld))) & (Not:C34(Is nil pointer:C315($_ptr_LookupFieldFIeld))))
					
					$_l_CharPosition:=Position:C15("]"; $_t_LookupCodeFIeld)
					
					If ($_l_CharPosition>0)
						
						$_ptr_LookupTable:=UTI_TablePointerFromString(Substring:C12($_t_LookupCodeFIeld; 1; $_l_CharPosition))
						
						If (Not:C34(Is nil pointer:C315($_ptr_LookupTable)))
							
							QUERY:C277($_ptr_LookupTable->; $_ptr_LookupCodeFIeld->=$_ptr_QueryField->)
							
							$_t_Related:=$_ptr_LookupFieldFIeld->
							
						End if 
						
					End if 
					
				End if 
				
			End if 
			
		End if 
		
	End if 
	
End if 

$0:=$_t_Related
ERR_MethodTrackerReturn("IME_DBLookupQuery"; $_t_oldMethodName)