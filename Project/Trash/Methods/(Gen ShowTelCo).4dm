//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_ShowTelCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_ShowTelCo")
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage2
DB_t_CurrentFormUsage2:="Comp"
Gen_ShowTel
DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Gen_ShowTelCo"; $_t_oldMethodName)