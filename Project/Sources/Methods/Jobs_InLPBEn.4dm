//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_InLPBEn
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InLPBEn")
OBJECT SET ENTERABLE:C238([JOBS:26]Company_Code:3; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Contact_Code:4; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Job_Code:1; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Job_Name:2; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Your_Order_Number:5; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Start_Date:6; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]End_Date:7; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Required_Date:8; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]State:9; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Terms:14; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Comments:15; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Stage_Code:18; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Person:19; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Job_Type:21; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Analysis_Code:24; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Currency_Code:25; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Layer_Code:26; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Project_Code:27; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Budget_TR:28; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Actual_TR:29; True:C214)
OBJECT SET ENTERABLE:C238([JOBS:26]Use_WIP:47; True:C214)
vButtDisJob:=Substring:C12(vButtDisJob; 1; 2)+"    "+Substring:C12(vButtDisJob; 7; 99)
//vButtDisJob≤3≥:=" "
//vButtDisJob≤4≥:=" "
//vButtDisJob≤5≥:=" "
//vButtDisJob≤6≥:=" "
DB_MenuAction("Print"; "Purchase Order"; 2; "")
DB_MenuAction("Print"; "Proforma Invoice"; 2; "")
DB_MenuAction("Print"; "Invoice or Credit Note"; 2; "")
DB_MenuAction("Functions"; ""; 2; "")

vSelPrev:=""
If (Read only state:C362([JOBS:26])=False:C215)
	READ WRITE:C146([ORDER_ITEMS:25])
	READ WRITE:C146([JOB_STAGES:47])
	READ WRITE:C146([JOB PERSONNEL:48])
End if 
ERR_MethodTrackerReturn("Jobs_InLPBEn"; $_t_oldMethodName)