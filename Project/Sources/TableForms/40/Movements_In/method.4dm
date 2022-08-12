If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENTS]Movements_in
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENTS].Movements_in"; Form event code:C388)
$_l_event:=Form event code:C388
Move_InLP($_l_event)
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENTS].Movements_in"; $_t_oldMethodName)