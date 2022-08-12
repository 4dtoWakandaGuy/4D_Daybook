//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      VER_CENTERWINDOW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:32
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
	C_LONGINT:C283($_l_Bottom; $_l_CountParameters; $_l_HalfScreenHeight; $_l_HalfScreenWidth; $_l_Left; $_l_offset; $_l_PreferredHeight; $_l_PreferredWidth; $_l_Right; $_l_Top; $_l_WindowReference)
	C_LONGINT:C283($_l_WindowType; $1; $2; $3; $6; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_CloseBoxMethod; $_t_oldMethodName; $_t_WindowTitle; $4; $5)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("VER_CENTERWINDOW")
If (False:C215)
	//DB_CENTER WINDOW BSW 25/07/02
	//This method opens a window in the center of a main screen
	//$1 Width (longint optional default value = 400)
	//$2 Height (longint optional default value = 200)
	//$3  Window Type (longint optional default value = Plain fixed size window)
	//$4 Window Title (optional)
	//$5 close box method (string 32 optional default = VER_CLOSEBOX)
	//$6 OffSet (Optional default = 0)
End if 


$_l_CountParameters:=Count parameters:C259

If ($_l_CountParameters>0)
	$_l_PreferredWidth:=$1
Else 
	$_l_PreferredWidth:=400
End if 

If ($_l_CountParameters>1)
	$_l_PreferredHeight:=$2
Else 
	$_l_PreferredHeight:=200
End if 

If ($_l_CountParameters>2)
	$_l_WindowType:=$3
Else 
	$_l_WindowType:=Plain fixed size window:K34:6
End if 

If ($_l_CountParameters>3)
	$_t_WindowTitle:=$4
Else 
	$_t_WindowTitle:="Daybook Version Control"
End if 

If ($_l_CountParameters>4)
	$_t_CloseBoxMethod:=$5
Else 
	$_t_CloseBoxMethod:="VER_CLOSEBOX"
End if 

$_l_HalfScreenWidth:=Screen width:C187/2
$_l_HalfScreenHeight:=Screen height:C188/2

$_l_Left:=$_l_HalfScreenWidth-($_l_PreferredWidth/2)
$_l_Right:=$_l_HalfScreenWidth+($_l_PreferredWidth/2)
$_l_Top:=$_l_HalfScreenHeight-($_l_PreferredHeight/2)+20
$_l_Bottom:=$_l_HalfScreenHeight+($_l_PreferredHeight/2)+20
If (Not:C34(WIN_bo_TrackerInited))
	ARRAY LONGINT:C221(WIN_al_CalledFromReference; 0)
	ARRAY LONGINT:C221(WIN_al_ThisWIndowReference; 0)
	WIN_bo_TrackerInited:=True:C214
End if 
$_l_WindowReference:=Open window:C153($_l_Left+$_l_offset; $_l_Top+$_l_offset; $_l_Right+$_l_offset; $_l_Bottom+$_l_offset; $_l_WindowType; $_t_WindowTitle; $_t_CloseBoxMethod)
APPEND TO ARRAY:C911(WIN_al_CalledFromReference; WIN_l_CurrentWinRef)
APPEND TO ARRAY:C911(WIN_al_ThisWIndowReference; $_l_WindowReference)
WIN_l_CurrentWinRef:=$_l_WindowReference
ERR_MethodTrackerReturn("VER_CENTERWINDOW"; $_t_oldMethodName)
