//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Minor Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 12:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(xNext)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor Sel")
//Minor Sel
$_t_Search:=Gen_Search("Code or Name to Find:"; ""; "Find")  //$2 = •None for no More Choices
If (OK=1)
	If (xNext=0)
		Minor_Sel2($_t_Search; $1; $2; $3)
	Else 
		Minor_SelP($1; $2; $3)
	End if 
End if 
ERR_MethodTrackerReturn("Minor Sel"; $_t_oldMethodName)