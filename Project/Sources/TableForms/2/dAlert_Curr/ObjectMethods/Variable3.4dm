If (False:C215)
	//object Name: [COMPANIES]dAlert_Curr.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>DB_at_CurrencyName;0)
	C_TEXT:C284($_t_oldMethodName; $_t_oldMethodName2; DB_t_CurrentFormUsage)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAlert_Curr.Variable3"; Form event code:C388)
If (<>DB_at_CurrencyName=0)
	<>DB_at_CurrencyName:=1
End if 
If (DB_t_CurrentFormUsage#"")
	$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+DB_t_CurrentFormUsage)
	EXECUTE FORMULA:C63(DB_t_CurrentFormUsage)
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAlert_Curr.Variable3"; $_t_oldMethodName)
