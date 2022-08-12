If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Pop-up%2FDrop-down List2
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
	//ARRAY TEXT(SP_at_PlusorMinus;0)
	C_TEXT:C284($_t_oldMethodName; SP_t_AFPlusMinus; SP_t_FPlusMinus)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Pop-up/Drop-down List2"; Form event code:C388)
If (SP_at_PlusorMinus>0)
	SP_t_AFPlusMinus:=SP_at_PlusorMinus{SP_at_PlusorMinus}
	If (SP_at_PlusorMinus=1)
		SP_t_FPlusMinus:="+"
	Else 
		SP_t_FPlusMinus:="-"
	End if 
	
End if 
SP_at_PlusorMinus:=0
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Pop-up/Drop-down List2"; $_t_oldMethodName)