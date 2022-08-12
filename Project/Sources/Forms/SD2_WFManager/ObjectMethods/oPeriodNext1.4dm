If (False:C215)
	//object Name: Object Name:      SD2_WFManager.oPeriodNext1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 12:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_EndDate; SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart; SD2_D_CurrentHighlightDay)
	C_LONGINT:C283($_l_AgendaArea; $_l_Dayof; SD2_l_CalenderArea; SD2_l_CurrentScheduleView)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_WFManager.oPeriodNext1"; Form event code:C388)

$_l_AgendaArea:=SD2_l_CalenderArea

Case of 
	: (SD2_l_CurrentScheduleView=1)  // Day view
		SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart+1
		SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart
		SD2_D_CurrentHighlightDay:=SD2_D_CurrentDateStart
	: (SD2_l_CurrentScheduleView=2)  // Week view
		SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart+7
		SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart+1
	: (SD2_l_CurrentScheduleView=3)  // Month view
		SD2_D_CurrentDateStart:=SD2_D_CurrentDateEnd+5  //Next month
		//The following is the code of the button 'Month'
		$_l_Dayof:=Day of:C23(SD2_D_CurrentDateStart)
		SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-($_l_Dayof-1)
		$_d_EndDate:=SD2_D_CurrentDateStart+28
		Repeat 
			If (Month of:C24($_d_EndDate)=Month of:C24(SD2_D_CurrentDateStart))
				$_d_EndDate:=$_d_EndDate+1
			End if 
		Until (Month of:C24($_d_EndDate)#Month of:C24(SD2_D_CurrentDateStart))
		$_d_EndDate:=$_d_EndDate-1
		SD2_D_CurrentDateEnd:=$_d_EndDate
		$_l_AgendaArea:=SD2_l_CalenderArea
		SD2_l_CurrentScheduleView:=3
End case 
ERR_MethodTrackerReturn("OBJ SD2_WFManager.oPeriodNext1"; $_t_oldMethodName)
