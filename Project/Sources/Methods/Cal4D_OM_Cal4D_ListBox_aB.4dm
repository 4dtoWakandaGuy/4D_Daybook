//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_Cal4D_ListBox_aB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/12/2009 15:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Cal_abo_CalenderList;0)
	//ARRAY BOOLEAN(<>Cal_Lb_CalenderList;0)
	//ARRAY BOOLEAN(<>CAL4D_abo_CalenderList;0)
	//ARRAY BOOLEAN(<>Cal4D_Lb_CalenderList;0)
	//ARRAY LONGINT(<>Cal_al_MoreEventIDs;0)
	//ARRAY LONGINT(<>Cal4D_al_MoreEventIDs;0)
	ARRAY TEXT:C222($_at_FormObjectVarNames; 0)
	C_LONGINT:C283(<>CAL_l_DeleteButton; $_l_eventID; $_l_Row)
	C_POINTER:C301(<>CAL_ptr_Nil; <>CAL_ptr_SelectedObject)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_Cal4D_ListBox_aB")


ARRAY BOOLEAN:C223(<>Cal_abo_CalenderList; 0)


Case of 
	: (Form event code:C388=On Selection Change:K2:29)
		<>CAL_ptr_SelectedObject:=<>CAL_ptr_Nil
		OBJECT SET ENABLED:C1123(<>CAL_l_DeleteButton; False:C215)
		//_O_DISABLE BUTTON(<>CAL_l_DeleteButton)
		
		$_l_Row:=Find in array:C230(<>Cal_abo_CalenderList; True:C214)
		
		If ($_l_Row>0)
			$_l_eventID:=<>Cal_al_MoreEventIDs{$_l_Row}  // See Cal4D_MoreStuffObjectMethod.
			Cal4D_CallCallbackMethod(On Selection Change:K2:29; $_l_eventID)
			
			// We're going to tell ourselves that one of the regular form event objects is selected (even though it's not visible now).
			ARRAY TEXT:C222($_at_FormObjectVarNames; 0)
			Cal4D_GetFormObjectsFromEventID($_l_eventID; ->$_at_FormObjectVarNames)
			If (Size of array:C274($_at_FormObjectVarNames)>0)
				<>CAL_ptr_SelectedObject:=Get pointer:C304("<>"+$_at_FormObjectVarNames{1})
				//_O_ENABLE BUTTON(<>Cal4D_l_DeleteButton)
				OBJECT SET ENABLED:C1123(<>CAL_l_DeleteButton; True:C214)
			End if 
			
		Else 
			Cal4D_CallCallbackMethod(On Selection Change:K2:29; No current record:K29:2)
		End if 
		
		
	: (Form event code:C388=On Double Clicked:K2:5)
		$_l_Row:=Find in array:C230(<>Cal_Lb_CalenderList; True:C214)
		
		If ($_l_Row>0)
			$_l_eventID:=<>Cal_al_MoreEventIDs{$_l_Row}
			
			If ($_l_eventID<0)  // Our records have negative IDs. Temporary events have positive IDs.
				Cal4D_Event_Edit($_l_eventID)
			Else 
				Cal4D_CallCallbackMethod(On Double Clicked:K2:5; $_l_eventID)
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("Cal4D_OM_Cal4D_ListBox_aB"; $_t_oldMethodName)