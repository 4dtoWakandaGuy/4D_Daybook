//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImOverCh
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
	C_BOOLEAN:C305(<>RemOver)
	C_TEXT:C284($_t_oldMethodName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImOverCh")

If (($1<[PERSONNEL:11]Last_Import:12) | (([PERSONNEL:11]Last_Import:12="") & ($1<vCompCode)) | ((<>RemOver) & (DB_t_CurrentFormUsage2="Rem")) | ((<>RemOver=False:C215) & (DB_t_CurrentFormUsage2="Main")))
	OK:=1
Else 
	OK:=0
End if 
ERR_MethodTrackerReturn("Remote ImOverCh"; $_t_oldMethodName)