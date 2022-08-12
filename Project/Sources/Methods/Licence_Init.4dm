//%attributes = {}

If (False:C215)
	//Project Method Name:      Licence_Init
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_Init")

//NG Modified September 2009 to use an inited boolean so not acessing resource more than once
$_t_oldMethodName:=ERR_MethodTracker("Licence_Init")
If (False:C215)
	
End if 
ERR_MethodTrackerReturn("Licence_Init"; $_t_oldMethodName)