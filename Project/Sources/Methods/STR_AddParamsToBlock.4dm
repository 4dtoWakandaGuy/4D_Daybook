//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_AddParamsToBlock
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
	C_LONGINT:C283($i; $iParameters)
	C_POINTER:C301($1; $BlockPtr)
	C_TEXT:C284(<>STR_s_TAB; $_t_oldMethodName; $Delimiter)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_AddParamsToBlock")
//******************************************************************************
//
//Method: STR_AddParamsToBlock
//
//Written by  John on 17/09/98
//
//Purpose:  Ancillary to STR_ParamBlock, useful for adding lots of values. Allows
//one to add bunches at a time with each call
//
//$1 - pointer to text block
//$ 2...$n - texts to add

//******************************************************************************


$iParameters:=Count parameters:C259  // Axel 07/19/2000

$BlockPtr:=$1
$Delimiter:=<>STR_s_TAB
If ($BlockPtr->#"")
	$BlockPtr->:=$BlockPtr->+$Delimiter
End if 
For ($i; 2; $iParameters)
	$BlockPtr->:=$BlockPtr->+${$i}
	If ($i<$iParameters)
		$BlockPtr->:=$BlockPtr->+$Delimiter
	End if 
End for 
ERR_MethodTrackerReturn("STR_AddParamsToBlock"; $_t_oldMethodName)