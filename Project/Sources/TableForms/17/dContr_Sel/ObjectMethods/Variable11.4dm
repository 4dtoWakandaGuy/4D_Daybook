If (False:C215)
	//object Name: [CONTRACTS]dContr_Sel.Variable11
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
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].dContr_Sel.Variable11"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vType; ""; ->[CONTRACT_TYPES:19]; ->[CONTRACT_TYPES:19]Contract_Type_Code:1; ->[CONTRACT_TYPES:19]Contract_Type_Name:2; "Type")
End if 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].dContr_Sel.Variable11"; $_t_oldMethodName)
