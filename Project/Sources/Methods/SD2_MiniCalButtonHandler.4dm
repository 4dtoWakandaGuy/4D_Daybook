//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_MiniCalButtonHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/08/2009 10:54
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_EndDate; CAL_D_RETURNDate; SD2_D_CurrentDateEnd; SD2_D_CurrentDateStart; SD2_D_CurrentHighlightDay; VCalF)
	C_LONGINT:C283($_l_AgendaArea; $_l_Daynumber; $_l_Dayof; $_l_FieldNumber; $_l_TableNumber; SD2_l_CalenderArea; SD2_l_CurrentScheduleView)
	C_POINTER:C301($_ptr_DateVariable; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SD2_MiniCalButtonHandler")
If (Count parameters:C259>=1)
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	$_ptr_DateVariable:=Get pointer:C304("vD"+String:C10(Num:C11($_t_VariableName)))
	CAL_D_RETURNDate:=(VCalF-1)+Num:C11($_ptr_DateVariable->)
	$_l_AgendaArea:=SD2_l_CalenderArea
	
	Case of 
		: (SD2_l_CurrentScheduleView=1)  // Day view
			SD2_D_CurrentDateStart:=CAL_D_RETURNDate
			SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart
			SD2_D_CurrentHighlightDay:=SD2_D_CurrentDateStart
		: (SD2_l_CurrentScheduleView=2)  // Week view
			SD2_D_CurrentDateStart:=CAL_D_RETURNDate
			$_l_Daynumber:=Day number:C114(SD2_D_CurrentHighlightDay)
			Case of 
				: ($_l_Daynumber=7)
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-6
				: ($_l_Daynumber=6)
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-5
				: ($_l_Daynumber=5)
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-4
				: ($_l_Daynumber=4)
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-3
				: ($_l_Daynumber=3)
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-2
				: ($_l_Daynumber=2)
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-1
				Else 
					SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart
			End case 
			
			SD2_D_CurrentDateStart:=SD2_D_CurrentDateStart-7
			SD2_D_CurrentDateEnd:=SD2_D_CurrentDateStart+1
		: (SD2_l_CurrentScheduleView=3)  // Month view
			SD2_D_CurrentDateStart:=CAL_D_RETURNDate
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
	
End if 
ERR_MethodTrackerReturn("SD2_MiniCalButtonHandler"; $_t_oldMethodName)
