//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Sel LPCurrLay
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 16:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode; vLayer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel LPCurrLay")
If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
	OBJECT SET ENTERABLE:C238(ACC_t_CurrencyCode; False:C215)
End if 
If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
	OBJECT SET ENTERABLE:C238(vLayer; False:C215)
End if 
ERR_MethodTrackerReturn("Sel LPCurrLay"; $_t_oldMethodName)
