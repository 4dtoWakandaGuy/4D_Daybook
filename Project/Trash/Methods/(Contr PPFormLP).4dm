//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr PPFormLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 15:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName; vContType; vDates; vLayCode; vNumber; vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13)
	C_TEXT:C284(vTitle14; vTitle15; vTitle16; vTitle19; vTitle2; vTitle20; vTitle3; vTitle4; vTitle7; vTitle8; vTitle9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contr PPFormLP")
If (vLayCode#[CONTRACTS:17]Contract_Code:3)
	vTitle1:="Site of Equipment"
	RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
	RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
	Address_Details
	Address_Contact
	vNumber:=[CONTRACTS:17]Contract_Code:3
	vTitle3:="Contract No"
	vTitle4:="Contract Dates"
	If ([CONTRACTS:17]Start_Date:5>!00-00-00!)
		vDates:=String:C10([CONTRACTS:17]Start_Date:5)+"-"+String:C10([CONTRACTS:17]End_Date:6)
	Else 
		vDates:=""
	End if 
	vTitle2:="Contract Type"
	RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
	vContType:=[CONTRACT_TYPES:19]Contract_Type_Name:2
	vTitle:="SERVICE CONTRACT"
	vTotal:=[CONTRACTS:17]Contract_Cost:7
	vTitle16:="Qty"
	vTitle7:="TOTAL COST"
	vTitle8:="Account No"
	vTitle9:="Item Description"
	vTitle10:="Serial No"
	vTitle11:="Cost"
	vTitle12:="SIGNATURES"
	vTitle13:="On behalf of client:   _____________________________________________"
	vTitle14:="On behalf of "+DB_GetOrganisation+":   _____________________________________________"
	vTitle15:="Name in Capitals:   _____________________________________________"
	vTitle19:="Position:   _____________________________________________"
	vTitle20:="Date:   _____________________________________________"
	vLayCode:=[CONTRACTS:17]Contract_Code:3
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
	ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Stage:35; >)
End if 
ERR_MethodTrackerReturn("Contr PPFormLP"; $_t_oldMethodName)