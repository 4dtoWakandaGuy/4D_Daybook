//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen SetModCol
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/05/2010 08:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>Mod_at_ModuleColourName;0)
	C_BOOLEAN:C305(<>MenuFront)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_BackgroundColour; $_l_Colour; $_l_Foregrou; $_l_ForegroundColour; $_l_Module; $1)
	C_TEXT:C284($_t_BackgroundColour; $_t_Colour; $_t_ForegroundColour; $_t_oldMethodName; vProblem; vSolution)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen SetModCol")
//Gen SetModCol - sets the colour of Modules Palette acc Modules
If (Count parameters:C259>=1)
	$_l_Module:=$1
Else 
	$_l_Module:=<>MENU_l_BarModule
	
End if 
$_t_Colour:=<>Mod_at_ModuleColourName{$_l_Module}
Case of 
	: ($_t_Colour="Green")
		If (<>MenuFront)
			$_l_BackgroundColour:=191
			$_l_ForegroundColour:=177
			$_l_Colour:=-49073  //-(177+(256*191)))49139
		Else 
			$_l_Colour:=-(191+(256*176))
			$_l_BackgroundColour:=177
			$_l_ForegroundColour:=191
		End if 
	: ($_t_Colour="Red")
		If (<>MenuFront)
			$_l_Colour:=-36224  //-(128+(256*141)))`36339
			$_l_BackgroundColour:=128
			$_l_ForegroundColour:=141
		Else 
			$_l_Colour:=-(141+(256*128))
			$_l_BackgroundColour:=141
			$_l_ForegroundColour:=128
		End if 
	: ($_t_Colour="Cyan")
		If (<>MenuFront)
			$_l_Colour:=-53184  //-(192+(256*207)))
			$_l_BackgroundColour:=207
			$_l_ForegroundColour:=192
		Else 
			$_l_Colour:=-(207+(256*192))
			$_l_BackgroundColour:=192
			$_l_ForegroundColour:=207
		End if 
	: ($_t_Colour="Purple")
		If (<>MenuFront)
			$_l_Colour:=-61408  //-(224+(256*239)))
			$_l_BackgroundColour:=239
			$_l_ForegroundColour:=224
		Else 
			$_l_Colour:=-(239+(256*224))
			$_l_BackgroundColour:=239
			$_l_ForegroundColour:=224
			
		End if 
	: ($_t_Colour="Brown")
		If (<>MenuFront)
			$_l_Colour:=-2705  //-(145+(256*10)))`36339
			$_l_BackgroundColour:=10
			$_l_ForegroundColour:=160
			
		Else 
			$_l_Colour:=-(10+(256*160))
			$_l_BackgroundColour:=160
			$_l_ForegroundColour:=10
		End if 
	: ($_t_Colour="Gold")
		If (<>MenuFront)
			$_l_Colour:=-3488  //-(160+(256*13)))`36339
			$_l_BackgroundColour:=13
			$_l_ForegroundColour:=160
		Else 
			$_l_Colour:=-(13+(256*160))
			$_l_BackgroundColour:=160
			$_l_ForegroundColour:=13
		End if 
	: ($_t_Colour="Orange")
		If (<>MenuFront)
			$_l_Colour:=-656  //-(144+(256*2)))49139
			$_l_BackgroundColour:=2
			$_l_ForegroundColour:=144
		Else 
			$_l_Colour:=-(2+(256*144))
			$_l_BackgroundColour:=144
			$_l_ForegroundColour:=2
		End if 
	Else   //blue
		If (<>MenuFront)
			$_l_Colour:=-57297  //-(209+(256*223)))57331
			$_l_BackgroundColour:=223
			$_l_ForegroundColour:=209
		Else 
			$_l_Colour:=-(223+(256*208))  //62687
			$_l_BackgroundColour:=208
			$_l_ForegroundColour:=223
		End if 
End case 
//$_l_ForegroundColour:=0
//_O_OBJECT SET COLOR(vSolution;$_l_Colour)
//$_l_ForegroundColour:=0
$_t_ForegroundColour:=UTIL_4DColorToRGB($_l_ForegroundColour)
$_t_BackgroundColour:=UTIL_4DColorToRGB($_l_BackgroundColour)
OBJECT SET RGB COLORS:C628(vSolution; $_t_ForegroundColour; $_t_BackgroundColour)

//_O_OBJECT SET COLOR(vProblem;$_l_Colour)  //Rollo 7/22/2004 `additional background so that module name is not too high
OBJECT SET RGB COLORS:C628(vProblem; $_t_ForegroundColour; $_t_BackgroundColour)
ERR_MethodTrackerReturn("Gen SetModCol"; $_t_oldMethodName)
