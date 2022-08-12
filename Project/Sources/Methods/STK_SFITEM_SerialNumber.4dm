//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SFITEM_SerialNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2011 16:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process)
	C_POINTER:C301($1; $2; $3)
	C_REAL:C285(<>STK_l_ReturnPreviousStockItemID; vTot)
	C_TEXT:C284($_t_MovementTypeStockAdd; $_t_oldMethodName; $_t_productCode; $_t_SerialNumber; vStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SFITEM_SerialNumber")

//StockI_SubLPSN
If (Count parameters:C259=3)
	If ($3-><0) | ([SF_STOCKMOVEMENT_ITEMS:194]Stock_itemInverted:28)
		$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Plus:3
	Else 
		$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Minus:4
	End if 
Else 
	$_t_MovementTypeStockAdd:=[MOVEMENT_TYPES:60]Stock_Minus:4
End if 
vStatus:=$_t_MovementTypeStockAdd
If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
	[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])  //this was outside the if and not much point in the save rere
	AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
End if 
$_t_productCode:=$1->
$_t_SerialNumber:=$2->
<>STK_l_ReturnPreviousStockItemID:=0
$_l_Process:=New process:C317("STK_GetPreviousBySerial"; 128000; "Get Stock Item Serial"; $_t_productCode; $_t_SerialNumber; $_t_MovementTypeStockAdd)
While (Process state:C330($_l_Process)>=0) & (Process_Name($_l_Process)="Get Stock Item Serial")
	
	DelayTicks(3)
End while 
If (False:C215)  //This needs a retrhink
	If ([MOVEMENT_TYPES:60]Serial_Unique:19)  //NG not really sure this should be handled like this in future because a serial number may be unique but it could still change stock type
		$_l_Process:=New process:C317("STK_GetPreviousBySerial"; 128000; "Get Stock Item Serial"; $_t_productCode; $_t_SerialNumber; $_t_MovementTypeStockAdd)
		
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=$_t_SerialNumber)
		If (Records in selection:C76([CURRENT_STOCK:62])>0)
			COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$CS")
			Gen_Alert($_t_SerialNumber+" is not a unique Serial No"; "Try again")
			USE NAMED SELECTION:C332("$CS")
			CLEAR NAMED SELECTION:C333("$CS")
			$2->:=""
			GOTO OBJECT:C206($2->)
		Else 
			$2->:=Uppercase:C13($2->)
		End if 
	Else 
		If ((Length:C16($_t_SerialNumber)=1) & (Character code:C91($_t_SerialNumber)=64))
			StockI_CurrButt
			If ((Length:C16($_t_SerialNumber)=1) & (Character code:C91($_t_SerialNumber)=64))
				$2->:=""
			End if 
		Else 
			QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=$_t_MovementTypeStockAdd; *)
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=$_t_SerialNumber)
			If (Records in selection:C76([CURRENT_STOCK:62])=0)
				QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Stock_Type:3=$_t_MovementTypeStockAdd; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Product_Code:1=$_t_productCode; *)
				QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=($_t_SerialNumber+"@"))
			End if 
			If (Records in selection:C76([CURRENT_STOCK:62])=0)
				If ([MOVEMENT_TYPES:60]Serial_Current:18)
					COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$CS")
					Gen_Alert("That is not a valid Serial No"; "Try again")
					USE NAMED SELECTION:C332("$CS")
					CLEAR NAMED SELECTION:C333("$CS")
					$2->:=""
					GOTO OBJECT:C206($2->)
				Else 
					$2->:=Uppercase:C13($2->)
				End if 
			Else 
				OK:=1
				If (Records in selection:C76([CURRENT_STOCK:62])>1)
					
					DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])); True:C214)
					
					//StockI_CurrDisp
				End if 
				If ((Records in selection:C76([CURRENT_STOCK:62])>0) & (OK=1))
					StockI_CurrLoad
					vTot:=1
				Else 
					If ([MOVEMENT_TYPES:60]Serial_Current:18)
						$2->:=""
						GOTO OBJECT:C206($2->)
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("STK_SFITEM_SerialNumber"; $_t_oldMethodName)
