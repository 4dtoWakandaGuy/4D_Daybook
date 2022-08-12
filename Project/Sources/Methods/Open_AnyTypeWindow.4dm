//%attributes = {}
If (False:C215)
	//Project Method Name:      Open_AnyTypeWindow
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_FormHeight; $_l_FormWidth; $_l_NewHeight; $_l_NewTopPosition; $_l_NewWidthCentre; $_l_ScreenCentreVertical; $_l_WindowReference; $1; $2; $3; WIN_l_CurrentWinRef)
	C_POINTER:C301($6)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $4; $5; $7)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Open_AnyTypeWindow")
//Open_AnyTypeWindow
If (Not:C34(WIN_bo_TrackerInited))
	ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
	ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
	WIN_bo_TrackerInited:=True:C214
End if 
If (($1>220) & (Screen height:C188<480))
	$_l_NewTopPosition:=74
Else 
	$_l_NewTopPosition:=110
End if 

$_l_ScreenCentreVertical:=Screen width:C187/2
$_l_NewHeight:=$1
$_l_NewWidthCentre:=$2/2
If (Count parameters:C259>=7)
	FORM GET PROPERTIES:C674($6->; $7; $_l_FormWidth; $_l_FormHeight)
	If ($_l_FormHeight>0) & ($_l_FormWidth>0)
		$_l_NewHeight:=$_l_FormHeight
		$_l_NewWidthCentre:=$_l_FormWidth/2
	End if 
	
End if 

If (Count parameters:C259=3)
	
	$_l_WindowReference:=Open window:C153(($_l_ScreenCentreVertical-$_l_NewWidthCentre); $_l_NewTopPosition; $_l_ScreenCentreVertical+$_l_NewWidthCentre; $_l_NewTopPosition+$_l_NewHeight; $3)
Else 
	
	If ($4="")
		If (Count parameters:C259=4)
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical-$_l_NewWidthCentre; $_l_NewTopPosition; $_l_ScreenCentreVertical+$_l_NewWidthCentre; $_l_NewTopPosition+$_l_NewHeight; $3)
		Else 
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical-$_l_NewWidthCentre; $_l_NewTopPosition; $_l_ScreenCentreVertical+$_l_NewWidthCentre; $_l_NewTopPosition+$_l_NewHeight; $3; ""; $5)
		End if 
	Else 
		$_t_WindowTitle:=Replace string:C233($4; "_"; " ")
		If (Count parameters:C259=4)
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical-$_l_NewWidthCentre; $_l_NewTopPosition; $_l_ScreenCentreVertical+$_l_NewWidthCentre; $_l_NewTopPosition+$_l_NewHeight; $3; $_t_WindowTitle)
		Else 
			$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical-$_l_NewWidthCentre; $_l_NewTopPosition; $_l_ScreenCentreVertical+$_l_NewWidthCentre; $_l_NewTopPosition+$_l_NewHeight; $3; $_t_WindowTitle; $5)
		End if 
		
	End if 
End if 
APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowReference)
WIN_l_CurrentWinRef:=$_l_WindowReference
ERR_MethodTrackerReturn("Open_AnyTypeWindow"; $_t_oldMethodName)