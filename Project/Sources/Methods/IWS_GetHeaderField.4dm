//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetHeaderField
	//------------------ Method Notes ------------------
	//Method: IWS_GetHeaderField
	//
	//Written by  John on 09/11/98
	//rewritten John 5/30/2000
	
	//Purpose: Returns content of field in HTTP header
	//
	//$1 - string, 30, name of field
	//$2 - text to search in - uses IWS_t_Request if omitted
	//$0 - text, contents of field
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(IWS_at_HeaderNames;0)
	//ARRAY TEXT(IWS_at_HeaderValues;0)
	C_LONGINT:C283($_l_EndPosition; $_l_HeaderRow; $_l_Position; $_l_StartPosition)
	C_TEXT:C284(<>STR_t_CRLF; $_t_Block; $_t_oldMethodName; $_t_Source; $_t_Value; $0; $1; $2; IWS_t_HeaderName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetHeaderField")
IWS_t_HeaderName:=$1
$_t_Value:=""
If (Count parameters:C259>1)
	//we're passing in some source other than the header , so we use the
	//string search method
	$_t_Source:=$2
	$_l_Position:=Position:C15((IWS_t_HeaderName+":"); $_t_Source)
	
	If ($_l_Position>0)
		$_l_StartPosition:=$_l_Position+Length:C16(IWS_t_HeaderName)+2  //first letter after colon and space
		$_t_Block:=Substring:C12($_t_Source; $_l_StartPosition)
		$_l_EndPosition:=Position:C15(<>STR_t_CRLF; $_t_Block)-1
		$_t_Value:=Substring:C12($_t_Block; 1; $_l_EndPosition)
	End if 
Else 
	//otherwise we can use the optimised binary search
	$_l_HeaderRow:=UTI_ArraySearch(->IWS_at_HeaderNames; ->IWS_t_HeaderName)
	If ($_l_HeaderRow>0)
		$_t_Value:=IWS_at_HeaderValues{$_l_HeaderRow}
	End if 
End if 
$0:=$_t_Value

//LOG_ResetMethod
ERR_MethodTrackerReturn("IWS_GetHeaderField"; $_t_oldMethodName)