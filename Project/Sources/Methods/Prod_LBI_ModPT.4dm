//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_LBI_ModPT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/11/2010 14:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(Prod_lb_PriceBox;0)
	//ARRAY REAL(PROD_ar_ActualQty;0)
	//ARRAY REAL(PROD_ar_ActualSalesPrice;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_LBI_ModPT")
//this script runs when a cell is exited
LISTBOX GET CELL POSITION:C971(Prod_lb_PriceBox; $_l_Column; $_l_Row)



//this is the cell we are leaving
If ($_l_Column>0) & ($_l_Row>0)
	Case of 
		: ($_l_Column=1)  //Code
			
		: ($_l_Column=2)  //Name
			
		: ($_l_Column=3)  //Std Price
			//(pop-up) Type
			
			
			
		: ($_l_Column=5)  //Sales Price
			If (PROD_ar_ActualSalesPrice{0}#PROD_ar_ActualSalesPrice{$_l_Row})
				If (PROD_ar_ActualQty{$_l_Row}=0)
					PROD_ar_ActualQty{$_l_Row}:=1
				End if 
			End if 
			
		: ($_l_Column=5)  //qty
			//exiting the pric column
			
			
			
			
	End case 
End if 
ERR_MethodTrackerReturn("Prod_LBI_ModPT"; $_t_oldMethodName)
