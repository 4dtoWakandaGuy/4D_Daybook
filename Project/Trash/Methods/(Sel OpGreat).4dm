//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel OpGreat
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel OpGreat")
Menu_Record("Sel OpGreat"; "Greater than")
Sel_OpGen(">")
ERR_MethodTrackerReturn("Sel OpGreat"; $_t_oldMethodName)