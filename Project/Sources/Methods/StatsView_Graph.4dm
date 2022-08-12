//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Graph
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
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $r1; $r2; bd12; r1; r2)
	C_TEXT:C284($_t_oldMethodName; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Graph")
//StatsView_Graph
$r1:=r1
$r2:=r2
<>SYS_l_CancelProcess:=0
If (bd12=1)
	StatsView_Cal2
	bd12:=0
End if 
If (<>SYS_l_CancelProcess#Current process:C322)
	vTitle1:=Uppers2(Lowercase:C14(DB_at_TableName{1}+" Graph"))
	StatsView_Title
	Open_Pro_Window(vTitle1; 0; 3; ->[COMPANIES:2]; "dSV_Graph13")
	DIALOG:C40([COMPANIES:2]; "dSV_Graph13")  //NG April 2004 Removed ◊Screen
	Close_ProWin
End if 
r1:=$r1
r2:=$r2
ERR_MethodTrackerReturn("StatsView_Graph"; $_t_oldMethodName)