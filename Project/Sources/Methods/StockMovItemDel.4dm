//%attributes = {}
If (False:C215)
	//Project Method Name:      StockMovItemDel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/05/2012 15:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ResetCalledOff; 0)
	//ARRAY LONGINT(STK_al_Reset;0)
	C_BOOLEAN:C305($_bo_Ready; $0; STK_bo_RestReady; STK_bo_RestReadytoreceive)
	C_LONGINT:C283($_l_BlankRow; $_l_Process)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

//Ng April 2004
$_t_oldMethodName:=ERR_MethodTracker("StockMovItemDel")
$0:=False:C215
ARRAY LONGINT:C221($_al_ResetCalledOff; 0)
If ([STOCK_MOVEMENTS:40]Movement_Code:1#"")
	
	
	$0:=True:C214
	//TRACE
	DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17; $_al_ResetCalledOff)
	$_l_BlankRow:=Find in array:C230($_al_ResetCalledOff; 0)
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_al_ResetCalledOff; $_l_BlankRow)
		
	End if 
	
	DELETE SELECTION:C66([STOCK_MOVEMENT_ITEMS:27])
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
	[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
	If (Size of array:C274($_al_ResetCalledOff)>0)
		$_l_Process:=New process:C317("STK_ResetCalledOff"; 128000; "Reset called off"; False:C215)
		DelayTicks(20)
		If ($_l_Process>0)
			Repeat 
				DelayTicks(2)
				GET PROCESS VARIABLE:C371($_l_Process; STK_bo_RestReadytoreceive; $_bo_Ready)
			Until ($_bo_Ready)
			VARIABLE TO VARIABLE:C635($_l_Process; STK_al_Reset; $_al_ResetCalledOff)
			SET PROCESS VARIABLE:C370($_l_Process; STK_bo_RestReady; True:C214)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("StockMovItemDel"; $_t_oldMethodName)
