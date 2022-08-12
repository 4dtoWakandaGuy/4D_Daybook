//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_GetSelectedDate_Mini
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 19:54`Method: Cal4D_Cal_GetSelectedDate_Mini
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $0)
	C_LONGINT:C283($Ndx)
	C_TEXT:C284($_t_oldMethodName; $_t_RefID; Cal_t_SelectedMiniCellRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_GetSelectedDate_Mini")


$_d_Date:=!00-00-00!

//========================    Method Actions    ==================================

If (Cal_t_SelectedMiniCellRef#"")
	$_t_RefID:=SVG_Get_ID(Cal_t_SelectedMiniCellRef)
	$_d_Date:=CAL4D_Cal_DateFromCellID($_t_RefID)
End if 

//========================    Clean up and Exit    =================================

$0:=$_d_Date
ERR_MethodTrackerReturn("Cal4D_Cal_GetSelectedDate_Mini"; $_t_oldMethodName)