//%attributes = {}
If (False:C215)
	//Project Method Name:      CheckModBynumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2010 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(DB_aI_aMod;0)
	C_BOOLEAN:C305(DB_bo_ModuleSettingsinited)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $2; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CheckModBynumber")

Check_Modules


//Check_Modules

If (DB_aI_aMod{$1}<2)
	If (DB_t_CurrentFormUsage3="NoCheck")  //from Menu_ModBar2
		OK:=1  //needed cos otherwise Change Access can clears the ◊aMods too early
	Else 
		Gen_Alert("You do not have access to the "+$2+" module."; "Cancel")
		OK:=0
	End if 
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("CheckModBynumber"; $_t_oldMethodName)