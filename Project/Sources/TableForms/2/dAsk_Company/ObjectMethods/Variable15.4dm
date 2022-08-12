If (False:C215)
	//object Name: [COMPANIES]dAsk_Company.Variable15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Company.Variable15"; Form event code:C388)
vCompCode:=GEN_at_RecordCode{GEN_at_Identity}
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Company.Variable15"; $_t_oldMethodName)