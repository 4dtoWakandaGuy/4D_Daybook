//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Move_InTypeChk
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_InTypeChk")
$0:=""
If ([MOVEMENT_TYPES:60]Stock_Plus:3#"")
	RELATE ONE:C42([MOVEMENT_TYPES:60]Stock_Plus:3)
	If (Records in selection:C76([STOCK_TYPES:59])=0)
		$0:=[MOVEMENT_TYPES:60]Stock_Plus:3
	End if 
End if 
If ([MOVEMENT_TYPES:60]Stock_Minus:4#"")
	RELATE ONE:C42([MOVEMENT_TYPES:60]Stock_Minus:4)
	If (Records in selection:C76([STOCK_TYPES:59])=0)
		$0:=[MOVEMENT_TYPES:60]Stock_Minus:4
	End if 
End if 
ERR_MethodTrackerReturn("Move_InTypeChk"; $_t_oldMethodName)