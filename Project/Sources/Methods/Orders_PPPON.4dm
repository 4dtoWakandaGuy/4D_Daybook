//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPPON
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/05/2011 13:21
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPPON")

Menu_Record("Orders_PPPON"; "Purchase Order by No")
DB_t_CurrentFormUsage2:=""
If (Not:C34(ORD_bo_IsRevision))
	Orders_InLPA(False:C215)
	Orders_PPPO
	GET HIGHLIGHTED RECORDS:C902(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
	COPY NAMED SELECTION:C331(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$CurrentSelection")
	REDUCE SELECTION:C351(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; 0)
	USE NAMED SELECTION:C332("$CurrentSelection")
	HIGHLIGHT RECORDS:C656(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders_PPPON"; $_t_oldMethodName)