//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements_Sel2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 13:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_StockMovements; 0)
	//ARRAY TEXT(STK_at_NoCopyFrom;0)
	C_BOOLEAN:C305($_bo_Reference; STK_bo_NoCopyFromSet; STK_bo_UseDeliveryReference)
	C_LONGINT:C283(<>AutoProc; $_l_FSPosition; STOCK_l_Context)
	C_TEXT:C284($_t_MovementType; $_t_MovementTypeNumber; $_t_oldMethodName; $_t_Search; $_t_SearchWithWIldCard; $1; STK_t_DeliveryReference)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements_Sel2")
STK_bo_UseDeliveryReference:=False:C215
If (<>AutoProc=987654321)
	<>AutoProc:=0
	USE NAMED SELECTION:C332("◊IA")
	$_t_Search:="◊IA"
Else 
	If (((Length:C16($1)=1) & (Character code:C91($1)=64)) | ($1=""))
		ALL RECORDS:C47([STOCK_MOVEMENTS:40])
	Else 
		$_t_SearchWithWIldCard:=Sel_AtSign($1)
		Sel_NoAtAt(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]MovementSourceReference:18; $1; $_t_SearchWithWIldCard)
		
		If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
			Sel_NoAtAt(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Type:6; $1; $_t_SearchWithWIldCard)
			If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
				Sel_NoAtAt(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Movement_Code:1; $1; $_t_SearchWithWIldCard)
				// Sel_NoAtAt (->[STOCK MOVEMENTS];->[STOCK MOVEMENTS]MovementSourceReference;$1;$
				If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
					Sel_NoAtAt(->[STOCK_MOVEMENTS:40]; ->[STOCK_MOVEMENTS:40]Company_From:2; $1; $_t_SearchWithWIldCard)
					If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
						If (Date:C102($1)#!00-00-00!)
							QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Date:5=Date:C102($1))
						End if 
						If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
							$_bo_Reference:=False:C215
							If (Date:C102($1)#!00-00-00!)
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Expected_Date:44=Date:C102($1))
							Else 
								$_bo_Reference:=True:C214
								QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_PO_Item_Delivery_Reference:43=$1+"@")
							End if 
							If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
								If ($_bo_Reference) & (STOCK_l_Context<0)  //only applies when doing a copy from previous
									STK_bo_UseDeliveryReference:=True:C214  // if search by delivery reference then when opening the movement only show items with the reference
									STK_t_DeliveryReference:=$1+"@"
								End if 
								DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11; $_at_StockMovements)
								QUERY WITH ARRAY:C644([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_StockMovements)
								
							End if 
							If (Records in selection:C76([STOCK_MOVEMENTS:40])=0)
								$_l_FSPosition:=Position:C15("/"; $1)
								If ($_l_FSPosition>0)
									$_t_MovementType:=Substring:C12($1; 1; $_l_FSPosition-1)
									$_t_MovementTypeNumber:=Substring:C12($1; $_l_FSPosition+1)
									QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Type:6=$_t_MovementType; *)
									QUERY:C277([STOCK_MOVEMENTS:40];  & ; [STOCK_MOVEMENTS:40]Type_Number:4=$_t_MovementTypeNumber)
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
			If (STK_bo_NoCopyFromSet)
				If (Size of array:C274(STK_at_NoCopyFrom)>0)
					CREATE SET:C116([STOCK_MOVEMENTS:40]; "$Current")
					
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENTS:40]Movement_Type:6; STK_at_NoCopyFrom)
					If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
						CREATE SET:C116([STOCK_MOVEMENTS:40]; "$takeOut")
						DIFFERENCE:C122("$current"; "$takeOut"; "$Current")
						USE SET:C118("$current")
					Else 
						USE SET:C118("$current")
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Movements_Sel2"; $_t_oldMethodName)