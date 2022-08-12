//%attributes = {}

If (False:C215)
	//Project Method Name:      INT_setButtonsPosition
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/04/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_LONGINT:C283($_l_FirstButtonRight; $_l_Gap; $_l_NavbuttonsBottom; $_l_NextButtonRight; $_l_Right; $_l_StrapBottom; $_l_StrapLeft; $_l_StrapRight; $_l_StrapTop; $_l_StripBottom; $_l_StripLeft)
	C_LONGINT:C283($_l_StripRight; $_l_StripTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowTop; $_l_WindowWidth)
End if 
//Code Starts Here
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_Right; $_l_WindowBottom)

//TRACE
$_l_NextButtonRight:=($_l_Right-$_l_WindowLeft)-10
$_l_NavbuttonsBottom:=($_l_WindowBottom-$_l_WindowTop)-10
$_l_Gap:=3
$_l_FirstButtonRight:=$_l_NextButtonRight
If (OBJECT Get visible:C1075(*; "oSaveButton"))
	
	OBJECT SET COORDINATES:C1248(*; "oSaveButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 
If (OBJECT Get visible:C1075(*; "oCancelButton"))
	
	OBJECT SET COORDINATES:C1248(*; "oCancelButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 

//TRACE
If (OBJECT Get visible:C1075(*; "oMinusButton"))
	OBJECT SET COORDINATES:C1248(*; "oMinusOptionButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	
	OBJECT SET COORDINATES:C1248(*; "oMinusButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
	OBJECT SET VISIBLE:C603(*; "oMinusOptionButton"; False:C215)
	
Else 
	If (OBJECT Get visible:C1075(*; "oMinusOptionButton"))
		OBJECT SET COORDINATES:C1248(*; "oMinusButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
		OBJECT SET COORDINATES:C1248(*; "oMinusOptionButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
		$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
	End if 
End if 
If (OBJECT Get visible:C1075(*; "oPlusButton"))
	
	OBJECT SET COORDINATES:C1248(*; "oPlusButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 
If (OBJECT Get visible:C1075(*; "oReportButton"))
	
	OBJECT SET COORDINATES:C1248(*; "oReportButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 

If (OBJECT Get visible:C1075(*; "oQualitiesButton"))
	$_l_NextButtonRight:=$_l_NextButtonRight-$_l_Gap
	OBJECT SET COORDINATES:C1248(*; "oQualitiesButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 

If (OBJECT Get visible:C1075(*; "oCompanyButton"))
	$_l_NextButtonRight:=$_l_NextButtonRight-$_l_Gap
	OBJECT SET COORDINATES:C1248(*; "oCompanyButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 
If (OBJECT Get visible:C1075(*; "oContactsButton"))
	$_l_NextButtonRight:=$_l_NextButtonRight-$_l_Gap
	OBJECT SET COORDINATES:C1248(*; "oContactsButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 

If (OBJECT Get visible:C1075(*; "oProductsButton"))
	$_l_NextButtonRight:=$_l_NextButtonRight-$_l_Gap
	OBJECT SET COORDINATES:C1248(*; "oProductsButton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 

If (OBJECT Get visible:C1075(*; "oTimeManagerbutton"))
	$_l_NextButtonRight:=$_l_NextButtonRight-$_l_Gap
	OBJECT SET COORDINATES:C1248(*; "oTimeManagerbutton"; $_l_NextButtonRight-35; $_l_NavbuttonsBottom-35; $_l_NextButtonRight; $_l_NavbuttonsBottom)
	$_l_NextButtonRight:=($_l_NextButtonRight-35)-$_l_Gap
End if 
$0:=$_l_FirstButtonRight
GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_Right; $_l_WindowBottom)
$_l_WindowWidth:=$_l_Right-$_l_WindowLeft
If ($_l_WindowWidth>$_l_FirstButtonRight)
	$_l_FirstButtonRight:=$_l_WindowWidth
End if 
OBJECT GET COORDINATES:C663(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_StrapRight; $_l_StrapBottom)
OBJECT GET COORDINATES:C663(*; "oOutStrip"; $_l_StripLeft; $_l_StripTop; $_l_StripRight; $_l_StripBottom)

OBJECT SET COORDINATES:C1248(*; "oStrapHeader"; $_l_StrapLeft; $_l_StrapTop; $_l_FirstButtonRight; $_l_StrapBottom)
OBJECT SET COORDINATES:C1248(*; "oOutStrip@"; $_l_StripLeft; $_l_StrapBottom-5; $_l_FirstButtonRight; $_l_StripTop+5)
OBJECT SET COORDINATES:C1248(*; "oShowButtons"; 0; 0; 3; $_l_WindowBottom-$_l_WindowTop)
