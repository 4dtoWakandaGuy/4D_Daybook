//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_GetMIMEParameter
	//------------------ Method Notes ------------------
	//******************************************************************************
	//
	//Method: IWS_GetMIMEParameter
	//
	//Written by  John
	//
	//Purpose: Returns value in attrubute field from MIME content type, disposition et
	//
	//$1 - text to look in
	//$2 - parameter to look for
	//
	//******************************************************************************
	
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_StartPosition; $_l_StringPosition; $_t_EndPosition)
	C_TEXT:C284(<>STR_t_DoubleQuote; $_t_FieldName; $_t_oldMethodName; $_t_Parameter; $_t_SearchString; $_t_Text; $_t_Value; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_GetMIMEParameter")


$_t_FieldName:=$1
$_t_Parameter:=$2
$_t_Value:=""
$_t_SearchString:=$_t_Parameter+"="
$_l_StringPosition:=Position:C15($_t_SearchString; $_t_FieldName)
If ($_l_StringPosition>0)
	$_l_StartPosition:=$_l_StringPosition+Length:C16($_t_SearchString)
	$_t_Text:=Substring:C12($_t_FieldName; $_l_StartPosition)
	$_t_EndPosition:=Position:C15(";"; $_t_Text)
	If ($_t_EndPosition>0)
		$_t_Value:=Substring:C12($_t_Text; 1; $_t_EndPosition-1)
	Else 
		$_t_Value:=$_t_Text
	End if 
End if 

If ($_t_Value=(<>STR_t_DoubleQuote+"@"+<>STR_t_DoubleQuote))  //it was in quotes
	$_t_Value:=STR_RemQuote($_t_Value)
End if 

$0:=$_t_Value
ERR_MethodTrackerReturn("IWS_GetMIMEParameter"; $_t_oldMethodName)