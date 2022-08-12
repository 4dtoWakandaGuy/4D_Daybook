If (False:C215)
	//object Name: [STOCK_MOVEMENTS]dMove Sel.Variable8
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
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].dMove Sel.Variable8"; Form event code:C388)
Sel_LPCompCode(->vCompCode; ->[STOCK_MOVEMENTS:40])
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].dMove Sel.Variable8"; $_t_oldMethodName)