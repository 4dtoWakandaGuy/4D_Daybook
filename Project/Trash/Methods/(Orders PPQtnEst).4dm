//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_PPQtnEst
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 18:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TermEst)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPQtnEst")
If (<>TermEst)
	Case of 
		: (BUT_p_ButtonStringPointer->="OI@")
			DB_MenuAction("Print"; "Quotation Form"; 1; "Estimate Form")
			DB_MenuAction("Print"; "Quotation WP"; 1; "Estimate WP")
			//SET_MENU ITEM(2049;1;"Estimate Form")
			//   SET_MENU ITEM(2049;2;"Estimate WP")
		: (BUT_p_ButtonStringPointer->="OO@")
			DB_MenuAction("Print"; "Quotation Form"; 1; "Estimate Form")
			DB_MenuAction("Print"; "Quotation WP"; 1; "Estimate WP")
			//SET_MENU ITEM(2049;1;"Estimate Form")
			//SET_MENU ITEM(2049;2;"Estimate WP")
		: (BUT_p_ButtonStringPointer->="IO@")
			DB_MenuAction("Print"; "Quotation Form"; 1; "Estimate Form")
			DB_MenuAction("Print"; "Quotation WP"; 1; "Estimate WP")
			//SET_MENU ITEM(2050;1;"Estimate Form")
			// SET_MENU ITEM(2050;2;"Estimate WP")
	End case 
End if 
ERR_MethodTrackerReturn("Orders_PPQtnEst"; $_t_oldMethodName)