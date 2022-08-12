//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_VerifyCopiedFrom
	//------------------ Method Notes ------------------
	//This method does a very basic veification of the copied from ID on a stock item record
	//it only checked that the values on the previous are correct AND that the previous does not have a residual less than zero. it is not intended to verify the called off count on that record. The current record we are checking
	//from may or not be saved. This is only to prevent or undo an overcall or a call where the copied from is wrong.
	
	//------------------ Revision Control ----------------
	//Date Created: 15/02/2012 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Verified; $0; STK_bo_CallBack; STK_bo_ParentVefify)
	C_LONGINT:C283($_l_CallBackProcess; $_l_Process; $_l_Retries; $_l_StockThreadID; $1; $2; STK_l_StockNumber)
	C_REAL:C285($4)
	C_TEXT:C284($_t_oldMethodName; $3; $5; $6; $7; $8)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_VerifyCopiedFrom")
If (Count parameters:C259>=8)
	If ($1=0)
		STK_l_StockNumber:=0
		STK_bo_CallBack:=False:C215
		STK_bo_ParentVefify:=False:C215
		$_l_Process:=New process:C317("STK_VerifyCopiedFrom"; 256000; "Verify Parent"; Current process:C322; $2; $3; $4; $5; $6; $7; $8)
		$_l_Retries:=0
		While ((Process state:C330($_l_Process)>=0) & ($_l_Retries<100)) & (STK_bo_CallBack=False:C215)
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2)
			If (Process_Name($_l_Process)#"Verify Parent")
				$_l_Process:=0
			End if 
		End while 
		If (STK_l_StockNumber>0)
			If ([STOCK_MOVEMENT_ITEMS:27]StockItemThread:19#STK_l_StockNumber)
				[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19:=STK_l_StockNumber
				SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
			End if 
		End if 
		$0:=STK_bo_ParentVefify
	Else 
		$_l_CallBackProcess:=$1
		$_bo_Verified:=True:C214
		READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$2)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=1)
			$_l_StockThreadID:=0
			If ([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$4) & ([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$3) & ([STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$5) & ([STOCK_MOVEMENT_ITEMS:27]Location:7=$6) & ([STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$7) & ([STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$8)
				If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>=0)
					$_bo_Verified:=True:C214
					$_l_StockThreadID:=[STOCK_MOVEMENT_ITEMS:27]StockItemThread:19
				Else 
					$_bo_Verified:=False:C215
				End if 
			Else 
				$_bo_Verified:=False:C215
			End if 
		Else 
			$_bo_Verified:=False:C215
			
		End if 
		SET PROCESS VARIABLE:C370($_l_CallBackProcess; STK_bo_CallBack; True:C214)
		SET PROCESS VARIABLE:C370($_l_CallBackProcess; STK_l_StockNumber; $_l_StockThreadID)
		
		SET PROCESS VARIABLE:C370($_l_CallBackProcess; STK_bo_ParentVefify; $_bo_Verified)
		RESUME PROCESS:C320($_l_CallBackProcess)
	End if 
	
Else 
	$0:=False:C215
	
End if 
ERR_MethodTrackerReturn("STK_VeirifyCopiedFrom"; $_t_oldMethodName)
