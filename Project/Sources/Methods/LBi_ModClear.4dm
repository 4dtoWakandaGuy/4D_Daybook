//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ModClear
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
	C_LONGINT:C283($1; $2; bd35)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ModClear")

//NG 19/7/06 this method is a replacement for ALmodClear-that method may only have been used in call backs
//This method was only used to clear the FLAG which indicated the call back had already been called.(bd35) it is unlikely that we will be using this method.
//only created for completness

$_t_oldMethodName:=ERR_MethodTracker("LBi_ModClear")
//this is called as the 'Arriving in field' callback
bd35:=0  //this variable is used to ensure that the 'modified' callback only gets done once
ERR_MethodTrackerReturn("LBi_ModClear"; $_t_oldMethodName)