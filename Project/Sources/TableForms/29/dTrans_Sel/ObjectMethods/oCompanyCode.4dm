If (False:C215)
	//object Name: [TRANSACTIONS]dTrans_Sel.Variable20
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
	C_LONGINT:C283($_l_ch1; ch1; cNAL)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].dTrans_Sel.Variable20"; Form event code:C388)
If (cNAL=0)
	$_l_ch1:=ch1
	Check_CompanyNC(->vCompCode; ->[CONTACTS:1]Contact_Code:2; ->[TRANSACTIONS:29])
	ch1:=$_l_ch1
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].dTrans_Sel.Variable20"; $_t_oldMethodName)
