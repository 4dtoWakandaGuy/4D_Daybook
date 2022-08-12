//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_LPCurrLay
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
	C_TEXT:C284($_t_CurrencyObject; $_t_LayersObject; $_t_oldMethodName; $1; $2; ACC_t_CurrencyCode; vLayer)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_LPCurrLay")
If (Count parameters:C259>=2)
	$_t_CurrencyObject:=$1
	$_t_LayersObject:=$2
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
		OBJECT SET ENTERABLE:C238(*; $_t_CurrencyObject; False:C215)
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
		OBJECT SET ENTERABLE:C238(*; $_t_LayersObject; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("Sel_LPCurrLay"; $_t_oldMethodName)
