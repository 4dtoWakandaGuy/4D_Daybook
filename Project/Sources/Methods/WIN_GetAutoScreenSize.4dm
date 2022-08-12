//%attributes = {}

If (False:C215)
	//Project Method Name:      WIN_GetAutoScreenSize
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
	//ARRAY TEXT(<>INT_at_FormNames;0)
	C_BOOLEAN:C305(<>INT_FormSIzesInited; SYS_bo_NoTrack)
	C_LONGINT:C283(<>ButtonBarPosition; <>ModulBarPosition; <>ModulePalBot; <>ModulePalLeft; <>ModulePalRight; <>ModulePalTop; <>PER_l_CurrentUserID; $_l_CurrentBottom; $_l_CurrentLeft; $_l_CurrentRIght; $_l_CurrentTop)
	C_LONGINT:C283($_l_CurrentWindowWIdth; $_l_DockLB; $_l_DockLL; $_l_DockLR; $_l_DockPosition; $_l_Edge; $_l_HalfHeight; $_l_HeightDIfference; $_l_MaxBottom; $_l_MaxRIght; $_l_MaxWidth)
	C_LONGINT:C283($_l_MinLeft; $_l_MinTop; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_SetBottom; $_l_SetLeft; $_l_SetRIght; $_l_SetTop; $_l_Shift; $_l_ShiftLeft; $_l_WIdthDIfference)
	C_LONGINT:C283($_l_WIndowRow; $1; $2; $3)
	C_POINTER:C301($5; $6)
	C_REAL:C285($10; $7; $8; $9)
	C_TEXT:C284($_t_oldMethodName; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WIN_GetAutoScreenSize")

//NG this method is based on WS_Autoscreensize-gets the size not sets it
//$2=Height
If (<>ModulePalbot=0)
	<>ModulePalLeft:=0
	<>ModulePalTop:=0
	<>ModulePalRight:=500
	<>ModulePalBot:=40
End if 

//`$3=Width


//NG april 2000
// to resize screens by rules
<>ModulBarPosition:=1

<>ButtonBarPosition:=2
//values for this are
$_l_DockPosition:=INT_GetDock("A"; ->$_l_DockLB; ->$_l_DockLR; ->$_l_DockLL)
//1=TOP
//2=Side Left
//3=Side Right
//4=Bottom
//0=Hidden
//Yes currently it is stuck at the top=but I want to change it
If (Count parameters:C259>=3)
	
	$_l_MinLeft:=(60*(Num:C11(<>ButtonBarPosition=2)))+$_l_DockLL
	If ($_l_MinLeft<60)
		$_l_MinLeft:=(30*(Num:C11(<>ModulBarPosition=2)))+$_l_DockLL
	End if 
	$_l_MinTop:=42*(Num:C11(<>ModulBarPosition=1))+38  //40  `Rollo 25/11/2004
	If ($_l_MinTop<(42+38))  //40
		$_l_MinTop:=42*(Num:C11(<>ModulBarPosition=1))+38
		
		
	End if 
	
	$_l_MaxRIght:=(30*(Num:C11(<>ButtonBarPosition=3)))-$_l_DockLR
	If ($_l_MaxRIght<30)
		$_l_MaxRIght:=(30*(Num:C11(<>ModulBarPosition=3)))-$_l_DockLR
	End if 
	$_l_MaxBottom:=(30*(Num:C11(<>ButtonBarPosition=4)))-$_l_DockLB
	If ($_l_MaxBottom<30)
		$_l_MaxBottom:=30
	End if 
	// If ($2>0)
	// GET WINDOW RECT($_l_CurrentLeft;$_l_CurrentTop;$_l_CurrentRIght;$_l_CurrentBottom;$2)
	//Else
	GET WINDOW RECT:C443($_l_CurrentLeft; $_l_CurrentTop; $_l_CurrentRIght; $_l_CurrentBottom)
	// End if
	If (Count parameters:C259>=10)
		$_l_CurrentLeft:=$7
		$_l_CurrentTop:=$8
		$_l_CurrentRIght:=$9
		$_l_CurrentBottom:=$10
		
		
	End if 
	
	Case of 
		: ($1=1)
			If (Count parameters:C259>=4)
				If ($4#"")
					If (Not:C34(<>INT_FormSIzesInited))
						INT_LoadFormSizes(<>PER_l_CurrentUserID)
					End if 
					
					$_l_WIndowRow:=Find in array:C230(<>INT_at_FormNames; $4)
					If ($_l_WIndowRow>0)
						$_l_MaxWidth:=<>INT_al_FormWidth{$_l_WIndowRow}  //+34  `Rollo 12/8/2004 - are all a bit wider now
						//NG took the  34 away..the screen get 34 wider every time the user opens it!!!
					Else 
						$_l_MaxWidth:=$3
					End if 
				Else 
					$_l_MaxWidth:=$3
				End if 
				
			Else 
				$_l_MaxWidth:=$3
			End if 
			
			
			//Set to full reach bottom of screen
			//The window width is passed in parameter 3-that is not changed
			
			$_l_CurrentWindowWIdth:=$_l_CurrentRIght-$_l_CurrentLeft
			
			If ($_l_CurrentWindowWIdth#$_l_MaxWidth)  //Window is wrong size
				//Window width must be changed
				$_l_SetRIght:=$_l_CurrentLeft+$_l_MaxWidth
			Else 
				$_l_SetRIght:=$_l_CurrentRIght
			End if 
			If ($_l_SetRIght>(Screen width:C187-$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRIght-(Screen width:C187-$_l_DockLR))-5
				$_l_CurrentLeft:=$_l_CurrentLeft-$_l_ShiftLeft
				If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
					$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+5
					$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				End if 
				$_l_SetRIght:=$_l_SetRIght-$_l_ShiftLeft
				//if that is too far the next bit will adjust it
			End if 
			
			$_l_Shift:=0
			If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
				$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+5
				$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				$_l_SetRIght:=$_l_SetRIght+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentLeft
			End if 
			
			If ($_l_SetRIght>(Screen width:C187-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-5
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRIght-(Screen width:C187-$_l_MaxRIght)-5)<$_l_MinLeft)
						$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-5
					Else 
						$_l_Shift:=$_l_SetRIght-((Screen width:C187-$_l_MaxRIght)-5)
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRIght:=$_l_SetRIght-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinTop:=38
			End if 
			If ($_l_CurrentTop<$_l_MinTop)
				$_l_SetTop:=$_l_MinTop+5
			Else 
				$_l_SetTop:=$_l_CurrentTop
			End if 
			$_l_SetBottom:=(Screen height:C188-$_l_MaxBottom)-5
			
		: ($1=2)
			//Fixed size but not positioned
			//
			//The window width is passed in parameter 3-that is not changed
			
			$_l_Edge:=10  //Rollo 25/11/2004 - was 5, hardcodedly below
			$_l_CurrentWindowWIdth:=$_l_CurrentRIght-$_l_CurrentLeft
			
			If ($_l_CurrentWindowWIdth#$3)  //Window is wrong size
				//Window width must be changed
				$_l_SetRIght:=$_l_CurrentLeft+$3
			Else 
				$_l_SetRIght:=$_l_CurrentRIght
			End if 
			If ($_l_SetRIght>(Screen width:C187-$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRIght-(Screen width:C187-$_l_DockLR))-$_l_Edge  //Rollo 25/11/2004 - no - Paletters should go right to the edge
				$_l_CurrentLeft:=$_l_CurrentLeft-$_l_ShiftLeft
				If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
					$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+$_l_Edge  //Rollo 25/11/2004
					$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				End if 
				$_l_SetRIght:=$_l_CurrentLeft+$3
				//if that is too far the next bit will adjust it
			End if 
			
			
			$_l_Shift:=0
			If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
				$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+$_l_Edge  //Rollo 25/11/2004
				$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				$_l_SetRIght:=$_l_SetRIght+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentLeft
			End if 
			If ($_l_SetRIght>(Screen width:C187-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-$_l_Edge  //Rollo 25/11/2004
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRIght-(Screen width:C187-$_l_MaxRIght)-$_l_Edge)<$_l_MinLeft)  //Rollo 25/11/2004
						$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-$_l_Edge  //Rollo 25/11/2004
					Else 
						$_l_Shift:=$_l_SetRIght-((Screen width:C187-$_l_MaxRIght)-$_l_Edge)  //Rollo 25/11/2004
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRIght:=$_l_SetRIght-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinTop:=38
			End if 
			
			If ($_l_CurrentTop<$_l_MinTop)
				$_l_SetTop:=$_l_MinTop+$_l_Edge  //Rollo 25/11/2004
			Else 
				$_l_SetTop:=$_l_CurrentTop
			End if 
			$_l_SetBottom:=$_l_SetTop+$2
			If ($_l_SetBottom>(Screen height:C188-$_l_MaxBottom))
				$_l_Shift:=$_l_SetBottom-(((Screen height:C188-$_l_DockLB))-$_l_Edge)
				
				//Window will be too far down
				//however if we shift it now it could go too high
				If (($_l_SetTop-$_l_Shift)<$_l_MinTop)
					$_l_SetBottom:=(((Screen height:C188-$_l_DockLB))-$_l_Edge)
					$_l_SetTop:=$_l_MinTop
				Else 
					$_l_SetBottom:=(((Screen height:C188-$_l_DockLB))-$_l_Edge)
					If ($_l_CurrentBottom<$_l_SetBottom)
						$_l_SetTop:=$_l_SetTop-$_l_Shift
					Else 
						$_l_Shift:=$_l_CurrentBottom-$_l_SetBottom
						$_l_SetTop:=$_l_SetTop-$_l_Shift
					End if 
				End if 
			End if 
			
		: ($1=3)
			//$2=HEIGHT
			//$3=WIDTH
			$_l_ScreenCentreVertical:=Screen width:C187/2
			$_l_HalfHeight:=Int:C8($3/2)
			$_l_SetLeft:=$_l_ScreenCentreVertical-$_l_HalfHeight
			$_l_SetRIght:=$_l_ScreenCentreVertical+$_l_HalfHeight
			$_l_ScreenCentreHorizontal:=Screen height:C188/2
			$_l_HalfHeight:=Int:C8($2/2)
			$_l_SetTop:=$_l_ScreenCentreHorizontal-$_l_HalfHeight
			$_l_SetBottom:=$_l_ScreenCentreHorizontal+$_l_HalfHeight
			
		: ($1=4)
			$_l_SetBottom:=$_l_CurrentBottom
			//Resizable to full reach bottom of screen
			//The window width is passed in parameter 3-that is not changed
			If (Count parameters:C259>=4)
				If ($4#"")
					If (Not:C34(<>INT_FormSIzesInited))
						INT_LoadFormSizes(<>PER_l_CurrentUserID)
					End if 
					
					$_l_WIndowRow:=Find in array:C230(<>INT_at_FormNames; $4)
					If ($_l_WIndowRow>0)
						$_l_MaxWidth:=<>INT_al_FormWidth{$_l_WIndowRow}  //+34  `Rollo 12/8/2004 - are all a bit wider now
						$_l_SetBottom:=<>INT_al_FormHeight{$_l_WIndowRow}+$_l_CurrentTop  //NG took the  34 away..the screen get 34 wider every time the user opens it!!!
					Else 
						
						$_l_MaxWidth:=$3
					End if 
				Else 
					$_l_MaxWidth:=$3
				End if 
			Else 
				$_l_MaxWidth:=$3
			End if 
			$_l_CurrentWindowWIdth:=$_l_CurrentRIght-$_l_CurrentLeft
			
			If ($_l_CurrentWindowWIdth#$_l_MaxWidth)  //Window is wrong size
				//Window width must be changed
				$_l_SetRIght:=$_l_CurrentLeft+$_l_MaxWidth
			Else 
				$_l_SetRIght:=$_l_CurrentRIght
			End if 
			If ($_l_SetRIght>(Screen width:C187--$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRIght-(Screen width:C187-$_l_DockLR))-5
				$_l_CurrentLeft:=$_l_CurrentLeft-$_l_ShiftLeft
				If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
					$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+5
					$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				End if 
				$_l_SetRIght:=$_l_SetRIght-$_l_ShiftLeft
				//if that is too far the next bit will adjust it
			End if 
			
			$_l_Shift:=0
			If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
				$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+5
				$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				$_l_SetRIght:=$_l_SetRIght+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentLeft
			End if 
			If ($_l_SetRIght>(Screen width:C187-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-5
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRIght-(Screen width:C187-$_l_MaxRIght)-5)<$_l_MinLeft)
						$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-5
					Else 
						$_l_Shift:=$_l_SetRIght-((Screen width:C187-$_l_MaxRIght)-5)
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRIght:=$_l_SetRIght-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinTop:=38
			End if 
			
			If ($_l_CurrentTop<$_l_MinTop)
				$_l_SetTop:=$_l_MinTop+5
			Else 
				$_l_SetTop:=$_l_CurrentTop
			End if 
			If ($_l_CurrentBottom>($_l_MaxBottom-5))
				If ($_l_SetBottom=$_l_CurrentBottom)
					$_l_SetBottom:=(Screen height:C188-$_l_MaxBottom)-5
				End if 
			End if 
		: ($1=5)  //Like 2
			//Top is positioned
			//Fixed size but not positioned
			//
			//The window width is passed in parameter 3-that is not changed
			
			$_l_CurrentWindowWIdth:=$_l_CurrentRIght-$_l_CurrentLeft
			
			If ($_l_CurrentWindowWIdth#$3)  //Window is wrong size
				//Window width must be changed
				$_l_SetRIght:=$_l_CurrentLeft+$3
			Else 
				$_l_SetRIght:=$_l_CurrentRIght
			End if 
			If ($_l_SetRIght>(Screen width:C187-$_l_DockLR))
				//that will be too far
				//so now move it all to the left!!!
				$_l_ShiftLeft:=($_l_SetRIght-(Screen width:C187-$_l_DockLR))-5
				$_l_CurrentLeft:=$_l_CurrentLeft-$_l_ShiftLeft
				If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
					$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+5
					$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				End if 
				$_l_SetRIght:=$_l_SetRIght-$_l_ShiftLeft
				//if that is too far the next bit will adjust it
			End if 
			
			$_l_Shift:=0
			If ($_l_CurrentLeft<$_l_MinLeft)  //window is too far left
				$_l_Shift:=$_l_MinLeft-$_l_CurrentLeft+5
				$_l_SetLeft:=$_l_CurrentLeft+$_l_Shift
				$_l_SetRIght:=$_l_SetRIght+$_l_Shift
			Else 
				$_l_SetLeft:=$_l_CurrentLeft
			End if 
			If ($_l_SetRIght>(Screen width:C187-$_l_MaxRIght))
				//Window will be too far right
				If ($_l_Shift>0)  //we are moving it so make it narrower
					$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-5
				Else 
					//we did not shift it
					//however if we shift it now it could go too far left
					If ($_l_SetLeft-($_l_SetRIght-(Screen width:C187-$_l_MaxRIght)-5)<$_l_MinLeft)
						$_l_SetRIght:=(Screen width:C187-$_l_MaxRIght)-5
					Else 
						$_l_Shift:=$_l_SetRIght-((Screen width:C187-$_l_MaxRIght)-5)
						
						$_l_SetLeft:=$_l_SetLeft-$_l_Shift
						$_l_SetRIght:=$_l_SetRIght-$_l_Shift
					End if 
				End if 
			End if 
			If ($_l_SetLeft><>ModulePalRight)
				//the pallette does not matter
				$_l_MinTop:=38
			End if 
			
			If ($_l_CurrentTop<$_l_MinTop)
				$_l_SetTop:=$_l_MinTop+5
			Else 
				$_l_SetTop:=$_l_CurrentTop
			End if 
			$_l_SetBottom:=$_l_SetTop+$2
			If ($_l_SetBottom>(Screen height:C188-$_l_MaxBottom))
				$_l_Shift:=$_l_SetBottom-(((Screen height:C188-$_l_DockLB))-5)
				
				//Window will be too far down
				//however if we shift it now it could go too high
				If (($_l_SetTop-$_l_Shift)<$_l_MinTop)
					$_l_SetBottom:=((Screen height:C188-$_l_DockLB)-5)
					//$_l_SetTop:=$_l_MinTop
				Else 
					$_l_SetBottom:=((Screen height:C188-$_l_DockLB)-5)
					If ($_l_CurrentBottom<$_l_SetBottom)
					Else 
						$_l_Shift:=$_l_CurrentBottom-$_l_SetBottom
						//$_l_SetTop:=$_l_SetTop-$_l_Shift
					End if 
				End if 
				
				
				
			End if 
	End case 
	
	If ($_l_CurrentLeft#$_l_SetLeft) | ($_l_CurrentTop#$_l_SetTop) | ($_l_CurrentRIght#$_l_SetRIght) | ($_l_CurrentBottom#$_l_SetBottom)
		//Need to move window
		// If ($2>0)
		// SET WINDOW RECT($_l_SetLeft;$_l_SetTop;$_l_SetRIght;$_l_SetBottom;$2)
		//Else
		//12/07/04 NG/PB/BSW - called twice as there is a bug in 4d 2003
		If (False:C215)
			SET WINDOW RECT:C444($_l_SetLeft; $_l_SetTop; $_l_SetRIght; $_l_SetBottom)
			SET WINDOW RECT:C444($_l_SetLeft; $_l_SetTop; $_l_SetRIght; $_l_SetBottom)
		Else 
			//SET WINDOW RECT($_l_SetLeft;$_l_SetTop;$_l_SetRIght;$_l_SetBottom)
			// 03/07/06 pb - RESIZE FORM SIZE takes object properties into account
			//$currentwidth:=$_l_CurrentRIght-$_l_CurrentLeft
			//$newwidth:=$_l_SetRIght-$_l_SetLeft
			//$_l_CurrentHeight:=$_l_CurrentBottom-$_l_CurrentTop
			//$newheight:=$_l_SetBottom-$_l_SetTop
			$_l_WIdthDIfference:=1
			$_l_HeightDIfference:=1
			If (Count parameters:C259>=6)
				//RESIZE FORM WINDOW($_l_WIdthDIfference;$_l_HeightDIfference)
				$5->:=$_l_SetBottom-$_l_SetTop
				$6->:=$_l_SetRIght-$_l_SetLeft
			End if 
			//SET WINDOW RECT($_l_SetLeft;$_l_SetTop;$_l_SetRIght;$_l_SetBottom)
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("WIN_GetAutoScreenSize"; $_t_oldMethodName)
