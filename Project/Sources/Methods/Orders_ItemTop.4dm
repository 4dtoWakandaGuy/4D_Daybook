//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_ItemTop
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(ORD_bo_IsRevision)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_ItemTop")
If (Not:C34(ORD_bo_IsRevision))
	
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))>1)
		If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
			Menu_Record("Orders_ItemTop"; "Show Top Level Items")
			Orders_InLPOI
			Orders_InLPß("S1")
		Else 
			Gen_Alert("This function can only be used when viewing order items")
		End if 
	End if 
Else 
	Gen_Alert("This function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders_ItemTop"; $_t_oldMethodName)