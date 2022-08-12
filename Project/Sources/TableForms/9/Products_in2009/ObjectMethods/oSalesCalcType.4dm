If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oSalesCalcType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_FilterBy;0)
	//ARRAY TEXT(STK_at_DetailTypes;0)
	//ARRAY TEXT(STK_at_HistoryTypes;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oSalesCalcType"; Form event code:C388)

$_l_event:=Form event code:C388
//NG Note:=as we are going to search order(items) must make sure if we are viewing a product from an order that this is in another process.

Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (STK_at_HistoryTypes=1)  //None)
				OBJECT SET VISIBLE:C603(STK_at_DetailTypes; False:C215)
			: (STK_at_HistoryTypes=2)  //Quantities sold
				ARRAY TEXT:C222(STK_at_DetailTypes; 4)
				STK_at_DetailTypes{1}:="Per Day"
				STK_at_DetailTypes{2}:="Per Month"
				STK_at_DetailTypes{3}:="Per Quarter"
				STK_at_DetailTypes{4}:="Per Year"
				OBJECT SET VISIBLE:C603(STK_at_DetailTypes; True:C214)
				OBJECT SET VISIBLE:C603(STK_at_FilterBy; True:C214)
				OBJECT SET VISIBLE:C603(*; "oDetailLabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "OreportPeriodLabel"; True:C214)
				
				ARRAY TEXT:C222(STK_at_FilterBy; 5)
				STK_at_FilterBy{1}:="Product Lifetime"
				STK_at_FilterBy{2}:="Current Year"
				STK_at_FilterBy{3}:="Current Quarter"
				STK_at_FilterBy{4}:="Current Month"
				STK_at_FilterBy{5}:="Date Range..."
				STK_FillHistoryBytype(STK_at_HistoryTypes; STK_at_DetailTypes; STK_at_FilterBy)
				
			: (STK_at_HistoryTypes=3)  //average sold
				ARRAY TEXT:C222(STK_at_DetailTypes; 4)
				STK_at_DetailTypes{1}:="Daily"
				STK_at_DetailTypes{2}:="Monthly"
				STK_at_DetailTypes{3}:="Quarterly"
				STK_at_DetailTypes{4}:="Annually"
				OBJECT SET VISIBLE:C603(STK_at_DetailTypes; True:C214)
				If (STK_at_FilterBy>4)
					STK_at_FilterBy:=1
				End if 
				ARRAY TEXT:C222(STK_at_FilterBy; 4)
				OBJECT SET VISIBLE:C603(STK_at_FilterBy; True:C214)
				
				STK_at_FilterBy{1}:="Product Lifetime"
				STK_at_FilterBy{2}:="Years"
				STK_at_FilterBy{3}:="Quarters"
				STK_at_FilterBy{4}:="Months"
				
				STK_FillHistoryBytype(STK_at_HistoryTypes; STK_at_DetailTypes; STK_at_FilterBy)
				
				
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oSalesCalcType"; $_t_oldMethodName)
