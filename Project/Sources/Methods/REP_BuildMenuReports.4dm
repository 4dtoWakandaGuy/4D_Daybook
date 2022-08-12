//%attributes = {}
If (False:C215)
	//Project Method Name:      REP_BuildMenuReports
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>REP_at_StandardReportFunctions;0)
	//ARRAY TEXT(<>REP_at_StandardReportNames;0)
	//ARRAY TEXT(REP_at_ReportTitles;0)
	C_BOOLEAN:C305($_bo_exit; $_bo_IncludeReports)
	C_LONGINT:C283($_l_Index; $_l_MenuItemCount; $_l_MenuNumber; $_l_ReportTitlePosition)
	C_TEXT:C284($_t_MenuItem; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("REP_BuildMenuReports")
//this method reads the selected menu bar
//it looks for REPORTS and puts them and the associated method
//into an array which is for the one process
//the process will add other reports to the array
WS_BUILDREPORTSLIST
ARRAY TEXT:C222(<>REP_at_StandardReportNames; 0)
ARRAY TEXT:C222(<>REP_at_StandardReportFunctions; 0)

$_l_MenuNumber:=Menu selected:C152\65536
$_l_MenuItemCount:=Count menu items:C405($_l_MenuNumber)
$_bo_IncludeReports:=False:C215
For ($_l_Index; 1; $_l_MenuItemCount)
	$_t_MenuItem:=Get menu item:C422($_l_MenuNumber; $_l_Index)
	If ($_t_MenuItem="-")
		$_bo_IncludeReports:=False:C215
	End if 
	If ($_bo_IncludeReports)
		$_bo_exit:=False:C215
		Repeat 
			If ($_t_MenuItem#"")
				If ($_t_MenuItem[[1]]=" ")
					$_t_MenuItem:=Substring:C12($_t_MenuItem; 2; Length:C16($_t_MenuItem))
				Else 
					$_bo_exit:=True:C214
				End if 
			Else 
				$_bo_exit:=True:C214
			End if 
		Until ($_bo_exit)
		$_bo_exit:=False:C215
		Repeat 
			If ($_t_MenuItem#"")
				If ($_t_MenuItem[[Length:C16($_t_MenuItem)]]=" ")
					$_t_MenuItem:=Substring:C12($_t_MenuItem; 1; Length:C16($_t_MenuItem)-1)
				Else 
					$_bo_exit:=True:C214
				End if 
			Else 
				$_bo_exit:=True:C214
			End if 
		Until ($_bo_exit)
		$_l_ReportTitlePosition:=Find in array:C230(REP_at_ReportTitles; $_t_MenuItem)
		If ($_l_ReportTitlePosition>0)
			
		End if 
	End if 
	If ($_t_MenuItem="REPORTS")
		$_bo_IncludeReports:=True:C214
	End if 
End for 
ERR_MethodTrackerReturn("REP_BuildMenuReports"; $_t_oldMethodName)