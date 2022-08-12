//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllocCuJ
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
	C_LONGINT:C283(vALLevels)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllocCuJ")
Menu_Record("OrderI_AllocCuJ"; "Allocate Stock")
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage:="Jobs"
vALLevels:=0
OrderI_AllocCur
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("OrderI_AllocCuJ"; $_t_oldMethodName)