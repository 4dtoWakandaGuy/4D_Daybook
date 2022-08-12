If (False:C215)
	//object Name: [WEBSETUP_4D]WebTest_d.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebTest_d.Variable6"; Form event code:C388)

If (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	Self:C308->:=30
End if 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebTest_d.Variable6"; $_t_oldMethodName)
