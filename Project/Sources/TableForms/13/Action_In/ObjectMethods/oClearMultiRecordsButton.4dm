If (False:C215)
	//object Name: [ACTIONS]Action_In.oClearMultiRecordsButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2013 23:18
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_LB_Autos;0)
	C_LONGINT:C283($_l_Column; $_l_Result; $_l_Row; BMrClear; BmrModify; SD2_l_MultiModify; SD2_l_SelectedMulti; SD2_l_StaticModify)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oMultiAdd_1"; Form event code:C388)
Case of 
		
	: (SD2_l_MultiModify=1)  //Button is save clear
		LISTBOX GET CELL POSITION:C971(SD2_LB_Autos; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			LISTBOX DELETE ROWS:C914(SD2_LB_Autos; $_l_Row)
			//DELETE FROM ARRAY(SD2_al_RelationTypesS;1)
			//DELETE FROM ARRAY(SD2_at_RelationTypesS;1)
			//DELETE FROM ARRAY(SD2_al_RelationTablesS;1)
			//DELETE FROM ARRAY(SD2_at_RelationTablesS;1)
			//DELETE FROM ARRAY(SD2_al_RelationRestS;1)
			//DELETE FROM ARRAY(SD2_at_RelationRest;1)
			OBJECT SET TITLE:C194(BmrModify; "Modify")
			OBJECT SET TITLE:C194(BMrClear; "Clear")
			OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; False:C215)
			SD2_l_MultiModify:=0
			LB_SetEnterable(->SD2_LB_Autos; False:C215; 0; "")
		End if 
	: (SD2_l_MultiModify=-1) | (SD2_l_MultiModify=-2)  //Button is Remove
		LISTBOX GET CELL POSITION:C971(SD2_LB_Autos; $_l_Column; $_l_Row)
		$_l_Result:=$_l_Row
		SD2_l_SelectedMulti:=$_l_Result
		If ($_l_Row>0)
			Gen_Confirm("Are you sure you want to delete this entry")
			If (OK=1)
				LISTBOX DELETE ROWS:C914(SD2_LB_Autos; $_l_Row)
				//DELETE FROM ARRAY(SD2_al_RelationTypesS;1)
				//DELETE FROM ARRAY(SD2_at_RelationTypesS;1)
				//DELETE FROM ARRAY(SD2_al_RelationTablesS;1)
				//DELETE FROM ARRAY(SD2_at_RelationTablesS;1)
				//DELETE FROM ARRAY(SD2_al_RelationRestS;1)
				//DELETE FROM ARRAY(SD2_at_RelationRest;1)
				OBJECT SET TITLE:C194(BmrModify; "Modify")
				OBJECT SET TITLE:C194(BMrClear; "Clear")
				OBJECT SET VISIBLE:C603(*; "oMultiAdd@"; False:C215)
				SD2_l_MultiModify:=0
				LB_SetEnterable(->SD2_LB_Autos; False:C215; 0; "")
				SD2_l_MultiModify:=0
				SD2_l_SelectedMulti:=0
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oMultiAdd_1"; $_t_oldMethodName)
