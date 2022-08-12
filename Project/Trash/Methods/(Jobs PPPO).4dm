//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs PPPO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; r0; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vNumber; vSolution)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs PPPO")
//Jobs PPPO
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
Menu_Record("Jobs PPPO"; "Purchase Order")
If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2) | (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=3))
	Gen_Alert("You do not have access to Purchase Order Processing"; "Cancel")
Else 
	If (Gen_PPChkStSing(->[JOBS:26]State:9; 5))
		vNumber:=""
		vSolution:="@"
		Open_Any_Window(222; 361)
		DIALOG:C40([JOBS:26]; "dAsk PO")
		CLOSE WINDOW:C154
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If ($_l_OK=1)
			Gen_PP1(->[JOBS:26]; "Jobs")
			READ WRITE:C146([ORDER_ITEMS:25])
			If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1)
				OrderI_LevelCr
			End if 
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Job_Code:34=[JOBS:26]Job_Code:1; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Job_Stage:35=vSolution; *)
			If (r0=1)
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="B"; *)
			Else 
				QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]State:46="A"; *)
			End if 
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Purchase_Order_Number:18=vNumber; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#""; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"BUNDLE"; *)
			QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
			DB_t_CurrentFormUsage:="Job "+[JOBS:26]Job_Code:1+" Stage "+vSolution
			Orders_PurchP
			Gen_PP2("Jobs")
			Jobs_PPEnd
		End if 
	End if 
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Jobs PPPO"; $_t_oldMethodName)