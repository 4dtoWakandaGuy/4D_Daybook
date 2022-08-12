If (False:C215)
	//object Name: [WEBSETUP_4D]WebLog.Variable20
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
	C_LONGINT:C283(GEN_l_RULER2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebLog.Variable20"; Form event code:C388)
Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		Self:C308->:=12
		GEN_l_RULER2:=8
		
	: (Form event code:C388=On Data Change:K2:15)
		GEN_l_RULER2:=Self:C308->
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebLog.Variable20"; $_t_oldMethodName)
