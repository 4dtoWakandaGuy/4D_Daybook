//%attributes = {}
If (False:C215)
	//Project Method Name:      ValidateMovement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2012 06:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_inTransaction; $3; STK_bo_inTransaction)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("ValidateMovement")

READ WRITE:C146([STOCK_MOVEMENTS:40])
READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])


If (Count parameters:C259>=1)
	If (Count parameters:C259>=3)
		$_bo_inTransaction:=$3
		If ($_bo_inTransaction)
			Repeat 
				GET PROCESS VARIABLE:C371($2; STK_bo_inTransaction; $_bo_inTransaction)
				If ($_bo_inTransaction)
					DelayTicks(2)
				End if 
			Until ($_bo_inTransaction=False:C215)
			
		End if 
		
	End if 
	
	QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$1)
	While (Not:C34(Check_Locked(->[STOCK_MOVEMENTS:40]; 0)))
		DelayTicks(10)
	End while 
	DB_SaveRecord(->[STOCK_MOVEMENTS:40])
	
End if 
//Gen_Alert ("post processing Done")
ERR_MethodTrackerReturn("ValidateMovement"; $_t_oldMethodName)
