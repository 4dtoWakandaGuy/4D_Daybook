//%attributes = {}

If (False:C215)
	//Project Method Name:      ZYear_Close
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
$_t_oldMethodName:=ERR_MethodTracker("ZYear_Close")
ZProc("Year_Close2"; DB_ProcessMemoryinit(4); "Close Year")
ERR_MethodTrackerReturn("ZYear_Close"; $_t_oldMethodName)
