//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Trans ACLSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisCodeFrom; vAnalCodeT; ACC_t_CurrencyCode; vLayer)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans ACLSrc")
//DEFAULT TABLE([TRANSACTIONS])
CREATE SET:C116([TRANSACTIONS:29]; "Master")
Sel_SIString(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Analysis_Code:2; ACC_t_AnalysisCodeFrom; vAnalCodeT)
Sel_SCurr(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Currency_Code:22; ACC_t_CurrencyCode)
Sel_SLayer(->[TRANSACTIONS:29]; ->[TRANSACTIONS:29]Layer_Code:23; vLayer)
USE SET:C118("Master")
ERR_MethodTrackerReturn("Trans ACLSrc"; $_t_oldMethodName)