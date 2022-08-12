//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_b_ShowCSBySI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/07/2011 17:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentStockID; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_bo_ShowCSBySI")

//This process will open a current stock record
//Pass a stock i tem ID and it twill open teh curent stock that was added to
Start_Process
If (Count parameters:C259>=3)
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
	$_l_CurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
	If ($_l_CurrentStockID>0)
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]X_ID:13=$_l_CurrentStockID)
		
		Open window:C153($2; $3; $2+560; $3+450; Alternate dialog box:K34:5)
		DIALOG:C40([CURRENT_STOCK:62]; "CurrentStock_In")
	Else 
		Gen_Alert("Sorry the previous stock does not have a current stock record")
	End if 
End if 
ERR_MethodTrackerReturn("STK_bo_ShowCSBySI"; $_t_oldMethodName)
