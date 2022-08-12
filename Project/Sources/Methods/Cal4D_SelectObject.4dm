//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_SelectObject
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_SelectObject (->form object)
	
	// This method selects the specified object on the calendar by placing
	//   one of our selection rectangle objects around it.
	// See also Cal4D_DeselectObject.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : The form object to select
	
	// Returns: Nothing
	
	// Created by Dave Batton on Aug 5, 2004
	//------------------ Revision Control ----------------
	//Date Created: 20/12/2009 14:13`Method: Cal4D_SelectObject
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_EventIDs;0)
	ARRAY TEXT:C222($_at_VariableNames; 0)
	//ARRAY TEXT(SD2_at_FormVarNames;0)
	C_DATE:C307($_d_EndDate; $_d_StartDate)
	C_LONGINT:C283(<>CAL_l_DragSelectL; <>CAL_l_DragSelectR; <>CAL_l_SemaphoreTimeout; $_l_colour; $_l_element; $_l_eventID; $_l_GroupID; $_l_NextRectangle; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectNumber)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop)
	C_POINTER:C301(<>CAL_ptr_SelectedObject; $_Ptr_object; $_ptr_RelatedObject; $1)
	C_TEXT:C284(<>CAL_t_SemaphoreName; $_t_oldMethodName; $_t_Title; $_t_Type)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_SelectObject")

$_Ptr_object:=$1

// First, deselect the currently selected object (if any).
Cal4D_DeselectObject(<>CAL_ptr_SelectedObject)


If (Not:C34(Is nil pointer:C315($_Ptr_object)))  // Just to be safe.
	<>CAL_ptr_SelectedObject:=$_Ptr_object
	
	$_l_eventID:=Cal4D_GetEventIDfromFormObject($_Ptr_object)
	Cal4D_Event_GetData($_l_eventID; ->$_t_Type; ->$_t_Title; ->$_d_StartDate; ->$_ti_StartTime; ->$_d_EndDate; ->$_ti_EndTime; ->$_l_colour; ->$_l_GroupID)
	
	Case of 
		: ($_t_Type="Banner")
			If (Not:C34(Semaphore:C143(<>CAL_t_SemaphoreName; <>CAL_l_SemaphoreTimeout)))
				// Since a banner may span multiple rows, we need to select all other variable
				//   objects associated with this event.
				$_l_element:=0
				$_l_NextRectangle:=1
				$_l_colour:=Cal4D_Util_ModifyColor($_l_colour; 0x0033)  // Get a modified color to use for the ends of the banner.
				
				Repeat 
					$_l_element:=Find in array:C230(SD2_al_EventIDs; $_l_eventID; $_l_element+1)
					If ($_l_element>0)
						$_ptr_RelatedObject:=Get pointer:C304("<>"+SD2_at_FormVarNames{$_l_element})  // "<>" works on Mac and Win.
						OBJECT GET COORDINATES:C663($_ptr_RelatedObject->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
						
						Case of 
							: (SD2_at_FormVarNames{$_l_element}="Cal4D_DragButtonLeft@")
								Cal4D_SetObjectColor(-><>CAL_l_DragSelectL; $_t_Type; $_d_StartDate; $_l_colour)
								OBJECT MOVE:C664(<>CAL_l_DragSelectL; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
								
							: (SD2_at_FormVarNames{$_l_element}="Cal4D_DragButtonRight@")
								Cal4D_SetObjectColor(-><>CAL_l_DragSelectR; $_t_Type; $_d_StartDate; $_l_colour)
								OBJECT MOVE:C664(<>CAL_l_DragSelectR; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom; *)
								
							Else 
								OBJECT MOVE:C664(*; "Cal4D_SelectRect"+String:C10($_l_NextRectangle); $_l_ObjectLeft-2; $_l_ObjectTop-2; $_l_ObjectRight+2; $_l_ObjectBottom+2; *)
								$_l_NextRectangle:=$_l_NextRectangle+1
						End case 
						
					End if 
				Until ($_l_element<1)
				CLEAR SEMAPHORE:C144(<>CAL_t_SemaphoreName)
			End if 
			
			
		Else   // It's a "Text" variable object.
			ARRAY TEXT:C222($_at_VariableNames; 0)
			Cal4D_GetFormObjectsFromEventID($_l_eventID; ->$_at_VariableNames)
			
			For ($_l_ObjectNumber; 1; Size of array:C274($_at_VariableNames))
				$_Ptr_object:=Get pointer:C304("<>"+$_at_VariableNames{$_l_ObjectNumber})
				OBJECT GET COORDINATES:C663($_Ptr_object->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				OBJECT MOVE:C664(*; "Cal4D_SelectRect"+String:C10($_l_ObjectNumber); $_l_ObjectLeft-2; $_l_ObjectTop-2; $_l_ObjectRight+2; $_l_ObjectBottom+2; *)
			End for 
	End case 
	
End if 
ERR_MethodTrackerReturn("Cal4D_SelectObject"; $_t_oldMethodName)