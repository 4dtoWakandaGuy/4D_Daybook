//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies_InBDe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_DefaultSales; <>SYS_bo_DefaultsCallback)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(vCM; vDY; xCount)
	C_TEXT:C284(<>DefSta; <>PER_t_CurrentUserInitials; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_InBDe")
If (([COMPANIES:2]Entry_Date:16=!00-00-00!) & ([COMPANIES:2]Status:12="") & ([COMPANIES:2]Taken_By:26=""))
	[COMPANIES:2]Value:31:=1
	[COMPANIES:2]Status:12:=<>DefSta
	[COMPANIES:2]Taken_By:26:=<>PER_t_CurrentUserInitials
	If (<>SYS_bo_DefaultSales)
		[COMPANIES:2]Sales_Person:29:=<>PER_t_CurrentUserInitials
		If (<>SYS_bo_DefaultsCallback)
			If ((vDY=0) & (vCM=0) & ((DB_GetModuleSettingByNUM(Module_DiaryManager)=2) | (DB_GetModuleSettingByNUM(Module_DiaryManager)=4)))
				xCount:=1
			End if 
		End if 
	End if 
	[COMPANIES:2]Entry_Date:16:=<>DB_d_CurrentDate
	[COMPANIES:2]Modified_Date:32:=<>DB_d_CurrentDate
	[COMPANIES:2]Omit:17:="N"
End if 
ERR_MethodTrackerReturn("Companies_InBDe"; $_t_oldMethodName)