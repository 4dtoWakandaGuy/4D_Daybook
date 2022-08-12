//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check_ContactNC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_ContactNC")
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage:="NC"
Check_Contact($1; $2; $3)
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Check_ContactNC"; $_t_oldMethodName)