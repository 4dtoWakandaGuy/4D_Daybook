//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movt FormLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName; vLayCode; vTitDepCo; vTitDepCoP; vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14)
	C_TEXT:C284(vTitle15; vTitle17; vTitle18; vTitle19; vTitle2; vTitle20; vTitle3; vTitle4; vTitle7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movt FormLP")
If (vLayCode#[STOCK_MOVEMENTS:40]Movement_Code:1)
	RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
	Company_Details
	RELATE ONE:C42([STOCK_MOVEMENTS:40]Movement_Type:6)
	If ([MOVEMENT_TYPES:60]Form_Title:7#"")
		vTitle:=[MOVEMENT_TYPES:60]Form_Title:7
	Else 
		vTitle:="STOCK MOVEMENT"
	End if 
	If ([MOVEMENT_TYPES:60]Number_Name:5#"")
		vTitle3:=[MOVEMENT_TYPES:60]Number_Name:5
	Else 
		vTitle3:=[STOCK_MOVEMENTS:40]Movement_Type:6+" No"
	End if 
	vTitle4:="Account No"
	vTitle11:="Our Ref"
	vTitle2:="Date"
	vTitle12:="Description"
	vTitle1:="Attn"
	vTitle13:="Serial No"
	vTitle14:="Qty"
	If ([MOVEMENT_TYPES:60]Form_No_Amount:21)
		vTitle15:=""
		vTitle7:=""
		vTotal:=0
	Else 
		vTitle15:="Cost Amount "+[STOCK_MOVEMENTS:40]Currency_Code:10
		vTitle7:="Total excl VAT "+[STOCK_MOVEMENTS:40]Currency_Code:10
		vTotal:=[STOCK_MOVEMENTS:40]Total_Cost:8
	End if 
	Forms_GenTit(->[STOCK_MOVEMENTS:40]Analysis_Code:9)
	If ([MOVEMENT_TYPES:60]Form_Name:9)
		vTitDepCo:=vTitDepCoP
	End if 
	If ([MOVEMENT_TYPES:60]Location_Form:14)
		vTitle10:="Location"
	Else 
		vTitle10:=""
	End if 
	vTitle17:="Signature:   ___________________________________________________________"
	vTitle18:="Date:   _______________________________________________________________"
	vTitle19:="Print Name:   __________________________________________________________"
	vTitle20:="Goods received in good condition"
	vLayCode:=[STOCK_MOVEMENTS:40]Movement_Code:1
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
	If ([MOVEMENT_TYPES:60]Location_Form:14)
		ORDER BY:C49([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Location:7; >)
	End if 
	If (([STOCK_MOVEMENT_ITEMS:27]Company_To:2="-PLUS") | ([STOCK_MOVEMENT_ITEMS:27]Company_To:2="-MINUS"))
		vTitle:="Disassembly"
	End if 
End if 
ERR_MethodTrackerReturn("Movt FormLP"; $_t_oldMethodName)