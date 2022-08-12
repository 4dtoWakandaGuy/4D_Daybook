//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices FormLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>DataSize; <>TextSize; $_l_Event)
	C_TEXT:C284(<>TitPayB; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices FormLP")
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Printing Detail:K2:18)
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->vTimes; ->vDetails; ->vOrderCode; ->vDates; ->vSolution; ->vDetailsD; ->[INVOICES:39]Your_Order_Number:14; ->[INVOICES:39]Terms:11; ->[INVOICES:39]Company_Code:2)
		SetFontsByPointerParameter(<>TextSize; ""; 0; ->vTitPay; -><>TitPayB; ->vTitReg; ->vTitDepCo; ->vTitAdd)
		
		//Set_Fonts ("vNumber+vDate+vTimes+vDetails+vOrderCode+vDates+vSolution+vDetailsD";◊DataSize)
		//Set_Fonts ("[INVOICES]Your Order No+[INVOICES]Terms"+"+[INVOICES]Company Code";◊DataSize)
		//Set_Fonts ("vTitPay+◊TitPayB+vTitReg+vTitDepCo+vTitAdd";◊TextSize)
		Invoices_FormL2
		//Set_Fonts ("vTitle18";◊TextSize-2)
		
		Set_FontsTitle
End case 
ERR_MethodTrackerReturn("Invoices FormLP"; $_t_oldMethodName)