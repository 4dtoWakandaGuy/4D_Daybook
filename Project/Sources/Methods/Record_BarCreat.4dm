//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_BarCreat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 16:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(GEN_at_Name;0)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; $1; $_l_Number; s1; vNo)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; vName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_BarCreat")
//Record_BarCreat

MESSAGES OFF:C175
While (Semaphore:C143("Untitled"))
	DelayTicks(30)
	
End while 
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="Untitled@")
If (Records in selection:C76([SCRIPTS:80])>0)
	ORDER BY:C49([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1; <)
	$_l_Number:=Num:C11(Substring:C12([SCRIPTS:80]Script_Code:1; 10; 6))+1
Else 
	$_l_Number:=1
End if 
CREATE RECORD:C68([SCRIPTS:80])
[SCRIPTS:80]Script_Code:1:="Untitled "+("0"*(3-Length:C16(String:C10($_l_Number))))+String:C10($_l_Number)
If (s1=1)
	[SCRIPTS:80]Same_Process:6:=True:C214
End if 
[SCRIPTS:80]Table_Number:8:=<>DB_at_TableNamesMacro
[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
DB_SaveRecord(->[SCRIPTS:80])
CLEAR SEMAPHORE:C144("Untitled")
MESSAGES ON:C181
vNo:=vNo+1


If (Count parameters:C259=1)  //ie come from Silver palette
	vName:=[SCRIPTS:80]Script_Code:1
Else 
	$_l_Number:=Size of array:C274(GEN_at_Name)
	INSERT IN ARRAY:C227(GEN_at_Name; $_l_Number+1; 1)
	GEN_at_Name{$_l_Number+1}:=[SCRIPTS:80]Script_Code:1
	GEN_at_Name:=$_l_Number+1
End if 
ERR_MethodTrackerReturn("Record_BarCreat"; $_t_oldMethodName)