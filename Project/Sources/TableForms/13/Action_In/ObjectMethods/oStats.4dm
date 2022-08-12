If (False:C215)
	//object Name: [ACTIONS]Action_In.oStats
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
	//ARRAY LONGINT(SD2_al_StaticFieldNUMs;0)
	//ARRAY TEXT(SD2_at_FieldName;0)
	//ARRAY TEXT(SD2_at_pop;0)
	//ARRAY TEXT(SD2_at_RecordCode;0)
	//ARRAY TEXT(SD2_at_StaticFieldNames;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $Result; BStClear; BStModify; SD2_l_SelectedStatic; SD2_l_StaticModify)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.oStats"; Form event code:C388)
$_l_event:=Form event code:C388

RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
$_l_Row:=Self:C308->

Case of 
	: ($_l_event=On Clicked:K2:4)
		If ($_t_VariableName="SD2_at_RecordCode")
			EDIT ITEM:C870(Self:C308->)
			
		End if 
	: ($_l_event=On Data Change:K2:15)
		Case of 
				
			: (SD2_l_StaticModify=0)  //Button is modify
				
				If ($_l_Row>0)
					
					OBJECT SET TITLE:C194(BStModify; "Edit")
					OBJECT SET VISIBLE:C603(*; "oStaticAdd@"; True:C214)
					SD2_l_StaticModify:=-2
				End if 
			: (SD2_l_StaticModify=1)  //Button is save
				If (SD2_at_FieldName{1}#"") & (SD2_at_RecordCode{1}#"")
					Gen_Confirm("Save"+SD2_at_RecordCode{1}+"?")
					If (OK=1)
						SD2_al_FieldNum{1}:=SD2_al_StaticFieldNUMs{Find in array:C230(SD2_at_StaticFieldNames; SD2_at_FieldName{1})}
						OBJECT SET TITLE:C194(BStModify; "Modify")
						OBJECT SET TITLE:C194(BStClear; "Clear")
						OBJECT SET VISIBLE:C603(*; "oStaticAdd@"; False:C215)
						SD2_l_StaticModify:=0
						LB_SetEnterable(Self:C308; False:C215; 0)
						
						//AL_SetEntryOpts (SD2_l_Statics;1;0;0;0;0)
						//AL_SetEnterable (SD2_l_Statics;1;0)
						//AL_SetEnterable (SD2_l_Statics;2;0)
						//AL_UpdateArrays (SD2_l_Statics;-2)
					End if 
					
				Else 
					Gen_Alert("You must select a field and code, or clear")
				End if 
				
			: (SD2_l_StaticModify=-1)  //Button is save(existing item)
				If (SD2_l_SelectedStatic>0)
					If (SD2_at_FieldName{0}#SD2_at_FieldName{SD2_l_SelectedStatic}) | (SD2_at_RecordCode{0}=SD2_at_RecordCode{SD2_l_SelectedStatic})
						Gen_Confirm("Save "+SD2_at_FieldName{SD2_l_SelectedStatic})
						If (OK=1)
							SD2_al_FieldNum{SD2_l_SelectedStatic}:=SD2_al_StaticFieldNUMs{Find in array:C230(SD2_at_StaticFieldNames; SD2_at_FieldName{SD2_l_SelectedStatic})}
							OBJECT SET TITLE:C194(BStModify; "Modify")
							OBJECT SET VISIBLE:C603(*; "oStaticAdd@"; False:C215)
							SD2_l_StaticModify:=0
							SD2_l_SelectedStatic:=0
							LB_SetEnterable(Self:C308; False:C215; 0)
							
							//AL_SetEntryOpts (SD2_l_Statics;1;0;0;0;0)
							//AL_SetEnterable (SD2_l_Statics;1;0)
							//AL_SetEnterable (SD2_l_Statics;2;0)
							//AL_UpdateArrays (SD2_l_Statics;-2)
						End if 
					End if 
				Else 
					
				End if 
			: (SD2_l_StaticModify=-2)
				//Ready to edit
				
				SD2_l_SelectedStatic:=$_l_Row
				If (SD2_l_SelectedStatic>0)
					SD2_l_StaticModify:=-1
					LB_SetEnterable(Self:C308; False:C215; 0)
					ARRAY TEXT:C222(SD2_at_pop; 0)
					COPY ARRAY:C226(SD2_at_StaticFieldNames; SD2_at_pop)
					INSERT IN ARRAY:C227(SD2_al_FieldNum; 1; 1)
					INSERT IN ARRAY:C227(SD2_at_FieldName; 1; 1)
					INSERT IN ARRAY:C227(SD2_at_RecordCode; 1; 1)
					//AL_SetEntryOpts (SD2_l_Statics;2;0;0;0;0)
					//AL_SetEnterable (SD2_l_Statics;1;2;SD2_at_pop)
					
					LB_SetChoiceList("lbStatics"; ->SD2_at_pop; ->SD2_at_FieldName)
					//AL_SetEnterable (SD2_l_Statics;2;1)
					LB_SetEnterable(->SD2_LB_Statics; True:C214; 0; "")
					LB_SetEnterable(->SD2_LB_Statics; True:C214; 2; "")
					
					OBJECT SET TITLE:C194(BStModify; "Save")
					OBJECT SET TITLE:C194(BStClear; "Delete")
					OBJECT SET VISIBLE:C603(*; "oStaticAdd@"; True:C214)
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.oStats"; $_t_oldMethodName)
