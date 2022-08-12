//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Sec
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_RecStateRestriction;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>SalesOrder; <>StatesLoaded; DB_bo_SectionAlertsoff)
	C_LONGINT:C283($_l_StateTable; $3)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_NewOrderState; $_t_NumberString; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Sec")
//Chec Sec
//TRACE

If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If (DB_t_CurrentFormUsage="Job")
	$_l_StateTable:=26
Else 
	$_l_StateTable:=24
End if 
$_t_NumberString:=("0"*(3-Length:C16(String:C10($_l_StateTable))))+String:C10($_l_StateTable)

If (Size of array:C274(<>SYS_at_RecStateCodes{$_l_StateTable})>2)
	$_t_NewOrderState:=$_t_NumberString+<>SYS_at_RecStateCodes{$_l_StateTable}{3}
Else 
	$_t_NewOrderState:=$_t_NumberString+"nZZZ"
End if 
If (($2->) | (((<>SYS_al_RecStateRestriction{$_l_StateTable}{vStPos}\2)%2)=1) | (((<>SalesOrder=False:C215) | (DB_GetModuleSettingByNUM(Module_SalesOrders)<2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)=3)) & ([ORDERS:24]State:15>$_t_NewOrderState) & (vProcaMod=13) & (DB_t_CurrentFormUsage#"NAT") & (DB_t_CurrentFormUsage#"Contr")))
	If (Not:C34(DB_bo_SectionAlertsoff))
		
		Gen_Alert("You cannot modify this field"; "Cancel")
	End if 
	$1->:=Old:C35($1->)
	OK:=0
Else 
	If ((DB_GetModuleSettingByNUM(Module_Assemblies)>0) & ([ORDER_ITEMS:25]Level_Up_Item_Number:48#0) & ([ORDER_ITEMS:25]Component_Level:47>0) & (Count parameters:C259=3))
		If (Not:C34(DB_bo_SectionAlertsoff))
			Gen_Alert("You cannot change the Sales details of Bundle Components"; "Cancel")
		End if 
		$1->:=Old:C35($1->)
		OK:=0
	Else 
		OK:=1
	End if 
End if 
ERR_MethodTrackerReturn("Check_Sec"; $_t_oldMethodName)