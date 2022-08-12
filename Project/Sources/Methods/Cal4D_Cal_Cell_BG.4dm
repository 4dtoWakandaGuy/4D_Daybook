//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_Cell_BG
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_Cal_Cell_BG
	////
	////  Written by Charles Vass - 03/05/2009, 07:50
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 16:11`Method: Cal4D_Cal_Cell_BG
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_Colour; $_t_MethodName; $_t_oldMethodName; $_t_Type; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_Cell_BG")
If (Count parameters:C259>=1)
	
	$_t_Type:=$1
	$_t_Colour:=""
	
	
	Case of 
		: (($_t_Type="Mini_OutMonth") | ($_t_Type="Out_Day"))
			$_t_Colour:="white"
			
		: ($_t_Type="Mini_ThisMonth")
			$_t_Colour:="rgb(212,212,213)"
			
		: ($_t_Type="Mini_Today")
			$_t_Colour:="rgb(109,138,183)"
			
		: ($_t_Type="Mini_Selected")
			$_t_Colour:="cyan"
			
		: ($_t_Type="Main_Today")
			$_t_Colour:="cornsilk"
			
		: ($_t_Type="Main_Day")
			$_t_Colour:="white"
			
		: ($_t_Type="Main_Selected")
			$_t_Colour:="rgb(241,241,241)"
			
		: ($_t_Type="Evt_Selected")
			$_t_Colour:="rgb(210,210,210)"
			
		: ($_t_Type="Pop_Today")
			$_t_Colour:="rgb(52,103,191)"
			
		: ($_t_Type="Pop_MouseOver")
			$_t_Colour:="rgb(157,186,225)"
			
		: ($_t_Type="Pop_WkNo")
			$_t_Colour:="rgb(221,221,221)"
			
		Else 
			Gen_Alert("ALERT"; "Unknown color!")
			
	End case 
	
	
	$0:=$_t_Colour
	
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_Cell_BG"; $_t_oldMethodName)