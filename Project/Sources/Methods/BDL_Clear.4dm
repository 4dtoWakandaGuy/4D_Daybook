//%attributes = {}
If (False:C215)
	//Project Method Name:      BDL_Clear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $BlobBdlPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BDL_Clear")
//LOG_SetMethod ("BDL_Clear")
//******************************************************************************
//
//Method: BDL_Clear
//
//Written by  John Moore on 10/25/98
//
//Purpose: Clears a BLOb bundle
//
//$1 - pointer to a BLOb bundle
//
//Copyright 1998 Modulus Software, Inc.

//
//******************************************************************************
$BlobBdlPtr:=$1
BDL_InitBdl($BlobBdlPtr)

//LOG_ResetMethod
ERR_MethodTrackerReturn("BDL_Clear"; $_t_oldMethodName)
