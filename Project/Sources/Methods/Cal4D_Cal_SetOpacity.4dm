//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SetOpacity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Opacity; $0)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_Type; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SetOpacity")

$_t_Type:=$1


Case of 
	: ($_t_Type="All-Day")
		$_l_Opacity:=40
		
	: ($_t_Type="Banner")
		$_l_Opacity:=40
		
	Else 
		$_l_Opacity:=10
		
End case 

//========================    Clean up and Exit    =================================

$0:=$_l_Opacity
ERR_MethodTrackerReturn("Cal4D_Cal_SetOpacity"; $_t_oldMethodName)