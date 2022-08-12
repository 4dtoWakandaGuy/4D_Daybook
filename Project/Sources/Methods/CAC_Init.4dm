//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_Init
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
	C_LONGINT:C283(<>CAC_l_TimeOut)
	C_TEXT:C284(<>CAC_s_CacheNullCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_Init")
// CAC_Init
// Created on 10/10/99 by Larry

Compiler_CAC_IA

<>CAC_s_CacheNullCode:=""  //Null value for finding empty location in cache array index
<>CAC_l_TimeOut:=60

// End CAC_Init
ERR_MethodTrackerReturn("CAC_Init"; $_t_oldMethodName)
