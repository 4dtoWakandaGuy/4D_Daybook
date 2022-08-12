//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPDelL
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
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($1; ORD_bo_IsRevision)
	C_TEXT:C284($_t_CurrentFormUsage2; $_t_oldMethodName; $2; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPDelL")

If (Not:C34(ORD_bo_IsRevision))
	
	Menu_Record("Orders PPDelL"; "Delivery Note Allocated")
	$_t_CurrentFormUsage2:=DB_t_CurrentFormUsage2
	DB_t_CurrentFormUsage2:="Alloc"
	If (Count parameters:C259>=2)
		//$1 IS A BOOLEAN IF IT IS FALSE WE HAVE THE CURRENT SELECTION OF ORDER ITEMS..THIS IS USED FROM STK_ENTERSTOCKMOVEMENT
		Orders_PPDel2("Alloc"; $1; $2)
		GET HIGHLIGHTED RECORDS:C902(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
		COPY NAMED SELECTION:C331(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$CurrentSelection")
		REDUCE SELECTION:C351(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; 0)
		USE NAMED SELECTION:C332("$CurrentSelection")
		HIGHLIGHT RECORDS:C656(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
	Else 
		Orders_PPDel2("Alloc")
	End if 
	
	DB_t_CurrentFormUsage2:=$_t_CurrentFormUsage2
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("Orders PPDelL"; $_t_oldMethodName)
