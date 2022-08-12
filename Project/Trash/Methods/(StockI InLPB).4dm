//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockI_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 08:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_lb_MovedOn;0)
	//ARRAY DATE(STK_ad_MovementDate;0)
	//ARRAY REAL(STK_ar_DestinationQuantity;0)
	//ARRAY TEXT(STK_at_DestinationCode;0)
	//ARRAY TEXT(STK_at_destinationStockType;0)
	//ARRAY TEXT(STK_at_DestinationType;0)
	C_BOOLEAN:C305($_bo_IsPOType; STK_bo_DestinationSet)
	C_LONGINT:C283($_l_Process; STK_l_BUT1; STK_l_But2; STK_l_BUT3; STK_l_BUT4; STK_l_BUT5; STK_l_BUT6; STK_l_BUT7; STK_l_BUT8; STK_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; $_t_StockMovementType; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; STK_t_COL1; STK_t_COL2; STK_t_COL3; STK_t_COL4; STK_t_COL5)
	C_TEXT:C284(STK_t_COL6; STK_t_COL7; STK_t_COL8; STK_t_COL9; STK_t_HED1; STK_t_HED2; STK_t_HED3; STK_t_HED4; STK_t_HED5; STK_t_HED6; STK_t_HED7)
	C_TEXT:C284(STK_t_HED8; STK_t_HED9; vButtDisSI; vCompany; vCompName; vProdName; vTitleL)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_InLPB"; Form event code:C388)
If (DB_t_CurrentFormUsage="MOD")
	RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
	RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
	vCompName:=[COMPANIES:2]Company_Name:2
End if 
If ([STOCK_MOVEMENTS:40]Movement_Code:1#[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
	If ([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11#"")
		QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
	End if 
End if 
If (Count parameters:C259>=1)
	If ($1="B")
		
		StockI_SubLPB
	End if 
End if 
$_bo_IsPOType:=False:C215
$_t_StockMovementType:=[STOCK_MOVEMENTS:40]Movement_Type:6
If ($_t_StockMovementType#"")
	If ([MOVEMENT_TYPES:60]Type_Code:1#$_t_StockMovementType)
		QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$_t_StockMovementType)
		$_bo_IsPOType:=[MOVEMENT_TYPES:60]Purch_Ord_Type:11
		
	End if 
End if 
If ($_bo_IsPOType)
	If ([STOCK_MOVEMENT_ITEMS:27]Date_Received:5#!00-00-00!)
		OBJECT SET VISIBLE:C603(*; "oexpected@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "odelivered@"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "oexpected@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "odelivered@"; False:C215)
	End if 
Else 
	
	OBJECT SET VISIBLE:C603(*; "oexpected@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "odelivered@"; True:C214)
End if 

RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
vProdName:=[PRODUCTS:9]Product_Name:2
RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Company_To:2)
vCompany:=[COMPANIES:2]Company_Name:2
vTitleL:=Uppercase:C13(Term_StoWT("Stock Item"))
vButtDisSI:="I  PMO  FSSSRCADT"
Input_Buttons(->[STOCK_MOVEMENT_ITEMS:27]; ->vButtDisSI)

ARRAY TEXT:C222(STK_at_DestinationCode; 0)
ARRAY TEXT:C222(STK_at_DestinationType; 0)
ARRAY TEXT:C222(STK_at_destinationStockType; 0)
ARRAY REAL:C219(STK_ar_DestinationQuantity; 0)
ARRAY DATE:C224(STK_ad_MovementDate; 0)
STK_bo_DestinationSet:=False:C215
$_l_Process:=New process:C317("STK_GetDestination"; 128000; "Get Destination"; Current process:C322; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
Repeat 
	DELAY PROCESS:C323(Current process:C322; 2)
Until (STK_bo_DestinationSet)

LB_SetupListbox(->STK_lb_MovedOn; "STK_t"; "STK_L"; 1; ->STK_ar_DestinationQuantity; ->STK_ad_MovementDate; ->STK_at_DestinationCode; ->STK_at_DestinationType; ->STK_at_destinationStockType)
LB_SetColumnHeaders(->STK_lb_MovedOn; "STK_L"; 1; "Quantity"; "Date"; "Movement"; "Type"; "Stock Type")
LB_SetColumnWidths(->STK_lb_MovedOn; "STK_t"; 1; 90; 97; 57; 88)
LB_SetEnterable(->STK_lb_MovedOn; False:C215; 0)
LB_SetScroll(->STK_lb_MovedOn; -2; -2)
LB_StyleSettings(->STK_lb_MovedOn; "Black"; 9; "STK_t"; ->[STOCK_MOVEMENTS:40])

Macro_AccType("Load "+String:C10(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
ERR_MethodTrackerReturn("StockI_InLPB"; $_t_oldMethodName)
