If (False:C215)
	//object Method Name: Object Name:      [USER].ACC_BalanceCheck.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_AllLayers)
	C_TEXT:C284($_t_oldMethodName; ACC_t_LayerStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_BalanceCheck.Variable6"; Form event code:C388)

Check_MinorNC(->ACC_t_LayerStart; ""; ->[LAYERS:76]; ->[LAYERS:76]Layer_Code:1; ->[LAYERS:76]Layer_Name:2; "Layer")  //6
If (ACC_t_LayerStart#"")
	ACC_l_AllLayers:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_BalanceCheck.Variable6"; $_t_oldMethodName)
