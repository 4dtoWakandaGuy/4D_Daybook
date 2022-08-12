//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SetCalledOffInProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/03/2014 15:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Delay; $_l_Repeats; $1; $3)
	C_REAL:C285($_r_CalledOffQuantity; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("STK_SetCalledOffInProcess")

//When we copy an item to a stock movement we dont update the called off quantity on that item and that causes a problem if 2 of the same product is on the movment or a simultanious movement is also entered
//which wants to copy from the same type may select the the same item as it still has a quantity available . HOWEVER
//1) if we then cancel the movement and we have updated the item it calls off from then it will no longer be correct and
//2) if we are in a transaction and change it there it will lock the record for everyone but a read only look at the record will see the quantity without the called off changed.
//SO...

//this method is called in a process..
//$1=The Stock movement item ID to change
//$2=The quantity to manually add to the called off-note we dont validate on save here!!
//$3=the 'calling' process-when that ends a validation of the called of will happen.
//TRACE
If (Count parameters:C259>=3)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
	
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$1)
	$_r_CalledOffQuantity:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold($1))
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
			If ($_l_Delay>60)
				$_l_Delay:=1
			End if 
			DelayTicks(60*$_l_Delay)
		End if 
	Until ($_bo_OK=True:C214)
	[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_CalledOffQuantity
	[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
	//$_l_Process:=New Process("STK_ValidateCalledafterProcess";128000;"Monitor Record "+String([STOCK ITEMS]x_ID);$3;[STOCK ITEMS]x_ID)
	UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
End if 
ERR_MethodTrackerReturn("STK_SetCalledOffInProcess"; $_t_oldMethodName)
