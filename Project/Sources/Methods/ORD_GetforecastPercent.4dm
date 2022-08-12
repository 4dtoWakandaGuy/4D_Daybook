//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_GetforecastPercent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/06/2010 08:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_TEXT:C284($_t_EnquiryState; $_t_oldMethodName; $_t_QuotationState; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_GetforecastPercent")

If (Not:C34(<>StatesLoaded))
	States_Load
End if 
$_t_EnquiryState:=""
$_t_QuotationState:=""
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=1)
	$_t_EnquiryState:=<>SYS_at_RecStateCodes{24}{1}
End if 
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>=2)
	$_t_EnquiryState:=<>SYS_at_RecStateCodes{24}{2}
End if 
If ([ORDERS:24]State:15=$_t_EnquiryState) | ([ORDERS:24]State:15=$_t_QuotationState)
	$0:=String:C10([ORDERS:24]Forecast_PC:22)+"%"
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("ORD_GetforecastPercent"; $_t_oldMethodName)
