//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_MoreStuffObjectMethod
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_MoreStuffObjectMethod (->form object)
	
	// Called from the "more stuff" buttons.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : The calling object
	
	// Returns: Nothing
	
	// Created by Dave Batton on Apr 20, 2006
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:25`Method: Cal4D_MoreStuffObjectMethod
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>Cal_Lb_CalenderList;0)
	//ARRAY BOOLEAN(<>Cal4D_Lb_CalenderList;0)
	//ARRAY INTEGER(<>CAL4D_al_TrackBoxNumbers;0)
	//ARRAY LONGINT(<>Cal_al_MoreEventColors;0)
	//ARRAY LONGINT(<>Cal_al_MoreEventIDs;0)
	//ARRAY LONGINT(<>Cal_al_TrackBoxNumbers;0)
	//ARRAY LONGINT(<>Cal_al_TrackEventColors;0)
	//ARRAY LONGINT(<>Cal_al_TrackRecordEventIDs;0)
	//ARRAY LONGINT(<>Cal4D_al_MoreEventColors;0)
	//ARRAY LONGINT(<>Cal4D_al_MoreEventIDs;0)
	//ARRAY LONGINT(<>CAL4D_al_TrackEventColors;0)
	//ARRAY LONGINT(<>Cal4D_al_TrackRecordEventIDs;0)
	//ARRAY TEXT(<>Cal_at_MoreEventTitles;0)
	//ARRAY TEXT(<>Cal_at_TrackFormVarNames;0)
	//ARRAY TEXT(<>Cal4D_at_MoreEventTitles;0)
	//ARRAY TEXT(<>cal4d_at_TrackFormVarNames;0)
	C_DATE:C307($_d_SelectedDate; $_d_NewDate; $_d_SelectedDate)
	C_LONGINT:C283($_l_Bottom; $_l_BoxHeight; $_l_BoxNumber; $_l_BoxWidth; $_l_Element; $_l_left; $_l_Right; $_l_Top; $_l_WindowBottom; $_l_WindowRight; $_l_WinHeight)
	C_LONGINT:C283(<>CAL_l_SelectedBoxColor; $_l_Bottom; $_l_BoxHeight; $_l_BoxNumber; $_l_BoxWidth; $_l_Element; $_l_left; $_l_Right; $_l_Top; $_l_WindowBottom; $_l_WindowLeft)
	C_LONGINT:C283($_l_WindowRight; $_l_WinHeight)
	C_POINTER:C301($_ptr_Box; $_ptr_CurrentObject; $1; <>CAL_ptr_SelectedObject; $_ptr_Box; $_ptr_CurrentObject; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_MoreStuffObjectMethod")


$_ptr_CurrentObject:=$1

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$_l_BoxNumber:=Cal4D_GetObjectNumber($_ptr_CurrentObject)
		
		// Get a pointer to the current date's box.
		$_ptr_Box:=Get pointer:C304("<>Cal4D_l_Box"+String:C10($_l_BoxNumber; "000"))
		
		// Highlight the selected date.
		$_d_SelectedDate:=Cal4D_Cal_SelectedDate
		$_d_NewDate:=Cal4D_GetDateByBoxNumber($_l_BoxNumber)
		Cal4D_Cal_SelectedDate($_d_NewDate)
		
		// Set the background color of the list box to match the selected day background color.
		OBJECT SET RGB COLORS:C628(<>Cal_Lb_CalenderList; Foreground color:K23:1; <>CAL_l_SelectedBoxColor)
		
		// Let the user know if the selection has changed.
		If (($_d_SelectedDate#$_d_NewDate) | (Not:C34(Is nil pointer:C315(<>CAL_ptr_SelectedObject))))
			Cal4D_CallCallbackMethod(On Selection Change:K2:29; No current record:K29:2)
		End if 
		
		// Deselect any event that was previously selected.
		Cal4D_DeselectObject(<>CAL_ptr_SelectedObject)
		
		
		OBJECT GET COORDINATES:C663($_ptr_Box->; $_l_left; $_l_Top; $_l_Right; $_l_Bottom)
		$_l_BoxWidth:=$_l_Right-$_l_left
		$_l_BoxHeight:=$_l_Bottom-$_l_Top
		If (Is Windows:C1573)
			$_l_Top:=$_l_Top+17  // Just trial and error.
			$_l_left:=$_l_left+2
		Else 
			$_l_Top:=$_l_Top+18
			$_l_left:=$_l_left+1
		End if 
		
		If (($_l_Right-$_l_left)<100)  // Make sure it's a useable width.
			$_l_Right:=$_l_left+150
		End if 
		
		While (($_l_Bottom-$_l_Top)<70)  // Make sure it's a useable height.
			$_l_Bottom:=$_l_Bottom+$_l_BoxHeight+1  // Extend it fully into the box below it.
		End while 
		
		// Now move the list box so it's fully visible.
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WinHeight; $_l_WindowRight; $_l_WindowBottom)
		If ($_l_Bottom>($_l_WindowBottom-$_l_WinHeight))
			$_l_BoxHeight:=$_l_Bottom-$_l_Top
			$_l_Bottom:=($_l_WindowBottom-$_l_WinHeight)
			$_l_Top:=$_l_Bottom-$_l_BoxHeight
		End if 
		If ($_l_Right>($_l_WindowRight-$_l_WindowLeft))
			$_l_BoxWidth:=$_l_Right-$_l_left
			$_l_Right:=($_l_WindowRight-$_l_WindowLeft)
			$_l_left:=$_l_Right-$_l_BoxHeight
		End if 
		
		OBJECT MOVE:C664(<>Cal_Lb_CalenderList; $_l_left; $_l_Top; $_l_Right; $_l_Bottom; *)
		
		ARRAY LONGINT:C221(<>Cal_al_MoreEventIDs; 0)
		ARRAY TEXT:C222(<>Cal_at_MoreEventTitles; 0)
		ARRAY LONGINT:C221(<>Cal_al_MoreEventColors; 0)
		
		For ($_l_Element; 1; Size of array:C274(<>Cal_al_TrackBoxNumbers))
			If (<>Cal_al_TrackBoxNumbers{$_l_Element}=$_l_BoxNumber)
				APPEND TO ARRAY:C911(<>Cal_al_MoreEventIDs; <>Cal_al_TrackRecordEventIDs{$_l_Element})
				$_ptr_CurrentObject:=Get pointer:C304("<>"+<>Cal_at_TrackFormVarNames{$_l_Element})
				APPEND TO ARRAY:C911(<>Cal_at_MoreEventTitles; $_ptr_CurrentObject->)
				APPEND TO ARRAY:C911(<>Cal_al_MoreEventColors; <>Cal_al_TrackEventColors{$_l_Element})
			End if 
		End for 
		
		ARRAY BOOLEAN:C223(<>Cal_Lb_CalenderList; Size of array:C274(<>Cal_al_MoreEventIDs))
		LISTBOX SELECT ROW:C912(<>Cal_Lb_CalenderList; 0; 2)
		OBJECT SET SCROLL POSITION:C906(<>Cal_Lb_CalenderList; 1; *)
		
		// Show the list box.
		OBJECT SET VISIBLE:C603(<>Cal_Lb_CalenderList; True:C214)
End case 
ERR_MethodTrackerReturn("Cal4D_MoreStuffObjectMethod"; $_t_oldMethodName)
