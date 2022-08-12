If (False:C215)
	//Project Form Method Name: STK_LogShowOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2011 08:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; STK_i_ShowLegend; STK_i_ShowMovement; STK_i_ShowNothing; STK_i_ShowPrevious; STK_l_PreviousID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM STK_LogShowOptions"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1)
		STK_i_ShowNothing:=1
		STK_i_ShowPrevious:=0
		STK_i_ShowLegend:=0
		STK_i_ShowMovement:=0
		OBJECT SET VISIBLE:C603(*; "oRBShowPrevious3"; False:C215)
		If (STK_l_PreviousID=0)
			OBJECT SET VISIBLE:C603(*; "oRBShowPrevious"; False:C215)
		End if 
End case 
ERR_MethodTrackerReturn("FM STK_LogShowOptions"; $_t_oldMethodName)
