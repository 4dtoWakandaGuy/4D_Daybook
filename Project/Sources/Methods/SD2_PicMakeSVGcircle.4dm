//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_PicMakeSVGcircle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 12:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Rectangle)
	C_LONGINT:C283($_l_CopyDataSource; $_l_Display; $1)
	C_PICTURE:C286($_pic_Picture; $0; SVG_Export_to_picture)
	C_REAL:C285($_r_CentreHorizontal; $_r_CentreVertical; $_r_Height; $_r_Radius; $_r_Width; $2; $3)
	C_TEXT:C284($_t_BackGroundColour; $_t_Circle; $_t_Description; $_t_ForeGroundColour; $_t_oldMethodName; $_t_RGB; $_t_SVGRef; $_t_Title)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_PicMakeSVGcircle")
$_t_RGB:=SVG_Color_RGB_from_long($1)

$_r_Width:=$2
$_r_Height:=$3+2
$_t_Title:="circle document"
$_t_Description:="a simple circle image"
$_bo_Rectangle:=True:C214
$_t_SVGRef:=SVG_New($_r_Width; $_r_Height; $_t_Title; $_t_Description; $_bo_Rectangle; $_l_Display)

$_r_CentreVertical:=$2/2
$_r_CentreHorizontal:=$3+2/2
$_r_Radius:=$3/2
$_t_BackGroundColour:="black"
$_t_ForeGroundColour:=$_t_RGB
$_r_Width:=1
$_t_Circle:=SVG_New_circle($_t_SVGRef; $_r_CentreVertical; $_r_CentreHorizontal; $_r_Radius; $_t_BackGroundColour; $_t_ForeGroundColour; $_r_Width)


$_pic_Picture:=SVG_Export_to_picture($_t_SVGRef; $_l_CopyDataSource)
SVG_CLEAR($_t_SVGRef)

$0:=$_pic_Picture
ERR_MethodTrackerReturn("SD2_PicMakeSVGcircle"; $_t_oldMethodName)
