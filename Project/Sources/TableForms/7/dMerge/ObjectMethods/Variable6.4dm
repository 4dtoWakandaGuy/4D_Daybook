If (False:C215)
	//object Name: [DOCUMENTS]dMerge.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 08:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vO)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dMerge.Variable6"; Form event code:C388)

vO:=1
Cont_SelP

If (OK=1)
	Letters_SWMerA1
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dMerge.Variable6"; $_t_oldMethodName)
