//%attributes = {}

If (False:C215)
	//Project Method Name:      WS_AutoscreenSize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>INT_al_FormHeight;0)
	//ARRAY LONGINT(<>INT_al_FormWidth;0)
	ARRAY LONGINT:C221($_al_ScreenBottom; 0)
	ARRAY LONGINT:C221($_al_ScreenLeft; 0)
	ARRAY LONGINT:C221($_al_ScreenRight; 0)
	ARRAY LONGINT:C221($_al_ScreenTop; 0)
	//ARRAY TEXT(<>INT_at_FormNames;0)
	C_BOOLEAN:C305(<>INT_FormSIzesInited; $_bo_AllowForDock; DB_bo_hasScrollBars; DB_bo_NoPallettes; SYS_bo_NoTrack)
	C_LONGINT:C283(<>ButtonBarPosition; <>ModulBarPosition; <>ModulePalbot; <>ModulePalLeft; <>ModulePalRight; <>ModulePalTop; <>PER_l_CurrentUserID; $_l_Bottom; $_l_ButtonBarPosition; $_l_CurrentScreenBottom; $_l_CurrentScreenHeight)
	C_LONGINT:C283($_l_CurrentScreenLeft; $_l_CUrrentScreenRight; $_l_CurrentScreenTop; $_l_CurrentScreenWidth; $_l_CurrentWindowBottom; $_l_CurrentWindowLeft; $_l_CurrentWindowRight; $_l_CurrentWindowTop; $_l_CurrentWindowWIdth; $_l_DockAllowance; $_l_DockLB)
	C_LONGINT:C283($_l_DockLL; $_l_DockLR; $_l_Edge; $_l_FormRow; $_l_GetBottom; $_l_GetLeft; $_l_GetRight; $_l_GetSizes; $_l_GetTop; $_l_HalfHeight; $_l_HalfWindow)
	C_LONGINT:C283($_l_Height; $_l_HeightDIfference; $_l_Heightis; $_l_Left; $_l_MaxBottom; $_l_MaxRIght; $_l_MaxWidth; $_l_MenuBarScreen; $_l_MinimumLeft; $_l_MinimumTop; $_l_ModuleBarPosition)
	C_LONGINT:C283($_l_NumberOfMonitors; $_l_RIght; $_l_ScreenCentreVertical; $_l_ScreenCetreHorizontal; $_l_ScreenNumber; $_l_SetBottom; $_l_SetLeft; $_l_SetRightPosition; $_l_SetTop; $_l_Shift; $_l_ShiftLeft)
	C_LONGINT:C283($_l_Top; $_l_WIdthDIfference; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $4)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("WS_AutoscreenSize")

GET WINDOW RECT:C443($_l_CurrentWindowLeft; $_l_CurrentWindowTop; $_l_CurrentWindowRight; $_l_CurrentWindowBottom)
$_l_MenuBarScreen:=Menu bar screen:C441
SCREEN COORDINATES:C438($_l_Left; $_l_Top; $_l_RIght; $_l_Bottom; $_l_MenuBarScreen)
$_l_NumberOfMonitors:=Count screens:C437
$_l_ScreenNumber:=0


$_l_CurrentScreenHeight:=$_l_Bottom-$_l_Top
$_l_CurrentScreenWidth:=$_l_RIght-$_l_Left
For ($_l_GetSizes; 1; $_l_NumberOfMonitors)
	SCREEN COORDINATES:C438($_l_left; $_l_top; $_l_right; $_l_bottom; $_l_GetSizes)
	APPEND TO ARRAY:C911($_al_ScreenLeft; $_l_left)
	APPEND TO ARRAY:C911($_al_ScreenTop; $_l_top)
	APPEND TO ARRAY:C911($_al_ScreenRight; $_l_right)
	APPEND TO ARRAY:C911($_al_ScreenBottom; $_l_bottom)
	If ($_l_CurrentWindowTop>=$_l_top) & ($_l_CurrentWindowTop<=$_l_bottom) & ($_l_CurrentWindowLeft>=$_l_left) & ($_l_CurrentWindowLeft<=$_l_right)
		$_l_ScreenNumber:=$_l_GetSizes
		$_l_CurrentScreenHeight:=$_l_bottom-$_l_top
		$_l_CurrentScreenWidth:=$_l_right-$_l_left
		$_l_CurrentScreenTop:=$_l_top
		$_l_CurrentScreenLeft:=$_l_left
		$_l_CUrrentScreenRight:=$_l_right
		$_l_CurrentScreenBottom:=$_l_bottom
		//this is the screen we are on-we keep within the bounds of this screen
		//$_l_minLeftAllow:=
	End if 
End for 
<>ModulBarPosition:=1
<>ButtonBarPosition:=2
If ($_l_ScreenNumber=$_l_MenuBarScreen)
	$_bo_AllowForDock:=True:C214
	$_l_ModuleBarPosition:=<>ModulBarPosition
	$_l_ButtonBarPosition:=<>ButtonBarPosition
Else 
	$_l_ModuleBarPosition:=0
	$_l_ButtonBarPosition:=0
End if 
If (<>ModulePalbot=0)
	<>ModulePalLeft:=0
	<>ModulePalTop:=0
	<>ModulePalRight:=500
	<>ModulePalBot:=40
End if 

//`$3=Width
If (Not:C34(SYS_bo_NoTrack))
	$_t_oldMethodName:=ERR_MethodTracker("WS_AutoscreenSize")
End if 



//values for this are

If ($_l_MenuBarScreen<=1) & ($_bo_AllowForDock)
	$_l_DockAllowance:=INT_GetDock("A"; ->$_l_DockLB; ->$_l_DockLR; ->$_l_DockLL)
End if   //1=TOP
GET WINDOW RECT:C443($_l_CurrentWindowLeft; $_l_CurrentWindowTop; $_l_CurrentWindowRight; $_l_CurrentWindowBottom)
//2=Side Left
//3=Side Right
//4=Bottom
//0=Hidden
//Yes currently it is stuck at the top=but I want to change it
//$2=Default Height
//$3=default width
If (Count parameters:C259>=3)
	If (Not:C34(DB_bo_NoPallettes))
		$_l_MinimumLeft:=(80*(Num:C11($_l_ButtonBarPosition=2)))+$_l_DockLL
		If ($_l_MinimumLeft<80)
			$_l_MinimumLeft:=(30*(Num:C11($_l_ModuleBarPosition=2)))+$_l_DockLL
		End if 
		$_l_MinimumTop:=42*(Num:C11($_l_ModuleBarPosition=1))+38  //40  `Rollo 25/11/2004
		If ($_l_MinimumTop<(42+38))  //40
			$_l_MinimumTop:=42*(Num:C11($_l_ModuleBarPosition=1))+38
			
			
		End if 
	Else 
		$_l_MinimumLeft:=$_l_DockLL
		$_l_MinimumTop:=44
		
	End if 
	$_l_MinimumTop:=$_l_CurrentScreenTop+$_l_MinimumTop
	
	$_l_MinimumLeft:=$_l_CurrentScreenLeft+$_l_MinimumLeft
	$_l_MaxRIght:=(30*(Num:C11($_l_ButtonBarPosition=3)))-$_l_DockLR
	If ($_l_MaxRIght<30)
		$_l_MaxRIght:=(30*(Num:C11($_l_ModuleBarPosition=3)))-$_l_DockLR
	End if 
	
	$_l_MaxBottom:=$_l_CurrentScreenHeight-($_l_DockLB+20)
	
	If ($_l_MaxBottom<30)
		$_l_MaxBottom:=30
	End if 
	// If ($2>0)
	// GET WINDOW RECT($_l_CurrentWindowLeft;$_l_CurrentWindowTop;$_l_CurrentWindowRight;$_l_CurrentWindowBottom;$2)
	//Else
	GET WINDOW RECT:C443($_l_CurrentWindowLeft; $_l_CurrentWindowTop; $_l_CurrentWindowRight; $_l_CurrentWindowBottom)
	// End if
	
	
	Case of 
		: ($1=1)
			If (Not:C34(<>INT_FormSIzesInited))
				INT_LoadFormSizes(<>PER_l_CurrentUserID)
			End if 
			If (Count parameters:C259>=4)
				$_l_FormRow:=Find in array:C230(<>INT_at_FormNames; $4)
				If ($_l_FormRow>0)
					$_l_MaxWidth:=<>INT_al_FormWidth{$_l_FormRow}
				Else 
					$_l_MaxWidth:=$3
				End if 
				
			Else 
				$_l_MaxWidth:=$3
			End if 
			
			
			//Set to full reach bottom of screen
			//The window width is passed in parameter 3-that is not changed
			
			$_l_CurrentWindowWIdth:=$_l_CurrentWindowRight-$_l_CurrentWindowLeft
			
			If ($_l_CurrentWindowWIdth#$_l_MaxWidth)  //Window is wrong size
				//Window width must be changed
				$_l_SetRightPosition:=$_l_CurrentWindowLeft+$_l_MaxWidth
			Else 
				$_l_SetRightPosition:=$_l_CurrentWindowRight
			End if 
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth-$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_DockLR))-5
				$_l_CurrentWindowLeft:=$_l_CurrentWindowLeft-$_l_ShiftLeft
				If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
					$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+5
					$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				End if 
				$_l_SetRightPosition:=$_l_SetRightPosition-$_l_ShiftLeft
				//if that is too far the next bit will adjust it
			End if 
			
			$_l_Shift:=0
			If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
				$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+5
				$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				$_l_SetRightPosition:=$_l_SetRightPosition+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentWindowLeft
			End if 
			
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-5
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_MaxRIght)-5)<$_l_MinimumLeft)
						$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-5
					Else 
						$_l_Shift:=$_l_SetRightPosition-(($_l_CurrentScreenWidth-$_l_MaxRIght)-5)
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRightPosition:=$_l_SetRightPosition-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinimumTop:=38
			End if 
			If ($_l_CurrentWindowTop<$_l_MinimumTop)
				$_l_SetTop:=$_l_MinimumTop+5
			Else 
				$_l_SetTop:=$_l_CurrentWindowTop
			End if 
			$_l_SetBottom:=$_l_MaxBottom
			
		: ($1=2)
			//Fixed size but not positioned
			//
			//The window width is passed in parameter 3-that is not changed
			
			$_l_Edge:=10  //Rollo 25/11/2004 - was 5, hardcodedly below
			$_l_CurrentWindowWIdth:=$_l_CurrentWindowRight-$_l_CurrentWindowLeft
			
			If ($_l_CurrentWindowWIdth#$3)  //Window is wrong size
				//Window width must be changed
				$_l_SetRightPosition:=$_l_CurrentWindowLeft+$3
			Else 
				$_l_SetRightPosition:=$_l_CurrentWindowRight
			End if 
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth-$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_DockLR))-$_l_Edge  //Rollo 25/11/2004 - no - Paletters should go right to the edge
				$_l_CurrentWindowLeft:=$_l_CurrentWindowLeft-$_l_ShiftLeft
				If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
					$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+$_l_Edge  //Rollo 25/11/2004
					$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				End if 
				$_l_SetRightPosition:=$_l_CurrentWindowLeft+$3
				//if that is too far the next bit will adjust it
			End if 
			
			
			$_l_Shift:=0
			If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
				$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+$_l_Edge  //Rollo 25/11/2004
				$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				$_l_SetRightPosition:=$_l_SetRightPosition+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentWindowLeft
			End if 
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-$_l_Edge  //Rollo 25/11/2004
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_MaxRIght)-$_l_Edge)<$_l_MinimumLeft)  //Rollo 25/11/2004
						$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-$_l_Edge  //Rollo 25/11/2004
					Else 
						$_l_Shift:=$_l_SetRightPosition-(($_l_CurrentScreenWidth-$_l_MaxRIght)-$_l_Edge)  //Rollo 25/11/2004
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRightPosition:=$_l_SetRightPosition-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinimumTop:=38
			End if 
			
			If ($_l_CurrentWindowTop<$_l_MinimumTop)
				$_l_SetTop:=$_l_MinimumTop+$_l_Edge  //Rollo 25/11/2004
			Else 
				$_l_SetTop:=$_l_CurrentWindowTop
			End if 
			$_l_SetBottom:=$_l_SetTop+$2
			If ($_l_SetBottom>($_l_MaxBottom))
				$_l_Shift:=$_l_SetBottom-((($_l_CurrentScreenHeight-$_l_DockLB))-$_l_Edge)
				
				//Window will be too far down
				//however if we shift it now it could go too high
				If (($_l_SetTop-$_l_Shift)<$_l_MinimumTop)
					$_l_SetBottom:=((($_l_CurrentScreenHeight-$_l_DockLB))-$_l_Edge)
					$_l_SetTop:=$_l_MinimumTop
				Else 
					$_l_SetBottom:=((($_l_CurrentScreenHeight-$_l_DockLB))-$_l_Edge)
					If ($_l_CurrentWindowBottom<$_l_SetBottom)
						$_l_SetTop:=$_l_SetTop-$_l_Shift
					Else 
						$_l_Shift:=$_l_CurrentWindowBottom-$_l_SetBottom
						$_l_SetTop:=$_l_SetTop-$_l_Shift
					End if 
				End if 
			End if 
			
		: ($1=3)
			//$2=HEIGHT
			//$3=WIDTH
			$_l_ScreenCentreVertical:=$_l_CurrentScreenWidth/2
			$_l_HalfWindow:=Int:C8($3/2)
			$_l_SetLeft:=$_l_ScreenCentreVertical-$_l_HalfWindow
			$_l_SetRightPosition:=$_l_ScreenCentreVertical+$_l_HalfWindow
			$_l_ScreenCetreHorizontal:=$_l_CurrentScreenHeight/2
			$_l_HalfHeight:=Int:C8($2/2)
			$_l_SetTop:=$_l_ScreenCetreHorizontal-$_l_HalfHeight
			$_l_SetBottom:=$_l_ScreenCetreHorizontal+$_l_HalfHeight
			
		: ($1=4)
			If (Not:C34(<>INT_FormSIzesInited))
				INT_LoadFormSizes(<>PER_l_CurrentUserID)
			End if 
			$_l_SetBottom:=$_l_CurrentWindowBottom
			//Resizable to full reach bottom of screen
			//The window width is passed in parameter 3-that is not changed
			If (Count parameters:C259>=4)
				$_l_FormRow:=Find in array:C230(<>INT_at_FormNames; $4)
				If ($_l_FormRow>0)
					$_l_MaxWidth:=<>INT_al_FormWidth{$_l_FormRow}  //+34  `Rollo 12/8/2004 - are all a bit wider now
					$_l_SetBottom:=<>INT_al_FormHeight{$_l_FormRow}+$_l_CurrentWindowTop  //NG took the  34 away..the screen get 34 wider every time the user opens it!!!
				Else 
					
					$_l_MaxWidth:=$3
				End if 
				
			Else 
				$_l_MaxWidth:=$3
			End if 
			$_l_CurrentWindowWIdth:=$_l_CurrentWindowRight-$_l_CurrentWindowLeft
			
			If ($_l_CurrentWindowWIdth#$_l_MaxWidth)  //Window is wrong size
				//Window width must be changed
				$_l_SetRightPosition:=$_l_CurrentWindowLeft+$_l_MaxWidth
			Else 
				$_l_SetRightPosition:=$_l_CurrentWindowRight
			End if 
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth--$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_DockLR))-5
				$_l_CurrentWindowLeft:=$_l_CurrentWindowLeft-$_l_ShiftLeft
				If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
					$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+5
					$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				End if 
				$_l_SetRightPosition:=$_l_SetRightPosition-$_l_ShiftLeft
				//if that is too far the next bit will adjust it
			End if 
			
			$_l_Shift:=0
			If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
				$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+5
				$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				$_l_SetRightPosition:=$_l_SetRightPosition+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentWindowLeft
			End if 
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-5
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_MaxRIght)-5)<$_l_MinimumLeft)
						$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-5
					Else 
						$_l_Shift:=$_l_SetRightPosition-(($_l_CurrentScreenWidth-$_l_MaxRIght)-5)
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRightPosition:=$_l_SetRightPosition-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinimumTop:=38
			End if 
			
			If ($_l_CurrentWindowTop<$_l_MinimumTop)
				$_l_SetTop:=$_l_MinimumTop+5
			Else 
				$_l_SetTop:=$_l_CurrentWindowTop
			End if 
			If ($_l_CurrentWindowBottom>($_l_MaxBottom))
				If ($_l_SetBottom=$_l_CurrentWindowBottom)
					$_l_SetBottom:=($_l_MaxBottom)-5
				End if 
			End if 
		: ($1=5)  //Like 2
			//Top is positioned
			//Fixed size but not positioned
			//
			//The window width is passed in parameter 3-that is not changed
			
			$_l_CurrentWindowWIdth:=$_l_CurrentWindowRight-$_l_CurrentWindowLeft
			
			If ($_l_CurrentWindowWIdth#$3)  //Window is wrong size
				//Window width must be changed
				$_l_SetRightPosition:=$_l_CurrentWindowLeft+$3
			Else 
				$_l_SetRightPosition:=$_l_CurrentWindowRight
			End if 
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth-$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_DockLR))-5
				$_l_CurrentWindowLeft:=$_l_CurrentWindowLeft-$_l_ShiftLeft
				If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
					$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+5
					$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				End if 
				$_l_SetRightPosition:=$_l_SetRightPosition-$_l_ShiftLeft
				//if that is too far the next bit will adjust it
			End if 
			
			$_l_Shift:=0
			If ($_l_CurrentWindowLeft<$_l_MinimumLeft)  //window is too far left
				$_l_Shift:=$_l_MinimumLeft-$_l_CurrentWindowLeft+5
				$_l_SetLeft:=$_l_CurrentWindowLeft+$_l_Shift
				$_l_SetRightPosition:=$_l_SetRightPosition+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentWindowLeft
			End if 
			If ($_l_SetRightPosition>($_l_CurrentScreenWidth-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-5
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRightPosition-($_l_CurrentScreenWidth-$_l_MaxRIght)-5)<$_l_MinimumLeft)
						$_l_SetRightPosition:=($_l_CurrentScreenWidth-$_l_MaxRIght)-5
					Else 
						$_l_Shift:=$_l_SetRightPosition-(($_l_CurrentScreenWidth-$_l_MaxRIght)-5)
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRightPosition:=$_l_SetRightPosition-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinimumTop:=38
			End if 
			
			If ($_l_CurrentWindowTop<$_l_MinimumTop)
				$_l_SetTop:=$_l_MinimumTop+5
			Else 
				$_l_SetTop:=$_l_CurrentWindowTop
			End if 
			$_l_SetBottom:=$_l_SetTop+$2
			If ($_l_SetBottom>($_l_MaxBottom))
				$_l_Shift:=$_l_SetBottom-((($_l_CurrentScreenHeight-$_l_DockLB))-5)
				
				//Window will be too far down
				//however if we shift it now it could go too high
				If (($_l_SetTop-$_l_Shift)<$_l_MinimumTop)
					$_l_SetBottom:=(($_l_CurrentScreenHeight-$_l_DockLB)-5)
					//$_l_SetTop:=$_l_MinimumTop
				Else 
					$_l_SetTop:=$_l_SetTop-$_l_Shift
					$_l_SetBottom:=(($_l_CurrentScreenHeight-$_l_DockLB)-5)
					If ($_l_CurrentWindowBottom<$_l_SetBottom)
					Else 
						
						$_l_Shift:=$_l_CurrentWindowBottom-$_l_SetBottom
						//$_l_SetTop:=$_l_SetTop-$_l_Shift
					End if 
				End if 
				
				
				
			End if 
	End case 
	
	If ($_l_CurrentWindowLeft#$_l_SetLeft) | ($_l_CurrentWindowTop#$_l_SetTop) | ($_l_CurrentWindowRight#$_l_SetRightPosition) | ($_l_CurrentWindowBottom#$_l_SetBottom)
		//Need to move window
		// If ($2>0)
		// SET WINDOW RECT($_l_SetLeft;$_l_SetTop;$_l_SetRightPosition;$_l_SetBottom;$2)
		//Else
		//12/07/04 NG/PB/BSW - called twice as there is a bug in 4d 2003
		If (False:C215)
			SET WINDOW RECT:C444($_l_SetLeft; $_l_SetTop; $_l_SetRightPosition; $_l_SetBottom)
			SET WINDOW RECT:C444($_l_SetLeft; $_l_SetTop; $_l_SetRightPosition; $_l_SetBottom)
		Else 
			//SET WINDOW RECT($_l_SetLeft;$_l_SetTop;$_l_SetRightPosition;$_l_SetBottom)
			// 03/07/06 pb - RESIZE FORM SIZE takes object properties into account
			//$currentwidth:=$_l_CurrentWindowRight-$_l_CurrentWindowLeft
			//$newwidth:=$_l_SetRightPosition-$_l_SetLeft
			//$_l_CurrentHeight:=$_l_CurrentWindowBottom-$_l_CurrentWindowTop
			//$newheight:=$_l_SetBottom-$_l_SetTop
			$_l_WIdthDIfference:=1
			$_l_HeightDIfference:=1
			
			RESIZE FORM WINDOW:C890($_l_WIdthDIfference; $_l_HeightDIfference)
			SET WINDOW RECT:C444($_l_SetLeft; $_l_SetTop; $_l_SetRightPosition; $_l_SetBottom)
			$_l_Height:=$_l_SetBottom-$_l_SetTop
			GET WINDOW RECT:C443($_l_GetLeft; $_l_GetTop; $_l_GetRight; $_l_GetBottom)
			$_l_Heightis:=$_l_GetBottom-$_l_GetTop
			If ($_l_Heightis#$_l_Height)
				SET WINDOW RECT:C444($_l_SetLeft; $_l_SetTop; $_l_SetRightPosition; $_l_SetBottom)
			End if 
		End if 
	End if 
	
End if 


If (DB_bo_hasScrollBars)
	//SET FORM SIZE(20;20;*)
Else 
	//SET FORM SIZE(20;20;*)
End if 
ERR_MethodTrackerReturn("WS_AutoscreenSize"; $_t_oldMethodName)
