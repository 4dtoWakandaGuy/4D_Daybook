//%attributes = {}
If (False:C215)
	//Project Method Name:      UTI_FieldPointerFromString
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
	//ARRAY LONGINT(<>SYS_al_2DFieldNumbers;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	C_LONGINT:C283($_l_CharPosition; $_l_FIeldsIndex; $_l_FIeldsNumber; $_l_TableIndex; $_l_TableNumber)
	C_POINTER:C301($_ptr_FIeld; $0)
	C_TEXT:C284($_t_FieldName; $_t_oldMethodName; $_t_TableFIeldName; $_t_TableName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UTI_FieldPointerFromString")
//UTI_FieldPointerFromString
//Rollo 24/6/2004

//Return a pointer to a field based on "[TABLE]Field Name" input
Load_Fields

If (Count parameters:C259>=1)
	$_t_TableFIeldName:=$1
	
	If ($_t_TableFIeldName="[@")
		
		$_l_CharPosition:=Position:C15("]"; $_t_TableFIeldName)
		
		If ($_l_CharPosition>0)
			
			$_t_TableName:=Substring:C12($_t_TableFIeldName; 2; $_l_CharPosition-2)
			$_t_FieldName:=Substring:C12($_t_TableFIeldName; $_l_CharPosition+1)
			
			$_l_TableIndex:=DB_GetTableNumFromNameString($_t_TableName)
			
			If ($_l_TableIndex>0)
				
				$_l_TableNumber:=<>DB_al_TableNums{$_l_TableIndex}
				
				If ($_l_TableNumber>0)
					
					$_l_FIeldsIndex:=Find in array:C230(<>SYS_at_2DFieldNames{$_l_TableIndex}; $_t_FieldName)
					
					If ($_l_FIeldsIndex>0)
						
						$_l_FIeldsNumber:=<>SYS_al_2DFieldNumbers{$_l_TableIndex}{$_l_FIeldsIndex}
						
						If ($_l_FIeldsNumber>0)
							
							$_ptr_FIeld:=Field:C253($_l_TableNumber; $_l_FIeldsNumber)
							
						End if 
						
					End if 
					
				End if 
				
			End if 
			
		End if 
	Else 
		
	End if 
Else 
	Gen_Alert("UTI FIeldPointerfromString called with no parameters")
End if 
$0:=$_ptr_FIeld
ERR_MethodTrackerReturn("UTI_FieldPointerFromString"; $_t_oldMethodName)
