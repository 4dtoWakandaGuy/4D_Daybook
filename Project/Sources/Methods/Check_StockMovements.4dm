//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_StockMovements
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 12:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CurrentWinRefOLD; $_l_DockRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_WindowTop; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNew)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; SM_S20_StockMoevement; vPurchase)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_StockMovements")

$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
xNew:=0
vPurchase:=""

QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$1->)

If (Count parameters:C259>=2)
	QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Company_From:2=$2->)
End if 

If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
	QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$1->+"@")
	
	If (Count parameters:C259>=2)
		If ($2->#"")
			QUERY SELECTION:C341([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Company_From:2=$2->)
		End if 
	End if 
End if 
If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
	If (Records in selection:C76([PURCHASE_INVOICES:37])=1)
		$1->:=[STOCK_MOVEMENTS:40]Movement_Code:1
	Else 
		Check_DispNum(->[STOCK_MOVEMENTS:40]; "Stock Movements")
		If (OK=1)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			
			If ($_l_WindowTop>0)
				WIN_l_CurrentWinRef:=Open window:C153(($_l_WindowLeft+10); $_l_WindowTop+10; $_l_WindowLeft+10; $_l_WindowTop+10; 4; "Select a stock movement"; "Close_Cancel")
				
			Else 
				$_l_DockRight:=INT_GetDock("R")
				
				WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187-$_l_DockRight)-372; <>SYS_l_WindowTop+50; Screen width:C187-$_l_DockRight; <>SYS_l_WindowTop+266; 4; "Select a stock movement"; "Close_Cancel")
			End if 
			SM_S20_StockMoevement:=""
			DIALOG:C40([STOCK_MOVEMENTS:40]; "dask_StockMovements")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			WS_KeepFocus
			
			Array_LCx(0)
			
			WS_KeepFocus
			If (xNew=1)
				
			Else 
				If (OK=0)
					GOTO OBJECT:C206($1->)
				End if 
				$1->:=SM_S20_StockMoevement
			End if 
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			
		End if 
		
	End if 
Else 
	Gen_Alert("No Stock Movements found")
	$1->:=""
	
End if 
ERR_MethodTrackerReturn("Check_StockMovements"; $_t_oldMethodName)