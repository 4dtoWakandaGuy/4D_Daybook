//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_ParamBlock
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
	C_LONGINT:C283($i)
	C_TEXT:C284(<>STR_s_TAB; $_t_oldMethodName; $0; $Delimiter)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_ParamBlock")
//******************************************************************************
//
//Method: STR_ParamBlock
//
//Written by  John on 17/09/98
//
//Purpose: Bundles number of strings into a text block using
//standard delimiter. STR_Param can then retrieve numbered
//parameters (fields)
//$1-$n  - text
//$0 - text -text block

//******************************************************************************
If (Count parameters:C259>0)
	$Delimiter:=<>STR_s_TAB
	$0:=""
	For ($i; 1; Count parameters:C259)
		$0:=$0+${$i}
		If ($i<Count parameters:C259)
			$0:=$0+$Delimiter
		End if 
	End for 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("STR_ParamBlock"; $_t_oldMethodName)