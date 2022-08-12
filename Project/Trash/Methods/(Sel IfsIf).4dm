//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel IfsIf
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

$_t_oldMethodName:=ERR_MethodTracker("Sel IfsIf")
Sel_SIString(->[COMPANIES:2]; ->[COMPANIES:2]Company_Name:2; ""; "")
Sel_SINum(->[COMPANIES:2]; ->[COMPANIES:2]Size:15; 0; 0)
ERR_MethodTrackerReturn("Sel IfsIf"; $_t_oldMethodName)