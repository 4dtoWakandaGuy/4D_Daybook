//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Delimiters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen Delimiters")
vFld:=Char:C90(9)
vRec:=Char:C90(13)
ERR_MethodTrackerReturn("Gen Delimiters"; $_t_oldMethodName)