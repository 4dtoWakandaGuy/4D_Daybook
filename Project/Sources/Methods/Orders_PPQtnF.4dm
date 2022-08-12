//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPQtnF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2010 15:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName; $_t_RecordState)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPQtnF")
Menu_Record("Orders_PPQtnF"; "Quotation Form")
COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "OITemp")
If ((DB_GetModuleSettingByNUM(Module_Enquiries))<2)
	Gen_Alert("You do not have access to the SalesBook"; "Cancel")
Else 
	If (Not:C34(<>StatesLoaded))
		States_Load
	End if 
	Orders_InLPA(False:C215)
	Orders_PPGen(->[ORDERS:24]; "Form"; "Orders_Out"; "Qtn"; "Order Quote"; "Orders_PPFormL2"; 0; ->[ORDERS:24]State:15; "Order Quote"; [ORDERS:24]Analysis_Code:33)
	If (OK=1)
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
			$_t_RecordState:="024"+<>SYS_at_RecStateCodes{24}{2}
			If ([ORDERS:24]State:15<$_t_RecordState)
				[ORDERS:24]State:15:=$_t_RecordState
				States_CUArr(->[ORDERS:24]State:15)
				Order_Title
			End if 
			If ([ORDERS:24]Quotation_Date:26=!00-00-00!)
				[ORDERS:24]Quotation_Date:26:=<>DB_d_CurrentDate
			End if 
		End if 
	End if 
End if 
USE NAMED SELECTION:C332("OITemp")
ERR_MethodTrackerReturn("Orders_PPQtnF"; $_t_oldMethodName)
