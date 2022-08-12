If (False:C215)
	//object Name: [ACTIONS]Action_In.oClearStaticRecordsButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_LB_Statics;0)
	//ARRAY LONGINT(SD2_al_FieldNum;0)
	//ARRAY TEXT(SD2_at_FieldName;0)
	//ARRAY TEXT(SD2_at_RecordCode;0)
	C_LONGINT:C283($_l_SelectedRow; BStClear; BStModify; SD2_l_SelectedStatic; SD2_l_StaticModify)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oStaticAdd_5"; Form event code:C388)
Case of 
		
	: (SD2_l_StaticModify=1)  //Button is save clear
		DELETE FROM ARRAY:C228(SD2_al_FieldNum; 1)
		DELETE FROM ARRAY:C228(SD2_at_FieldName; 1)
		DELETE FROM ARRAY:C228(SD2_at_RecordCode; 1)
		OBJECT SET TITLE:C194(BStModify; "Modify")
		OBJECT SET TITLE:C194(BStClear; "Clear")
		OBJECT SET VISIBLE:C603(*; "oStaticAdd@"; False:C215)
		SD2_l_StaticModify:=0
		//AL_SetEntryOpts (SD2_l_Statics;1;0;0;0;0)
		//AL_SetEnterable (SD2_l_Statics;1;0)
		LB_SetEnterable(->SD2_LB_Statics; False:C215; 1; "")
		//AL_SetEnterable (SD2_l_Statics;2;0)
		LB_SetEnterable(->SD2_LB_Statics; False:C215; 2; "")
		//AL_UpdateArrays (SD2_l_Statics;-2)
		
	: (SD2_l_StaticModify=-1) | (SD2_l_StaticModify=-2)  //Button is Remove
		//$_l_SelectedRow:=AL_GetLine (SD2_l_Statics)  `SelectedElement
		$_l_SelectedRow:=SD2_LB_Statics
		SD2_l_SelectedStatic:=$_l_SelectedRow
		If (SD2_l_SelectedStatic>0)
			Gen_Confirm("Are you sure you want to delete this entry")
			If (OK=1)
				//AL_SetEntryOpts (SD2_l_Statics;1;0;0;0;0)
				//AL_SetEnterable (SD2_l_Statics;1;0)
				LB_SetEnterable(->SD2_LB_Statics; False:C215; 1; "")
				//AL_SetEnterable (SD2_l_Statics;2;0)
				LB_SetEnterable(->SD2_LB_Statics; False:C215; 2; "")
				//AL_UpdateArrays (SD2_l_Statics;-2)
				DELETE FROM ARRAY:C228(SD2_al_FieldNum; SD2_l_SelectedStatic)
				DELETE FROM ARRAY:C228(SD2_at_FieldName; SD2_l_SelectedStatic)
				DELETE FROM ARRAY:C228(SD2_at_RecordCode; SD2_l_SelectedStatic)
				OBJECT SET TITLE:C194(BStClear; "Clear")
				OBJECT SET TITLE:C194(BStModify; "Modify")
				OBJECT SET VISIBLE:C603(*; "oStaticAdd@"; False:C215)
				SD2_l_StaticModify:=0
				SD2_l_SelectedStatic:=0
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oStaticAdd_5"; $_t_oldMethodName)
