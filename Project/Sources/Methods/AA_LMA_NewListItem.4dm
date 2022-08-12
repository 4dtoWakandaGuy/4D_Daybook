//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_LMA_NewListItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2010 14:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(AA_bo_SimulateClick)
	C_LONGINT:C283($_l_CountListItems; $_l_ItemReference; $_l_ListObjectBottom; $_l_ListObjectLeft; $_l_ListObjectRight; $_l_ListObjectTop; $_l_NextItemID; $_l_SelectedListItem; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight)
	C_LONGINT:C283($_l_WindowTop; AA_HL_ListItems; AA_l_CurrentSelectedItemID)
	C_TEXT:C284($_t_ItemName; $_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_LMA_NewListItem")
//does the existing Item need saving


AA_bo_SimulateClick:=True:C214

If (AA_l_CurrentSelectedItemID#0)
	
	AA_SaveListItem(AA_l_CurrentSelectedItemID)
	
End if 

//CREATE RECORD([x_Lists])
GOTO OBJECT:C206(AA_HL_ListItems)

$_l_SelectedListItem:=Selected list items:C379(AA_HL_ListItems)
$_l_CountListItems:=Count list items:C380(AA_HL_ListItems)
Case of 
	: ($_l_CountListItems>0)
		GET LIST ITEM:C378(AA_HL_ListItems; 1; $_l_ItemReference; $_t_ItemText)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		OBJECT GET COORDINATES:C663(AA_HL_ListItems; $_l_ListObjectLeft; $_l_ListObjectTop; $_l_ListObjectRight; $_l_ListObjectBottom)
		$_l_NextItemID:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
		//APPEND TO LIST(AA_HL_ListItems;"Untitled";-$_l_NextItemID)
		$_t_ItemName:=Gen_Request("Name This item:"; ""; "Save"; "Cancel"; $_l_WindowLeft; $_l_WindowTop; "Add item")
		If (OK=0)
			$_t_ItemName:=""
		End if 
		
		If ($_t_ItemName#"")
			INSERT IN LIST:C625(AA_HL_ListItems; $_l_ItemReference; $_t_ItemName; -$_l_NextItemID)
			AA_l_CurrentSelectedItemID:=-$_l_NextItemID
			//////////////////////////////_o_REDRAW LIST(AA_HL_ListItems)  //bsw 8/09/04
			//SET LIST ITEM PROPERTIES(AA_HL_ListItems;0;True;Plain ;0)
			
			If (False:C215)
				////////////////////////////_o_REDRAW LIST(AA_HL_ListItems)
				POST EVENT:C467(Mouse down event:K17:2; 0; Tickcount:C458; ($_l_WindowLeft+$_l_ListObjectLeft+2); ($_l_WindowTop+$_l_ListObjectTop+2+((1))); Command key mask:K16:1; Current process:C322)
				POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
				//SM_bo_SimulateClick:=True
				If (False:C215)
					//: ($_l_CountListItems>0)
					GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
					
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
					
					OBJECT GET COORDINATES:C663(AA_HL_ListItems; $_l_ListObjectLeft; $_l_ListObjectTop; $_l_ListObjectRight; $_l_ListObjectBottom)
					$_l_NextItemID:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
					//APPEND TO LIST(AA_HL_ListItems;"Untitled";-$_l_NextItemID)
					INSERT IN LIST:C625(AA_HL_ListItems; $_l_ItemReference; "Untitled"; -$_l_NextItemID)
					AA_l_CurrentSelectedItemID:=-$_l_NextItemID
					//SET LIST ITEM PROPERTIES(AA_HL_ListItems;0;True;Plain ;0)
					// SELECT LIST ITEM(AA_HL_ListItems;$_l_CountListItems+1)
					//////////////////////////////_o_REDRAW LIST(AA_HL_ListItems)
					POST EVENT:C467(Mouse down event:K17:2; 0; Tickcount:C458; ($_l_WindowLeft+$_l_ListObjectLeft+2); ($_l_WindowTop+$_l_ListObjectBottom-2); Command key mask:K16:1; Current process:C322)
					POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
					//SM_bo_SimulateClick:=True
				End if 
			End if 
		Else 
			//////////////////////////////_o_REDRAW LIST(AA_HL_ListItems)
		End if 
		
	: ($_l_CountListItems=0)
		GET LIST ITEM:C378(AA_HL_ListItems; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		
		OBJECT GET COORDINATES:C663(AA_HL_ListItems; $_l_ListObjectLeft; $_l_ListObjectTop; $_l_ListObjectRight; $_l_ListObjectBottom)
		$_l_NextItemID:=AA_GetNextIDinMethod(->[LIST_ITEMS:95]X_ID:3)
		$_t_ItemName:=Gen_Request("Name This item:"; ""; "Save"; "Cancel"; $_l_WindowLeft; $_l_WindowTop; "Add item")
		If (OK=0)
			$_t_ItemName:=""
		End if 
		If ($_t_ItemName#"")
			APPEND TO LIST:C376(AA_HL_ListItems; $_t_ItemName; -$_l_NextItemID)
			AA_l_CurrentSelectedItemID:=-$_l_NextItemID
			//////////////////////////////_o_REDRAW LIST(AA_HL_ListItems)
			
			If (False:C215)
				POST EVENT:C467(Mouse down event:K17:2; 0; Tickcount:C458; ($_l_WindowLeft+$_l_ListObjectLeft+2); ($_l_WindowTop+$_l_ListObjectTop+2+(($_l_SelectedListItem*16))); Command key mask:K16:1; Current process:C322)
				POST KEY:C465(Character code:C91("A"); Command key mask:K16:1; Current process:C322)
			End if 
			//SM_bo_SimulateClick:=True
		End if 
		
End case 
AA_bo_SimulateClick:=False:C215
ERR_MethodTrackerReturn("AA_LMA_NewListItem"; $_t_oldMethodName)
