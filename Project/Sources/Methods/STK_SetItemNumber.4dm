//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SetItemNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   02/02/2012 23:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Delay; $_l_Repeats; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SetItemNumber")
//this method is called as a process when createing an ISO from a PO movement need to take the item id off(sales order item number)-.

If (Count parameters:C259>=1)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
	$_l_Repeats:=0
	$_l_Delay:=2
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 1)
		If (Not:C34($_bo_OK))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_Delay)
		End if 
	Until ($_bo_OK=True:C214)
	[STOCK_MOVEMENT_ITEMS:27]Item_Number:8:=0
	[STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24:=0
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
End if 
ERR_MethodTrackerReturn("STK_SetItemNumber"; $_t_oldMethodName)
