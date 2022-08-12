If (False:C215)
	//Project Form Method Name:      TEST_SVG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/02/2012 13:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_GraphBreaks;0)
	//ARRAY LONGINT(DB_al_GraphFIeld;0)
	//ARRAY LONGINT(DB_al_GraphType;0)
	//ARRAY LONGINT(DB_al_GraphXaxisBreaks;0)
	//ARRAY TEXT(DB_at_GraphBreaks;0)
	//ARRAY TEXT(DB_at_GraphFIeld;0)
	//ARRAY TEXT(DB_at_GraphType;0)
	//ARRAY TEXT(DB_at_GraphUnitType;0)
	//ARRAY TEXT(DB_at_GraphXaxisBreaks;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_Event; DB_l_CurrentDisplayedForm)
	C_PICTURE:C286(DB_pi_GraphDisplay)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM TEST_SVG"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		ARRAY TEXT:C222(DB_at_GraphUnitType; 0)
		APPEND TO ARRAY:C911(DB_at_GraphUnitType; "None")
		APPEND TO ARRAY:C911(DB_at_GraphUnitType; "Currency")
		APPEND TO ARRAY:C911(DB_at_GraphUnitType; "Unit of Measure")
		APPEND TO ARRAY:C911(DB_at_GraphUnitType; "None")
		//DB_al_GraphType{DB_at_GraphType};DB_al_GraphFIeld{DB_at_GraphFIeld};DB_al_GraphBreaks{DB_at_GraphBreaks})
		DB_l_CurrentDisplayedForm:=Table:C252(->[INVOICES:39])
		
		ALL RECORDS:C47([ORDERS:24])
		ARRAY LONGINT:C221(DB_al_GraphFIeld; 0)
		ARRAY TEXT:C222(DB_at_GraphFIeld; 0)
		APPEND TO ARRAY:C911(DB_at_GraphFIeld; "Total Invoiced")
		APPEND TO ARRAY:C911(DB_al_GraphFIeld; Field:C253(->[INVOICES:39]Total_Invoiced:5))
		APPEND TO ARRAY:C911(DB_at_GraphFIeld; "Total Paid")
		APPEND TO ARRAY:C911(DB_al_GraphFIeld; Field:C253(->[INVOICES:39]Total_Paid:6))
		ARRAY TEXT:C222(DB_at_GraphBreaks; 0)
		ARRAY LONGINT:C221(DB_al_GraphBreaks; 0)
		APPEND TO ARRAY:C911(DB_at_GraphBreaks; "Accounting period")
		APPEND TO ARRAY:C911(DB_al_GraphBreaks; Field:C253(->[INVOICES:39]Period_Code:13))
		APPEND TO ARRAY:C911(DB_at_GraphBreaks; "Analysis Code")
		APPEND TO ARRAY:C911(DB_al_GraphBreaks; Field:C253(->[INVOICES:39]Analysis_Code:17))
		
		ARRAY TEXT:C222(DB_at_GraphXaxisBreaks; 0)
		ARRAY LONGINT:C221(DB_al_GraphXaxisBreaks; 0)
		APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "None")
		APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
		APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Account Period")
		APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; Field:C253(->[ORDERS:24]Order_Period:42))
		APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Order Date")
		APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; Field:C253(->[ORDERS:24]Order_Date:4))
		If (False:C215)
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Seconds")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
			
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Minutes")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
			
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Hours")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Days")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Weeks")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Months")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Quarters")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
			APPEND TO ARRAY:C911(DB_at_GraphXaxisBreaks; "Hours")
			APPEND TO ARRAY:C911(DB_al_GraphXaxisBreaks; -1)
		End if 
		
		ARRAY TEXT:C222(DB_at_GraphType; 0)
		ARRAY LONGINT:C221(DB_al_GraphType; 0)
		APPEND TO ARRAY:C911(DB_at_GraphType; "Bar Graph")
		APPEND TO ARRAY:C911(DB_at_GraphType; "Pie Graph")
		APPEND TO ARRAY:C911(DB_at_GraphType; "Vector Graph")
		APPEND TO ARRAY:C911(DB_al_GraphType; 1)
		APPEND TO ARRAY:C911(DB_al_GraphType; 3)
		APPEND TO ARRAY:C911(DB_al_GraphType; 2)
		
End case 
ERR_MethodTrackerReturn("FM TEST_SVG"; $_t_oldMethodName)
