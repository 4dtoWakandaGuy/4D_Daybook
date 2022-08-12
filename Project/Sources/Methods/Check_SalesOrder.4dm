//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_SalesOrder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(<>StatesLoaded; $_bo_QueryOrders; $3)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CharacterCode; $_l_CurrentWinRefOLD; $_l_DockRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNew)
	C_POINTER:C301($1; $2; $4)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $_t_OrderCode; $_t_ReturnsNumber; DB_t_CurrentFormUsage; SO_t_OrderCode; vPurchase)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_SalesOrder")

//Check_Contact (->[ORDERS]Contact Code;->[ORDERS]Company Code;->[ORDERS])
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
xNew:=0
vPurchase:=""

If (Not:C34(<>StatesLoaded))
	States_Load
End if 

$_t_OrderCode:=$1->
$1->:=""
If (Count parameters:C259>=3)
	$_bo_QueryOrders:=$3
Else 
	$_bo_QueryOrders:=True:C214
End if 
If ($_bo_QueryOrders)
	QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
End if 
If (Count parameters:C259>=2)
	If ($2->#"")
		QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Company_Code:1=$2->)
	End if 
End if 
If (Records in selection:C76([ORDERS:24])=0)
	If ($_t_OrderCode#"")
		QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode+"@")
		If (Count parameters:C259>=2)
			If ($2->#"")
				QUERY SELECTION:C341([ORDERS:24]; [ORDERS:24]Company_Code:1=$2->)
			End if 
		End if 
	End if 
End if 
If (Count parameters:C259>=4)
	If (Records in selection:C76([ORDERS:24])>0)
		CREATE SET:C116([ORDERS:24]; "$Temp")
	Else 
		CREATE EMPTY SET:C140([ORDERS:24]; "$Temp")
	End if 
	If ($4->#"")
		$_t_ReturnsNumber:=$4->
		$_l_CharacterCode:=Character code:C91($_t_ReturnsNumber[[Length:C16($_t_ReturnsNumber)]])
		If ($_l_CharacterCode#64)
			$_t_ReturnsNumber:=$_t_ReturnsNumber+"@"
		Else 
			$_t_ReturnsNumber:=$_t_ReturnsNumber
		End if 
		$4->:=""
		
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ReturnsNumber:64=$_t_ReturnsNumber)
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
			QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
			If (Records in selection:C76([ORDERS:24])>0)
				If (Records in set:C195("$Temp")>0)
					CREATE SET:C116([ORDERS:24]; "$Temp2")
					INTERSECTION:C121("$Temp"; "$Temp2"; "$Temp")
				Else 
					CREATE SET:C116([ORDERS:24]; "$Temp")
				End if 
			End if 
			USE SET:C118("$Temp")
		End if 
	End if 
End if 
If (Records in selection:C76([ORDERS:24])>0)
	If (Records in selection:C76([ORDERS:24])=1)
		$_t_OrderCode:=[ORDERS:24]Order_Code:3
		If (Count parameters:C259>=2)
			$2->:=[ORDERS:24]Company_Code:1
		End if 
	Else 
		Check_DispNum(->[ORDERS:24]; "Orders")
		If (OK=1)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			
			If ($_l_WindowTop>0)
				WIN_l_CurrentWinRef:=Open window:C153(($_l_WindowLeft+10); $_l_WindowTop+10; $_l_WindowLeft+10; $_l_WindowTop+10; 4; "Select an Order"; "Close_Cancel")
				
			Else 
				$_l_DockRight:=INT_GetDock("R")
				
				WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187-$_l_DockRight)-372; <>SYS_l_WindowTop+50; Screen width:C187-$_l_DockRight; <>SYS_l_WindowTop+266; 4; "Select an Order"; "Close_Cancel")
			End if 
			SO_t_OrderCode:=""
			DIALOG:C40([ORDERS:24]; "dAsk_Order")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			WS_KeepFocus
			
			Array_LCx(0)
			ARRAY TEXT:C222(SVS_at_PreviewEvent; 0)
			WS_KeepFocus
			If (xNew=1)
				
			Else 
				If (OK=0)
					GOTO OBJECT:C206($_t_OrderCode)
				End if 
				$_t_OrderCode:=SO_t_OrderCode
				If (Count parameters:C259>=2)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=SO_t_OrderCode)
					$2->:=[ORDERS:24]Company_Code:1
				End if 
			End if 
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			
		End if 
		
	End if 
Else 
	$_t_OrderCode:=""
End if 
If ($_t_OrderCode#"")
	$1->:=$_t_OrderCode
	If (Count parameters:C259>=4)
		$4->:=$_t_ReturnsNumber
	End if 
End if 
ERR_MethodTrackerReturn("Check_SalesOrder"; $_t_oldMethodName)