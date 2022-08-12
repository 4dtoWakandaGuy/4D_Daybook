If (False:C215)
	//object Name: [COMPANIES]Company_In.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(COM_al_CompanyTabPage;0)
	//ARRAY TEXT(COM_at_CompanyTab;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Element; $_l_Page)
	C_TEXT:C284($_t_Execute; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Invisible Button1"; Form event code:C388)
If (COM_at_CompanyTab>1)
	COM_at_CompanyTab:=COM_at_CompanyTab-1
End if 
$_l_Element:=COM_al_CompanyTabPage{COM_at_CompanyTab}

If ($_l_Element#FORM Get current page:C276)
	$_t_Execute:="P"+String:C10($_l_Element)
	$_bo_OK:=True:C214
	$_l_Page:=1
	Case of 
			
			
		: ($_l_Element=2)
			
			$_l_Page:=2
		: ($_l_Element=3)
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)=2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)=2) | (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=2) | (DB_GetModuleSettingByNUM(Module_JobCosting)=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)=2))
				
				$_l_Page:=3
			Else 
				$_bo_OK:=False:C215
				$_l_Page:=1
				Gen_Alert("You do not have Access Rights to view this page"; "Cancel")
			End if 
			
		: ($_l_Element=4)
			
			Companies_InLas
			$_l_Page:=4
			
			
			
		: ($_l_Element=5)
			
			FORM GOTO PAGE:C247(COM_al_CompanyTabPage{$_l_Element})
			$_l_Page:=5
			
		: ($_l_Element=5)
			FORM GOTO PAGE:C247(COM_al_CompanyTabPage{$_l_Element})
			$_l_Page:=5
	End case 
	If ($_bo_OK)
		Companies_InLPß($_t_Execute)
		FORM GOTO PAGE:C247(COM_al_CompanyTabPage{$_l_Element})
	End if 
	
End if 
COM_at_CompanyTab:=Find in array:C230(COM_al_CompanyTabPage; $_l_Element)
ERR_MethodTrackerReturn("OBJ:Company_In,Bright"; $_t_oldMethodName)
