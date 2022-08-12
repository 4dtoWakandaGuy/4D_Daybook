//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements OutDe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements OutDe")
If (Records in set:C195("Userset")>0)
	Are_You_Sure
	If (OK=1)
		CREATE SET:C116([STOCK_MOVEMENTS:40]; "Master")
		USE SET:C118("Userset")
		FIRST RECORD:C50([STOCK_MOVEMENTS:40])
		While (Not:C34(End selection:C36([STOCK_MOVEMENTS:40])))
			RELATE MANY:C262([STOCK_MOVEMENTS:40]Movement_Code:1)
			DELETE SELECTION:C66([STOCK_MOVEMENT_ITEMS:27])
			NEXT RECORD:C51([STOCK_MOVEMENTS:40])
		End while 
		DELETE SELECTION:C66([STOCK_MOVEMENTS:40])
		USE SET:C118("Master")
		Gen_OutNoF(->[STOCK_MOVEMENTS:40])
	End if 
End if 
ERR_MethodTrackerReturn("Movements OutDe"; $_t_oldMethodName)