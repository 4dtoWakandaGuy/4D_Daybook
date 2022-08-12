//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont Details2
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
	C_TEXT:C284($_t_oldMethodName; vContName; vJobTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont Details2")
//Cont Details2
vContName:=""
If ([CONTACTS:1]Contact_Code:2#"")
	vContName:=vContName+[CONTACTS:1]Contact_Code:2+" "
End if 
If ([CONTACTS:1]Title:3#"")
	vContName:=vContName+Substring:C12([CONTACTS:1]Title:3; 1; 1)+". "
End if 
vContName:=vContName+[CONTACTS:1]Forename:4
vJobTitle:=[CONTACTS:1]Job_Title:6
ERR_MethodTrackerReturn("Cont Details2"; $_t_oldMethodName)