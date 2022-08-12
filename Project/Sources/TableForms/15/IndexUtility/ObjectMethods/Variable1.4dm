If (False:C215)
	//object Name: [USER]IndexUtility.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Enterable; $_bo_Expanded)
	C_LONGINT:C283(<>CIM_vlhlList; $_l_FieldNumber; $_l_Icon; $_l_ItemReference; $_l_SelectedListItem; $_l_Style; $_l_SublistID; $_l_TableNumber)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].IndexUtility.Variable1"; Form event code:C388)


$_l_SelectedListItem:=Selected list items:C379(<>CIM_vlhlList)
//TRACE
If ($_l_SelectedListItem>0)
	
	GET LIST ITEM:C378(<>CIM_vlhlList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
	
	If ($_l_ItemReference>1000)
		
		GET LIST ITEM PROPERTIES:C631(<>CIM_vlhlList; $_l_ItemReference; $_bo_Enterable; $_l_Style; $_l_Icon)
		If ($_l_Style=Bold:K14:2)
			
			SET LIST ITEM PROPERTIES:C386(<>CIM_vlhlList; $_l_ItemReference; False:C215; Plain:K14:1; 865)
			//////_o_REDRAW LIST(<>CIM_vlhlList)
			
			$_l_TableNumber:=$_l_ItemReference/1000
			$_l_FieldNumber:=$_l_ItemReference%1000
			
			//     GtDeleteArrayelement (Field($_l_TableNumber;$_l_FieldNumber);->◊CIM_tpFieldToProces
		Else 
			
			SET LIST ITEM PROPERTIES:C386(<>CIM_vlhlList; $_l_ItemReference; False:C215; Bold:K14:2; 865)
			//////_o_REDRAW LIST(<>CIM_vlhlList)
			
			$_l_TableNumber:=$_l_ItemReference/1000
			$_l_FieldNumber:=$_l_ItemReference%1000
			
			//     GtAddArrayElement (Field($_l_TableNumber;$_l_FieldNumber);->◊CIM_tpFieldToProcess)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].IndexUtility.Variable1"; $_t_oldMethodName)
