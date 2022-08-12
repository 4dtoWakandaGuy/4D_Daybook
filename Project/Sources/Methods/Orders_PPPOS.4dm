//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPPOS
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
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(ORD_bo_IsRevision)
	C_LONGINT:C283(DB_l_ButtonClickedFunction)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; $_t_oldMethodName; DB_t_CurrentFormUsage2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPPOS")

If (Not:C34(ORD_bo_IsRevision))
	
	Menu_Record("Orders_PPPOS"; "Purchase Order Selected")
	If (BUT_p_ButtonStringPointer->="IO@")
		If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
			DB_t_CurrentFormUsage2:="Sel"
			Orders_InLPA(False:C215)
			Orders_PPPO
			GET HIGHLIGHTED RECORDS:C902(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
			COPY NAMED SELECTION:C331(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$CurrentSelection")
			REDUCE SELECTION:C351(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; 0)
			USE NAMED SELECTION:C332("$CurrentSelection")
			HIGHLIGHT RECORDS:C656(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("MenuReset")
			POST OUTSIDE CALL:C329(Current process:C322)
			DB_t_CurrentFormUsage2:=""
		Else 
			Gen_Alert("Purchase Orders may only be raised for Sales order Items")
			
		End if 
	Else 
		Gen_Alert("This Function can only be used from the Orders entry screen"; "Cancel")
	End if 
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders_PPPOS"; $_t_oldMethodName)
