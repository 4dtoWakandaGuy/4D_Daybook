//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPBDis
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
	C_TEXT:C284($_t_oldMethodName; vButtDisJob; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPBDis")
OBJECT SET ENTERABLE:C238([JOBS:26]Company_Code:3; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Contact_Code:4; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Job_Code:1; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Job_Name:2; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Your_Order_Number:5; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Start_Date:6; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]End_Date:7; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Required_Date:8; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]State:9; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Terms:14; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Comments:15; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Stage_Code:18; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Person:19; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Job_Type:21; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Analysis_Code:24; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Currency_Code:25; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Layer_Code:26; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Project_Code:27; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Budget_TR:28; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Actual_TR:29; False:C215)
OBJECT SET ENTERABLE:C238([JOBS:26]Use_WIP:47; False:C215)
vButtDisJob:=Substring:C12(vButtDisJob; 1; 2)+"DPMO"+Substring:C12(vButtDisJob; 7; 99)
//vButtDisJob≤3≥:="D"
//vButtDisJob≤4≥:="P"
//vButtDisJob≤5≥:="M"
//vButtDisJob≤6≥:="O"
DB_MenuAction("Print"; "Purchase Order"; 3; "")
DB_MenuAction("Print"; "Proforma Invoice"; 3; "")
DB_MenuAction("Print"; "Invoice or Credit Note"; 3; "")
DB_MenuAction("Functions"; ""; 3; "")

vSelPrev:="&Dis"
READ ONLY:C145([ORDER_ITEMS:25])
READ ONLY:C145([JOB_STAGES:47])
READ ONLY:C145([JOB PERSONNEL:48])
ERR_MethodTrackerReturn("Jobs_InLPBDis"; $_t_oldMethodName)