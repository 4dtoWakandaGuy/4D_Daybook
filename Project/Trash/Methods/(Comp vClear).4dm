//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp vClear
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vCompName; vCompNameAndTel; vContName; vExtn; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp vClear")
vCompName:=""
vTel:=""
vCompNameAndTel:=""  //added 16/01/07 - kmw
vContName:=""
vExtn:=""
ERR_MethodTrackerReturn("Comp vClear"; $_t_oldMethodName)