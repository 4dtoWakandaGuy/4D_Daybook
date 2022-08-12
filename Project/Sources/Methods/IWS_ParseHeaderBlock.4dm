//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_ParseHeaderBlock
	//------------------ Method Notes ------------------
	//Method: IWS_ParseHeaderBlock
	//
	//Purpose: Parses a text block containing name:value
	//pairs into a pair of arrays
	
	//$1, text, text block to parse
	//$2, pointer to array to contain names
	//$3, pointer to array to contain values
	
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(IWS_at_Headers;0)
	C_LONGINT:C283($_l_ColonPosition; $_l_Elements; $_l_Index; $_l_SizeofArray)
	C_POINTER:C301($_ptr_NamesArray; $_ptr_ValuesArray; $2; $3)
	C_TEXT:C284($_t_HeaderText; $_t_Line; $_t_Name; $_t_oldMethodName; $_t_Value; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_ParseHeaderBlock")

$_t_HeaderText:=$1
$_ptr_NamesArray:=$2
$_ptr_ValuesArray:=$3
//reduce the delimiter to one character to make it easier to parse
$_t_HeaderText:=Replace string:C233($_t_HeaderText; Char:C90(10); "")
STR_Text2Array($_t_HeaderText; ->IWS_at_Headers)
$_l_SizeofArray:=Size of array:C274(IWS_at_Headers)
//resize the target arrays
UTI_ArrayResize($_l_SizeofArray; $_ptr_NamesArray; $_ptr_ValuesArray)
$_l_Elements:=0
For ($_l_Index; 1; $_l_SizeofArray)
	$_t_Line:=IWS_at_Headers{$_l_Index}
	$_l_ColonPosition:=Position:C15(":"; $_t_Line)
	If ($_l_ColonPosition>0)
		$_t_Name:=STR_RemoveLeadTrailSpace(Substring:C12($_t_Line; 1; $_l_ColonPosition-1))
		$_t_Value:=STR_RemoveLeadTrailSpace(Substring:C12($_t_Line; $_l_ColonPosition+1))
		$_l_Elements:=$_l_Elements+1
		$_ptr_NamesArray->{$_l_Elements}:=$_t_Name
		$_ptr_ValuesArray->{$_l_Elements}:=$_t_Value
	End if 
End for 
If ($_l_Elements<$_l_SizeofArray)
	//if there were some malformed entries, we need to truncate to the real size
	UTI_ArrayResize($_l_Elements; $_ptr_NamesArray; $_ptr_ValuesArray)
End if 
//sort into name order to make it possible to use binary search
SORT ARRAY:C229($_ptr_NamesArray->; $_ptr_ValuesArray->)
ERR_MethodTrackerReturn("IWS_ParseHeaderBlock"; $_t_oldMethodName)