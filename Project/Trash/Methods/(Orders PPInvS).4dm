//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPInvS
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
	//Array LONGINT(ORD_al_ViewTableToTable;0)
	//Array TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305(ORD_bo_IsRevision)
	C_LONGINT:C283(DB_l_ButtonClickedFunction)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPInvS")
Menu_Record("Orders PPInvS"; "Invoice Selected")
If (Not:C34(ORD_bo_IsRevision))
	
	If (BUT_p_ButtonStringPointer->="IO@")
		If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
			DB_t_CurrentFormUsage2:="Sel"
			
			Orders_PPInv2
			DB_t_CurrentFormUsage2:=""
			GET HIGHLIGHTED RECORDS:C902(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
			COPY NAMED SELECTION:C331(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$CurrentSelection")
			REDUCE SELECTION:C351(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; 0)
			USE NAMED SELECTION:C332("$CurrentSelection")
			HIGHLIGHT RECORDS:C656(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
			DB_l_ButtonClickedFunction:=DB_GetButtonFunction("MenuReset")
			POST OUTSIDE CALL:C329(Current process:C322)
		Else 
			Gen_Alert("Invoices may only be raised  for Sales order Items")
		End if 
	Else 
		Gen_Alert("This Function can only be used from the Orders entry screen"; "Cancel")
	End if 
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders PPInvS"; $_t_oldMethodName)