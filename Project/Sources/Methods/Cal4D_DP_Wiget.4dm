//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_DP_Wiget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/01/2010 18:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0; $1; DTP_d_Date)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_FormHeight; $_l_FormWidth; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectLeft; $_l_ObjectTop; $_l_WindowRef; $_l_WIndowType; $2)
	C_LONGINT:C283($3; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_ErrorMethod; $_t_MethodName; $_t_oldMethodName; Cal4D_t_MouseOverSVGref; SVG_t_XMLDateWigetRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_DP_Wiget")


$0:=!00-00-00!
If (Application type:C494#4D Server:K5:6)  // This shouldn't be called from 4D Server.
	
	Cal4D_Init
	
	If (Cal4D_Cell_BG_MouseOver="")
		Cal4D_Cell_BG_MouseOver(Cal4D_Cal_Cell_BG("Pop_MouseOver"))
	End if 
	
	
	$_t_ErrorMethod:=SVG_Set_error_handler
	SVG_Set_error_handler("DTP4D_DummyMethod")
	
	SVG_t_XMLDateWigetRef:=""
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
		Case of 
			: ($1=!00-00-00!)
				DTP_d_Date:=Current date:C33
			Else 
				DTP_d_Date:=$1
		End case 
	Else 
		DTP_d_Date:=Current date:C33
	End if 
	
	Cal4D_Cal_SelectedDate(DTP_d_Date)
	
	BRING TO FRONT:C326(Current process:C322)
	READ ONLY:C145(*)  // Unless we say otherwise, don't lock any records.
	
	FORM GET PROPERTIES:C674("Cal4D_DP_Widget_d"; $_l_FormWidth; $_l_FormHeight)
	
	If (Is Windows:C1573)
		$_l_WIndowType:=Pop up window:K34:14
	Else 
		$_l_WIndowType:=-Palette window:K34:3
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	$_l_WindowRef:=Open window:C153($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectLeft+$_l_FormWidth; $_l_ObjectTop+$_l_FormHeight; $_l_WIndowType; ""; "Cal4D_Cal_CloseBox")
	WIN_l_CurrentWinRef:=$_l_WindowRef
	DIALOG:C40("Cal4D_DP_Widget_d")
	CLOSE WINDOW:C154($_l_WindowRef)
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	
	//========================    Clean up and Exit    =================================
	
	SVG_Set_error_handler($_t_ErrorMethod)
End if 

If (OK=1)
	$0:=DTP_d_Date
End if 
ERR_MethodTrackerReturn("Cal4D_DP_Wiget"; $_t_oldMethodName)