//%attributes = {}
If (False:C215)
	//Project Method Name:      Comp_DrySrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_DATE:C307(vDoDateF; vDoDateT)
	C_LONGINT:C283(ch1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_DrySrch")
//Comp_DrySrch
QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4>=vDoDateF; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4<=vDoDateT)
If (ch1=1)
	$0:=(Records in selection:C76([DIARY:12])=0)
Else 
	$0:=(Records in selection:C76([DIARY:12])#0)
End if 
ERR_MethodTrackerReturn("Comp_DrySrch"; $_t_oldMethodName)