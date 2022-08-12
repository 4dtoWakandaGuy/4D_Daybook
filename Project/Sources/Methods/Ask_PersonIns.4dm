//%attributes = {}
If (False:C215)
	//Project Method Name:      Ask_PersonIns
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Initials; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	ARRAY TEXT:C222($_at_Passwords; 0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_LONGINT:C283($_l_Index; $_l_recordCount)
	C_TEXT:C284($_t_GroupCode; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Ask_PersonIns")

//Ask_PersonInsert Elements

$_t_oldMethodName:=ERR_MethodTracker("Ask_PersonIns"; 0; DB_t_CurrentFormUsage)
If (GEN_at_RecordCode{GEN_at_Name}="ZZ99")
	$_t_GroupCode:=""
Else 
	$_t_GroupCode:=GEN_at_RecordCode{GEN_at_Name}
End if 
If (DB_t_CurrentFormUsage="NSL")
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=$_t_GroupCode; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
Else 
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Group_Code:28=$_t_GroupCode; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
End if 

$_l_recordCount:=Records in selection:C76([PERSONNEL:11])
ARRAY TEXT:C222($_at_Initials; 0)
ARRAY TEXT:C222($_at_Names; 0)
ARRAY TEXT:C222($_at_Passwords; 0)
SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; $_at_Initials; [PERSONNEL:11]Name:2; $_at_Names; [PERSONNEL:11]Person_Identity:13; $_at_Passwords)
SORT ARRAY:C229($_at_Initials; $_at_Names; $_at_Passwords; >)
For ($_l_Index; 1; $_l_recordCount)
	INSERT IN ARRAY:C227(GEN_at_Name; GEN_at_Name+$_l_Index; 1)
	INSERT IN ARRAY:C227(GEN_at_RecordCode; GEN_at_Name+$_l_Index; 1)
	INSERT IN ARRAY:C227(GEN_at_Identity; GEN_at_Name+$_l_Index; 1)
	GEN_at_Name{GEN_at_Name+$_l_Index}:="   "+$_at_Names{$_l_Index}
	GEN_at_RecordCode{GEN_at_Name+$_l_Index}:=$_at_Initials{$_l_Index}
	GEN_at_Identity{GEN_at_Name+$_l_Index}:=$_at_Passwords{$_l_Index}
End for 
ERR_MethodTrackerReturn("Ask_PersonIns"; $_t_oldMethodName)
