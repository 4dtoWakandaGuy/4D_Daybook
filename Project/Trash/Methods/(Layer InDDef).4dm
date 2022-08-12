//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Layer InDDef
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
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Layer InDDef")
If ([COMPANIES:2]Default_Layer:51#"")
	$1->:=[COMPANIES:2]Default_Layer:51
Else 
	$1->:=""
	Layer_Fill($1)
End if 
ERR_MethodTrackerReturn("Layer InDDef"; $_t_oldMethodName)