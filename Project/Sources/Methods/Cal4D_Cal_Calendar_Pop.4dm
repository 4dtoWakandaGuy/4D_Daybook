//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Calendar_Pop
	//------------------ Method Notes ------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 16:52`Method: Cal4D_Cal_Calendar_Pop
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0; $1; Cal4D_d_Date)
	C_LONGINT:C283($_l_FormHeight; $_l_FormWidth; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowRef; $_l_WIndowType; $2; $3)
	C_LONGINT:C283($_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_installedErrorHandler; $_t_oldMethodName; CAl_t_BannerText; Cal4D_t_MouseOverSVGref; Cal4D_t_PopCalSVGref; SVG_t_PopCal_Ref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Calendar_Pop")

$0:=!00-00-00!

If (Application type:C494#4D Server:K5:6)  // This shouldn't be called from 4D Server.
	//Cal4D_Init
	$_t_installedErrorHandler:=Method called on error:C704
	ON ERR CALL:C155("Cal4D_DummyMethod")
	//ALERT("Method called on error "+Method called on error+"Cal4D_Cal_Calendar_Pop")
	
	Cal4D_t_PopCalSVGref:=""
	Cal4D_t_MouseOverSVGref:=""
	
	If (Count parameters:C259=3)
		$_l_ObjectLeft:=$2
		$_l_ObjectTop:=$3
	Else 
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton; *)
		$_l_ObjectLeft:=$_l_MouseX
		$_l_ObjectTop:=$_l_MouseY
	End if 
	
	//========================    Method Actions    ==================================
	
	If (Count parameters:C259=1)
		Cal4D_d_Date:=$1
		If (Cal4D_d_Date=!00-00-00!)
			Cal4D_d_Date:=Current date:C33
		End if 
	Else 
		Cal4D_d_Date:=Current date:C33
	End if 
	
	BRING TO FRONT:C326(Current process:C322)
	READ ONLY:C145(*)  // Unless we say otherwise, don't lock any records.
	
	//Cal4D_MenuBar   ` Update the menu bar.
	FORM GET PROPERTIES:C674("Cal4D_Cal_Popup_d"; $_l_FormWidth; $_l_FormHeight)
	
	If (Is Windows:C1573)
		$_l_WIndowType:=Pop up window:K34:14
	Else 
		$_l_WIndowType:=-Plain dialog box:K34:4
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	$_l_WindowRef:=Open window:C153($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_FormWidth; $_l_ObjectTop+$_l_FormHeight; $_l_WIndowType; ""; "Cal4D_Cal_CloseBox")
	WIN_l_CurrentWinRef:=$_l_WindowRef
	DIALOG:C40("Cal4D_Cal_Popup_d")
	CLOSE WINDOW:C154($_l_WindowRef)
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	ON ERR CALL:C155($_t_installedErrorHandler)
	//ALERT("Method called on error "+Method called on error+"Cal4D_Cal_Calendar_Pop")
	If (OK=1)
		$0:=Cal4D_d_Date
	End if 
	
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_Calendar_Pop"; $_t_oldMethodName)