If (False:C215)
	//object Name: [TRANSACTION_BATCHES]SubItemDisplay.oDeleteRelation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:48
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(ACC_at_Relations;0)
	//ARRAY TEXT(ACC_at_RelationsCode;0)
	//ARRAY TEXT(ACC_at_RelationsName;0)
	//ARRAY TEXT(ACC_at_RelationTypes;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305(GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_RelationRow; ACC_l_ItemViewContext; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; DB_t_WindowTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].SubItemDisplay.oDeleteRelation"; Form event code:C388)
If (ACC_l_ItemViewContext=1) | (ACC_l_ItemViewContext=3)
	Gen_Confirm("Are you sure you want to clear a relation?"; "Yes"; "No")
	If (OK=1)
		ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
		ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(ACC_at_RelationTypes))
		ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(ACC_at_RelationTypes))
		For ($_l_Index; 1; Size of array:C274(ACC_at_RelationTypes))
			GEN_at_DropDownMenu{$_l_Index}:=ACC_at_RelationTypes{$_l_Index}
			GEN_al_DropDownMenuID{$_l_Index}:=$_l_Index
		End for 
		
		GEN_Bo_ShowCreate:=False:C215
		DB_t_WindowTitle:="Select Item to delete"
		GEN_at_DropDownMenu:=0
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; 1986)
		DIALOG:C40([USER:15]; "Gen_PopUpChoice")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (GEN_at_DropDownMenu>0)
			$_l_RelationRow:=Find in array:C230(ACC_at_Relations; GEN_at_DropDownMenu{GEN_at_DropDownMenu})
			If ($_l_RelationRow<0)
				Gen_Alert("There is no relation of this type on this batch item")
			Else 
				DELETE FROM ARRAY:C228(ACC_at_Relations; $_l_RelationRow)
				DELETE FROM ARRAY:C228(ACC_at_RelationsCode; $_l_RelationRow)
				DELETE FROM ARRAY:C228(ACC_at_RelationsName; $_l_RelationRow)
			End if 
			//AL_UpdateArrays (ACC_l_Relations;-2)
		End if 
		
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("OBJ:SubItemDisplay,BClearRelation"; $_t_oldMethodName)
