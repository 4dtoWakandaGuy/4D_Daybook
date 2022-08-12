If (False:C215)
	//Table Form Method Name: [ORDERS]Orders BWB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 13:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_CharPosition)
	C_TEXT:C284($_t_oldMethodName; vCallCode; vCompCode; vContCode; vOrderCode; vTitle1; vTitle2; vTitle3; vType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Orders BWB"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		If ([ORDERS:24]Total_Amount:6<0)
			vType:="OC"
			vContCode:="C"
		Else 
			vType:="OI"
			vContCode:="D"
		End if 
		vOrderCode:=STR_LeadZeros(String:C10([ORDERS:24]Export_Document_Number:46); 8)
		
		$_l_CharPosition:=Position:C15("/"; [ORDERS:24]Company_Code:1)
		vCompCode:=Str_TrailSpaces(Substring:C12([ORDERS:24]Company_Code:1; $_l_CharPosition+1; 5); 5)
		Case of 
			: ([ORDERS:24]Order_Date:4>!00-00-00!)
				vDate:=[ORDERS:24]Order_Date:4
			: ([ORDERS:24]Quotation_Date:26>!00-00-00!)
				vDate:=[ORDERS:24]Quotation_Date:26
			Else 
				vDate:=[ORDERS:24]Enquiry_Date:25
		End case 
		MESSAGES OFF:C175
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		//i:=2
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
		MESSAGES ON:C181
		
		vCallCode:=STR_LeadZeros(Substring:C12(String:C10(Records in selection:C76([ORDER_ITEMS:25])); 1; 2); 2)
		vTitle1:=STR_LeadZeros(Substring:C12(String:C10(Sum:C1([ORDER_ITEMS:25]Quantity:3)); 1; 5); 5)
		vTitle2:=Str_ZeroAmt([ORDERS:24]Total_Amount:6; 17)
		vTitle3:="01"
End case 
ERR_MethodTrackerReturn("FM [ORDERS].Orders BWB"; $_t_oldMethodName)
